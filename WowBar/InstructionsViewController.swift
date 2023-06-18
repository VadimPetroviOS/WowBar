//
//  InstructionsViewController.swift
//  WowBar
//
//  Created by Вадим on 22.05.2023.
//

import UIKit
import SnapKit

class InstructionsViewController: UIViewController {
    
    var data: [Data]
    
    init(data: [Data]) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    var x: CGFloat = 0
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
    
    let wof: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Wheel of Fortune")
        return imageView
    }()
    
    let text: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "textHonor")
        return imageView
    }()
    
    let textView: UITextView = {
        let textView = UITextView()
        textView.text = "In honor of the opening of our WOW bar - we give prizes to everyone!\n\nSpin the wheel of fortune and show the qr-qode to the waiter when paying for the order"
        textView.textAlignment = .center
        textView.isEditable = false
        textView.backgroundColor = UIColor.clear
        textView.textColor = UIColor.white
        return textView
    }()
    
    let bonusButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "bonusButton"), for: .normal)
        button.addTarget(self, action: #selector(bonusButtonPressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstants()
        setSubviews()
        setConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        textView.font = UIFont(name: "Katibeh-Regular", size: Constants.setSizeY(28))
    }
    
    private func setSubviews() {
        view.addSubview(background)
        background.addSubview(logo)
        background.addSubview(wof)
        background.addSubview(text)
        view.addSubview(bonusButton)
    }
    
    private func setConstraints() {
        background.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        logo.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(95), height: Constants.setSizeY(95)))
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(16.24)
        }
        
        wof.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(290), height: Constants.setSizeY(45)))
            $0.centerX.equalToSuperview()
            $0.top.equalTo(logo.snp.bottom).offset(Constants.setSizeY(77))
        }
        
        text.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(341), height: Constants.setSizeY(156)))
            $0.centerX.equalToSuperview()
            $0.top.equalTo(wof.snp.bottom).offset(Constants.setSizeY(80))
        }
        
        bonusButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(CGSize(width: Constants.setSizeY(217), height: Constants.setSizeY(67)))
            $0.top.equalTo(text.snp.bottom).offset(Constants.setSizeY(60))
        }
    }
        
    private func setConstants() {
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        x = screenWidth/375
        y = screenHeight/812
    }
    
    private func setFont(_ label: UILabel, _ size: Double, _ border: Double) {
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
}

extension InstructionsViewController {
    @objc private func bonusButtonPressed() {
        self.view.window?.rootViewController = UINavigationController(rootViewController: WheelViewController(data: self.data))
    }
}
