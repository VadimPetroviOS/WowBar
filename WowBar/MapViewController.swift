//
//  MapViewController.swift
//  WowBar
//
//  Created by Вадим on 16.06.2023.
//

import UIKit
import SnapKit
import MapKit

class MapViewController: UIViewController {

    private lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        return mapView
    }()
    
    let locationManager = CLLocationManager()
    
    let viewTabBar: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = Constants.setSizeY(32)
        return view
    }()
    
    let viewLogo: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = Constants.setSizeY(32)
        return view
    }()
    
    let logo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "back"), for: .normal)
        button.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        return button
    }()
    
    let klobuca: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "klobuca")
        return imageView
    }()
    
    let copyButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "copy"), for: .normal)
        button.addTarget(self, action: #selector(copyButtonPressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        showLocationOnMap(address: "Kłobucka 27, Warszawa, Mazowieckie 02-699, Poland")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationEnabled()
    }
    
    private func setupManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    private func checkLocationEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            
        } else {
            
            let alert = UIAlertController(title: "У вас включена служба геолокации", message: "Хотите включить?", preferredStyle: .alert)
            
            let settingsAction = UIAlertAction(title: "Настройки", style: .default) { (alert) in
                if let url = URL(string: "App-Prefs:root=LOCATION_SERVICES") {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            }
            let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
            
            alert.addAction(settingsAction)
            alert.addAction(cancelAction)
            
            present(alert, animated: true)
        }
    }
    
    private func setupUI() {
        view.addSubview(mapView)
        mapView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        view.addSubview(viewTabBar)
        viewTabBar.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.height.equalTo(Constants.setSizeY(115))
        }
        view.addSubview(viewLogo)
        viewLogo.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.height.equalTo(Constants.setSizeY(150))
        }
        view.addSubview(logo)
        logo.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(95), height: Constants.setSizeY(95)))
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(Constants.setSizeY(16))
        }
        view.addSubview(backButton)
        backButton.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(36), height: Constants.setSizeY(36)))
            $0.centerY.equalTo(logo.snp.centerY)
            $0.right.equalTo(view.snp.right).inset(Constants.setSizeY(20))
        }
        view.addSubview(klobuca)
        klobuca.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(312), height: Constants.setSizeY(32)))
            $0.centerX.equalTo(logo.snp.centerX)
            $0.top.equalTo(backButton.snp.bottom).offset(Constants.setSizeY(20))
        }
        view.addSubview(copyButton)
        copyButton.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.setSizeY(14), height: Constants.setSizeY(14)))
            $0.centerY.equalTo(klobuca.snp.centerY)
            $0.right.equalTo(klobuca.snp.right).inset(Constants.setSizeY(8))
        }
    }
    
    func showLocationOnMap(address: String) {
            let geocoder = CLGeocoder()
            geocoder.geocodeAddressString(address) { (placemarks, error) in
                if let error = error {
                    print("Ошибка геокодирования: \(error.localizedDescription)")
                    return
                }
                
                if let placemark = placemarks?.first {
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = placemark.location!.coordinate
                    annotation.title = address
                    self.mapView.addAnnotation(annotation)
                    let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 2000, longitudinalMeters: 2000) // Здесь задан радиус карты в метрах
                    self.mapView.setRegion(region, animated: true)
                }
            }
        }
    
    @objc func backButtonPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func copyButtonPressed() {
        UIPasteboard.general.string = "Kłobucka 27, Warszawa, Mazowieckie 02-699, Poland"
    }
}

extension MapViewController: CLLocationManagerDelegate {
    
}
