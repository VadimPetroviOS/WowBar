//
//  NewReservationViewController.swift
//  WowBar
//
//  Created by Вадим on 24.05.2023.
//

import UIKit
import SnapKit

class NewReservationViewController: UIViewController {
    
    var x: CGFloat = 0
    var y: CGFloat = 0
    var shumbaumba = 0
    
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
    
    let topView: UIView = {
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
    
    let background: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "BG")
        return imageView
    }()
    
    let logo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    let newReservationLabel: UILabel = {
        let label = UILabel()
        label.text = "New reservation"
        label.textColor = .white
        return label
    }()
    
    let viewDataPicker: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 9
        view.layer.borderWidth = 0.5
        view.layer.borderColor = #colorLiteral(red: 0.9995638728, green: 0.7265195251, blue: 0.007270149887, alpha: 1)
        return view
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "Time*"
        label.textColor = .gray
        label.font = UIFont(name: "Inter", size: Constants.setSizeY(8))
        let attributedText = NSMutableAttributedString(string: label.text!)
        attributedText.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: 4, length: 1))
        label.attributedText = attributedText
        return label
    }()
    
    let fromLabel: UILabel = {
        let label = UILabel()
        label.text = "from"
        label.textColor = .white
        return label
    }()
    
    let fromDataPicker: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 9
        view.layer.borderWidth = 0.5
        view.layer.borderColor = #colorLiteral(red: 0.9995638728, green: 0.7265195251, blue: 0.007270149887, alpha: 1)
        return view
    }()
    
    let fromdateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM"
        let today = Date()
        let dateString = dateFormatter.string(from: today)
        label.text = dateString
        return label
    }()
    
    let fromButtonDataPicker: UIButton = {
        let button = UIButton()
        button.setTitle("17:00", for: .normal)
        button.setTitle("", for: .highlighted)
        button.titleLabel?.font = UIFont(name: "Katibeh-Regular", size: Constants.setSizeY(30))
        button.addTarget(self, action: #selector(fromButtonDataPickerPressed), for: .touchUpInside)
        button.layer.zPosition = 1
        return button
    }()
    
    let toLabel: UILabel = {
        let label = UILabel()
        label.text = "to"
        label.textColor = .white
        return label
    }()
    
    let toDataPicker: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 9
        view.layer.borderWidth = 0.5
        view.layer.borderColor = #colorLiteral(red: 0.9995638728, green: 0.7265195251, blue: 0.007270149887, alpha: 1)
        return view
    }()
    
    let toDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM"
        let today = Date()
        let dateString = dateFormatter.string(from: today)
        label.text = dateString
        return label
    }()
    
    let toButtonDataPicker: UIButton = {
        let button = UIButton()
        button.setTitle("23:00", for: .normal)
//        button.setTitle("", for: .highlighted)
        button.titleLabel?.font = UIFont(name: "Katibeh-Regular", size: Constants.setSizeY(30))
//        button.addTarget(self, action: #selector(toButtonDataPickerPressed), for: .touchUpInside)
        return button
    }()
    
    let viewName: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 9
        view.layer.borderWidth = 0.5
        view.layer.borderColor = #colorLiteral(red: 0.9995638728, green: 0.7265195251, blue: 0.007270149887, alpha: 1)
        return view
    }()
    
    let yourNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Your name*"
        label.textColor = .gray
        label.font = UIFont(name: "Inter", size: Constants.setSizeY(11))
        let attributedText = NSMutableAttributedString(string: label.text!)
        attributedText.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: 9, length: 1))
        label.attributedText = attributedText
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        let font = UIFont(name: "Katibeh-Regular", size: Constants.setSizeY(30))!
        textField.font = font
        textField.textColor = UIColor.white
        return textField
    }()
    
    let viewGuests: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 9
        view.layer.borderWidth = 0.5
        view.layer.borderColor = #colorLiteral(red: 0.9995638728, green: 0.7265195251, blue: 0.007270149887, alpha: 1)
        return view
    }()
    
    let howManyLabel: UILabel = {
        let label = UILabel()
        label.text = "How many guests*"
        label.textColor = .gray
        label.font = UIFont(name: "Inter", size: Constants.setSizeY(11))
        let attributedText = NSMutableAttributedString(string: label.text!)
        attributedText.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: 15, length: 1))
        label.attributedText = attributedText
        return label
    }()
    
    let fourLabel: UILabel = {
        let label = UILabel()
        label.text = "4"
        label.textColor = .white
        return label
    }()
    
    let checkMarkButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Polygon 1"), for: .normal)
        button.addTarget(self, action: #selector(checkMarkButtonPressed), for: .touchUpInside)
        button.tag = 0
        return button
    }()
    
    let viewTelephone: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 9
        view.layer.borderWidth = 0.5
        view.layer.borderColor = #colorLiteral(red: 0.9995638728, green: 0.7265195251, blue: 0.007270149887, alpha: 1)
        return view
    }()
    
    let phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "Phone number*"
        label.textColor = .gray
        label.font = UIFont(name: "Inter", size: Constants.setSizeY(11))
        let attributedText = NSMutableAttributedString(string: label.text!)
        attributedText.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: 12, length: 1))
        label.attributedText = attributedText
        return label
    }()
    
    let phoneTextField: UITextField = {
        let textField = UITextField()
        let font = UIFont(name: "Katibeh-Regular", size: Constants.setSizeY(30))!
        textField.font = font
        textField.textColor = UIColor.white
        return textField
    }()
    
    let commentView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 9
        view.layer.borderWidth = 0.5
        view.layer.borderColor = #colorLiteral(red: 0.9995638728, green: 0.7265195251, blue: 0.007270149887, alpha: 1)
        return view
    }()
    
    let yourCommentLabel: UILabel = {
        let label = UILabel()
        label.text = "Your comment"
        label.textColor = .gray
        label.font = UIFont(name: "Inter", size: Constants.setSizeY(11))
        return label
    }()
    
    let commentTextField: UITextField = {
        let textField = UITextField()
        let font = UIFont(name: "Katibeh-Regular", size: Constants.setSizeY(30))!
        textField.font = font
        textField.textColor = UIColor.white
        textField.placeholder = "For example, a flower vase or a children's chair"
        return textField
    }()
    
    let chooseLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose a table*"
        label.textColor = .gray
        label.font = UIFont(name: "Inter", size: Constants.setSizeY(11))
        let attributedText = NSMutableAttributedString(string: label.text!)
        attributedText.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: 14, length: 1))
        label.attributedText = attributedText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tableView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 9
        view.layer.borderWidth = 0.5
        view.layer.borderColor = #colorLiteral(red: 0.9995638728, green: 0.7265195251, blue: 0.007270149887, alpha: 1)
        return view
    }()
    
    let tableImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "table")
        return imageView
    }()
    
    let barImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bar")
        return imageView
    }()
    
    let oneButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(oneButtonPressed), for: .touchUpInside)
        button.tag = 0
        return button
    }()
    
    let twoButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(twoButtonPressed), for: .touchUpInside)
        button.tag = 0
        return button
    }()
    
    let threeButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Ellipse red"), for: .normal)
        return button
    }()
    
    let fourButton: UIButton = {
        let button = UIButton()
        button.tag = 0
        button.addTarget(self, action: #selector(fourButtonPressed), for: .touchUpInside)
        return button
    }()
    
    let fiveButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Ellipse red"), for: .normal)
        return button
    }()
    
    let sixButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Ellipse red"), for: .normal)
        return button
    }()
    
    let sevenButton: UIButton = {
        let button = UIButton()
        button.tag = 0
        button.addTarget(self, action: #selector(sevenButtonPressed), for: .touchUpInside)
        return button
    }()
    
    let eightButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Ellipse red"), for: .normal)
        return button
    }()
    
    let nineButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Ellipse red"), for: .normal)
        return button
    }()
    
    let tenButton: UIButton = {
        let button = UIButton()
        button.tag = 0
        button.addTarget(self, action: #selector(tenButtonPressed), for: .touchUpInside)
        return button
    }()
    
    let elevenButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Ellipse red"), for: .normal)
        return button
    }()
    
    let twelveButton: UIButton = {
        let button = UIButton()
        button.tag = 0
        button.addTarget(self, action: #selector(twelveButtonPressed), for: .touchUpInside)
        return button
    }()
    
    let thirteenButton: UIButton = {
        let button = UIButton()
        button.tag = 0
        button.addTarget(self, action: #selector(thirteenButtonPressed), for: .touchUpInside)
        return button
    }()
    
    let fourteenButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Ellipse red"), for: .normal)
        return button
    }()
    
    let freeTable: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "FreeTable")
        return imageView
    }()
    
    let tableReserved: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Table Reserved")
        return imageView
    }()
    
    let yourReservation: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Your reservation")
        return imageView
    }()
    
    let reserveButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Reserve a table"), for: .normal)
        button.titleLabel?.font = UIFont(name: "Katibeh-Regular", size: 30)
        button.addTarget(self, action: #selector(reserveButtonPressed), for: .touchUpInside)
        return button
    }()
    
    let dataForPiccker = ["17:00", "18:00", "19:00", "20:00", "21:00", "22:00"]
    let pickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.layer.cornerRadius = 25
        picker.backgroundColor = #colorLiteral(red: 0.2205930948, green: 0.2233696282, blue: 0.2233207226, alpha: 1)
        return picker
    }()
    
    let dataForPicckerTwo = ["18:00", "19:00", "20:00", "21:00", "22:00", "23:00"]
    let pickerViewTwo: UIPickerView = {
        let picker = UIPickerView()
        picker.layer.cornerRadius = 25
        picker.backgroundColor = #colorLiteral(red: 0.1372548938, green: 0.1372548938, blue: 0.1372548938, alpha: 1)
        return picker
    }()
    
    let countGuestsView: UIView = {
        let view = UIView()
        view.isHidden = true
        view.backgroundColor = .black
        return view
    }()
    
    let buttonNumberOne: UIButton = {
        let button = UIButton()
        button.setTitle("   1                                           ", for: .normal)
        button.setTitle("", for: .highlighted)
        button.layer.cornerRadius = 9
        button.layer.borderWidth = 0.5
        button.layer.borderColor = #colorLiteral(red: 0.9995638728, green: 0.7265195251, blue: 0.007270149887, alpha: 1)
        button.isHidden = true
        button.addTarget(self, action: #selector(buttonNumberOnePressed), for: .touchUpInside)
        return button
    }()
    
    let buttonNumberTwo: UIButton = {
        let button = UIButton()
        button.setTitle("   2                                           ", for: .normal)
        button.setTitle("", for: .highlighted)
        button.layer.cornerRadius = 9
        button.layer.borderWidth = 0.5
        button.layer.borderColor = #colorLiteral(red: 0.9995638728, green: 0.7265195251, blue: 0.007270149887, alpha: 1)
        button.isHidden = true
        button.addTarget(self, action: #selector(buttonNumberTwoPressed), for: .touchUpInside)
        return button
    }()
    
    let buttonNumberThree: UIButton = {
        let button = UIButton()
        button.setTitle("   3                                         ", for: .normal)
        button.setTitle("", for: .highlighted)
        button.layer.cornerRadius = 9
        button.layer.borderWidth = 0.5
        button.layer.borderColor = #colorLiteral(red: 0.9995638728, green: 0.7265195251, blue: 0.007270149887, alpha: 1)
        button.isHidden = true
        button.addTarget(self, action: #selector(buttonNumberThreePressed), for: .touchUpInside)
        return button
    }()
    
    let buttonNumberFour: UIButton = {
        let button = UIButton()
        button.setTitle("   4                                           ", for: .normal)
        button.setTitle("", for: .highlighted)
        button.layer.cornerRadius = 9
        button.layer.borderWidth = 0.5
        button.layer.borderColor = #colorLiteral(red: 0.9995638728, green: 0.7265195251, blue: 0.007270149887, alpha: 1)
        button.isHidden = true
        button.addTarget(self, action: #selector(buttonNumberFourPressed), for: .touchUpInside)
        return button
    }()
    
    let errorLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .red
        return label
    }()
    
    let geoButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "geo"), for: .normal)
        button.addTarget(self, action: #selector(geoButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private var customNavigationBar = UINavigationBar()
    
    let datapicker: UIDatePicker = {
        let datapicker = UIDatePicker()
        datapicker.locale = .current
        datapicker.datePickerMode = .dateAndTime
        datapicker.tintColor = .systemGreen
        datapicker.translatesAutoresizingMaskIntoConstraints = false
        datapicker.backgroundColor = .white
        datapicker.layer.zPosition = 1
        datapicker.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
        return datapicker
    }()
    
    let jackdawButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "jackdaw"), for: .normal)
        button.layer.zPosition = 1
        button.addTarget(self, action: #selector(jackdawButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentInsetAdjustmentBehavior = .never
        
        nameTextField.delegate = self
        phoneTextField.delegate = self
        commentTextField.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        
        if (self.defaults.object(forKey: "oneButton") != nil) {
            oneButton.setBackgroundImage(UIImage(named: "Ellipse red"), for: .normal)
        } else {
            oneButton.setBackgroundImage(UIImage(named: "Ellipse green"), for: .normal)
        }
        
        if (self.defaults.object(forKey: "twoButton") != nil) {
            twoButton.setBackgroundImage(UIImage(named: "Ellipse red"), for: .normal)
        } else {
            twoButton.setBackgroundImage(UIImage(named: "Ellipse green"), for: .normal)
        }
        
        if (self.defaults.object(forKey: "fourButton") != nil) {
            fourButton.setBackgroundImage(UIImage(named: "Ellipse red"), for: .normal)
        } else {
            fourButton.setBackgroundImage(UIImage(named: "Ellipse green"), for: .normal)
        }
        
        if (self.defaults.object(forKey: "sevenButton") != nil) {
            sevenButton.setBackgroundImage(UIImage(named: "Ellipse red"), for: .normal)
        } else {
            sevenButton.setBackgroundImage(UIImage(named: "Ellipse green"), for: .normal)
        }
        
        if (self.defaults.object(forKey: "tenButton") != nil) {
            tenButton.setBackgroundImage(UIImage(named: "Ellipse red"), for: .normal)
        } else {
            tenButton.setBackgroundImage(UIImage(named: "Ellipse green"), for: .normal)
        }
        
        if (self.defaults.object(forKey: "twelveButton") != nil) {
            twelveButton.setBackgroundImage(UIImage(named: "Ellipse red"), for: .normal)
        } else {
            twelveButton.setBackgroundImage(UIImage(named: "Ellipse green"), for: .normal)
        }
        
        if (self.defaults.object(forKey: "thirteenButton") != nil) {
            thirteenButton.setBackgroundImage(UIImage(named: "Ellipse red"), for: .normal)
        } else {
            thirteenButton.setBackgroundImage(UIImage(named: "Ellipse green"), for: .normal)
        }
        
        
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerViewTwo.delegate = self
        pickerViewTwo.dataSource = self
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        customNavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100))
        view.addSubview(customNavigationBar)

        view.backgroundColor = .black
        setConstants()
        setSubviews()
        setConstraints()


