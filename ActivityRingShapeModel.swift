//
//  ActivityRingShapeModel.swift
//  Fitness
//
//  Created by Davide Castaldi on 15/11/23.
//

import Foundation
import SwiftUI

struct ActivityRingShapeModel: Shape {
    
    //parameters to set up the ring
    var percent: Double
    let startAngle: Double
    
    //the things that will have animations and how to define them
    typealias animatableData = Double
    var animatableData: Double {
        get {
            return percent
        }
        set {
            percent = newValue
        }
    }
    
    //it's important to initialize percent as max and start angle at -90 to make it start on top
    init(
        percent: Double = 100,
        startAngle: Double = -90
    ) {
        self.percent = percent
        self.startAngle = startAngle
    }
    
    //this function is to convert the from a percentage to an angle, since it's important to work with percentage, so we can always define where things are
    static func percentToAngle(percent: Double, startAngle: Double) -> Double {
        return (percent / 100 * 360) + startAngle
    }
    
    //path is one of the main functions that define the activity ring
    func path(in rect: CGRect) -> Path {
        
        let width = rect.width
        let height = rect.height
        let radius = min(height, width) / 2
        let center = CGPoint(x: width / 2, y: height / 2)
        let endAngle = Self.percentToAngle(percent: percent, startAngle: startAngle)
        
        return Path { path in
            path.addArc(
                center: center,
                radius: radius,
                startAngle: Angle(degrees: startAngle),
                endAngle: Angle(degrees: endAngle),
                clockwise: false)
        }
    }
}
