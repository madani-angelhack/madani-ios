//
//  MapView.swift
//  madani
//
//  Created by fakhry_fauzan on 27/07/24.
//

import SwiftUI
import GoogleMaps
import CoreLocation

struct MapView: UIViewRepresentable {
    // Binding for total distance
    @Binding var totalDistance: CLLocationDistance
    @Binding var selectedSuhu: Suhu
    @Binding var markers: [MapMarker]
    @Binding var dangers: [Suhu]
    
    // Coordinator to handle events
    class Coordinator: NSObject, CLLocationManagerDelegate, GMSMapViewDelegate {
        
        var completion: ((String) -> Void)?
        var mapView: GMSMapView?
        var locationManager = CLLocationManager()
        var previousLocation: CLLocation?
        var polyline: GMSPolyline?
        @Binding var markers: [MapMarker]
        @Binding var totalDistance: CLLocationDistance
        
        init(totalDistance: Binding<CLLocationDistance>, markers: Binding<[MapMarker]>) {
            self._markers = markers
            self._totalDistance = totalDistance
        }
        
        // Location manager delegate method
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let location = locations.first else { return }
            
            // Calculate distance and update total distance
            if let previousLocation = self.previousLocation {
                let distance = location.distance(from: previousLocation)
                self.totalDistance += distance
            }
            
            // Update polyline to draw the route
            if let path = polyline?.path {
                let mutablePath = GMSMutablePath(path: path)
                mutablePath.add(location.coordinate)
                polyline?.path = mutablePath
            } else {
                let path = GMSMutablePath()
                path.add(location.coordinate)
                
                let newPolyline = GMSPolyline(path: path)
                newPolyline.strokeColor = .red
                newPolyline.strokeWidth = 5.0
                newPolyline.map = mapView
                polyline = newPolyline
            }
            
            // Set camera position to current location
            let zoom: Float = 12.0
            let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude,
                                                  longitude: location.coordinate.longitude,
                                                  zoom: zoom)
            mapView?.animate(to: camera)
            
            self.previousLocation = location
        }
        
        // Authorization status change handler
        func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            if status == .authorizedWhenInUse {
                locationManager.startUpdatingLocation()
                mapView?.isMyLocationEnabled = true
                mapView?.settings.myLocationButton = true
            }
        }
        
        func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
          if let title = marker.title {
              if let userID = marker.userData as? String {
                  
                  completion?(userID)
              }
          }
          return true
        }
        
        func mapView(_ mapView: GMSMapView, didTap overlay: GMSOverlay) {
            print(overlay)
            if let circle = overlay as? GMSCircle {
                print("Circle tapped at coordinate: \(circle.position)")
                // Handle the tap event here
                let alert = UIAlertController(title: "Circle Tapped", message: "You tapped the circle!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    // Make coordinator
    func makeCoordinator() -> Coordinator {
        return Coordinator(totalDistance: $totalDistance, markers: $markers)
    }
    
    // Make UIView
    func makeUIView(context: Context) -> GMSMapView {
        let mapView = GMSMapView()
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        mapView.delegate = context.coordinator
        context.coordinator.mapView = mapView
        context.coordinator.completion = { id in
            if let suhu = self.dangers.first { suhu in
                suhu.id == id
            } {
                self.selectedSuhu = suhu
                print(selectedSuhu)
            }
        }
        // Request location authorization
        context.coordinator.locationManager.requestWhenInUseAuthorization()
        context.coordinator.locationManager.delegate = context.coordinator
        
        for danger in dangers {
            if danger.sensor.is_danger {
                let circleCenter = CLLocationCoordinate2D(latitude: danger.lat, longitude: danger.lon)
                let circle = GMSCircle(position: circleCenter, radius: 1000) // Radius in meters
                circle.fillColor = UIColor.red.withAlphaComponent(0.5)
                circle.strokeColor = UIColor.red
                circle.strokeWidth = 2
                circle.map = mapView
            }else {
                let markerToAdd = GMSMarker()
                markerToAdd.position = CLLocationCoordinate2D(latitude: danger.lat, longitude: danger.lon)
                markerToAdd.title = "Sungai Ciliwung"
                markerToAdd.map = mapView
                markerToAdd.userData = danger.id
            }
            
            //            markerToAdd.icon = UIImage(named: marker.icon)
        }
        
        return mapView
    }
    
    func updateUIView(_ uiView: GMSMapView, context: Context) {}
}
