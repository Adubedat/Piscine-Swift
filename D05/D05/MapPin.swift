//
//  MapPin.swift
//  D05
//
//  Created by Arthur DUBEDAT on 4/2/18.
//  Copyright © 2018 Arthur DUBEDAT. All rights reserved.
//

import Foundation
import MapKit

class MapPin : NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    var type: locationType?
    
    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String, type: locationType) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        self.type = type
    }
}