//        view.addSubview(datePicker)
//        datePicker.center = view.center
        
        
//        let datePicker = UIDatePicker()
//        datePicker.datePickerMode = .time // устанавливаем тип пикера на время
//
//
//        datePicker.backgroundColor = UIColor.white // устанавливаем цвет фона
//
//        // Устанавливаем диапазон выбора времени от 17:00 до 21:00
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "HH:mm"
//        let minDate = dateFormatter.date(from: "17:00")
//        let maxDate = dateFormatter.date(from: "21:00")
//        datePicker.minimumDate = minDate
//        datePicker.maximumDate = maxDate
//
//        // Устанавливаем локаль для форматирования даты и времени
//        datePicker.locale = Locale(identifier: "en_US_POSIX")
//
//        // Устанавливаем формат времени в 24-часовой формат
//        datePicker.locale = Locale(identifier: "en_GB")
//
//        // Блокируем прокручивание минутной области
//        datePicker.minuteInterval = 60
//
//        // Добавляем пикер на ваш экран в нужную позицию, например:
//        view.addSubview(datePicker)
//        datePicker.center = view.center
//


    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        setFontGray(timeLabel, Constants.setSizeY(15), 0)
        let attributedText1 = NSMutableAttributedString(string: timeLabel.text!)
        attributedText1.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: 4, length: 1))
        timeLabel.attributedText = attributedText1
        
        setFontGray(yourNameLabel, Constants.setSizeY(15), 0)
        let attributedText2 = NSMutableAttributedString(string: yourNameLabel.text!)
        attributedText2.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: 9, length: 1))
        yourNameLabel.attributedText = attributedText2
        
        setFontGray(howManyLabel, Constants.setSizeY(15), 0)
        let attributedText3 = NSMutableAttributedString(string: howManyLabel.text!)
        attributedText3.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: 15, length: 1))
        howManyLabel.attributedText = attributedText3
        
        setFontGray(phoneNumberLabel, Constants.setSizeY(15), 0)
        let attributedText4 = NSMutableAttributedString(string: phoneNumberLabel.text!)
        attributedText4.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: 12, length: 1))
        phoneNumberLabel.attributedText = attributedText4
        
        setFontGray(yourCommentLabel, Constants.setSizeY(15), 0)
        
        setFontGray(chooseLabel, Constants.setSizeY(15), 0)
        let attributedText5 = NSMutableAttributedString(string: chooseLabel.text!)
        attributedText5.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: 14, length: 1))
        chooseLabel.attributedText = attributedText5
        
        setFontInter(newReservationLabel, Constants.setSizeY(14), 0)
