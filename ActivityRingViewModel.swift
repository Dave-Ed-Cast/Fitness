//
//  ActivityRingView.swift
//  Fitness
//
//  Created by Davide Castaldi on 15/11/23.
//

import SwiftUI

struct ActivityRingViewModel: View {
    
    private static let ShadowColor: Color = Color.black.opacity(0.8)
    private static let ShadowRadius: CGFloat = 5
    private static let ShadowOffsetMultiplier: CGFloat = ShadowRadius 
    
    private let ringWidth: CGFloat
    private let percent: Double
    private let backgroundColor: Color
    private let foregroundColors: [Color]
    private let startAngle: Double = -90
    private var gradientStartAngle: Double {
        self.percent >= 100 ? relativePercentageAngle - 360 : startAngle
    }
    private var absolutePercentageAngle: Double {
        ActivityRingShapeModel.percentToAngle(percent: self.percent, startAngle: 0)
    }
    private var relativePercentageAngle: Double {
        // Take into account the startAngle
        absolutePercentageAngle + startAngle
    }
    private var firstGradientColor: Color {
        self.foregroundColors.first ?? .red
    }
    private var lastGradientColor: Color {
        self.foregroundColors.last ?? .red
    }
    private var ringGradient: AngularGradient {
        AngularGradient(
            gradient: Gradient(colors: self.foregroundColors),
            center: .center,
            startAngle: Angle(degrees: self.gradientStartAngle),
            endAngle: Angle(degrees: relativePercentageAngle)
        )
    }
    
    init(ringWidth: CGFloat, percent: Double, backgroundColor: Color, foregroundColors: [Color]) {
        self.ringWidth = ringWidth
        self.percent = percent
        self.backgroundColor = backgroundColor
        self.foregroundColors = foregroundColors
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Background for the ring
                ActivityRingShapeModel()
                    .stroke(style: StrokeStyle(lineWidth: self.ringWidth))
                    .fill(self.backgroundColor)
                    
                // Foreground
                ActivityRingShapeModel(percent: self.percent, startAngle: self.startAngle)
                    .stroke(style: StrokeStyle(lineWidth: self.ringWidth, lineCap: .round))
                    .fill(self.ringGradient)
                    .shadow(radius: 100)

                // End of ring with drop shadow
                if self.getShowShadow(frame: geometry.size) {
                    Circle()
                        .fill(self.lastGradientColor)
                        .frame(width: self.ringWidth, height: self.ringWidth, alignment: .center)
                        .offset(x: self.getEndCircleLocation(frame: geometry.size).0, 
                                y: self.getEndCircleLocation(frame: geometry.size).1)
                        .shadow(color: ActivityRingViewModel.ShadowColor,
                                radius: ActivityRingViewModel.ShadowRadius,
                                x: self.getEndCircleShadowOffset().0,
                                y: self.getEndCircleShadowOffset().1)
                }
            }
        }
        // Padding to ensure that the entire ring fits within the view size allocated
        .padding(self.ringWidth / 2)
    }
    
    private func getEndCircleLocation(frame: CGSize) -> (CGFloat, CGFloat) {
        // Get angle of the end circle with respect to the start angle
        let angleOfEndInRadians: Double = relativePercentageAngle.toRadians()
        let offsetRadius = min(frame.width, frame.height) / 2
        return (offsetRadius * cos(angleOfEndInRadians).toCGFloat(), offsetRadius * sin(angleOfEndInRadians).toCGFloat())
    }
    
    private func getEndCircleShadowOffset() -> (CGFloat, CGFloat) {
        let angleForOffset = absolutePercentageAngle + (self.startAngle + 90)
        let angleForOffsetInRadians = angleForOffset.toRadians()
        let relativeXOffset = cos(angleForOffsetInRadians)
        let relativeYOffset = sin(angleForOffsetInRadians)
        let xOffset = relativeXOffset.toCGFloat() * ActivityRingViewModel.ShadowOffsetMultiplier
        let yOffset = relativeYOffset.toCGFloat() * ActivityRingViewModel.ShadowOffsetMultiplier
        return (xOffset, yOffset)
    }
    
    private func getShowShadow(frame: CGSize) -> Bool {
        let circleRadius = min(frame.width, frame.height) / 2
        let remainingAngleInRadians = (360 - absolutePercentageAngle).toRadians().toCGFloat()
        if self.percent >= 100 {
            return true
        } else if circleRadius * remainingAngleInRadians <= self.ringWidth {
            return true
        }
        return false
    }
}
