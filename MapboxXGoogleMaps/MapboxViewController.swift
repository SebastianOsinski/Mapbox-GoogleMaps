//
//  MapboxViewController.swift
//  MapboxXGoogleMaps
//
//  Created by Sebastian Osiński on 15/10/2020.
//

import UIKit
import Mapbox

class MapboxViewController: UIViewController {
    let mapView = MGLMapView()

    let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self

        view.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

        button.setTitle("GoogleMaps", for: .normal)
        button.backgroundColor = .systemGreen
        button.addTarget(self, action: #selector(openGoogleMaps), for: .touchUpInside)

        mapView.setCenter(
            .init(latitude: 32.363120, longitude: 15.095134),
            zoomLevel: 15,
            animated: false
        )
    }

    @objc private func openGoogleMaps() {
        present(UINavigationController(rootViewController: GoogleMapsViewController()), animated: true)
    }
}

extension MapboxViewController: MGLMapViewDelegate {
    func mapViewDidFinishLoadingMap(_ mapView: MGLMapView) {
        mapView.addAnnotations([
            Annotation(coordinate: .init(latitude: 32.363120, longitude: 15.095134)),
            Annotation(coordinate: .init(latitude: 32.363120, longitude: 15.094134)),
            Annotation(coordinate: .init(latitude: 32.363120, longitude: 15.093134)),
            Annotation(coordinate: .init(latitude: 32.363120, longitude: 15.092134))
        ])
    }

    func mapView(_ mapView: MGLMapView, viewFor annotation: MGLAnnotation) -> MGLAnnotationView? {
        let identifier = "AnnotationView"
        let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? AnnotationView
            ??
            AnnotationView(reuseIdentifier: identifier)

        annotationView.annotation = annotation

        return annotationView
    }
}

final class Annotation: NSObject, MGLAnnotation {
    let coordinate: CLLocationCoordinate2D

    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}

final class AnnotationView: MGLAnnotationView {
    override init(annotation: MGLAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)

        setup()
    }

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        bounds.size = CGSize(width: 40, height: 40)
        backgroundColor = .systemRed

        centerOffset = .init(dx: 0, dy: -30)
    }
}
