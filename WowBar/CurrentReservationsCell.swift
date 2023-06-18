//
//  CurrentReservations.swift
//  WowBar
//
//  Created by Вадим on 03.06.2023.
//

import UIKit
import SnapKit

class CurrentReservationsCell: UICollectionViewCell {
    
    static let identifier = "cellIDOne"
    var x: CGFloat = 0
    var y: CGFloat = 0
    let defaults = UserDefaults.standard
    
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
        label.isHidden = false
        return label
    }()
    
    let editNameTable: UITextField = {
        let textField = UITextField()
        textField.text = "Пример текста"
        textField.borderStyle = .roundedRect
        textField.textAlignment = .center
        textField.isUserInteractionEnabled = false
        textField.backgroundColor = UIColor.clear
        textField.textColor = UIColor.white
        let font = UIFont.systemFont(ofSize: Constants.setSizeY(11), weight: .regular)
        textField.font = font
        textField.isHidden = true
        return textField
    }()
    
    let editNameTableButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "pencil"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = true
        return button
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "fsjngokwe"
        label.isHidden = false
        return label
    }()
    
    let editDateView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 9
        view.layer.borderWidth = 0.5
        view.layer.borderColor = #colorLiteral(red: 0.4753579497, green: 0.4704254866, blue: 0.4705111384, alpha: 1)
        view.isHidden = true
        return view
    }()
    
    let editDate: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.clear
        textField.textColor = UIColor.white
        let font = UIFont(name: "Katibeh-Regular", size: Constants.setSizeY(28))
        textField.font = font
        textField.isHidden = true
        textField.isUserInteractionEnabled = false
        return textField
    }()
    
    let editDateButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "pencil"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = true
        return button
    }()
    
    let nameClientLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "fsjngokwe"
        label.isHidden = false
        return label
    }()
    
    let nameClientView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 9
        view.layer.borderWidth = 0.5
        view.layer.borderColor = #colorLiteral(red: 0.4753579497, green: 0.4704254866, blue: 0.4705111384, alpha: 1)
        view.isHidden = true
        return view
    }()
    
    let nameClientButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "pencil"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = true
        return button
    }()
    
    let editNameClient: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.clear
        textField.textColor = UIColor.white
        let font = UIFont(name: "Katibeh-Regular", size: Constants.setSizeY(28))
        textField.font = font
        textField.isHidden = true
        textField.isUserInteractionEnabled = false
        return textField
    }()
    
    let commentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "fsjngokwe"
        label.isHidden = false
        return label
    }()
    
    let pencilButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "pencil"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = false
        return button
    }()
    
    let qrButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "openQrCode"), for: .normal)
        button.isHidden = false
        return button
    }()
    
    let jackdawButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "jackdaw"), for: .normal)
        button.isHidden = true
        return button
    }()
    
    let crossButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "cross"), for: .normal)
        button.isHidden = true
        return button
    }()
    
    let cancelTableButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "cancelTable"), for: .normal)
        button.isHidden = true
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        editNameTable.delegate = self
        editDate.delegate = self
        editNameClient.delegate = self
        backgroundColor = .black
        setConstants()
        setSubviews()
        setConstraints()
        setFontInter(nameTableLabel, Constants.setSizeY(11.0), 0)
        setFontKatibeh(dateLabel, Constants.setSizeY(28.0), 0)
        setFontKatibeh(nameClientLabel, Constants.setSizeY(28.0), 0)
        setFontInterGray(commentLabel, Constants.setSizeY(11), 0)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.addGestureRecognizer(tapGesture)
        
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
        self.addSubview(image)
        self.addSubview(pencilButton)
        self.addSubview(qrButton)
        self.addSubview(editNameTable)
        self.addSubview(editNameTableButton)
        self.addSubview(editDateView)
        editDateView.addSubview(editDate)
        self.addSubview(editDateButton)
        self.addSubview(nameClientView)
        self.addSubview(nameClientButton)
        self.addSubview(jackdawButton)
        self.addSubview(crossButton)
        self.addSubview(cancelTableButton)
        nameClientView.addSubview(editNameClient)
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
        
        pencilButton.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(21), height: Constants.setSizeY(21)))
            $0.top.equalTo(image.snp.top).inset(Constants.setSizeY(20))
            $0.right.equalTo(image.snp.right).inset(Constants.setSizeY(10))
        }
        
        qrButton.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(100), height: Constants.setSizeY(30)))
            $0.bottom.equalTo(image.snp.bottom).inset(Constants.setSizeY(10))
            $0.right.equalTo(image.snp.right).inset(Constants.setSizeY(10))
        }
        
        editNameTableButton.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(11), height: Constants.setSizeY(11)))
            $0.centerX.equalTo(image.snp.centerX).offset(Constants.setSizeY(55))
            $0.centerY.equalTo(image.snp.centerY).offset(Constants.setSizeY(-80))
        }
        
        nameTableLabel.snp.makeConstraints {
            $0.centerX.equalTo(image.snp.centerX)
            $0.top.equalTo(image.snp.top).offset(Constants.setSizeY(3))
        }
        
        editNameTable.snp.makeConstraints {
            $0.width.equalTo(Constants.setSizeY(100))
            $0.centerX.equalTo(image.snp.centerX)
            $0.centerY.equalTo(image.snp.centerY).offset(Constants.setSizeY(-80))
        }
        
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(image.snp.top).offset(Constants.setSizeY(38))
            $0.left.equalTo(image.snp.left).inset(Constants.setSizeY(136))
        }
        
        editDateView.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(136), height: Constants.setSizeY(28)))
            $0.top.equalTo(image.snp.top).offset(Constants.setSizeY(31))
            $0.left.equalTo(image.snp.left).inset(Constants.setSizeY(126))
        }
        
        editDate.snp.makeConstraints {
            $0.width.equalTo(Constants.setSizeY(116))
            $0.top.equalTo(editDateView.snp.top).inset(Constants.setSizeY(7))
            $0.left.equalTo(editDateView.snp.left).inset(Constants.setSizeY(10))
        }
        
        editDateButton.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(11), height: Constants.setSizeY(11)))
            $0.centerX.equalTo(editDateView.snp.right)
            $0.centerY.equalTo(editDateView.snp.centerY)
        }
        
        nameClientLabel.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(Constants.setSizeY(14))
            $0.left.equalTo(dateLabel.snp.left)
        }
        
        nameClientView.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(186), height: Constants.setSizeY(33)))
            $0.top.equalTo(editDateView.snp.bottom).offset(Constants.setSizeY(14))
            $0.left.equalTo(editDateView.snp.left)
        }
        
        nameClientButton.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(11), height: Constants.setSizeY(11)))
            $0.centerX.equalTo(nameClientView.snp.right)
            $0.centerY.equalTo(nameClientView.snp.centerY)
        }
        
        editNameClient.snp.makeConstraints {
            $0.width.equalTo(Constants.setSizeY(157))
            $0.top.equalTo(nameClientView.snp.top).inset(Constants.setSizeY(7))
            $0.left.equalTo(nameClientView.snp.left).inset(Constants.setSizeY(10))
        }
        
        commentLabel.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(165), height: Constants.setSizeY(40)))
            $0.top.equalTo(nameClientView.snp.bottom)
            $0.left.equalTo(nameClientLabel.snp.left)
        }
        
        jackdawButton.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(21), height: Constants.setSizeY(21)))
            $0.top.equalTo(image.snp.top).inset(Constants.setSizeY(20))
            $0.right.equalTo(image.snp.right).inset(Constants.setSizeY(10))
        }
        
        crossButton.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(16), height: Constants.setSizeY(16)))
            $0.centerY.equalTo(jackdawButton.snp.centerY)
            $0.right.equalTo(jackdawButton.snp.left).offset(Constants.setSizeY(-5))
        }
        
        cancelTableButton.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(158), height: Constants.setSizeY(29)))
            $0.bottom.equalTo(image.snp.bottom).inset(Constants.setSizeY(10))
            $0.right.equalTo(image.snp.right).inset(Constants.setSizeY(10))
        }
    }
    
    func setNameTable(_ text: String) {
        nameTableLabel.text = text
        editNameTable.text = text
    }
    
    func setDateLabel(_ text: String) {
        dateLabel.text = text
        editDate.text = text
    }
    
    func setNameClient(_ text: String) {
        nameClientLabel.text = text
        editNameClient.text = text
    }
    
    func setComment(_ text: String) {
        if text == "" {
            commentLabel.text = "Add comment to table reservation"
        } else {
            commentLabel.text = text
        }
    }
    
    func jobobo() {
        qrButton.isHidden = true
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


extension CurrentReservationsCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
    }
}
