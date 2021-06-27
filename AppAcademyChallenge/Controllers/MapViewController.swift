//
//  MapViewController.swift
//  AppAcademyChallenge
//
//  Created by Thonatas Borges on 20/05/21.
//

import UIKit
import MapKit
import SnapKit

class MapViewController: UIViewController {
    
    private lazy var myMapView: MKMapView = {
        let mapView = MKMapView()
        mapView.mapType = MKMapType.standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()

    var candidateManager = CandidateManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        candidateManager.parseToCsv()
        addMapView()
        
        let states = candidateManager.returnAllStates()
        getDirections(enterdLocations: states)

        
    }
    
    private func addMapView() {
        view.addSubview(myMapView)
        
        myMapView.snp.makeConstraints { make in
            make.top.equalTo(self.view).offset(150)
            make.bottom.equalTo(self.view)
            make.leading.equalTo(self.view).offset(5)
            make.trailing.equalTo(self.view).offset(-5)
        }
    }
    
    
    func getDirections(enterdLocations:[String])  {
        
        var locations = [MKPointAnnotation]()
        for item in enterdLocations {
            let geocoder = CLGeocoder()
            geocoder.geocodeAddressString(item, completionHandler: {(placemarks, error) -> Void in
                if((error) != nil){
                    print("Error")
                }
                if let placemark = placemarks?.first {

                    let coordinates:CLLocationCoordinate2D = placemark.location!.coordinate

                    let dropPin = MKPointAnnotation()
                    dropPin.coordinate = coordinates
                    dropPin.title = item
                    self.myMapView.addAnnotation(dropPin)
                    self.myMapView.selectAnnotation( dropPin, animated: true)

                    locations.append(dropPin)
                    //add this if you want to show them all
                    self.myMapView.showAnnotations(locations, animated: true)
                }
            })
        }
    }

}
