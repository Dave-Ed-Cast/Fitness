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
    @State var tappablePercentage: Double = 0
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Activity")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                    ZStack(alignment: .leading){
                        Rectangle()
                            .frame(width: .infinity, height: 200)
                            .clipped()
                            .cornerRadius(20)
                            .padding()
                            .foregroundStyle(.gray).opacity(0.3)
                            .offset(y: -25)
                        VStack(alignment: .leading){
                            Text("Move")
                                .font(.body)
                                .foregroundColor(.white)
                                .padding(.horizontal, 40)
                                .offset(x: 0, y: -80)
                            HStack {
                                Text("NUMBER")
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.red)
                                Text("KCAL")
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.red)
                                    .offset(x: -8, y: 2)
                            }
                            .padding(.horizontal, 40)
                            .offset(x: 0, y: -85)
                        }
                        ZStack {
                            ActivityRingView(lineWidth: 19,
                                             backgroundColor: .red.opacity(0.2),
                                             foregroundColor: .red,
                                             percentage: tappablePercentage)
                            .frame(width: 130, height: 130)
                            .offset(x: 220, y: -25)
                            .onTapGesture {
                                withAnimation(.easeIn(duration: 0.3)) {
                                    self.tappablePercentage = 40
                                    
                                } completion: {
                                    withAnimation(.easeOut(duration: 1)) {
                                        tappablePercentage += 10
                                    }
                                }
                            }
                            Image(systemName: "arrow.right")
                                .offset(x: 220, y: -90)
                                .dynamicTypeSize(.xSmall)
                                .fontWeight(.bold)
                            
                            ActivityRingView(lineWidth: 19,
                                             backgroundColor: .green.opacity(0.2),
                                             foregroundColor: .green,
                                             percentage: tappablePercentage)
                            .frame(width: 90, height: 90)
                            .offset(x: 220, y: -25)
                            .onTapGesture {
                                withAnimation(.easeIn(duration: 0.3)) {
                                    self.tappablePercentage = 40
                                    
                                } completion: {
                                    withAnimation(.easeOut(duration: 1)) {
                                        tappablePercentage += 10
                                    }
                                }
                            }
                            Image(systemName: "arrow.right")
                                .offset(x: 220, y: -68)
                                .dynamicTypeSize(.xSmall)
                                .fontWeight(.bold)
                            
                            ActivityRingView(lineWidth: 19,
                                             backgroundColor: .cyan.opacity(0.2),
                                             foregroundColor: .cyan,
                                             percentage: tappablePercentage)
                            .frame(width: 50, height: 50)
                            .offset(x: 220, y: -25)
                            .onTapGesture {
                                withAnimation(.easeIn(duration: 0.3)) {
                                    self.tappablePercentage = 40
                                    
                                } completion: {
                                    withAnimation(.easeOut(duration: 1)) {
                                        tappablePercentage += 10
                                    }
                                }
                            }
                            Image(systemName: "arrow.up")
                                .offset(x: 220, y: -48)
                                .dynamicTypeSize(.xSmall)
                                .fontWeight(.bold)
                        }
                    }
                }
            }
            .toolbar{
                ToolbarItemGroup(placement: .topBarLeading) {
                    Text("TUESDAY, 14 NOV")
                        .font(.callout)
                        .padding(.top, 30)
                        .foregroundColor(.gray)
                }
            }
            .navigationTitle("Summary")
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
