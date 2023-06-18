//
//  EnjoyViewController.swift
//  WowBar
//
//  Created by Вадим on 07.06.2023.
//

import UIKit
import SnapKit

class EnjoyViewController: UIViewController {
    
    let defaults = UserDefaults.standard
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
    
    let enjoy: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Enjoy this time!")
        return imageView
    }()
    
    let image: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Rectangle 25-2")
        return imageView
    }()
    
    let text: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "The table has been successfully booked!")
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setConstants()
        setSubviews()
        setConstraints()
        
        if let data = self.defaults.data(forKey: "persons") {
            do {
                let decoder = JSONDecoder()
                let arrayOfPersons = try decoder.decode([Data].self, from: data)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    self.view.window?.rootViewController = UINavigationController(rootViewController: TabBarController(data: arrayOfPersons))
                }
                
            } catch {
                print("Ошибка при декодировании данных: \(error.localizedDescription)")
            }
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
        
        background.addSubview(enjoy)
        enjoy.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.size.equalTo(CGSize(width: Constants.setSizeY(300), height: Constants.setSizeY(60)))
            $0.top.equalTo(logo.snp.bottom).offset(Constants.setSizeY(14))
        }
        background.addSubview(image)
        image.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(CGSize(width: Constants.setSizeY(344), height: Constants.setSizeY(323)))
            $0.top.equalTo(enjoy.snp.bottom).offset(Constants.setSizeY(47))
        }
        background.addSubview(text)
        text.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(CGSize(width: Constants.setSizeY(244), height: Constants.setSizeY(68)))
            $0.top.equalTo(image.snp.bottom).offset(Constants.setSizeY(62))
        }
    }
        
    private func setConstants() {
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        x = screenWidth/375
        y = screenHeight/812
    }
}









