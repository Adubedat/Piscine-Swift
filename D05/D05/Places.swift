//
//  Places.swift
//  D05
//
//  Created by Arthur DUBEDAT on 4/2/18.
//  Copyright © 2018 Arthur DUBEDAT. All rights reserved.
//

import Foundation
import MapKit

enum locationType {
    case country
    case city
    case building
}

struct Places {
    static let list : [(String, String, CLLocationCoordinate2D, locationType)] = [
        ("École 42", "Programming school", CLLocationCoordinate2D(latitude: 48.896664, longitude: 2.318491), .building),
        ("Paris", "France capital", CLLocationCoordinate2D(latitude: 48.857482, longitude: 2.346715), .city),
        ("La Réunion", "Best island on earth", CLLocationCoordinate2D(latitude: -21.118632, longitude: 55.544466), .country),
        ("France", "European country", CLLocationCoordinate2D(latitude: 46.667289, longitude: 2.532383), .country),
        ("Russie", "Vladimir Poutine", CLLocationCoordinate2D(latitude: 62.309624, longitude: 94.739312), .country)
    ]
}
