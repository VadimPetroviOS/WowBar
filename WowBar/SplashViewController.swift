//
//  SplashViewController.swift.swift
//  WowBar
//
//  Created by Вадим on 22.05.2023.
//

import UIKit
import SnapKit

class SplashViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    
    let logo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setSubviews()
        setConstraints()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
            var session = self.defaults.object(forKey: "session") ?? 0
            var vc = UIViewController()
            if session as! Int == 0 {
                vc = WelcomeFirstViewController()
            } else {
                    if let dataa = self.defaults.data(forKey: "persons") {
                        do {
                            let decoder = JSONDecoder()
                            let arrayOfPersons = try decoder.decode([Data].self, from: dataa)
                            let data = arrayOfPersons
                            vc = TabBarController(data: data)
                        } catch {
                            print("Ошибка при декодировании данных: \(error.localizedDescription)")
                        }
                    } else {
                        vc = TabBarController(data: [])
                    }                
            }
            session = session as! Int + 1
            DispatchQueue.main.async {
                self.defaults.set(session, forKey: "session")
            }
            self.view.window?.rootViewController = UINavigationController(rootViewController: vc)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func setSubviews() {
        view.addSubview(logo)
    }
    
    private func setConstraints() {
        logo.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(CGSize(width: Constants.setSizeY(212), height: Constants.setSizeY(212)))
        }
    }
}









