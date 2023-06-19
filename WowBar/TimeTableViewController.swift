//
//  TimeTableViewController.swift
//  WowBar
//
//  Created by Вадим on 24.05.2023.
//

import UIKit
import SnapKit

//protocol TimeTableViewControllerDelegate {
//    func pencilButtonPressed()
//}

class TimeTableViewController: UIViewController {

    var editNameTableCount = 0
    var editDateCount = 0
    var editNameClientCount = 0
    var data: [Data]
    
    init(data: [Data]) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    let defaults = UserDefaults.standard
    
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.showsVerticalScrollIndicator = true
        view.isDirectionalLockEnabled = true
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    let highTopView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    let topView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    let highMiddleView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    let middleView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    let endScroll: UILabel = {
        let label = UILabel()
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let discountData = ["Fortune", "Fridey", "Lunchtime"]
    let discountFraze = ["Wheel of Fortune", "Lunchtime 1", "Friday night out"]
    let discountText = ["Spin", "Every day", "Every Friday"]
    
    let background1: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "BG")
        return imageView
    }()
    
    let background2: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "BG")
        return imageView
    }()
    
    let logo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    let currentReservations: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Current reservations")
        return imageView
    }()
    
    let historyReservations: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "History of table reservations")
        return imageView
    }()
    
    let geoButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "geo"), for: .normal)
        button.addTarget(self, action: #selector(geoButtonPressed), for: .touchUpInside)
        return button
    }()
    
    var topColView: UICollectionView!
    var bottomColView: UICollectionView!
    
    private var customNavigationBar = UINavigationBar()
    
    var firstArray: [Data] = []
    var secondArray: [Data] = []/*[Data(nameTable: "", date: "", phone: "", nameClient: "", comment: ""), Data(nameTable: "", date: "", phone: "", nameClient: "", comment: "")]*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstArray = data
        // для отображения данных при создании нового стола
        DispatchQueue.main.async {
            do {
                let encoder = JSONEncoder()
                let datas = try encoder.encode(self.data)
                DispatchQueue.main.async {
                    self.defaults.set(datas, forKey: "persons")
                }
            } catch {
                print("Ошибка при кодировании данных: \(error.localizedDescription)")
            }
        }

        //Провереям данные на наниличие устаревших дат
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM"
        
        let currentDate = Date()
        let today = dateFormatter.string(from: currentDate)
        let todayDate = dateFormatter.date(from: String(today))!
        print(todayDate)
        
//        DispatchQueue.main.async {
            if !self.firstArray.isEmpty {
                var thirtyArray: [Data] = []
                for i in 0..<self.firstArray.count {
                    let firstFive = self.firstArray[i].date.prefix(5)
                    let date = dateFormatter.date(from: String(firstFive))!
                    print(date)
                    if date >= todayDate {
                        thirtyArray.append(self.firstArray[i])
                    } else {
                        self.secondArray.append(self.firstArray[i])
                    }
                }
                self.firstArray = thirtyArray
            }
//        }
        
        scrollView.contentInsetAdjustmentBehavior = .never

        self.navigationController?.setNavigationBarHidden(true, animated: false)
        customNavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100))
        view.addSubview(customNavigationBar)
        
        let layout1 = UICollectionViewFlowLayout()
        layout1.scrollDirection = .vertical
        layout1.minimumLineSpacing = 0
        layout1.itemSize = CGSize(width: view.frame.width, height: Constants.setSizeY(200))
        topColView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout1)
        topColView.delegate = self
        topColView.dataSource = self
        topColView.register(CurrentReservationsCell.self, forCellWithReuseIdentifier: CurrentReservationsCell.identifier)
        topColView.backgroundColor = UIColor.black
        topColView.reloadData()
        topColView.collectionViewLayout.invalidateLayout()
        topColView.layoutSubviews()
        topColView.isPagingEnabled = true
        topColView.contentInsetAdjustmentBehavior = .never
        topColView.isScrollEnabled = false

        
        let layout2 = UICollectionViewFlowLayout()
        layout2.scrollDirection = .vertical
        layout2.minimumLineSpacing = 0
        layout2.itemSize = CGSize(width: view.frame.width, height: Constants.setSizeY(200))
        bottomColView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout1)
        bottomColView.delegate = self
        bottomColView.dataSource = self
        bottomColView.register(HistoryReservationsCell.self, forCellWithReuseIdentifier: HistoryReservationsCell.identifier)
        bottomColView.backgroundColor = UIColor.black
        bottomColView.isPagingEnabled = true
        bottomColView.reloadData()
        bottomColView.collectionViewLayout.invalidateLayout()
        bottomColView.layoutSubviews()
        bottomColView.isScrollEnabled = false

        
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.snp.edges)
            $0.centerX.equalTo(scrollView.snp.centerX)
        }
        
        contentView.addSubview(highTopView)
        highTopView.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top)
            $0.left.equalTo(contentView.snp.left)
            $0.right.equalTo(contentView.snp.right)
            $0.height.equalTo(Constants.setSizeY(165))
        }
        
        highTopView.addSubview(logo)
        logo.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(95), height: Constants.setSizeY(95)))
            $0.centerX.equalTo(highTopView.snp.centerX)
            $0.top.equalTo(contentView.snp.top).offset(Constants.setSizeY(16))
        }
        
        highTopView.addSubview(geoButton)
        geoButton.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(36), height: Constants.setSizeY(36)))
            $0.centerY.equalTo(logo.snp.centerY)
            $0.right.equalTo(highTopView.snp.right).inset(Constants.setSizeY(20))
        }
        
        highTopView.addSubview(currentReservations)
        currentReservations.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(138), height: Constants.setSizeY(15)))
            $0.centerX.equalTo(highTopView.snp.centerX)
            $0.top.equalTo(logo.snp.bottom).offset(Constants.setSizeY(10))
        }
        
        contentView.addSubview(topView)
        topView.snp.makeConstraints {
            $0.top.equalTo(highTopView.snp.bottom).offset(Constants.setSizeY(5))
            $0.left.equalTo(contentView.snp.left)
            $0.right.equalTo(contentView.snp.right)
            $0.height.equalTo(Constants.setSizeY(CGFloat(200 * firstArray.count)))
        }
        topView.addSubview(background1)
        background1.snp.makeConstraints {
            $0.edges.equalTo(topView.snp.edges)
        }
        
        topView.addSubview(topColView)
        topColView.snp.makeConstraints {
            $0.top.equalTo(topView.snp.top)
            $0.left.equalTo(topView.snp.left)
            $0.right.equalTo(topView.snp.right)
            $0.bottom.equalTo(topView.snp.bottom)
        }
        
        contentView.addSubview(highMiddleView)
        highMiddleView.snp.makeConstraints {
            $0.top.equalTo(topView.snp.bottom).offset(Constants.setSizeY(27))
            $0.left.equalTo(contentView.snp.left)
            $0.right.equalTo(contentView.snp.right)
            $0.height.equalTo(Constants.setSizeY(37))
        }
        
        highMiddleView.addSubview(historyReservations)
        historyReservations.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(191), height: Constants.setSizeY(15)))
            $0.centerX.equalTo(highMiddleView.snp.centerX)
            $0.top.equalTo(highMiddleView.snp.top)
        }
        
        contentView.addSubview(middleView)
        middleView.snp.makeConstraints {
            $0.top.equalTo(highMiddleView.snp.bottom).offset(Constants.setSizeY(5))
            $0.left.equalTo(contentView.snp.left)
            $0.right.equalTo(contentView.snp.right)
            $0.height.equalTo(Constants.setSizeY(CGFloat(200 * secondArray.count)))
        }
        
        middleView.addSubview(background2)
        background2.snp.makeConstraints {
            $0.edges.equalTo(middleView.snp.edges)
        }
        
        middleView.addSubview(bottomColView)
        bottomColView.snp.makeConstraints {
            $0.top.equalTo(middleView.snp.top)
            $0.left.equalTo(middleView.snp.left)
            $0.right.equalTo(middleView.snp.right)
            $0.bottom.equalTo(middleView.snp.bottom)
        }
        
        middleView.addSubview(endScroll)
        endScroll.snp.makeConstraints {
            $0.top.equalTo(background2.snp.bottom)
            $0.left.equalTo(middleView.snp.left)
            $0.right.equalTo(middleView.snp.right)
            $0.bottom.equalTo(contentView.snp.bottom)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @objc func feedbackButtonPressed(sender: UIButton) {
        let indexPath = IndexPath(row: sender.tag, section: 0)
        if let cell = bottomColView.cellForItem(at: indexPath) as? HistoryReservationsCell {
            cell.textView.text = ""
        }
    }
    
    @objc func cancelTableButtonPressed(sender: UIButton) {
        let indexPath = IndexPath(row: sender.tag, section: 0)
        if let cell = topColView.cellForItem(at: indexPath) as? CurrentReservationsCell {
            firstArray.remove(at: indexPath.row)
        }
        let array = firstArray + secondArray
        DispatchQueue.main.async {
            self.view.window?.rootViewController = UINavigationController(rootViewController: TabBarController(data: array))
        }
    }
    
    @objc func geoButtonPressed() {
        let newViewController = MapViewController()
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    @objc func qrButtonPressed() {
        if let tabBarController = self.tabBarController {
            tabBarController.selectedIndex = 4
        }
    }
    
    @objc func pencilButtonPressed(sender: UIButton) {
        let indexPath = IndexPath(row: sender.tag, section: 0)
        if let cell = topColView.cellForItem(at: indexPath) as? CurrentReservationsCell {
            cell.nameTableLabel.isHidden = true
            cell.dateLabel.isHidden = true
            cell.nameClientLabel.isHidden = true
            cell.pencilButton.isHidden = true
            cell.qrButton.isHidden = true
            
            cell.editNameTable.isHidden = false
            cell.editNameTableButton.isHidden = false
            
            cell.editDateView.isHidden = false
            cell.editDate.isHidden = false
            cell.editDateButton.isHidden = false
            
            cell.nameClientView.isHidden = false
            cell.nameClientButton.isHidden = false
            cell.editNameClient.isHidden = false
            
            cell.jackdawButton.isHidden = false
            cell.crossButton.isHidden = false
            cell.cancelTableButton.isHidden = false
        }
    }
    
    @objc func jackdawButtonPressed(sender: UIButton) {
        let indexPath = IndexPath(row: sender.tag, section: 0)
        if let cell = topColView.cellForItem(at: indexPath) as? CurrentReservationsCell {
            cell.nameTableLabel.isHidden = false
            cell.dateLabel.isHidden = false
            cell.nameClientLabel.isHidden = false
            cell.pencilButton.isHidden = false
            cell.qrButton.isHidden = false
            
            cell.editNameTable.isHidden = true
            cell.editNameTableButton.isHidden = true
            
            cell.editDateView.isHidden = true
            cell.editDate.isHidden = true
            cell.editDateButton.isHidden = true
            
            cell.nameClientView.isHidden = true
            cell.nameClientButton.isHidden = true
            cell.editNameClient.isHidden = true
            
            cell.jackdawButton.isHidden = true
            cell.crossButton.isHidden = true
            cell.cancelTableButton.isHidden = true
            
            // смена имен в лейблах
            cell.nameTableLabel.text = cell.editNameTable.text
            cell.nameClientLabel.text = cell.editNameClient.text
            cell.dateLabel.text = cell.editDate.text
            
            // сохранение эти данных в UsDe
            firstArray[indexPath.item].nameTable = cell.nameTableLabel.text!
            firstArray[indexPath.item].nameClient = cell.nameClientLabel.text!
            firstArray[indexPath.item].date = cell.dateLabel.text!
        }
        
        let array = firstArray + secondArray
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(array)
            DispatchQueue.main.async {
                self.defaults.set(data, forKey: "persons")
            }
        } catch {
            print("Ошибка при кодировании данных: \(error.localizedDescription)")
        }
        
        DispatchQueue.main.async {
            self.view.window?.rootViewController = UINavigationController(rootViewController: TabBarController(data: array))
        }
    }
    
    @objc func crossButtonPressed(sender: UIButton) {
        let indexPath = IndexPath(row: sender.tag, section: 0)
        if let cell = topColView.cellForItem(at: indexPath) as? CurrentReservationsCell {
            cell.nameTableLabel.isHidden = false
            cell.dateLabel.isHidden = false
            cell.nameClientLabel.isHidden = false
            cell.pencilButton.isHidden = false
            cell.qrButton.isHidden = false
            
            cell.editNameTable.isHidden = true
            cell.editNameTableButton.isHidden = true
            
            cell.editDateView.isHidden = true
            cell.editDate.isHidden = true
            cell.editDateButton.isHidden = true
            
            cell.nameClientView.isHidden = true
            cell.nameClientButton.isHidden = true
            cell.editNameClient.isHidden = true
            
            cell.jackdawButton.isHidden = true
            cell.crossButton.isHidden = true
            cell.cancelTableButton.isHidden = true
        }
    }
    
    @objc func editNameTableButtonPressed(sender: UIButton) {
        if editNameTableCount == 0 {
            editNameTableCount = 1
            let indexPath = IndexPath(row: sender.tag, section: 0)
            if let cell = topColView.cellForItem(at: indexPath) as? CurrentReservationsCell {
                cell.editNameTable.isUserInteractionEnabled = true
            }
            
            
            
        } else {
            editNameTableCount = 0
            let indexPath = IndexPath(row: sender.tag, section: 0)
            if let cell = topColView.cellForItem(at: indexPath) as? CurrentReservationsCell {
                cell.editNameTable.isUserInteractionEnabled = false
            }
        }
        
    }
    
    @objc func editDateButtonPressed(sender: UIButton) {
        if editDateCount == 0 {
            editDateCount = 1
            let indexPath = IndexPath(row: sender.tag, section: 0)
            if let cell = topColView.cellForItem(at: indexPath) as? CurrentReservationsCell {
                cell.editDate.isUserInteractionEnabled = true
            }
        } else {
            editDateCount = 0
            let indexPath = IndexPath(row: sender.tag, section: 0)
            if let cell = topColView.cellForItem(at: indexPath) as? CurrentReservationsCell {
                cell.editDate.isUserInteractionEnabled = false
            }
        }
        
    }
    
    @objc func nameClientButtonPressed(sender: UIButton) {
        if editNameClientCount == 0 {
            editNameClientCount = 1
            let indexPath = IndexPath(row: sender.tag, section: 0)
            if let cell = topColView.cellForItem(at: indexPath) as? CurrentReservationsCell {
                cell.editNameClient.isUserInteractionEnabled = true
            }
        } else {
            editNameClientCount = 0
            let indexPath = IndexPath(row: sender.tag, section: 0)
            if let cell = topColView.cellForItem(at: indexPath) as? CurrentReservationsCell {
                cell.editNameClient.isUserInteractionEnabled = false
            }
        }
        
    }
}

extension TimeTableViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == topColView {
            return firstArray.count
        } else if collectionView == bottomColView {
            //            if firstArray.count > secondArray.count {
            //                return firstArray.count
            //            } else {
            return secondArray.count
            //            }
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == topColView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CurrentReservationsCell.identifier, for: indexPath) as! CurrentReservationsCell
            
            cell.setNameTable(firstArray[indexPath.item].nameTable)
            cell.setDateLabel(firstArray[indexPath.row].date)
            cell.setNameClient(firstArray[indexPath.row].nameClient)
            cell.setComment(firstArray[indexPath.row].comment)
            
            cell.qrButton.tag = indexPath.row
            cell.qrButton.addTarget(self, action: #selector(qrButtonPressed), for: .touchUpInside)
            
            cell.pencilButton.tag = indexPath.row
            cell.pencilButton.addTarget(self, action: #selector(pencilButtonPressed(sender:)), for: .touchUpInside)
            
            cell.editNameTableButton.tag = indexPath.row
            cell.editNameTableButton.addTarget(self, action: #selector(editNameTableButtonPressed(sender:)), for: .touchUpInside)
            
            cell.editDateButton.tag = indexPath.row
            cell.editDateButton.addTarget(self, action: #selector(editDateButtonPressed(sender:)), for: .touchUpInside)
            
            cell.nameClientButton.tag = indexPath.row
            cell.nameClientButton.addTarget(self, action: #selector(nameClientButtonPressed(sender:)), for: .touchUpInside)
            
            cell.jackdawButton.tag = indexPath.row
            cell.jackdawButton.addTarget(self, action: #selector(jackdawButtonPressed(sender:)), for: .touchUpInside)
            
            cell.crossButton.tag = indexPath.row
            cell.crossButton.addTarget(self, action: #selector(crossButtonPressed(sender:)), for: .touchUpInside)
            
            cell.cancelTableButton.tag = indexPath.row
            cell.cancelTableButton.addTarget(self, action: #selector(cancelTableButtonPressed(sender:)), for: .touchUpInside)
            
            return cell
        } else if collectionView == bottomColView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HistoryReservationsCell.identifier, for: indexPath) as! HistoryReservationsCell
            
            cell.setNameTable(secondArray[indexPath.row].nameTable)
            cell.setDateLabel(secondArray[indexPath.row].date)
            cell.setNameClient(secondArray[indexPath.row].nameClient)
            cell.setComment(secondArray[indexPath.row].comment)
            
            cell.feedbackButton.tag = indexPath.row
            cell.feedbackButton.addTarget(self, action: #selector(feedbackButtonPressed(sender:)), for: .touchUpInside)
            
            return cell
        }
        return UICollectionViewCell()
    }
}
