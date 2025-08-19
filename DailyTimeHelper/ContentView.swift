//
//  ContentView.swift
//  DailyTimeHelper
//
//  Created by Hualiteq International on 2025/8/19.
//

import SwiftUI

struct ContentView: View {
    @State private var currentTime = Date()
    
    var body: some View {
        VStack {
            Text("Time")
                .font(.title)
                .fontWeight(.medium)
                .fontDesign(.monospaced)
            
            // Dynamic time that updates every second
            Text("\(currentTime)")
                .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()) { _ in
                    currentTime = Date()
                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
