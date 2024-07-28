//
//  ZonaResikoModel.swift
//  madani
//
//  Created by fakhry_fauzan on 27/07/24.
//

import Foundation
import CoreLocation

struct MapMarker {
    var title: String
    var deskripsi: String
    var icon: String
    var latitude: CLLocationDegrees
    var longitude: CLLocationDegrees
}

struct Danger{
    var title: String
    var latitude: CLLocationDegrees
    var longitude: CLLocationDegrees
    var typeDanger: TypeDanger
}

enum TypeDanger {
    case medium
    case critical
}
