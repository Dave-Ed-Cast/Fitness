//
//  ContentView.swift
//  Fitness
//
//  Created by Davide Castaldi on 14/11/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    
    @State var moveRingProgress: Double = 10
    @State var exerciseRingProgress: Double = 10
    @State var standRingProgress: Double = 10

    @State private var shouldAnimate: Bool = false
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Activity")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                    ZStack(alignment: .leading) {
                        NavigationLink {
                            ActivityView(moveRingProgress: moveRingProgress, exerciseRingProgress: exerciseRingProgress, standRingProgress: standRingProgress)
                        } label: {
                            Rectangle()
                                .frame(width: 361, height: 200)
                                .clipped()
                                .cornerRadius(10)
                                .padding()
                                .foregroundStyle(.gray).opacity(0.3)
                                .offset(y: -25)
                        }

                        VStack(alignment: .leading) {
                            Text("Move")
                                .font(.body)
                                .foregroundColor(.white)
                                .padding(.horizontal, 35)
                                .offset(x: 0, y: -80)
                            HStack {
                                Text("\(Int(moveRingProgress * 3))/\(Int(moveRingProgress * 2))")
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.red)
                                Text("KCAL")
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.red)
                                    .offset(x: -8, y: 2)
                            }
                            .padding(.horizontal, 40)
                            .offset(x: -5, y: -85)
                            
                            Text("Exercise")
                                .font(.body)
                                .foregroundColor(.white)
                                .padding(.horizontal, 35)
                                .offset(x: 0, y: -80)
                            HStack {
                                Text("\(Int(exerciseRingProgress / 2))/\(Int(exerciseRingProgress / 4))")
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.green)
                                Text("MINS")
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.green)
                                    .offset(x: -8, y: 2)
                            }
                            .padding(.horizontal, 40)
                            .offset(x: -5, y: -85)
                            
                            Text("Stand")
                                .font(.body)
                                .foregroundColor(.white)
                                .padding(.horizontal, 35)
                                .offset(x: 0, y: -80)
                            HStack {
                                Text("\(Int(standRingProgress / 24))/\(Int(standRingProgress / 48))")
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.cyan)
                                Text("HRS")
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.cyan)
                                    .offset(x: -8, y: 2)
                            }
                            .padding(.horizontal, 40)
                            .offset(x: -5, y: -85)
                        }
                        .offset(x: 0, y: 50)
                        
                        ZStack {
                            CustomRingView(accessibilityText: "Move ring", background: .red.opacity(0.3), wHeight: 130, completionRate: moveRingProgress/100, ringThickness: 19, colorGradient: Gradient(colors: [.red, .pink]))
                                .offset(x: 220, y: -25)
                            
                            Image(systemName: "arrow.right")
                                .foregroundColor(.black)
                                .offset(x: 220, y: -90)
                                .dynamicTypeSize(.xSmall)
                                .fontWeight(.bold)
                            
                            CustomRingView(accessibilityText: "Exercise ring", background: .green.opacity(0.2), wHeight: 90, completionRate: exerciseRingProgress/100, ringThickness: 19, colorGradient: Gradient(colors: [.green, .accentColor]))
                                .offset(x: 220, y: -25)

                            Image(systemName: "arrow.right")
                                .foregroundColor(.black)
                                .offset(x: 217, y: -70)
                                .dynamicTypeSize(.xSmall)
                                .fontWeight(.bold)
                            Image(systemName: "arrow.right")
                                .foregroundColor(.black)
                                .offset(x: 221, y: -70)
                                .dynamicTypeSize(.xSmall)
                                .fontWeight(.bold)
                            
                            CustomRingView(accessibilityText: "Stand ring", background: .teal.opacity(0.3), wHeight: 50, completionRate: standRingProgress/100, ringThickness: 19, colorGradient: Gradient(colors: [.cyan, .teal]))
                                .offset(x: 220, y: -25)
                            
                            Image(systemName: "arrow.up")
                                .foregroundColor(.black)
                                .offset(x: 220, y: -50)
                                .dynamicTypeSize(.xSmall)
                                .fontWeight(.bold)
                        }
                    }
                }
                Group {
                    SliderView
                        .offset(y: -30)
                    HistoryView
                        .offset(y: -30)
                    TrainerTipsView
                        .offset(y: -60)
                }
                .onAppear {
                    withAnimation(.linear) {
                        self.shouldAnimate = true
                    }
                }
                .opacity(shouldAnimate ? 1 : 0.2)
                .offset(y: shouldAnimate ? 0 : 50)
            }
            
            .navigationTitle("Summary")
            .toolbar{
                ToolbarItemGroup(placement: .topBarLeading) {
                    Text(Date.now, style: .date)
                        .font(.callout)
                        .padding(.top, 30)
                        .foregroundColor(.gray)
                }
                
            }
            .background(.black)
        }
    }
    
    var SliderView: some View {
        
        VStack(alignment: .leading) {
            Text("Move Ring")
                .font(.title2)
                .foregroundStyle(.white)
            Slider(value: $moveRingProgress, in: 0...200)
                .accessibilityValue("setting move ring to \(Int(moveRingProgress)) percent")

            Text("Exercise Ring")
                .font(.title2)
                .foregroundStyle(.white)
            Slider(value: $exerciseRingProgress, in: 0...200)
                .accessibilityValue("setting exercise ring to \(Int(exerciseRingProgress)) percent")

            Text("Stand Ring")
                .font(.title2)
                .foregroundStyle(.white)
            Slider(value: $standRingProgress, in: 0...200)
                .accessibilityValue("setting stand ring to \(Int(standRingProgress)) percent")

        }
        .padding()
    } 
    
    var HistoryView: some View {
        
        VStack (alignment: .leading) {
            Text("History")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: 361, height: 80)
                    .clipped()
                    .cornerRadius(10)
                    .padding()
                    .foregroundStyle(.gray).opacity(0.3)
                    .offset(y: -25)
                Circle()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.green.opacity(0.2))
                    .padding(.horizontal, 35)
                    .padding(.bottom, 50)
                Image(systemName: "figure.hiking")
                    .resizable()
                    .frame(width: 15, height: 25)
                    .padding(.horizontal, 53)
                    .padding(.bottom, 50)
                    .foregroundColor(.green)
                VStack(alignment: .leading){
                    Text("Hiking")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                    HStack {
                        Text("1.70")
                        Text("MI")
                            .offset(x: -8, y: 1)
                            .fontWeight(.semibold)
                            .font(.subheadline)
                    }
                    .font(.headline)
                    .foregroundStyle(.green)
                }
                .padding()
                .padding(.horizontal, 90)
                .padding(.top, -45)
            }
        }
    }
    
    var TrainerTipsView: some View {
        
        VStack (alignment: .leading) {
            Text("Trainer Tips")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: 361, height: 120)
                    .clipped()
                    .cornerRadius(10)
                    .padding()
                    .foregroundStyle(.gray).opacity(0.3)
                    .offset(y: -25)
                Circle()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.gray.opacity(0.2))
                    .padding(.horizontal, 35)
                    .padding(.bottom, 90)
                Image(systemName: "figure.water.fitness")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(.horizontal, 46)
                    .padding(.bottom, 88)
                    .foregroundColor(.white)
                VStack(alignment: .leading){
                    Text("How to set up for warrior 1 in yoga")
                        .multilineTextAlignment(.leading)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                    Text("With Fitness+")
                        .font(.caption)
                        .foregroundStyle(.gray)
                    Spacer()

                    Text("Watch this week's tip")
                        .fontWeight(.semibold)
                        .font(.subheadline)
                        .foregroundStyle(.green)
                        .offset(y: -35)
                }
                .padding()
                .padding(.horizontal, 90)
                .padding(.top, -10)
            }
        }
    }
    
    init() {
        // Large Navigation Title
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        // Inline Navigation Title
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
}

#Preview {
    ContentView()
}
