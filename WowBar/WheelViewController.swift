//
//  WheelViewController.swift
//  WowBar
//
//  Created by Вадим on 23.05.2023.
//

import UIKit
import SnapKit

class WheelViewController: UIViewController {
    
    var data: [Data]
    
    init(data: [Data]) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    let defaults = UserDefaults.standard
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
    
    let wheel: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "wheel")
        return imageView
    }()
    
    private let wheelButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "wheelButton"), for: .normal)
        button.isUserInteractionEnabled = false
        return button
    }()
    
    let arrow: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "arrow")
        return imageView
    }()
    
    private let spinButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "spinButton"), for: .normal)
        button.addTarget(self, action: #selector(spinButtonPressed), for: .touchUpInside)
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
    
    private func setSubviews() {
        view.addSubview(background)
        background.addSubview(logo)
        background.addSubview(wof)
        background.addSubview(wheel)
        background.addSubview(wheelButton)
        background.addSubview(arrow)
        view.addSubview(spinButton)
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
        
        wof.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(290), height: Constants.setSizeY(45)))
            $0.centerX.equalToSuperview()
            $0.top.equalTo(logo.snp.bottom).offset(Constants.setSizeY(8))
        }
        
        wheel.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(380), height: Constants.setSizeY(505)))
            $0.center.equalToSuperview()
        }
        
        wheelButton.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(160), height: Constants.setSizeY(160)))
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(Constants.setSizeY(1.5))
        }
        
        arrow.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(100), height: Constants.setSizeY(100)))
            $0.top.equalTo(wheel.snp.top).offset(Constants.setSizeY(44))
            $0.centerX.equalToSuperview()
        }
        
        spinButton.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(158), height: Constants.setSizeY(67)))
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(Constants.setSizeY(-135))
        }
    }
    
    private func setConstants() {
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        x = screenWidth/375
        y = screenHeight/812
    }
    
    fileprivate func rotationAnimation10() -> Int {
        let randomNumber = Double(Int.random(in: 1...10))
        print(randomNumber)
        
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.fromValue = 0
        if randomNumber == 1.0  {
            rotationAnimation.toValue = CGFloat.pi * 2 + CGFloat.pi * 1/10
        } else if randomNumber < 25 {
            rotationAnimation.toValue = CGFloat.pi * 2 + (CGFloat.pi * 2/10) * randomNumber - CGFloat.pi * 1/10
        } else {
            rotationAnimation.toValue = CGFloat.pi * 2 + (CGFloat.pi * 2/10) * randomNumber - CGFloat.pi * 1/10
        }
        print(rotationAnimation.toValue)
        rotationAnimation.duration = 4.0
        rotationAnimation.repeatCount = 1
        rotationAnimation.fillMode = .forwards
        rotationAnimation.isRemovedOnCompletion = false
        
        let timingFunction = CAMediaTimingFunction(name: .easeOut) // добавляем плавную остановку анимации
        rotationAnimation.timingFunction = timingFunction
        
        // Добавляем анимацию на изображение
        self.wheel.layer.add(rotationAnimation, forKey: "rotationAnimation")
        return Int(randomNumber)
    }
}

extension WheelViewController {
    @objc private func spinButtonPressed() {
        let number = rotationAnimation10()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            switch number {
            case 1:
                self.defaults.set("400", forKey: "value")
                self.view.window?.rootViewController = UINavigationController(rootViewController: WinViewController(value: "400", fromTabBar: false, data: self.data))
            case 2:
                self.defaults.set("500", forKey: "value")
                self.view.window?.rootViewController = UINavigationController(rootViewController: WinViewController(value: "500", fromTabBar: false, data: self.data))
            case 3:
                self.defaults.set("100", forKey: "value")
                self.view.window?.rootViewController = UINavigationController(rootViewController: WinViewController(value: "100", fromTabBar: false, data: self.data))
            case 4:
                self.view.window?.rootViewController = UINavigationController(rootViewController: WheelViewController(data: []))
            case 5:
                self.defaults.set("350", forKey: "value")
                self.view.window?.rootViewController = UINavigationController(rootViewController: WinViewController(value: "350", fromTabBar: false, data: self.data))
            case 6:
                self.defaults.set("250", forKey: "value")
                self.view.window?.rootViewController = UINavigationController(rootViewController: WinViewController(value: "250", fromTabBar: false, data: self.data))
            case 7:
                self.defaults.set("50", forKey: "value")
                self.view.window?.rootViewController = UINavigationController(rootViewController: WinViewController(value: "50", fromTabBar: false, data: self.data))
            case 8:
                self.defaults.set("200", forKey: "value")
                self.view.window?.rootViewController = UINavigationController(rootViewController: WinViewController(value: "200", fromTabBar: false, data: self.data))
            case 9:
                self.defaults.set("1000", forKey: "value")
                self.view.window?.rootViewController = UINavigationController(rootViewController: WinViewController(value: "1000", fromTabBar: false, data: self.data))
            default:
                self.defaults.set("750", forKey: "value")
                self.view.window?.rootViewController = UINavigationController(rootViewController: WinViewController(value: "750", fromTabBar: false, data: self.data))
            }
        }
    }
}








