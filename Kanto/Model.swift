//
//  Model.swift
//  Kanto
//
//  Created by Mbongeni NDLOVU on 2018/10/09.
//  Copyright © 2018 mndlovu. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

struct PinCoordinate {
    let name: String?
    let subTitle: String?
    let coordinate: CLLocationCoordinate2D?
    
    init (_ coordinate: CLLocationCoordinate2D,_ name: String,_ subTitle: String) {
        self.name = name
        self.subTitle = subTitle
        self.coordinate = coordinate
    }
}

struct PinCoordinates {
    static var isSelected: Bool = false
    static var selected: Int = 0
    static let point: [PinCoordinate] = [
        PinCoordinate(CLLocationCoordinate2DMake(48.8966491, 2.31834989999993), "Ecole 42", "you code or you die"),
        PinCoordinate(CLLocationCoordinate2DMake(38.8976763, -77.03652979999998), "The White House", " The residence and workplace of the President of the US."),
        PinCoordinate(CLLocationCoordinate2DMake(38.87099,-77.05596), "The Pentagon", "headquarters of the United States Department of Defense"),
        PinCoordinate(CLLocationCoordinate2DMake(29.976111,31.131111), "Egyptian pyramids", "The Egyptian pyramids are ancient pyramid-shaped masonry structures"),
           PinCoordinate(CLLocationCoordinate2DMake(40.689247, -74.044502), "Statue of Liberty", "The copper statue")
    ]
}
