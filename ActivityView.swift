//
//  ActivityView.swift
//  Fitness
//
//  Created by Davide Castaldi on 22/11/23.
//

import SwiftUI

struct ActivityView: View {
    
    @State var moveRingProgress: Double
    @State var exerciseRingProgress: Double
    @State var standRingProgress: Double
    
    @State var tempMoveProgress: Double = 0
    @State var tempExerciseProgress: Double = 0
    @State var tempStandProgress: Double = 0
    
    var body: some View {
        
        ZStack {
            Color.black
                .ignoresSafeArea(.all)
            
            Rectangle()
                .frame(width: 360, height: 360)
                .foregroundStyle(.gray)
                .opacity(0.2)
                .cornerRadius(30)
                .padding(.bottom, 80)
            
            CustomRingView(accessibilityText: "Move ring", background: .red.opacity(0.3), wHeight: 255, completionRate: tempMoveProgress/100, ringThickness: 30, colorGradient: Gradient(colors: [.red, .pink]))
                .padding(.bottom, 80)
                
            
            Image(systemName: "arrow.right")
                .foregroundColor(.black)
                .offset(y: -125)
                .dynamicTypeSize(.xLarge)
                .fontWeight(.bold)
                .padding(.bottom, 80)
            
            CustomRingView(accessibilityText: "Exercise ring", background: .green.opacity(0.2), wHeight: 190, completionRate: tempExerciseProgress/100, ringThickness: 30, colorGradient: Gradient(colors: [.green, .accentColor]))
                .padding(.bottom, 80)
            
            Image(systemName: "arrow.right")
                .foregroundColor(.black)
                .offset(y: -93)
                .dynamicTypeSize(.xLarge)
                .fontWeight(.bold)
                .padding(.bottom, 80)
            Image(systemName: "arrow.right")
                .foregroundColor(.black)
                .offset(x: 5, y: -93)
                .dynamicTypeSize(.xLarge)
                .fontWeight(.bold)
                .padding(.bottom, 80)
            
            CustomRingView(accessibilityText: "Stand ring", background: .teal.opacity(0.3), wHeight: 125, completionRate: tempStandProgress/100, ringThickness: 30, colorGradient: Gradient(colors: [.cyan, .teal]))
                .padding(.bottom, 80)
            
            Image(systemName: "arrow.up")
                .foregroundColor(.black)
                .offset(y: -60)
                .dynamicTypeSize(.xLarge)
                .fontWeight(.bold)
                .padding(.bottom, 80)
        }
//        .onTapGesture {
//            withAnimation(.easeInOut(duration: 1.2)) {
//                moveRingProgress
//            }
//        }
        .onAppear(){
            withAnimation(.easeInOut(duration: 1.2)) {
//                moveRingProgress = 180
//                exerciseRingProgress = 120
//                standRingProgress = 50
                tempMoveProgress = moveRingProgress
                tempExerciseProgress = exerciseRingProgress
                tempStandProgress = standRingProgress

            }
        }
    }
}


#Preview {
    ActivityView(moveRingProgress: 110, exerciseRingProgress: 0, standRingProgress: 0)
}
