//
//  ActivityRingView.swift
//  Fitness
//
//  Created by Davide Castaldi on 15/11/23.
//

import SwiftUI

struct ActivityRingView: View {
    
    let lineWidth: CGFloat
    let backgroundColor: Color
    let foregroundColor: Color
    let percentage: Double
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                //Track
                ActivityRingShapeModel()
                    .stroke(style: StrokeStyle(lineWidth: lineWidth))
                    .fill(backgroundColor)
                //animated ring
                ActivityRingShapeModel(percent: percentage)
                    .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                    .fill(foregroundColor)
            }
        }
    }
}
