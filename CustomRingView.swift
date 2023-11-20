//
//  CustomRingView.swift
//  Fitness
//
//  Created by Davide Castaldi on 20/11/23.
//

import SwiftUI

struct CustomRingView: View {
    
    var background: Color
    var wHeight: CGFloat
    var completionRate: Double
    var ringThickness: CGFloat
    var colorGradient: Gradient
    
    private var rotationDegree: Angle {
        .degrees(-90)
    }
    
    private var endAngle: Angle {
        .degrees(completionRate * 360 - 90)
    }
    
    private var strokeStyle: StrokeStyle {
        StrokeStyle(lineWidth: ringThickness, lineCap: .round)
    }
    
    private var gradientEffect: AngularGradient {
        AngularGradient(gradient: colorGradient, center: .center, startAngle: rotationDegree, endAngle: endAngle)
    }
    
    private var gradientEndColor: Color {
        colorGradient.stops.indices.contains(1) ? colorGradient.stops[1].color : Color.clear
    }
    
    private var circleShadow: Color {
        .black.opacity(1)
    }
    
    private var overlayPosition: (_ width: CGFloat, _ height: CGFloat) -> CGPoint {
        return {
            width, height in CGPoint(x: width / 2, y: height / 2)
        }
    }
    
    private var overlayOffset: (_ width: CGFloat, _ height: CGFloat) -> CGFloat {
        return { width, height in
            min(width, height) / 2
        }
    }
    
    private var overlayRotation: Angle {
        .degrees(completionRate * 360 - 90)
    }
    
    private var clippedCircleRotation: Angle {
        .degrees(-90 + completionRate * 360)
    }
    
    var body: some View {
        
        ZStack {
            Circle().stroke(lineWidth: 19)
                .foregroundColor(background)
                .opacity(0.4)
            Circle().rotation(rotationDegree)
                .trim(from: 0, to: completionRate)
                .stroke(gradientEffect, style: strokeStyle)
                .overlay(overlayCircle)
                
        }
        .frame(width: wHeight, height: wHeight)
    }
    
    var overlayCircle: some View {
        GeometryReader { geometry in
            Circle()
                .fill(gradientEndColor)
                .frame(width: ringThickness, height: ringThickness)
                .position(overlayPosition(geometry.size.width, geometry.size.height))
                .offset(x: overlayOffset(geometry.size.width, geometry.size.height))
                .rotationEffect(overlayRotation)
                .shadow(color: circleShadow, radius: ringThickness / 2)
        }
        .clipShape(
            Circle()
                .rotation(clippedCircleRotation)
                .trim(from: 0, to: 0.1)
                .stroke(style: strokeStyle)
        )
    }
}

#Preview {
    CustomRingView(background: .red, wHeight: 300, completionRate: 0.7, ringThickness: 10, colorGradient: Gradient(colors: [.red, .green]))
}
