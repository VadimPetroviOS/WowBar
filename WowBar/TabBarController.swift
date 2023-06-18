//
//  TabBarController.swift
//  WowBar
//
//  Created by Вадим on 24.05.2023.
//

import UIKit

class TabBarController: UITabBarController {

    var data: [Data]
    
    init(data: [Data]) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    private lazy var middleButton: UIButton = {
        let middleButton = UIButton()
        middleButton.setBackgroundImage(UIImage(named: "plus"), for: .normal)
        middleButton.addTarget(self, action: #selector(didPressMiddleButton), for: .touchUpInside)
        middleButton.translatesAutoresizingMaskIntoConstraints = false
        return middleButton
    }()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundImage = UIImage()
        tabBar.addSubview(middleButton)
        middleButton.snp.makeConstraints {
            $0.height.equalTo(74)
            $0.width.equalTo(74)
            $0.centerX.equalTo(tabBar.snp.centerX)
            $0.top.equalTo(tabBar.snp.top).inset(Constants.setSizeY(-20))
        }
        
        var value = ""
        if let valueValue = self.defaults.object(forKey: "value") as? String {
            value = valueValue
    }
        
        viewControllers = [
            createNavControler(viewControler: TimeTableViewController(data: data),
                               image: "history"),
            createNavControler(viewControler: MenuViewController(),
                               image: "Menu"),
            createNavControler(viewControler: NewReservationViewController(), //NewReservationViewController()ThirdViewController
                               image: "pluss"),
            createNavControler(viewControler: DiscountViewController(),
                               image: "%"),
            createNavControler(viewControler: WinViewController(value: value, fromTabBar: true, data: self.data),
                               image: "surprise"),
            
        ]
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    fileprivate func createNavControler(viewControler: UIViewController,
                                        image: String) -> UIViewController {
        let navController = UINavigationController(rootViewController: viewControler)
        navController.navigationBar.prefersLargeTitles = true
        navController.tabBarItem.image = UIImage(named: image)
        tabBar.tintColor = .white
        return navController
    }
    
    @objc
    private func didPressMiddleButton() {
        //
    }
}






