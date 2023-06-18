//
//  CongratsViewController.swift
//  WowBar
//
//  Created by Вадим on 07.06.2023.
//

import UIKit
import SnapKit

class CongratsViewController: UIViewController {
    
    var data: [Data]
    
    init(data: [Data]) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    var x: CGFloat = 0
    var y: CGFloat = 0
    
    let logo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    let background: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "BG")
        return imageView
    }()
    
    let congratulations: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Congratulations!")
        return imageView
    }()
    
    let image: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Rectangle 25")
        return imageView
    }()
    
    let text: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "You have")
        return imageView
    }()
    
    let bonus: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "welcome bonus!")
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setConstants()
        setSubviews()
        setConstraints()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.view.window?.rootViewController = UINavigationController(rootViewController: InstructionsViewController(data: self.data))
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func setSubviews() {
        
        view.addSubview(background)
        view.addSubview(logo)
        
    }
    
    private func setConstraints() {
        background.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        logo.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(background.snp.top).offset(Constants.setSizeY(16))
            make.size.equalTo(CGSize(width: Constants.setSizeY(95), height: Constants.setSizeY(95)))
        }
        
        background.addSubview(congratulations)
        congratulations.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.size.equalTo(CGSize(width: Constants.setSizeY(323), height: Constants.setSizeY(60)))
            $0.top.equalTo(logo.snp.bottom).offset(Constants.setSizeY(56))
        }
        background.addSubview(image)
        image.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(CGSize(width: Constants.setSizeY(344), height: Constants.setSizeY(215)))
            $0.top.equalTo(congratulations.snp.bottom).offset(Constants.setSizeY(44))
        }
        background.addSubview(text)
        text.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(CGSize(width: Constants.setSizeY(341), height: Constants.setSizeY(190)))
            $0.top.equalTo(image.snp.bottom).offset(Constants.setSizeY(26))
        }
        background.addSubview(bonus)
        bonus.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(CGSize(width: Constants.setSizeY(238), height: Constants.setSizeY(28)))
            $0.bottom.equalTo(text.snp.bottom).offset(Constants.setSizeY(7))
        }
        
        
    }
        
    private func setConstants() {
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        x = screenWidth/375
        y = screenHeight/812
    }
}









