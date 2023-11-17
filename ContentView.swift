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
                            .frame(width: .infinity, height: 200)
                            .clipped()
                            .cornerRadius(20)
                            .padding()
                            .foregroundStyle(.gray).opacity(0.3)
                            .offset(y: -25)
                        VStack(alignment: .leading) {
                            Text("Move")
                                .font(.body)
                                .foregroundColor(.white)
                                .padding(.horizontal, 40)
                                .offset(x: 0, y: -80)
                            HStack {
                                Text("\(tappablePercentage1)")
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
                            
                            Text("Exercise")
                                .font(.body)
                                .foregroundColor(.white)
                                .padding(.horizontal, 40)
                                .offset(x: 0, y: -80)
                            HStack {
                                Text("\(tappablePercentage2)")
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.green)
                                Text("MIN")
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.green)
                                    .offset(x: -8, y: 2)
                            }
                            .padding(.horizontal, 40)
                            .offset(x: 0, y: -85)
                            
                            Text("Stand")
                                .font(.body)
                                .foregroundColor(.white)
                                .padding(.horizontal, 40)
                                .offset(x: 0, y: -80)
                            HStack {
                                Text("\(tappablePercentage3)")
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.cyan)
                                Text("HRS")
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.cyan)
                                    .offset(x: -8, y: 2)
                            }
                            .padding(.horizontal, 40)
                            .offset(x: 0, y: -85)
                        }
                        .offset(x: 0, y: 50)
                        ZStack {
                            ActivityRingView(lineWidth: 19,
                                             backgroundColor: .red.opacity(0.2),
                                             foregroundColor: .red,
                                             percentage: tappablePercentage1)
                            .frame(width: 130, height: 130)
                            .offset(x: 220, y: -25)
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 1.2)) {
                                    self.tappablePercentage1 = 65
                                }
                            }
                            Image(systemName: "arrow.right")
                                .offset(x: 220, y: -90)
                                .dynamicTypeSize(.xSmall)
                                .fontWeight(.bold)
                            
                            ActivityRingView(lineWidth: 19,
                                             backgroundColor: .green.opacity(0.2),
                                             foregroundColor: .green,
                                             percentage: tappablePercentage2)
                            .frame(width: 90, height: 90)
                            .offset(x: 220, y: -25)
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 1.2)) {
                                    self.tappablePercentage2 = 90
                                }
                            }
                            Image(systemName: "arrow.right")
                                .offset(x: 220, y: -68)
                                .dynamicTypeSize(.xSmall)
                                .fontWeight(.bold)
                            Image(systemName: "arrow.right")
                                .offset(x: 224, y: -68)
                                .dynamicTypeSize(.xSmall)
                                .fontWeight(.bold)
                            
                            ActivityRingView(lineWidth: 19,
                                             backgroundColor: .cyan.opacity(0.2),
                                             foregroundColor: .cyan,
                                             percentage: tappablePercentage3)
                            .frame(width: 50, height: 50)
                            .offset(x: 220, y: -25)
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 1.2)) {
                                    self.tappablePercentage3 = 35
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
