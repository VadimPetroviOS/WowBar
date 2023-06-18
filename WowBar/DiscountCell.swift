//
//  DiscountCell.swift
//  WowBar
//
//  Created by Вадим on 24.05.2023.
//

import UIKit

class DiscountCell: UICollectionViewCell {
    
    static let identifier = "cellID"
    var z: CGFloat = 0
    var k: CGFloat = 0
    var x: CGFloat = Constants.setSizeY(55)
    var y: CGFloat = 0
    
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
    
    let image: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let topImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let bottomImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let topLabel: UILabel = {
        let label = UILabel()
        label.text = "1000"
        return label
    }()
    
    let bottomText: UITextView = {
        let textView = UITextView()
        textView.text = "In honor of the opening of our WOW bar - we give prizes to everyone!\n\nSpin the wheel of fortune and show the qr-qode to the waiter when paying for the order"
        textView.textAlignment = .center
        textView.isEditable = false
        textView.backgroundColor = UIColor.clear
        textView.textColor = UIColor.white
        return textView
    }()
    
    let geoButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "geo"), for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        setSubviews()
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    private func setSubviews() {
        self.addSubview(background)
        background.addSubview(logo)
        background.addSubview(image)
        background.addSubview(topImage)
        background.addSubview(bottomImage)
    }
    
    private func setConstraints() {
        background.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
//        background.snp.makeConstraints {
//            $0.top.equalToSuperview().offset(-90)
//            $0.left.equalToSuperview()
//            $0.right.equalToSuperview()
//            $0.bottom.equalToSuperview()
//        }
        logo.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(95), height: Constants.setSizeY(95)))
            $0.centerX.equalToSuperview()
            $0.top.equalTo(background.snp.top).offset(Constants.setSizeY(16))
        }
        image.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(344), height: Constants.setSizeY(554)))
            $0.top.equalTo(logo.snp.bottom)
            $0.centerX.equalTo(background.snp.centerX)
        }
        topImage.snp.makeConstraints {
            $0.height.equalTo(Constants.setSizeY(45))
            $0.width.equalTo(Constants.setSizeY(z))
            $0.top.equalTo(image.snp.top).inset(Constants.setSizeY(22))
            $0.centerX.equalTo(background.snp.centerX)
        }
        bottomImage.snp.makeConstraints {
            $0.top.equalTo(image.snp.bottom).inset(Constants.setSizeY(65))
            $0.width.equalTo(Constants.setSizeY(k))
            $0.height.equalTo(Constants.setSizeY(x))
//            $0.bottom.equalTo(image.snp.bottom).inset(Constants.setSizeY(15))
            $0.centerX.equalTo(background.snp.centerX)
        }
        
        self.addSubview(geoButton)
        geoButton.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(36), height: Constants.setSizeY(36)))
            $0.centerY.equalTo(logo.snp.centerY)
            $0.right.equalToSuperview().inset(Constants.setSizeY(20))
        }
    }
    
    func setImage(_ imageName: String,_ z: CGFloat, _ k: CGFloat) {
        image.image = UIImage(named: imageName)
        self.z = z
        self.k = k
//        if k < 300 {
//            x = Constants.setSizeY(66)
//        }
        setConstraints()
    }
    
    func setFraze(_ imageName: String) {
        topImage.image = UIImage(named: imageName)
    }
    func setText(_ imageName: String) {
        bottomImage.image = UIImage(named: imageName)

    }
    
}
