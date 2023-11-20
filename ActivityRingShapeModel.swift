//
//  ActivityRingShapeModel.swift
//  Fitness
//
//  Created by Davide Castaldi on 15/11/23.
//

import Foundation
import SwiftUI

//to tell SwiftUI how to calculate radians
extension Double {
    func toRadians() -> Double {
        return self * Double.pi / 180
    }
    //and CoreGraphics Float
    func toCGFloat() -> CGFloat {
        return CGFloat(self)
    }
}

struct ActivityRingShapeModel: Shape {
    //function to convert percent values to angles in degrees so that it is possible to understand where we are on the ring
    static func percentToAngle(percent: Double, startAngle: Double) -> Double {
        (percent / 100 * 360) + startAngle
    }
    private var percent: Double
    private var startAngle: Double
    private let drawnClockwise: Bool
    
    //this allows animations to run smoothly for percent values
    var animatableData: Double {
        get {
            return percent
        }
        set {
            percent = newValue
        }
    }
    
    //classic init, nothing oblivious to see here :D
    init(percent: Double = 100, startAngle: Double = -90, drawnClockwise: Bool = false) {
        self.percent = percent
        self.startAngle = startAngle
        self.drawnClockwise = drawnClockwise
    }
    
    // This draws a simple arc from the start angle to the end angle
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        let radius = min(width, height) / 2
        let center = CGPoint(x: width / 2, y: height / 2)
        let endAngle = Angle(degrees: ActivityRingShapeModel.percentToAngle(percent: self.percent, startAngle: self.startAngle))
        
        return Path { path in
            path.addArc(center: center, radius: radius, startAngle: .degrees(startAngle), endAngle: endAngle, clockwise: drawnClockwise)
            
        }
        //.fill(Color.black)
        //.shadow(radius: 10)
    }
}

