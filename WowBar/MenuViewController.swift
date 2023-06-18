//
//  MenuViewController.swift
//  WowBar
//
//  Created by Вадим on 24.05.2023.
//

import UIKit
import SnapKit

class MenuViewController: UIViewController {
    
    var x: CGFloat = 0
    var y: CGFloat = 0
    
    private var customNavigationBar = UINavigationBar()
    
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.showsVerticalScrollIndicator = true
        view.isDirectionalLockEnabled = true
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    let topView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    let middleView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
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
    
    let endScroll: UILabel = {
        let label = UILabel()
        label.text = ""
        return label
    }()
    
    let exclusiveCocktails: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Exclusive cocktails")
        return imageView
    }()
    
    let beMemorable: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Be Memorable")
        return imageView
    }()
    
    let beLoco: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Be Loco")
        return imageView
    }()
    
    let beGenie: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Be a Genie")
        return imageView
    }()
    
    let beFragrance: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Be Fragrance")
        return imageView
    }()
    
    let bePrepared: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Be Prepared")
        return imageView
    }()
    
    let classicCocktails: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Classic cocktails")
        return imageView
    }()
    
    let negroni: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Negroni")
        return imageView
    }()
    
    let oldFashioned: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Old Fashioned")
        return imageView
    }()
    
    let manhattan: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Manhattan")
        return imageView
    }()
    
    let french75: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "French 75")
        return imageView
    }()
    
    let espressoMartini: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Espresso Martini")
        return imageView
    }()
    
    let aperolSpritz: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Aperol Spritz")
        return imageView
    }()
    
    let cosmopolitan: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Cosmopolitan")
        return imageView
    }()
    
    let mojito: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Mojito")
        return imageView
    }()
    
    let darkStormy: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Dark and Stormy")
        return imageView
    }()
    
    let margarita: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Margarita")
        return imageView
    }()
    
    let nonAlcoholic: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Non alcoholic cocktails")
        return imageView
    }()
    
    let beMoravian: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Be Moravian")
        return imageView
    }()
    
    let beGlamorous: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Be Glamorous")
        return imageView
    }()
    
    let floweryCitrus: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Flowery citrus")
        return imageView
    }()
    
    let cherryPicante: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "CHERRY PICANTE")
        return imageView
    }()
    
    let verjusVeritas: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "IN VERJUS VERITAS")
        return imageView
    }()
    
    let lemonades: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Home made lemonades")
        return imageView
    }()
    
    let ginFizz: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Gin Fizz")
        return imageView
    }()
    
    let dropMartini: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Drop Martini")
        return imageView
    }()
    
    let paloma: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Paloma")
        return imageView
    }()
    
    let whiskeySour: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Whiskey Sour")
        return imageView
    }()
    
    let watermelonMarga: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Watermelon Marga")
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
        
        scrollView.contentInsetAdjustmentBehavior = .never
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        customNavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100))
        view.addSubview(customNavigationBar)

        setConstants()
        setSubviews()
        setConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func setConstants() {
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        x = screenWidth/375
        y = screenHeight/812
    }
    
    private func setSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(topView)
        contentView.addSubview(middleView)
        middleView.addSubview(background)
        middleView.addSubview(endScroll)
        background.addSubview(logo)
        background.addSubview(exclusiveCocktails)
        background.addSubview(beMemorable)
        background.addSubview(beLoco)
        background.addSubview(beGenie)
        background.addSubview(beFragrance)
        background.addSubview(bePrepared)
        background.addSubview(classicCocktails)
        background.addSubview(negroni)
        background.addSubview(oldFashioned)
        background.addSubview(manhattan)
        background.addSubview(french75)
        background.addSubview(espressoMartini)
        background.addSubview(aperolSpritz)
        background.addSubview(cosmopolitan)
        background.addSubview(mojito)
        background.addSubview(darkStormy)
        background.addSubview(margarita)
        background.addSubview(nonAlcoholic)
        background.addSubview(beMoravian)
        background.addSubview(beGlamorous)
        background.addSubview(floweryCitrus)
        background.addSubview(cherryPicante)
        background.addSubview(verjusVeritas)
        background.addSubview(lemonades)
        background.addSubview(ginFizz)
        background.addSubview(dropMartini)
        background.addSubview(paloma)
        background.addSubview(whiskeySour)
        background.addSubview(watermelonMarga)
    }
    
    private func setConstraints() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.snp.edges)
            $0.centerX.equalTo(scrollView.snp.centerX)
        }
        
        topView.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top)
            $0.left.equalTo(contentView.snp.left)
            $0.right.equalTo(contentView.snp.right)
            $0.height.equalTo(1)
        }
        
        middleView.snp.makeConstraints {
            $0.top.equalTo(topView.snp.top)
            $0.left.equalTo(contentView.snp.left)
            $0.right.equalTo(contentView.snp.right)
            $0.bottom.equalTo(contentView.snp.bottom)
        }
        
        background.snp.makeConstraints {
            $0.top.equalTo(middleView.snp.top).offset(Constants.setSizeY(0)) //-90
            $0.left.equalTo(middleView.snp.left)
            $0.right.equalTo(middleView.snp.right)
            $0.height.equalTo(Constants.setSizeY(3500))
        }
        endScroll.snp.makeConstraints {
            $0.top.equalTo(background.snp.bottom)
            $0.left.equalTo(middleView.snp.left)
            $0.right.equalTo(middleView.snp.right)
            $0.bottom.equalTo(contentView.snp.bottom)
        }
        logo.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(95), height: Constants.setSizeY(95)))
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(Constants.setSizeY(16))
        }
        exclusiveCocktails.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(126), height: Constants.setSizeY(15)))
            $0.centerX.equalToSuperview()
            $0.top.equalTo(logo.snp.bottom).offset(Constants.setSizeY(10))
        }
        exclusiveCocktails.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(126), height: Constants.setSizeY(18)))
            $0.centerX.equalToSuperview()
            $0.top.equalTo(logo.snp.bottom).offset(Constants.setSizeY(10))
        }
        beMemorable.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(344), height: Constants.setSizeY(100)))
            $0.centerX.equalToSuperview()
            $0.top.equalTo(exclusiveCocktails.snp.bottom).offset(Constants.setSizeY(20))
        }
        beLoco.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(344), height: Constants.setSizeY(100)))
            $0.centerX.equalToSuperview()
            $0.top.equalTo(beMemorable.snp.bottom).offset(Constants.setSizeY(15))
        }
        beGenie.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(344), height: Constants.setSizeY(100)))
            $0.centerX.equalToSuperview()
            $0.top.equalTo(beLoco.snp.bottom).offset(Constants.setSizeY(15))
        }
        beFragrance.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(344), height: Constants.setSizeY(100)))
            $0.centerX.equalToSuperview()
            $0.top.equalTo(beGenie.snp.bottom).offset(Constants.setSizeY(15))
        }
        bePrepared.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(344), height: Constants.setSizeY(100)))
            $0.centerX.equalToSuperview()
            $0.top.equalTo(beFragrance.snp.bottom).offset(Constants.setSizeY(15))
        }
        classicCocktails.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(112), height: Constants.setSizeY(15)))
            $0.centerX.equalToSuperview()
            $0.top.equalTo(bePrepared.snp.bottom).offset(Constants.setSizeY(42))
        }
        negroni.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(344), height: Constants.setSizeY(100)))
            $0.centerX.equalToSuperview()
            $0.top.equalTo(classicCocktails.snp.bottom).offset(Constants.setSizeY(15))
        }
        oldFashioned.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(344), height: Constants.setSizeY(100)))
            $0.centerX.equalToSuperview()
            $0.top.equalTo(negroni.snp.bottom).offset(Constants.setSizeY(15))
        }
        manhattan.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(344), height: Constants.setSizeY(100)))
            $0.centerX.equalToSuperview()
            $0.top.equalTo(oldFashioned.snp.bottom).offset(Constants.setSizeY(15))
        }
        french75.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(344), height: Constants.setSizeY(100)))
            $0.centerX.equalToSuperview()
            $0.top.equalTo(manhattan.snp.bottom).offset(Constants.setSizeY(15))
        }
        espressoMartini.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(344), height: Constants.setSizeY(100)))
            $0.centerX.equalToSuperview()
            $0.top.equalTo(french75.snp.bottom).offset(Constants.setSizeY(15))
        }
        aperolSpritz.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(344), height: Constants.setSizeY(100)))
            $0.centerX.equalToSuperview()
            $0.top.equalTo(espressoMartini.snp.bottom).offset(Constants.setSizeY(15))
        }
        cosmopolitan.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(344), height: Constants.setSizeY(100)))
            $0.centerX.equalToSuperview()
            $0.top.equalTo(aperolSpritz.snp.bottom).offset(Constants.setSizeY(15))
        }
        mojito.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(344), height: Constants.setSizeY(100)))
            $0.centerX.equalToSuperview()
            $0.top.equalTo(cosmopolitan.snp.bottom).offset(Constants.setSizeY(15))
        }
        darkStormy.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(344), height: Constants.setSizeY(100)))
            $0.centerX.equalToSuperview()
            $0.top.equalTo(mojito.snp.bottom).offset(Constants.setSizeY(15))
        }
        margarita.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(344), height: Constants.setSizeY(100)))
            $0.centerX.equalToSuperview()
            $0.top.equalTo(darkStormy.snp.bottom).offset(Constants.setSizeY(15))
        }
        nonAlcoholic.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(155), height: Constants.setSizeY(15)))
            $0.centerX.equalToSuperview()
            $0.top.equalTo(margarita.snp.bottom).offset(Constants.setSizeY(50))
        }
        beMoravian.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(344), height: Constants.setSizeY(100)))
            $0.centerX.equalToSuperview()
            $0.top.equalTo(nonAlcoholic.snp.bottom).offset(Constants.setSizeY(27))
        }
        beGlamorous.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(344), height: Constants.setSizeY(100)))
            $0.centerX.equalToSuperview()
            $0.top.equalTo(beMoravian.snp.bottom).offset(Constants.setSizeY(15))
        }
        floweryCitrus.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(344), height: Constants.setSizeY(100)))
            $0.centerX.equalToSuperview()
            $0.top.equalTo(beGlamorous.snp.bottom).offset(Constants.setSizeY(15))
        }
        cherryPicante.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(344), height: Constants.setSizeY(100)))
            $0.centerX.equalToSuperview()
            $0.top.equalTo(floweryCitrus.snp.bottom).offset(Constants.setSizeY(15))
        }
        verjusVeritas.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(344), height: Constants.setSizeY(100)))
            $0.centerX.equalToSuperview()
            $0.top.equalTo(cherryPicante.snp.bottom).offset(Constants.setSizeY(15))
        }
        lemonades.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(155), height: Constants.setSizeY(15)))
            $0.centerX.equalToSuperview()
            $0.top.equalTo(verjusVeritas.snp.bottom).offset(Constants.setSizeY(50))
        }
        ginFizz.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(344), height: Constants.setSizeY(100)))
            $0.centerX.equalToSuperview()
            $0.top.equalTo(lemonades.snp.bottom).offset(Constants.setSizeY(27))
        }
        dropMartini.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(344), height: Constants.setSizeY(100)))
            $0.centerX.equalToSuperview()
            $0.top.equalTo(ginFizz.snp.bottom).offset(Constants.setSizeY(15))
        }
        paloma.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(344), height: Constants.setSizeY(100)))
            $0.centerX.equalToSuperview()
            $0.top.equalTo(dropMartini.snp.bottom).offset(Constants.setSizeY(15))
        }
        whiskeySour.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(344), height: Constants.setSizeY(100)))
            $0.centerX.equalToSuperview()
            $0.top.equalTo(paloma.snp.bottom).offset(Constants.setSizeY(15))
        }
        watermelonMarga.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(344), height: Constants.setSizeY(100)))
            $0.centerX.equalToSuperview()
            $0.top.equalTo(whiskeySour.snp.bottom).offset(Constants.setSizeY(15))
        }
        
        middleView.addSubview(geoButton)
        geoButton.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(36), height: Constants.setSizeY(36)))
            $0.centerY.equalTo(logo.snp.centerY)
            $0.right.equalTo(middleView.snp.right).inset(Constants.setSizeY(20))
        }
        
    }
    
    @objc func geoButtonPressed() {
        let newViewController = MapViewController()
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
}









