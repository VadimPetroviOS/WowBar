//
//  DiscountViewController.swift
//  WowBar
//
//  Created by Вадим on 24.05.2023.
//

import UIKit

//class DiscountViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
class DiscountViewController: UIViewController {
    
    let discountData = ["Fortune", "Fridey", "Lunchtime"]
    let discountFraze = ["Wheel of Fortune", "Lunchtime 1", "Friday night out"]
    let discountText = ["Spin", "Every day", "Every Friday"]
    
    let background: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "BG")
        return imageView
    }()
    
    var colView: UICollectionView!
    
    lazy var pageControl: UIPageControl = {
         let pc = UIPageControl()
         pc.currentPage = 0
         pc.numberOfPages = discountData.count
        pc.currentPageIndicatorTintColor = #colorLiteral(red: 0.9862137437, green: 0.7851949334, blue: 0.01395483781, alpha: 1)
         pc.pageIndicatorTintColor = .gray
         
         return pc
     }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: view.frame.width, height: view.frame.height)
        colView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        colView.delegate = self
        colView.dataSource = self
        colView.register(DiscountCell.self, forCellWithReuseIdentifier: DiscountCell.identifier)
        colView.backgroundColor = UIColor.white
        
        colView.isPagingEnabled = true
        
        view.addSubview(background)
        view.addSubview(colView)
        view.addSubview(pageControl)
        
        background.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        pageControl.snp.makeConstraints{
            $0.bottom.equalToSuperview().offset(Constants.setSizeY(-100))
            $0.centerX.equalToSuperview()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @objc func geoButtonPressed(sender: UIButton) {
        let newViewController = MapViewController()
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
}

extension DiscountViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return discountData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiscountCell.identifier, for: indexPath) as! DiscountCell
        var z: CGFloat = 0
        var k: CGFloat = 0
        if discountData[indexPath.row] == "Fortune" {
            z = 290
            k = 308
        } else if discountData[indexPath.row] == "Fridey" {
            z = 175
            k = 270
        } else if discountData[indexPath.row] == "Lunchtime" {
            z = 275
            k = 290
        }
        cell.setImage(discountData[indexPath.row], z, k)
        cell.setFraze(discountFraze[indexPath.row])
        cell.setText(discountText[indexPath.row])
        
        cell.geoButton.tag = indexPath.row
        cell.geoButton.addTarget(self, action: #selector(geoButtonPressed(sender:)), for: .touchUpInside)
        
//        let storeData = storeData[indexPath.item]
//        cell.storeData = storeData
//        cell.value = defaults.object(forKey: "value") as? String
//        cell.soundPlaing = soundPlaing
//        cell.language = language
//        cell.mainBG = mainBG
//        navigationController?.setNavigationBarHidden(true, animated: false)
        return cell
    }
//
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.bounds.width, height: self.view.bounds.height)
    }
//
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

extension DiscountViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / scrollView.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
}
