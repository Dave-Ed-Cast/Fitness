//
//  ContentView.swift
//  Fitness
//
//  Created by Davide Castaldi on 14/11/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    //    @Environment(\.modelContext) private var modelContext
    //    @Query private var items: [Item]
    @State var percentage1: Double = 0
    @State var percentage2: Double = 0
    @State var percentage3: Double = 0
    
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
                        Rectangle()
                            .frame(width: 361, height: 200)
                            .clipped()
                            .cornerRadius(10)
                            .padding()
                            .foregroundStyle(.gray).opacity(0.3)
                            .offset(y: -25)
                        VStack(alignment: .leading) {
                            Text("Move")
                                .font(.body)
                                .foregroundColor(.white)
                                .padding(.horizontal, 35)
                                .offset(x: 0, y: -80)
                            HStack {
                                
                                Text("\(Int(percentage1 * 3))/\(Int(percentage1 * 2))")
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
                                Text("\(Int(percentage2 / 2))/\(Int(percentage2 / 4))")
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
                                Text("\(Int(percentage3 / 24))/\(Int(percentage3 / 48))")
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
                            CustomRingView(background: .red.opacity(0.3), wHeight: 130, completionRate: percentage1/100, ringThickness: 19, colorGradient: Gradient(colors: [.red, .pink]))
                            .frame(width: 130, height: 130)
                            .offset(x: 220, y: -25)
                            
                            
                            Image(systemName: "arrow.right")
                                .foregroundColor(.black)
                                .offset(x: 220, y: -90)
                                .dynamicTypeSize(.xSmall)
                                .fontWeight(.bold)
                            
                            CustomRingView(background: .green.opacity(0.2), wHeight: 90, completionRate: percentage2/100, ringThickness: 19, colorGradient: Gradient(colors: [.green, .green]))
                            .frame(width: 90, height: 90)
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
                            
                            CustomRingView(background: .cyan.opacity(0.3), wHeight: 50, completionRate: percentage3/100, ringThickness: 19, colorGradient: Gradient(colors: [.cyan, .cyan]))
                            .frame(width: 50, height: 50)
                            .offset(x: 220, y: -25)
                            
                            Image(systemName: "arrow.up")
                                .foregroundColor(.black)
                                .offset(x: 220, y: -50)
                                .dynamicTypeSize(.xSmall)
                                .fontWeight(.bold)
                        }
                        .onAppear {
                            withAnimation(.easeInOut(duration: 1.2)) {
                                self.percentage1 = 180
                                self.percentage2 = 110
                                self.percentage3 = 140
                            }
                        }
                    }
                    
                }
                
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
            .overlay(
                Image(systemName: "person.circle.fill")
                    .foregroundStyle(.white)
                    .imageScale(.large)
                    .padding(.trailing, 20)
                    .offset(x: 0, y: -35), alignment: .topTrailing
            )
            .background(.black)
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