//        timeLabel.font = UIFont(name: "Inter", size: Constants.setSizeY(11.0))
        setFontKatibeh(fromLabel, Constants.setSizeY(30), 0)
        setFontKatibeh(fromdateLabel, Constants.setSizeY(30), 0)
        setFontKatibeh(toLabel, Constants.setSizeY(30), 0)
        setFontKatibeh(toDateLabel, Constants.setSizeY(30), 0)
        setFontKatibeh(fourLabel, Constants.setSizeY(30), 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func setConstants() {
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        x = screenWidth/375
        y = screenHeight/812
    }
    
    private func setSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(topView)
        contentView.addSubview(middleView)
        middleView.addSubview(background)
        background.addSubview(endScroll)
        background.addSubview(logo)
        
        background.addSubview(newReservationLabel)
        background.addSubview(viewDataPicker)
        background.addSubview(timeLabel)
        background.addSubview(fromLabel)
        middleView.addSubview(fromDataPicker)
        background.addSubview(fromdateLabel)
        fromDataPicker.addSubview(fromButtonDataPicker)
        background.addSubview(toLabel)
        middleView.addSubview(toDataPicker)
        background.addSubview(toDateLabel)
        toDataPicker.addSubview(toButtonDataPicker)
        background.addSubview(viewName)
        background.addSubview(yourNameLabel)
        middleView.addSubview(nameTextField)
        middleView.addSubview(viewGuests)
        background.addSubview(howManyLabel)
        background.addSubview(fourLabel)
        viewGuests.addSubview(checkMarkButton)
        background.addSubview(viewTelephone)
        background.addSubview(phoneNumberLabel)
        middleView.addSubview(phoneTextField)
        background.addSubview(commentView)
        background.addSubview(yourCommentLabel)
        middleView.addSubview(commentTextField)
        background.addSubview(chooseLabel)
        middleView.addSubview(tableView)
        tableView.addSubview(tableImage)
        tableView.addSubview(barImage)
        tableView.addSubview(twoButton)
        tableView.addSubview(oneButton)
        tableView.addSubview(threeButton)
        tableView.addSubview(fourButton)
        tableView.addSubview(fiveButton)
        tableView.addSubview(sixButton)
        tableView.addSubview(sevenButton)
        tableView.addSubview(eightButton)
        tableView.addSubview(nineButton)
        tableView.addSubview(tenButton)
        tableView.addSubview(elevenButton)
        tableView.addSubview(twelveButton)
        tableView.addSubview(thirteenButton)
        tableView.addSubview(fourteenButton)
        middleView.addSubview(freeTable)
        middleView.addSubview(tableReserved)
        middleView.addSubview(yourReservation)
        middleView.addSubview(reserveButton)
        middleView.addSubview(countGuestsView)
    }
    
    private func setConstraints() {
        
        let stackView: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [buttonNumberOne, buttonNumberTwo, buttonNumberThree, buttonNumberFour])
            stack.axis = .vertical
            stack.spacing = 3
            stack.alignment = .center
            stack.distribution = .fillEqually
            return stack
        }()
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.snp.edges)
            $0.centerX.equalTo(scrollView.snp.centerX)
        }
        
        topView.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top)
            $0.left.equalTo(contentView.snp.left)
            $0.right.equalTo(contentView.snp.right)
            $0.height.equalTo(1)
        }
        
        middleView.snp.makeConstraints {
            $0.top.equalTo(topView.snp.top)
            $0.left.equalTo(contentView.snp.left)
            $0.right.equalTo(contentView.snp.right)
            $0.bottom.equalTo(contentView.snp.bottom)
        }
        
        background.snp.makeConstraints {
            $0.top.equalTo(middleView.snp.top).offset(Constants.setSizeY(0)) //-90
            $0.left.equalTo(middleView.snp.left)
            $0.right.equalTo(middleView.snp.right)
            $0.height.equalTo(Constants.setSizeY(1100))
        }
        
        endScroll.snp.makeConstraints {
            $0.top.equalTo(background.snp.bottom)
            $0.left.equalTo(middleView.snp.left)
            $0.right.equalTo(middleView.snp.right)
            $0.bottom.equalTo(contentView.snp.bottom)
        }
        
        logo.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(95), height: Constants.setSizeY(95)))
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(Constants.setSizeY(16))
        }
        
        newReservationLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(logo.snp.bottom).offset(Constants.setSizeY(10))
        }
        viewDataPicker.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(344), height: Constants.setSizeY(78)))
            $0.top.equalTo(newReservationLabel.snp.bottom).offset(Constants.setSizeY(55))
            $0.centerX.equalToSuperview()
        }
        timeLabel.snp.makeConstraints {
            $0.top.equalTo(viewDataPicker.snp.top).inset(Constants.setSizeY(7))
            $0.left.equalTo(viewDataPicker.snp.left).inset(Constants.setSizeY(10))
        }
        fromLabel.snp.makeConstraints {
            $0.top.equalTo(viewDataPicker.snp.top).inset(Constants.setSizeY(30))
            $0.left.equalTo(viewDataPicker.snp.left).inset(Constants.setSizeY(10))
        }
        fromDataPicker.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(82), height: Constants.setSizeY(60)))
            $0.centerY.equalTo(viewDataPicker.snp.centerY)
            $0.left.equalTo(fromLabel.snp.right).offset(Constants.setSizeY(10))
        }
        fromdateLabel.snp.makeConstraints {
            $0.centerX.equalTo(fromDataPicker.snp.centerX)
            $0.top.equalTo(fromDataPicker.snp.top).inset(Constants.setSizeY(12))
        }
        fromButtonDataPicker.snp.makeConstraints {
            $0.centerX.equalTo(fromDataPicker.snp.centerX)
            $0.bottom.equalTo(fromDataPicker.snp.bottom).inset(Constants.setSizeY(-12))
        }
        toLabel.snp.makeConstraints {
            $0.top.equalTo(viewDataPicker.snp.top).inset(Constants.setSizeY(30))
            $0.left.equalTo(fromDataPicker.snp.right).offset(Constants.setSizeY(27))
        }
        toDataPicker.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(82), height: Constants.setSizeY(60)))
            $0.centerY.equalTo(viewDataPicker.snp.centerY)
            $0.left.equalTo(toLabel.snp.right).offset(Constants.setSizeY(27))
        }
        toDateLabel.snp.makeConstraints {
            $0.centerX.equalTo(toDataPicker.snp.centerX)
            $0.top.equalTo(toDataPicker.snp.top).inset(Constants.setSizeY(12))
        }
        toButtonDataPicker.snp.makeConstraints {
            $0.centerX.equalTo(toDataPicker.snp.centerX)
            $0.bottom.equalTo(toDataPicker.snp.bottom).inset(Constants.setSizeY(-12))
        }
        viewName.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(164), height: Constants.setSizeY(58)))
            $0.left.equalTo(viewDataPicker.snp.left)
            $0.top.equalTo(viewDataPicker.snp.bottom).offset(Constants.setSizeY(12))
        }
        yourNameLabel.snp.makeConstraints {
            $0.top.equalTo(viewName.snp.top).inset(Constants.setSizeY(7))
            $0.left.equalTo(viewName.snp.left).inset(Constants.setSizeY(10))
        }
        nameTextField.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(100), height: Constants.setSizeY(30)))
            $0.top.equalTo(viewName.snp.top).inset(Constants.setSizeY(30))
            $0.left.equalTo(viewName.snp.left).inset(Constants.setSizeY(10))
        }
        viewGuests.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(164), height: Constants.setSizeY(58)))
            $0.top.equalTo(viewName.snp.top)
            $0.left.equalTo(viewName.snp.right).offset(Constants.setSizeY(16))
        }
        howManyLabel.snp.makeConstraints {
            $0.top.equalTo(viewGuests.snp.top).inset(Constants.setSizeY(7))
            $0.left.equalTo(viewGuests.snp.left).inset(Constants.setSizeY(10))
        }
        fourLabel.snp.makeConstraints {
            $0.top.equalTo(viewGuests.snp.top).inset(Constants.setSizeY(35))
            $0.left.equalTo(viewGuests.snp.left).inset(Constants.setSizeY(10))
        }
        checkMarkButton.snp.makeConstraints {
            $0.bottom.equalTo(viewGuests.snp.bottom).inset(Constants.setSizeY(7))
            $0.left.equalTo(viewGuests.snp.right).inset(Constants.setSizeY(30))
            $0.width.equalTo(Constants.setSizeY(12))
            $0.height.equalTo(Constants.setSizeY(12))
        }
        viewTelephone.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(344), height: Constants.setSizeY(59)))
            $0.top.equalTo(viewName.snp.bottom).offset(Constants.setSizeY(10))
            $0.left.equalTo(viewName.snp.left)
        }
        phoneNumberLabel.snp.makeConstraints {
            $0.top.equalTo(viewTelephone.snp.top).inset(Constants.setSizeY(7))
            $0.left.equalTo(viewTelephone.snp.left).inset(Constants.setSizeY(10))
        }
        phoneTextField.snp.makeConstraints {
            $0.size.equalTo(CGSize(width:Constants.setSizeY(300), height: Constants.setSizeY(30)))
            $0.top.equalTo(viewTelephone.snp.top).inset(Constants.setSizeY(30))
            $0.left.equalTo(viewTelephone.snp.left).inset(Constants.setSizeY(10))
        }
        commentView.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(344), height: Constants.setSizeY(78)))
            $0.top.equalTo(viewTelephone.snp.bottom).offset(Constants.setSizeY(10))
            $0.left.equalTo(viewTelephone.snp.left)
        }
        yourCommentLabel.snp.makeConstraints {
            $0.top.equalTo(commentView.snp.top).inset(Constants.setSizeY(7))
            $0.left.equalTo(commentView.snp.left).inset(Constants.setSizeY(10))
        }
        commentTextField.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(325), height: Constants.setSizeY(46)))
            $0.top.equalTo(commentView.snp.top).inset(Constants.setSizeY(35))
            $0.left.equalTo(commentView.snp.left).inset(Constants.setSizeY(10))
        }
        chooseLabel.snp.makeConstraints {
            $0.left.equalTo(commentView.snp.left).inset(Constants.setSizeY(10))
            $0.top.equalTo(commentView.snp.bottom).offset(Constants.setSizeY(40))
        }
        tableView.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(344), height: Constants.setSizeY(240)))
            $0.top.equalTo(chooseLabel.snp.bottom).offset(Constants.setSizeY(22))
            $0.left.equalTo(viewTelephone.snp.left)
        }
        tableImage.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(210), height: Constants.setSizeY(120)))
            $0.top.equalTo(tableView.snp.top).inset(Constants.setSizeY(59))
            $0.left.equalTo(tableView.snp.left).inset(Constants.setSizeY(42))
        }
        barImage.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(25), height: Constants.setSizeY(169)))
            $0.top.equalTo(tableView.snp.top).inset(Constants.setSizeY(17))
            $0.right.equalTo(tableView.snp.right).inset(Constants.setSizeY(18))
        }
        twoButton.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(28), height: Constants.setSizeY(28)))
            $0.centerX.equalTo(tableImage.snp.centerX)
            $0.bottom.equalTo(tableImage.snp.top).offset(Constants.setSizeY(-13))
        }
        oneButton.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(28), height: Constants.setSizeY(28)))
            $0.centerY.equalTo(twoButton.snp.centerY)
            $0.bottom.equalTo(tableImage.snp.top).offset(Constants.setSizeY(-13))
            $0.right.equalTo(twoButton.snp.left).offset(Constants.setSizeY(-21))
        }
        threeButton.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(28), height: Constants.setSizeY(28)))
            $0.centerY.equalTo(twoButton.snp.centerY)
            $0.bottom.equalTo(tableImage.snp.top).offset(Constants.setSizeY(-13))
            $0.left.equalTo(twoButton.snp.right).offset(Constants.setSizeY(21))
        }
        fourButton.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(28), height: Constants.setSizeY(28)))
            $0.bottom.equalTo(tableImage.snp.top).offset(Constants.setSizeY(10))
            $0.left.equalTo(threeButton.snp.right).offset(Constants.setSizeY(18))
        }
        fiveButton.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(28), height: Constants.setSizeY(28)))
            $0.bottom.equalTo(tableImage.snp.top).offset(Constants.setSizeY(10))
            $0.right.equalTo(fourButton.snp.left).offset(Constants.setSizeY(-168))
        }
        sixButton.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(28), height: Constants.setSizeY(28)))
            $0.top.equalTo(fourButton.snp.bottom).offset(Constants.setSizeY(19))
            $0.left.equalTo(tableImage.snp.right).offset(Constants.setSizeY(6))
        }
        sevenButton.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(28), height: Constants.setSizeY(28)))
            $0.top.equalTo(sixButton.snp.top)
            $0.right.equalTo(sixButton.snp.left).offset(Constants.setSizeY(-221))
        }
        eightButton.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(28), height: Constants.setSizeY(28)))
            $0.top.equalTo(sixButton.snp.bottom).offset(Constants.setSizeY(20))
            $0.centerX.equalTo(sixButton.snp.centerX)
        }
        nineButton.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(28), height: Constants.setSizeY(28)))
            $0.top.equalTo(sevenButton.snp.bottom).offset(Constants.setSizeY(20))
            $0.centerX.equalTo(sevenButton.snp.centerX)
        }
        nineButton.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(28), height: Constants.setSizeY(28)))
            $0.top.equalTo(sevenButton.snp.bottom).offset(Constants.setSizeY(20))
            $0.centerX.equalTo(sevenButton.snp.centerX)
        }
        tenButton.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(28), height: Constants.setSizeY(28)))
            $0.top.equalTo(fourButton.snp.bottom).offset(Constants.setSizeY(116))
            $0.centerX.equalTo(fourButton.snp.centerX)
        }
        elevenButton.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(28), height: Constants.setSizeY(28)))
            $0.top.equalTo(fiveButton.snp.bottom).offset(Constants.setSizeY(116))
            $0.centerX.equalTo(fiveButton.snp.centerX)
        }
        twelveButton.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(28), height: Constants.setSizeY(28)))
            $0.top.equalTo(oneButton.snp.bottom).offset(Constants.setSizeY(146))
            $0.centerX.equalTo(oneButton.snp.centerX)
        }
        thirteenButton.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(28), height: Constants.setSizeY(28)))
            $0.top.equalTo(twoButton.snp.bottom).offset(Constants.setSizeY(146))
            $0.centerX.equalTo(twoButton.snp.centerX)
        }
        fourteenButton.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(28), height: Constants.setSizeY(28)))
            $0.top.equalTo(threeButton.snp.bottom).offset(Constants.setSizeY(146))
            $0.centerX.equalTo(threeButton.snp.centerX)
        }
        freeTable.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(83), height: Constants.setSizeY(14)))
            $0.top.equalTo(tableView.snp.bottom).offset(Constants.setSizeX(37))
            $0.left.equalTo(tableView.snp.left).offset(Constants.setSizeY(10))
        }
        tableReserved.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(108), height: Constants.setSizeY(14)))
            $0.top.equalTo(tableView.snp.bottom).offset(Constants.setSizeX(37))
            $0.left.equalTo(freeTable.snp.right).offset(Constants.setSizeY(18))
        }
        yourReservation.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(115), height: Constants.setSizeY(14)))
            $0.top.equalTo(tableView.snp.bottom).offset(Constants.setSizeX(37))
            $0.left.equalTo(tableReserved.snp.right).offset(Constants.setSizeY(18))
        }
        reserveButton.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(222), height: Constants.setSizeY(67)))
            $0.top.equalTo(tableReserved.snp.bottom).offset(Constants.setSizeY(62))
            $0.centerX.equalTo(background.snp.centerX)
        }
        countGuestsView.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(164), height: Constants.setSizeY(120)))
            $0.top.equalTo(viewGuests.snp.bottom)
            $0.centerX.equalTo(viewGuests.snp.centerX)
        }
        countGuestsView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalTo(countGuestsView.snp.edges)
        }
        background.addSubview(errorLabel)
        errorLabel.snp.makeConstraints {
            $0.bottom.equalTo(reserveButton.snp.top).offset(Constants.setSizeY(-15))
            $0.centerX.equalTo(reserveButton.snp.centerX)
        }
        
        middleView.addSubview(geoButton)
        geoButton.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(36), height: Constants.setSizeY(36)))
            $0.centerY.equalTo(logo.snp.centerY)
            $0.right.equalTo(middleView.snp.right).inset(Constants.setSizeY(20))
        }
    }
    
    private func setFontKatibeh(_ label: UILabel, _ size: Double, _ border: Double) {
        label.font = UIFont(name: "Katibeh-Regular", size: size)
        ?? .systemFont(ofSize: size, weight: .bold)

        let strokeTextAttributes: [NSAttributedString.Key: Any] = [
            .strokeColor : #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1),
            .strokeWidth : border,
            .foregroundColor : #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        ]
        let myAttributedString = NSAttributedString(string: label.text!, attributes: strokeTextAttributes)
        label.attributedText = myAttributedString
    }
    
    private func setFontInter(_ label: UILabel, _ size: Double, _ border: Double) {
        label.font = UIFont(name: "Inter", size: size)
        ?? .systemFont(ofSize: size, weight: .bold)

        let strokeTextAttributes: [NSAttributedString.Key: Any] = [
            .strokeColor : #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1),
            .strokeWidth : border,
            .foregroundColor : #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        ]
        let myAttributedString = NSAttributedString(string: label.text!, attributes: strokeTextAttributes)
        label.attributedText = myAttributedString
    }
    
    private func setFontGray(_ label: UILabel, _ size: Double, _ border: Double) {
        label.font = UIFont(name: "Inter", size: size)
        ?? .systemFont(ofSize: size, weight: .bold)

        let strokeTextAttributes: [NSAttributedString.Key: Any] = [
            .strokeColor : #colorLiteral(red: 0.4753579497, green: 0.4704254866, blue: 0.4705111384, alpha: 1),
            .strokeWidth : border,
            .foregroundColor : #colorLiteral(red: 0.4753579497, green: 0.4704254866, blue: 0.4705111384, alpha: 1)
        ]
        let myAttributedString = NSAttributedString(string: label.text!, attributes: strokeTextAttributes)
        label.attributedText = myAttributedString
    }
    
    fileprivate func offOnButton(_ bool: Bool, _ button: UIButton) {
        switch button {
        case oneButton:
            if bool {
                twoButton.isUserInteractionEnabled = false
                threeButton.isUserInteractionEnabled = false
                fourButton.isUserInteractionEnabled = false
                fiveButton.isUserInteractionEnabled = false
                sixButton.isUserInteractionEnabled = false
                sevenButton.isUserInteractionEnabled = false
                eightButton.isUserInteractionEnabled = false
                nineButton.isUserInteractionEnabled = false
                tenButton.isUserInteractionEnabled = false
                elevenButton.isUserInteractionEnabled = false
                twelveButton.isUserInteractionEnabled = false
                thirteenButton.isUserInteractionEnabled = false
                fourteenButton.isUserInteractionEnabled = false
            } else {
                twoButton.isUserInteractionEnabled = true
                threeButton.isUserInteractionEnabled = true
                fourButton.isUserInteractionEnabled = true
                fiveButton.isUserInteractionEnabled = true
                sixButton.isUserInteractionEnabled = true
                sevenButton.isUserInteractionEnabled = true
                eightButton.isUserInteractionEnabled = true
                nineButton.isUserInteractionEnabled = true
                tenButton.isUserInteractionEnabled = true
                elevenButton.isUserInteractionEnabled = true
                twelveButton.isUserInteractionEnabled = true
                thirteenButton.isUserInteractionEnabled = true
                fourteenButton.isUserInteractionEnabled = true
            }
        case twoButton:
            if bool {
                oneButton.isUserInteractionEnabled = false
                threeButton.isUserInteractionEnabled = false
                fourButton.isUserInteractionEnabled = false
                fiveButton.isUserInteractionEnabled = false
                sixButton.isUserInteractionEnabled = false
                sevenButton.isUserInteractionEnabled = false
                eightButton.isUserInteractionEnabled = false
                nineButton.isUserInteractionEnabled = false
                tenButton.isUserInteractionEnabled = false
                elevenButton.isUserInteractionEnabled = false
                twelveButton.isUserInteractionEnabled = false
                thirteenButton.isUserInteractionEnabled = false
                fourteenButton.isUserInteractionEnabled = false
            } else {
                oneButton.isUserInteractionEnabled = true
                threeButton.isUserInteractionEnabled = true
                fourButton.isUserInteractionEnabled = true
                fiveButton.isUserInteractionEnabled = true
                sixButton.isUserInteractionEnabled = true
                sevenButton.isUserInteractionEnabled = true
                eightButton.isUserInteractionEnabled = true
                nineButton.isUserInteractionEnabled = true
                tenButton.isUserInteractionEnabled = true
                elevenButton.isUserInteractionEnabled = true
                twelveButton.isUserInteractionEnabled = true
                thirteenButton.isUserInteractionEnabled = true
                fourteenButton.isUserInteractionEnabled = true
            }
        case fourButton:
            if bool {
                oneButton.isUserInteractionEnabled = false
                twoButton.isUserInteractionEnabled = false
                threeButton.isUserInteractionEnabled = false
                
                fiveButton.isUserInteractionEnabled = false
                sixButton.isUserInteractionEnabled = false
                sevenButton.isUserInteractionEnabled = false
                eightButton.isUserInteractionEnabled = false
                nineButton.isUserInteractionEnabled = false
                tenButton.isUserInteractionEnabled = false
                elevenButton.isUserInteractionEnabled = false
                twelveButton.isUserInteractionEnabled = false
                thirteenButton.isUserInteractionEnabled = false
                fourteenButton.isUserInteractionEnabled = false
            } else {
                oneButton.isUserInteractionEnabled = true
                twoButton.isUserInteractionEnabled = true
                threeButton.isUserInteractionEnabled = true
                
                fiveButton.isUserInteractionEnabled = true
                sixButton.isUserInteractionEnabled = true
                sevenButton.isUserInteractionEnabled = true
                eightButton.isUserInteractionEnabled = true
                nineButton.isUserInteractionEnabled = true
                tenButton.isUserInteractionEnabled = true
                elevenButton.isUserInteractionEnabled = true
                twelveButton.isUserInteractionEnabled = true
                thirteenButton.isUserInteractionEnabled = true
                fourteenButton.isUserInteractionEnabled = true
            }
        case sevenButton:
            if bool {
                oneButton.isUserInteractionEnabled = false
                twoButton.isUserInteractionEnabled = false
                threeButton.isUserInteractionEnabled = false
                fourButton.isUserInteractionEnabled = false
                fiveButton.isUserInteractionEnabled = false
                sixButton.isUserInteractionEnabled = false
                
                eightButton.isUserInteractionEnabled = false
                nineButton.isUserInteractionEnabled = false
                tenButton.isUserInteractionEnabled = false
                elevenButton.isUserInteractionEnabled = false
                twelveButton.isUserInteractionEnabled = false
                thirteenButton.isUserInteractionEnabled = false
                fourteenButton.isUserInteractionEnabled = false
            } else {
                oneButton.isUserInteractionEnabled = true
                twoButton.isUserInteractionEnabled = true
                threeButton.isUserInteractionEnabled = true
                fourButton.isUserInteractionEnabled = true
                fiveButton.isUserInteractionEnabled = true
                sixButton.isUserInteractionEnabled = true
                
                eightButton.isUserInteractionEnabled = true
                nineButton.isUserInteractionEnabled = true
                tenButton.isUserInteractionEnabled = true
                elevenButton.isUserInteractionEnabled = true
                twelveButton.isUserInteractionEnabled = true
                thirteenButton.isUserInteractionEnabled = true
                fourteenButton.isUserInteractionEnabled = true
            }
        case tenButton:
            if bool {
                oneButton.isUserInteractionEnabled = false
                twoButton.isUserInteractionEnabled = false
                threeButton.isUserInteractionEnabled = false
                fourButton.isUserInteractionEnabled = false
                fiveButton.isUserInteractionEnabled = false
                sixButton.isUserInteractionEnabled = false
                sevenButton.isUserInteractionEnabled = false
                eightButton.isUserInteractionEnabled = false
                nineButton.isUserInteractionEnabled = false
                
                elevenButton.isUserInteractionEnabled = false
                twelveButton.isUserInteractionEnabled = false
                thirteenButton.isUserInteractionEnabled = false
                fourteenButton.isUserInteractionEnabled = false
            } else {
                oneButton.isUserInteractionEnabled = true
                twoButton.isUserInteractionEnabled = true
                threeButton.isUserInteractionEnabled = true
                fourButton.isUserInteractionEnabled = true
                fiveButton.isUserInteractionEnabled = true
                sixButton.isUserInteractionEnabled = true
                sevenButton.isUserInteractionEnabled = true
                eightButton.isUserInteractionEnabled = true
                nineButton.isUserInteractionEnabled = true
                
                elevenButton.isUserInteractionEnabled = true
                twelveButton.isUserInteractionEnabled = true
                thirteenButton.isUserInteractionEnabled = true
                fourteenButton.isUserInteractionEnabled = true
            }
        case twelveButton:
            if bool {
                oneButton.isUserInteractionEnabled = false
                twoButton.isUserInteractionEnabled = false
                threeButton.isUserInteractionEnabled = false
                fourButton.isUserInteractionEnabled = false
                fiveButton.isUserInteractionEnabled = false
                sixButton.isUserInteractionEnabled = false
                sevenButton.isUserInteractionEnabled = false
                eightButton.isUserInteractionEnabled = false
                nineButton.isUserInteractionEnabled = false
                tenButton.isUserInteractionEnabled = false
                elevenButton.isUserInteractionEnabled = false
                
                thirteenButton.isUserInteractionEnabled = false
                fourteenButton.isUserInteractionEnabled = false
            } else {
                oneButton.isUserInteractionEnabled = true
                twoButton.isUserInteractionEnabled = true
                threeButton.isUserInteractionEnabled = true
                fourButton.isUserInteractionEnabled = true
                fiveButton.isUserInteractionEnabled = true
                sixButton.isUserInteractionEnabled = true
                sevenButton.isUserInteractionEnabled = true
                eightButton.isUserInteractionEnabled = true
                nineButton.isUserInteractionEnabled = true
                tenButton.isUserInteractionEnabled = true
                elevenButton.isUserInteractionEnabled = true
                
                thirteenButton.isUserInteractionEnabled = true
                fourteenButton.isUserInteractionEnabled = true
            }
        case thirteenButton:
            if bool {
                oneButton.isUserInteractionEnabled = false
                twoButton.isUserInteractionEnabled = false
                threeButton.isUserInteractionEnabled = false
                fourButton.isUserInteractionEnabled = false
                fiveButton.isUserInteractionEnabled = false
                sixButton.isUserInteractionEnabled = false
                sevenButton.isUserInteractionEnabled = false
                eightButton.isUserInteractionEnabled = false
                nineButton.isUserInteractionEnabled = false
                tenButton.isUserInteractionEnabled = false
                elevenButton.isUserInteractionEnabled = false
                twelveButton.isUserInteractionEnabled = false
                
                fourteenButton.isUserInteractionEnabled = false
            } else {
                oneButton.isUserInteractionEnabled = true
                twoButton.isUserInteractionEnabled = true
                threeButton.isUserInteractionEnabled = true
                fourButton.isUserInteractionEnabled = true
                fiveButton.isUserInteractionEnabled = true
                sixButton.isUserInteractionEnabled = true
                sevenButton.isUserInteractionEnabled = true
                eightButton.isUserInteractionEnabled = true
                nineButton.isUserInteractionEnabled = true
                tenButton.isUserInteractionEnabled = true
                elevenButton.isUserInteractionEnabled = true
                twelveButton.isUserInteractionEnabled = true
                
                fourteenButton.isUserInteractionEnabled = true
            }
        default:
            if bool {
                oneButton.isUserInteractionEnabled = false
                twoButton.isUserInteractionEnabled = false
                threeButton.isUserInteractionEnabled = false
                fourButton.isUserInteractionEnabled = false
                fiveButton.isUserInteractionEnabled = false
                sixButton.isUserInteractionEnabled = false
                sevenButton.isUserInteractionEnabled = false
                eightButton.isUserInteractionEnabled = false
                nineButton.isUserInteractionEnabled = false
                tenButton.isUserInteractionEnabled = false
                elevenButton.isUserInteractionEnabled = false
                twelveButton.isUserInteractionEnabled = false
                thirteenButton.isUserInteractionEnabled = false
            } else {
                oneButton.isUserInteractionEnabled = true
                twoButton.isUserInteractionEnabled = true
                threeButton.isUserInteractionEnabled = true
                fourButton.isUserInteractionEnabled = true
                fiveButton.isUserInteractionEnabled = true
                sixButton.isUserInteractionEnabled = true
                sevenButton.isUserInteractionEnabled = true
                eightButton.isUserInteractionEnabled = true
                nineButton.isUserInteractionEnabled = true
                tenButton.isUserInteractionEnabled = true
                elevenButton.isUserInteractionEnabled = true
                twelveButton.isUserInteractionEnabled = true
                thirteenButton.isUserInteractionEnabled = true
            }
        }
    }
}

extension NewReservationViewController {
    
    @objc func geoButtonPressed() {
        let newViewController = MapViewController()
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    @objc func dismissKeyboard() {
            view.endEditing(true)
    }
    
    @objc func oneButtonPressed() {
        
        if oneButton.backgroundImage(for: .normal) == UIImage(named: "Ellipse red") {
            
        } else {
            if oneButton.tag == 0 {
                oneButton.setBackgroundImage(UIImage(named: "Ellipse yellow"), for: .normal)
                oneButton.tag = 1
                shumbaumba = 1
                offOnButton(true, oneButton)
            } else {
                oneButton.setBackgroundImage(UIImage(named: "Ellipse green"), for: .normal)
                oneButton.tag = 0
                shumbaumba = 0
                offOnButton(false, oneButton)
            }
        }
        let yellow = true
        self.defaults.set(yellow, forKey: "oneButton")
    }
    
    @objc func twoButtonPressed() {
        
        if twoButton.backgroundImage(for: .normal) == UIImage(named: "Ellipse red") {
            
        } else {
            if twoButton.tag == 0 {
                twoButton.setBackgroundImage(UIImage(named: "Ellipse yellow"), for: .normal)
                let yellow = true
                self.defaults.set(yellow, forKey: "twoButton")
                twoButton.tag = 1
                shumbaumba = 2
                offOnButton(true, twoButton)
            } else {
                twoButton.setBackgroundImage(UIImage(named: "Ellipse green"), for: .normal)
                let yellow = true
                self.defaults.set(yellow, forKey: "twoButton")
                twoButton.tag = 0
                shumbaumba = 0
                offOnButton(false, twoButton)
            }
        }
    }
    
    @objc func fourButtonPressed() {
        if fourButton.backgroundImage(for: .normal) == UIImage(named: "Ellipse red") {
            
        } else {
            
            if fourButton.tag == 0 {
                fourButton.setBackgroundImage(UIImage(named: "Ellipse yellow"), for: .normal)
                let yellow = true
                self.defaults.set(yellow, forKey: "fourButton")
                fourButton.tag = 1
                shumbaumba = 4
                offOnButton(true, fourButton)
            } else {
                fourButton.setBackgroundImage(UIImage(named: "Ellipse green"), for: .normal)
                let yellow = true
                self.defaults.set(yellow, forKey: "fourButton")
                fourButton.tag = 0
                shumbaumba = 0
                offOnButton(false, fourButton)
            }
            
        }
    }
    
    @objc func sevenButtonPressed() {
        
        if sevenButton.backgroundImage(for: .normal) == UIImage(named: "Ellipse red") {
            
        } else {
            if sevenButton.tag == 0 {
                sevenButton.setBackgroundImage(UIImage(named: "Ellipse yellow"), for: .normal)
                let yellow = true
                self.defaults.set(yellow, forKey: "sevenButton")
                sevenButton.tag = 1
                shumbaumba = 7
                offOnButton(true, sevenButton)
            } else {
                sevenButton.setBackgroundImage(UIImage(named: "Ellipse green"), for: .normal)
                let yellow = true
                self.defaults.set(yellow, forKey: "sevenButton")
                sevenButton.tag = 0
                shumbaumba = 0
                offOnButton(false, sevenButton)
            }
        }
    }
    
    @objc func tenButtonPressed() {
        
        if tenButton.backgroundImage(for: .normal) == UIImage(named: "Ellipse red") {
            
        } else {
            
            if tenButton.tag == 0 {
                tenButton.setBackgroundImage(UIImage(named: "Ellipse yellow"), for: .normal)
                let yellow = true
                self.defaults.set(yellow, forKey: "tenButton")
                tenButton.tag = 1
                shumbaumba = 10
                offOnButton(true, tenButton)
            } else {
                tenButton.setBackgroundImage(UIImage(named: "Ellipse green"), for: .normal)
                let yellow = true
                self.defaults.set(yellow, forKey: "tenButton")
                tenButton.tag = 0
                shumbaumba = 0
                offOnButton(false, tenButton)
            }
        }
    }
    
    @objc func twelveButtonPressed() {
        
        if twelveButton.backgroundImage(for: .normal) == UIImage(named: "Ellipse red") {
            
        } else {
            if twelveButton.tag == 0 {
                twelveButton.setBackgroundImage(UIImage(named: "Ellipse yellow"), for: .normal)
                let yellow = true
                self.defaults.set(yellow, forKey: "twelveButton")
                twelveButton.tag = 1
                shumbaumba = 12
                offOnButton(true, twelveButton)
            } else {
                twelveButton.setBackgroundImage(UIImage(named: "Ellipse green"), for: .normal)
                let yellow = true
                self.defaults.set(yellow, forKey: "twelveButton")
                twelveButton.tag = 0
                shumbaumba = 0
                offOnButton(false, twelveButton)
            }
        }
    }
    
    @objc func thirteenButtonPressed() {
        
        if thirteenButton.backgroundImage(for: .normal) == UIImage(named: "Ellipse red") {
            
        } else {
            if thirteenButton.tag == 0 {
                thirteenButton.setBackgroundImage(UIImage(named: "Ellipse yellow"), for: .normal)
                let yellow = true
                self.defaults.set(yellow, forKey: "thirteenButton")
                thirteenButton.tag = 1
                shumbaumba = 12
                offOnButton(true, thirteenButton)
            } else {
                thirteenButton.setBackgroundImage(UIImage(named: "Ellipse green"), for: .normal)
                let yellow = true
                self.defaults.set(yellow, forKey: "thirteenButton")
                thirteenButton.tag = 0
                shumbaumba = 0
                offOnButton(false, thirteenButton)
            }
        }
    }
    
    @objc func fromButtonDataPickerPressed() {
        datapicker.isHidden = false
        jackdawButton.isHidden = false
        scrollView.addSubview(datapicker)
        scrollView.addSubview(jackdawButton)
        if #available(iOS 14.0, *) {
            // Код для iOS 13 и новее
            NSLayoutConstraint.activate([
                datapicker.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
                datapicker.topAnchor.constraint(equalTo: viewGuests.topAnchor),
                
                jackdawButton.widthAnchor.constraint(equalToConstant: 30),
                jackdawButton.heightAnchor.constraint(equalToConstant: 30),
                jackdawButton.centerYAnchor.constraint(equalTo: datapicker.centerYAnchor),
                jackdawButton.leadingAnchor.constraint(equalTo: datapicker.trailingAnchor,constant: 10),
            ])
            
        } else {
            NSLayoutConstraint.activate([
                datapicker.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
                datapicker.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor, constant: -30),
            ])
            
            NSLayoutConstraint.activate([
                jackdawButton.widthAnchor.constraint(equalToConstant: 30),
                jackdawButton.heightAnchor.constraint(equalToConstant: 30),
                jackdawButton.rightAnchor.constraint(equalTo: datapicker.rightAnchor, constant: -10),
                jackdawButton.bottomAnchor.constraint(equalTo: datapicker.bottomAnchor,constant: -10),
            ])
        }
                
       
        
       
        
    }
    
    @objc func jackdawButtonPressed() {
        datapicker.isHidden = true
        jackdawButton.isHidden = true
        
    }
    
    @objc func datePickerValueChanged(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM" // Формат дня и месяца
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm" // Формат часов и минут
        
        let selectedDate = sender.date
        let formattedDate = dateFormatter.string(from: selectedDate)
        let formattedTime = timeFormatter.string(from: selectedDate)
        
        fromdateLabel.text = formattedDate
        fromButtonDataPicker.setTitle(formattedTime, for: .normal)
        toDateLabel.text = formattedDate
        toButtonDataPicker.setTitle("23:00", for: .normal)
    }
    
    @objc func reserveButtonPressed() {
        
        let n = self.defaults.object(forKey: "number") ?? 122
        let number = n as! Int + 1
        self.defaults.set(number, forKey: "number")
        let nameTable = "Reservation\(number)"
        var date = ""
        var date2 = ""
        var nameClient = ""
        var phone = ""
        var comment = ""
        
        //Получаем данные
        if let titleOne = fromButtonDataPicker.title(for: .normal) {
            date = "\(fromdateLabel.text!) \(titleOne)"
        }
        
        if let titleTwo = toButtonDataPicker.title(for: .normal) {
            date2 = "\(toDateLabel.text!) \(titleTwo)"
        }
        
        if let nameText = nameTextField.text {
            nameClient = "\(nameText), \(fourLabel.text!) person"
        }
        
        if let phoneText = phoneTextField.text {
            phone = phoneText
        }
        
        if let commentText = commentTextField.text {
            comment = commentText
        }
        var data: [Data] = []
        let newData = [Data(nameTable: nameTable, date: date, phone: phone, nameClient: nameClient, comment: comment)]
        
        // Загружаем дату чтобы добавить ее в массив
        if let dataa = defaults.data(forKey: "persons") {
            do {
                let decoder = JSONDecoder()
                let arrayOfPersons = try decoder.decode([Data].self, from: dataa)
                data = arrayOfPersons
                data += newData
            } catch {
                print("Ошибка при декодировании данных: \(error.localizedDescription)")
            }
        }
        
        // Обновляем ТабБар
        
        if errorLabel.text == "" || errorLabel.text == "wrong date" || errorLabel.text == "Enter your name" || errorLabel.text == "enter phone" || errorLabel.text == "choose a table"  {
            
            if date >= date2 {
                self.errorLabel.isHidden = false
                self.errorLabel.text = "wrong date"
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                    self.errorLabel.isHidden = true
                }
            } else if nameClient == ", \(fourLabel.text!) person" {
                self.errorLabel.isHidden = false
                self.errorLabel.text = "Enter your name"
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                    self.errorLabel.isHidden = true
                }
            } else if phone == "" {
                self.errorLabel.isHidden = false
                self.errorLabel.text = "enter phone"
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                    self.errorLabel.isHidden = true
                }
            } else if shumbaumba == 0  {
                self.errorLabel.isHidden = false
                self.errorLabel.text = "choose a table"
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                    self.errorLabel.isHidden = true
                }
            } else {
                
                DispatchQueue.main.async {
                    do {
                        let encoder = JSONEncoder()
                        let datas = try encoder.encode(data)
                        DispatchQueue.main.async {
                            self.defaults.set(datas, forKey: "persons")
                            print("я сохранился")
                        }
                    } catch {
                        print("Ошибка при кодировании данных: \(error.localizedDescription)")
                    }
                }
                
//                var session = self.defaults.object(forKey: "session")
//                if session as! Int == 1 {
//                    session = 2
//                    DispatchQueue.main.async { self.defaults.set(session, forKey: "session") }
//                    
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                        DispatchQueue.main.async {
//                            self.view.window?.rootViewController = UINavigationController(rootViewController: InstructionsViewController(data: newData))
//                        }
//                    }
//                } else {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        self.view.window?.rootViewController = UINavigationController(rootViewController: EnjoyViewController())
                    }
//                }
                
            }
            
        }
    }
        
    @objc func checkMarkButtonPressed() {
        if checkMarkButton.tag == 0 {
            countGuestsView.isHidden = false
            buttonNumberOne.isHidden = false
            buttonNumberTwo.isHidden = false
            buttonNumberThree.isHidden = false
            buttonNumberFour.isHidden = false
            checkMarkButton.tag = 1
        } else {
            countGuestsView.isHidden = true
            buttonNumberOne.isHidden = true
            buttonNumberTwo.isHidden = true
            buttonNumberThree.isHidden = true
            buttonNumberFour.isHidden = true
            checkMarkButton.tag = 0
        }
        
    }
    
    @objc func buttonNumberOnePressed() {
        checkMarkButton.tag = 0
        countGuestsView.isHidden = true
        buttonNumberOne.isHidden = true
        buttonNumberTwo.isHidden = true
        buttonNumberThree.isHidden = true
        buttonNumberFour.isHidden = true
        fourLabel.text = "1"
    }
    
    @objc func buttonNumberTwoPressed() {
        checkMarkButton.tag = 0
        countGuestsView.isHidden = true
        buttonNumberOne.isHidden = true
        buttonNumberTwo.isHidden = true
        buttonNumberThree.isHidden = true
        buttonNumberFour.isHidden = true
        fourLabel.text = "2"
    }
    
    @objc func buttonNumberThreePressed() {
        checkMarkButton.tag = 0
        countGuestsView.isHidden = true
        buttonNumberOne.isHidden = true
        buttonNumberTwo.isHidden = true
        buttonNumberThree.isHidden = true
        buttonNumberFour.isHidden = true
        fourLabel.text = "3"
    }
    
    @objc func buttonNumberFourPressed() {
        checkMarkButton.tag = 0
        countGuestsView.isHidden = true
        buttonNumberOne.isHidden = true
        buttonNumberTwo.isHidden = true
        buttonNumberThree.isHidden = true
        buttonNumberFour.isHidden = true
        fourLabel.text = "4"
    }
}

