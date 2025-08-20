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
        VStack(spacing: 30) {
            Text("Digital Clock")
                .font(.title2)
                .fontWeight(.medium)
                .fontDesign(.monospaced)
                .foregroundStyle(.gray)
            
            // Dynamic time that updates every second
            Text(currentTime, style: .time)
                .font(.system(size: 30, weight: .bold, design: .monospaced))
                .foregroundStyle(.indigo)
                .padding(.horizontal, 30)
                .padding(.vertical, 20)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.black)
                        .shadow(color: .green.opacity(0.3), radius: 10, x: 50, y: 50)
                        .shadow(color: .green.opacity(0.3), radius: 10, x: -50, y: -50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.green.opacity(0.5), lineWidth: 12)
                        )
                )
                .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()) { _ in
                    currentTime = Date()
                }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.9))
    }
}

#Preview {
    ContentView()
}
