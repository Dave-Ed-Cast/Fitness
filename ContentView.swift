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
    @State var tappablePercentage1: Double = 0
    @State var tappablePercentage2: Double = 0
    @State var tappablePercentage3: Double = 0

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
                                
                                Text("\(Int(tappablePercentage1 * 2))")
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
                                Text("\(Int(tappablePercentage2 / 2))")
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
                                Text("\(Int(tappablePercentage3 / 24))")
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
                            ActivityRingViewModel(ringWidth: 19,
                                             percent: tappablePercentage1 ,
                                             backgroundColor: .red.opacity(0.2), foregroundColors: [.red, .red])
                            .frame(width: 130, height: 130)
                            .offset(x: 220, y: -25)
                            
                            Image(systemName: "arrow.right")
                                .foregroundColor(.black)
                                .offset(x: 220, y: -80)
                                .dynamicTypeSize(.xSmall)
                                .fontWeight(.bold)
                            
                            ActivityRingViewModel(ringWidth: 19,
                                             percent: tappablePercentage2,
                                             backgroundColor: .green.opacity(0.2),
                                             foregroundColors: [.green, .green])
                            .frame(width: 90, height: 90)
                            .offset(x: 220, y: -25)
                            
                            
                            Image(systemName: "arrow.right")
                                .foregroundColor(.black)
                                .offset(x: 217, y: -60)
                                .dynamicTypeSize(.xSmall)
                                .fontWeight(.bold)
                            Image(systemName: "arrow.right")
                                .foregroundColor(.black)
                                .offset(x: 221, y: -60)
                                .dynamicTypeSize(.xSmall)
                                .fontWeight(.bold)
                            
                            ActivityRingViewModel(ringWidth: 19,
                                             percent: tappablePercentage3,
                                             backgroundColor: .cyan.opacity(0.2),
                                             foregroundColors: [.cyan, .cyan] )
                            .frame(width: 50, height: 50)
                            .offset(x: 220, y: -25)
                            
                            Image(systemName: "arrow.up")
                                .foregroundColor(.black)
                                .offset(x: 220, y: -40)
                                .dynamicTypeSize(.xSmall)
                                .fontWeight(.bold)
                        }
                        .onAppear {
                            withAnimation(.easeInOut(duration: 1.2)) {
                                self.tappablePercentage1 = 160
                                self.tappablePercentage2 = 280
                                self.tappablePercentage3 = 140
                            }
                        }
                    }
                    
                }
                
            }
            
            .navigationTitle("Summary")
            .toolbar{
                ToolbarItemGroup(placement: .topBarLeading) {
                    Text("TUESDAY, 14 NOV")
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