extension NewReservationViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView == self.pickerView {
            return 1
        } else if pickerView == self.pickerViewTwo {
            return 1
        }
        return 1 // Количество столбцов в UIPickerView
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == self.pickerView {
            return dataForPiccker.count
        } else if pickerView == self.pickerViewTwo {
            return dataForPicckerTwo.count
        }
        return dataForPiccker.count // Количество строк в UIPickerView
    }

    // MARK: - UIPickerViewDelegate

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == self.pickerView {
            return dataForPiccker[row]
        } else if pickerView == self.pickerViewTwo {
            return dataForPicckerTwo[row]
        }
        return dataForPiccker[row] // Текст для отображения в каждой строке UIPickerView
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == self.pickerView {
            let selectedOption = dataForPiccker[row] // Выбранная опция в UIPickerView
            fromButtonDataPicker.setTitle(selectedOption, for: .normal) // Устанавливаем выбранное значение в качестве заголовка кнопки
            pickerView.removeFromSuperview() // Удаляем UIPickerView с экрана
        } else if pickerView == pickerViewTwo {
            let selectedOption = dataForPicckerTwo[row] // Выбранная опция в UIPickerView
            toButtonDataPicker.setTitle(selectedOption, for: .normal) // Устанавливаем выбранное значение в качестве заголовка кнопки
            pickerViewTwo.removeFromSuperview() // Удаляем UIPickerView с экрана
        }
        
    }
}

extension NewReservationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
}


