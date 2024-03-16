//
//  HomeViewController.swift
//  CFH-Task-Ahmed-Elshobary
//
//  Created by ahmed elshobary on 16/03/2024.
//

import UIKit
import SideMenu
import CoreLocation
import MapKit

enum SelectedView{
    case listView
    case mapView
}
class HomeViewController: UIViewController {
    
    // MARK: - Variables
    
    var locationManager: CLLocationManager!
    var userLatitude: Double?
    var userLongitude: Double?
    var venuesData: VenueModelResponse?
    var viewModel: HomeViewModel = .init()
    var currendView: SelectedView = .listView
    
    // MARK: - Outlets
    
    @IBOutlet weak var mapViewButtonOutlet: UIButton!
    @IBOutlet weak var listViewButtonOutlet: UIButton!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var enableLocationLabel: UILabel!
    @IBOutlet weak var venuesTableView: UITableView!
    
    // MARK: - Actions
    
    @IBAction func listView(_ sender: Any) {
        setDefaults()
        listViewButtonOutlet.backgroundColor = UIColor.init(netHex: 0x002A5B)
        listViewButtonOutlet.setTitleColor(UIColor.white, for: .normal)
        mapView.isHidden = true
        venuesTableView.isHidden = false
        currendView = .listView
    }
    
    @IBAction func mapViewAction(_ sender: Any) {
        setDefaults()
        mapViewButtonOutlet.backgroundColor = UIColor.init(netHex: 0x002A5B)
        mapViewButtonOutlet.setTitleColor(UIColor.white, for: .normal)
        venuesTableView.isHidden = true
        mapView.isHidden = false
        currendView = .mapView
        
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaults()
        listViewButtonOutlet.backgroundColor = UIColor.init(netHex: 0x002A5B)
        listViewButtonOutlet.setTitleColor(UIColor.white, for: .normal)
        mapView.isHidden = true
        venuesTableView.isHidden = false
        currendView = .listView
        setupLocationManager()
        bindNearbyVenues()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Set up location manager
           locationManager.delegate = self
           
           // Check the current authorization status
        let authorizationStatus = locationManager.authorizationStatus

           // Handle authorization status
        if authorizationStatus == .restricted || authorizationStatus == .denied {
            handleAuthorizationStatus(authorizationStatus)
        }
    }
    
    private func setupLocationManager(){
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
   
    func setDefaults(){
        listViewButtonOutlet.backgroundColor = UIColor.white
        listViewButtonOutlet.setTitleColor(UIColor.init(netHex: 0x002A5B), for: .normal)
        
        mapViewButtonOutlet.backgroundColor = UIColor.white
        mapViewButtonOutlet.setTitleColor(UIColor.init(netHex: 0x002A5B), for: .normal)
        
        venuesTableView.estimatedRowHeight = 115
        venuesTableView.rowHeight = UITableView.automaticDimension
        
        mapView.isHidden = true
        venuesTableView.isHidden = true
    }
    
    @IBAction func showSideMenu(_ sender: Any) {
        let sideMenuVC = SideMenuViewController.loadFromNib()
        sideMenuVC.sourceVC = .home
        let menu = SideMenuNavigationController(rootViewController: sideMenuVC)
        self.navigationController?.present(menu, animated: true, completion: nil)
    }
    
     func searchNearbyVenues(){
         self.startLoading()
        viewModel.search(lat: String(UserDefaultsManager.shared.getLatitude() ?? 30.041206), long: String(UserDefaultsManager.shared.getLongitude() ?? 31.247477))
    }
    
    func addAnnotationsToMap() {
        guard let venues = venuesData?.response?.venues else { return }
        
        var annotations: [MKAnnotation] = []
        
        // Retrieve user location from UserDefaults
        if let userLatitude = UserDefaultsManager.shared.getLatitude(),
           let userLongitude = UserDefaultsManager.shared.getLongitude() {
            
            let userCoordinate = CLLocationCoordinate2D(latitude: userLatitude, longitude: userLongitude)
            let userAnnotation = MKPointAnnotation()
            userAnnotation.coordinate = userCoordinate
            userAnnotation.title = "User Location"
            
            annotations.append(userAnnotation)
        }
        
        for venue in venues {
            if let location = venue.location,
               let name = venue.name,
               let lat = location.lat,
               let lng = location.lng {
                
                let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lng)
                let annotation = MKPointAnnotation()
                annotation.coordinate = coordinate
                annotation.title = name
                
                // Set additional venue info as annotation's subtitle
                var subtitle = ""
                if let address = location.address {
                    subtitle += address + "\n"
                }
                if let categories = venue.categories, let categoryName = categories.first?.name {
                    subtitle += "Category: \(categoryName)"
                }
                annotation.subtitle = subtitle
                
                annotations.append(annotation)
            }
        }
        
        mapView.addAnnotations(annotations)
        
        // Set the region to show all annotations
        mapView.showAnnotations(annotations, animated: true)
    }



    func bindNearbyVenues(){
        
        viewModel.error.listen(on: { [weak self] error in
            self?.stopLoading()
            self?.present(HelperMethods.showAlert(title: "Alert", message: error?.localizedDescription ?? "Some thing went wrong"), animated: true)
        })
        
        viewModel.venuesObject.listen(on: { [weak self] value in
            self?.stopLoading()
            // save user data
            guard let data = value else {return}
            self?.venuesData = data
            self?.addAnnotationsToMap()
            self?.venuesTableView.reloadData()
        })
        
    }
   
}
