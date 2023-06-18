//
//  WinViewController.swift
//  WowBar
//
//  Created by Вадим on 23.05.2023.
//

import UIKit
import SnapKit

class WinViewController: UIViewController {
    
    var x: CGFloat = 0
    var y: CGFloat = 0
    let defaults = UserDefaults.standard
    
    var value: String
    var fromTabBar: Bool
    var data: [Data]
    
    init(value: String, fromTabBar: Bool, data: [Data]) {
        self.value = value
        self.fromTabBar = fromTabBar
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    let background: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "winBG")
        return imageView
    }()
    
    let logo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    let wowWin: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Your Wow Win")
        imageView.isHidden = false
        return imageView
    }()
    
    let gold: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "gold")
        imageView.isHidden = false
        return imageView
    }()
    
    let incomeLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        return label
    }()
    
    let text: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "qrText")
        imageView.isHidden = true
        return imageView
    }()
    
    let qrCode: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "qrCode")
        imageView.isHidden = true
        return imageView
    }()
    
    let geoButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "geo"), for: .normal)
        button.addTarget(self, action: #selector(geoButtonPressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        incomeLabel.text = value
        setConstants()
        setSubviews()
        setConstraints()
        
        if !fromTabBar {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.wowWin.isHidden = true
                self.gold.isHidden = true
                self.text.isHidden = false
                self.qrCode.isHidden = false
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                DispatchQueue.main.async {
                    self.view.window?.rootViewController = UINavigationController(rootViewController: TabBarController(data: self.data))
                }
            }
        } else {
            self.wowWin.isHidden = true
            self.gold.isHidden = true
            self.text.isHidden = false
            self.qrCode.isHidden = false
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setFont(incomeLabel, Constants.setSizeY(65), -2.0)
    }
    
    private func setConstants() {
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        x = screenWidth/375
        y = screenHeight/812
    }
    
    private func setSubviews() {
        view.addSubview(background)
        background.addSubview(logo)
        background.addSubview(wowWin)
        background.addSubview(gold)
        background.addSubview(incomeLabel)
        background.addSubview(text)
        background.addSubview(qrCode)
        
    }
    
    private func setConstraints() {
        background.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        logo.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(95), height: Constants.setSizeY(95)))
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(Constants.setSizeY(16))
        }
        
        wowWin.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(300), height: Constants.setSizeY(162)))
            $0.centerX.equalToSuperview()
            $0.top.equalTo(logo.snp.bottom).offset(Constants.setSizeY(56))
        }
        
        gold.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(359), height: Constants.setSizeY(269)))
            $0.centerX.equalToSuperview()
            $0.top.equalTo(wowWin.snp.bottom).offset(Constants.setSizeY(13))
        }
        
        incomeLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(gold.snp.bottom).offset(Constants.setSizeY(13))
        }
        
        text.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(286), height: Constants.setSizeY(81)))
            $0.centerX.equalToSuperview()
            $0.top.equalTo(logo.snp.bottom).offset(Constants.setSizeY(104))
            
        }
        
        qrCode.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(228), height: Constants.setSizeY(228)))
            $0.centerX.equalToSuperview()
            $0.top.equalTo(text.snp.bottom).offset(Constants.setSizeY(58))
        }
        view.addSubview(geoButton)
        geoButton.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(36), height: Constants.setSizeY(36)))
            $0.centerY.equalTo(logo.snp.centerY)
            $0.right.equalToSuperview().inset(Constants.setSizeY(20))
        }
    }
    
    private func setFont(_ label: UILabel, _ size: Double, _ border: Double) {
        label.font = UIFont(name: "AnticDidone-Regular", size: size)
        ?? .systemFont(ofSize: size, weight: .bold)

        let strokeTextAttributes: [NSAttributedString.Key: Any] = [
            .strokeColor : #colorLiteral(red: 0.982283771, green: 0.781255424, blue: 0, alpha: 1),
            .strokeWidth : border,
            .foregroundColor : #colorLiteral(red: 0.9601890445, green: 0.8562752604, blue: 0.0006004792522, alpha: 1)
        ]
        let myAttributedString = NSAttributedString(string: label.text!, attributes: strokeTextAttributes)
        label.attributedText = myAttributedString
    }
    
    @objc func geoButtonPressed() {
        let newViewController = MapViewController()
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
}









