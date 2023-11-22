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
    
    @State var animateTheView: Bool = false
    
    var body: some View {
        
        VStack{
            ZStack {
                Color.black
                    .ignoresSafeArea(.all)
                
                Rectangle()
                    .frame(width: 360, height: 360)
                    .foregroundStyle(.gray)
                    .opacity(0.2)
                    .cornerRadius(30)
                
                CustomRingView(accessibilityText: "Move ring", background: .red.opacity(0.3), wHeight: 255, completionRate: moveRingProgress/100, ringThickness: 30, colorGradient: Gradient(colors: [.red, .pink]))
                
                Image(systemName: "arrow.right")
                    .foregroundColor(.black)
                    .offset(y: -125)
                    .dynamicTypeSize(.xLarge)
                    .fontWeight(.bold)
                
                CustomRingView(accessibilityText: "Exercise ring", background: .green.opacity(0.2), wHeight: 190, completionRate: exerciseRingProgress/100, ringThickness: 30, colorGradient: Gradient(colors: [.green, .accentColor]))
                
                Image(systemName: "arrow.right")
                    .foregroundColor(.black)
                    .offset(y: -90)
                    .dynamicTypeSize(.xLarge)
                    .fontWeight(.bold)
                Image(systemName: "arrow.right")
                    .foregroundColor(.black)
                    .offset(x: 5, y: -90)
                    .dynamicTypeSize(.xLarge)
                    .fontWeight(.bold)
                
                CustomRingView(accessibilityText: "Stand ring", background: .teal.opacity(0.3), wHeight: 125, completionRate: standRingProgress/100, ringThickness: 30, colorGradient: Gradient(colors: [.cyan, .teal]))
                
                Image(systemName: "arrow.up")
                    .foregroundColor(.black)
                    .offset(y: -60)
                    .dynamicTypeSize(.xLarge)
                    .fontWeight(.bold)
            }
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 1.2)) {
                self.animateTheView = true
            }
        }
    }
}


#Preview {
    ActivityView(moveRingProgress: 150, exerciseRingProgress: 110, standRingProgress: 190)
}
