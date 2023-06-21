//
//  HistoryReservationsCell.swift
//  WowBar
//
//  Created by Вадим on 06.06.2023.
//

import UIKit
import SnapKit

class HistoryReservationsCell: UICollectionViewCell {
    
    static let identifier = "cellIDTwo"
    var x: CGFloat = 0
    var y: CGFloat = 0
    
    let background: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "BG")
        return imageView
    }()
    
    let image: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Gimage 62")
        return imageView
    }()
    
    let topImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let bottomImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let nameTableLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "fsjngokwe"
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "fsjngokwe"
        return label
    }()
    
    let nameClientLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "fsjngokwe"
        return label
    }()
    
    let commentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "fsjngokwe"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let feedbackButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "feedback"), for: .normal)
        return button
    }()
    
    let textView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = #colorLiteral(red: 0.1372548938, green: 0.1372548938, blue: 0.1372548938, alpha: 1)
        textView.layer.cornerRadius = 12
        textView.textColor = #colorLiteral(red: 0.8509805799, green: 0.8509805799, blue: 0.8509805202, alpha: 1)
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        textView.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.addGestureRecognizer(tapGesture)
        
        backgroundColor = .black
        setConstants()
        setSubviews()
        setConstraints()
        setFontInter(nameTableLabel, 11.0, 0)
        setFontKatibeh(dateLabel, 28.0, 0)
        setFontKatibeh(nameClientLabel, 28.0, 0)
        setFontInterGray(commentLabel, 11, 0)
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    private func setConstants() {
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        x = screenWidth/375
        y = screenHeight/812
    }
    
    private func setSubviews() {
        self.addSubview(background)
        self.addSubview(feedbackButton)
        self.addSubview(textView)
        background.addSubview(image)
        image.addSubview(nameTableLabel)
        image.addSubview(dateLabel)
        image.addSubview(nameClientLabel)
        image.addSubview(commentLabel)
    }
    
    private func setConstraints() {
        background.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        image.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(344), height: Constants.setSizeY(182)))
            $0.centerX.equalTo(background.snp.centerX)
        }
        
        feedbackButton.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(98), height: Constants.setSizeY(29)))
            $0.bottom.equalTo(image.snp.bottom).inset(Constants.setSizeY(10))
            $0.right.equalTo(image.snp.right).inset(Constants.setSizeY(10))
        }
        
        nameTableLabel.snp.makeConstraints {
            $0.centerX.equalTo(image.snp.centerX)
            $0.top.equalTo(image.snp.top).offset(Constants.setSizeY(3))
        }
        
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(image.snp.top).offset(Constants.setSizeY(38))
            $0.left.equalTo(image.snp.left).inset(Constants.setSizeY(136))
        }
        
        nameClientLabel.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(Constants.setSizeY(14))
            $0.left.equalTo(dateLabel.snp.left)
        }
        
//        commentLabel.snp.makeConstraints {
//            $0.size.equalTo(CGSize(width: Constants.setSizeY(165), height: Constants.setSizeY(40)))
//            $0.top.equalTo(nameClientLabel.snp.bottom)//.offset(Constants.setSizeY(14))
//            $0.left.equalTo(nameClientLabel.snp.left)
//        }
        
        textView.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(191), height: Constants.setSizeY(39)))
            $0.bottom.equalTo(feedbackButton.snp.top).offset(-5)
            $0.left.equalTo(nameClientLabel.snp.left)
        }
    }
    
    func setNameTable(_ text: String) {
        nameTableLabel.text = text
    }
    
    func setDateLabel(_ text: String) {
        dateLabel.text = text
    }
    
    func setNameClient(_ text: String) {
        nameClientLabel.text = text
    }
    
    func setComment(_ text: String) {
        commentLabel.text = text
    }
    
    private func setFontInter(_ label: UILabel, _ size: Double, _ border: Double) {
        label.font = UIFont(name: "Inter", size: size)
        ?? .systemFont(ofSize: size, weight: .regular)

        let strokeTextAttributes: [NSAttributedString.Key: Any] = [
            .strokeColor : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
            .strokeWidth : border,
            .foregroundColor : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        ]
        let myAttributedString = NSAttributedString(string: label.text!, attributes: strokeTextAttributes)
        label.attributedText = myAttributedString
    }
    
    private func setFontKatibeh(_ label: UILabel, _ size: Double, _ border: Double) {
        label.font = UIFont(name: "Katibeh-Regular", size: size)
        ?? .systemFont(ofSize: size, weight: .bold)

        let strokeTextAttributes: [NSAttributedString.Key: Any] = [
            .strokeColor : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
            .strokeWidth : border,
            .foregroundColor : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        ]
        let myAttributedString = NSAttributedString(string: label.text!, attributes: strokeTextAttributes)
        label.attributedText = myAttributedString
    }
    
    private func setFontInterGray(_ label: UILabel, _ size: Double, _ border: Double) {
        label.font = UIFont(name: "Inter", size: size)
        ?? .systemFont(ofSize: size, weight: .regular)

        let strokeTextAttributes: [NSAttributedString.Key: Any] = [
            .strokeColor : #colorLiteral(red: 0.4753579497, green: 0.4704254866, blue: 0.4705111384, alpha: 1),
            .strokeWidth : border,
            .foregroundColor : #colorLiteral(red: 0.4753579497, green: 0.4704254866, blue: 0.4705111384, alpha: 1)
        ]
        let myAttributedString = NSAttributedString(string: label.text!, attributes: strokeTextAttributes)
        label.attributedText = myAttributedString
    }
    
    @objc func dismissKeyboard() {
        self.endEditing(true)
    }
}

extension HistoryReservationsCell: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
           if text == "\n" {
               textView.resignFirstResponder() // Закрываем клавиатуру
               return false
           }
           return true
    }
}



/*
 
 class CurrentReservationsCell: UICollectionViewCell {
     
     static let identifier = "cell1"
     
     let background: UIImageView = {
         let imageView = UIImageView()
         imageView.image = UIImage(named: "BG")
         return imageView
     }()
     
     let image: UIImageView = {
         let imageView = UIImageView()
         imageView.image = UIImage(named: "Be Loco") //Be Loco //Gimage 62
         return imageView
     }()
     
     let tableNameLabel: UILabel = {
         let label = UILabel()
         return label
     }()
     
     let timeLabel: UILabel = {
         let label = UILabel()
         return label
     }()
     
     let nameClientLabel: UILabel = {
         let label = UILabel()
         return label
     }()
     
     let commentLabel: UILabel = {
         let label = UILabel()
         return label
     }()
     
     override init(frame: CGRect) {
         super.init(frame: frame)
         backgroundColor = .blue
 //        setConstants()
         setSubviews()
         setConstraints()
     }
     
     required init?(coder: NSCoder) { fatalError() }
     
     private func setSubviews() {
 //        self.addSubview(background)
 //        background.addSubview(image)
     }
     
     private func setConstraints() {
 //        background.snp.makeConstraints{
 //            $0.edges.equalToSuperview()
 //        }
 //        image.snp.makeConstraints {
 //            $0.size.equalTo(CGSize(width: 344, height: 183))
 //            $0.centerX.equalToSuperview()
 //            $0.top.equalTo(background.snp.top).offset(16)
 //        }
     }
 }

 
 */
