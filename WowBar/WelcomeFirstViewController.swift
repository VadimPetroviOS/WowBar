//
//  WelcomeFirstViewController.swift
//  WowBar
//
//  Created by Вадим on 22.05.2023.
//

import UIKit
import SnapKit

class WelcomeFirstViewController: UIViewController {
    
    let logo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    let background: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        return imageView
    }()
    
    let text: UIImageView = {
        let imageView = UIImageView()
//        imageView.backgroundColor = .gray
        imageView.image = UIImage(named: "text")
        return imageView
    }()
    
    let blurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let view = UIVisualEffectView(effect: blurEffect)
        return view
//        blurView.frame = text.bounds
//        text.addSubview(blurView)
    }()
    
    private let bonusButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "bonusButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(bonusButtonPressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setConstants()
        setSubviews()
        setConstraints()  
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func setSubviews() {
        view.addSubview(logo)
        view.addSubview(background)
        background.addSubview(text)
        
        view.addSubview(bonusButton)
    }
    
    private func setConstraints() {
        logo.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(16)
            make.size.equalTo(CGSize(width: Constants.setSizeY(95), height: Constants.setSizeY(95)))
        }
        
        background.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(logo.snp.bottom)
            make.size.equalTo(CGSize(width: Constants.setSizeY(375), height: Constants.setSizeY(598)))
        }
        
        text.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: Constants.setSizeY(323), height: Constants.setSizeY(87)))
            make.bottom.equalTo(background.snp.bottom).inset(Constants.setSizeY(81))
        }
        
        bonusButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.height.equalTo(CGSize(width: Constants.setSizeY(222), height: Constants.setSizeY(56)))
            make.bottom.equalTo(background.snp.bottom).inset(Constants.setSizeY(7))
        }
        
        
    }
        
    private func setConstants() {
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
    }
                                      
    
    @objc private func bonusButtonPressed() {
        self.view.window?.rootViewController = UINavigationController(rootViewController: InstructionsViewController(data: []))
    }
}









