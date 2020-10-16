//
//  GoogleMapsViewController.swift
//  MapboxXGoogleMaps
//
//  Created by Sebastian Osiński on 15/10/2020.
//

import UIKit
import GoogleMaps

class GoogleMapsViewController: UIViewController {
    let mapView = GMSMapView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        mapView.mapType = .satellite

        mapView.animate(toLocation: .init(latitude: 32.363120, longitude: 15.095134))
        mapView.animate(toZoom: 15)

        let markers = [
            GMSMarker(position: .init(latitude: 32.363120, longitude: 15.095134)),
            GMSMarker(position: .init(latitude: 32.363120, longitude: 15.094134)),
            GMSMarker(position: .init(latitude: 32.363120, longitude: 15.093134)),
            GMSMarker(position: .init(latitude: 32.363120, longitude: 15.092134))
        ]

        markers.forEach { $0.map = mapView }
    }
}
