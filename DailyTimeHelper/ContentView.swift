//
//  ContentView.swift
//  DailyTimeHelper
//
//  Created by Hualiteq International on 2025/8/19.
//

import SwiftUI

struct ContentView: View {
    @State private var currentTime = Date()
    @State private var shadowLocation: CGFloat = 0
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Digital Clock")
                .font(.title2)
                .fontWeight(.medium)
                .fontDesign(.monospaced)
                .foregroundStyle(.gray)
            
            Button(action: {
                withAnimation(.easeInOut(duration: 0.5)) {
                    makeShadowDynamic()
                }
            }, label: {
                // Dynamic time that updates every second
                Text(currentTime, style: .time)
                    .font(.system(size: 30, weight: .bold, design: .monospaced))
                    .foregroundStyle(.indigo)
                    .padding(.horizontal, 30)
                    .padding(.vertical, 20)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.black)
                            .shadow(color: .green.opacity(0.3), radius: 10, x: shadowLocation, y: shadowLocation)
                            .shadow(color: .green.opacity(0.2), radius: 15, x: -shadowLocation, y: -shadowLocation)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.green.opacity(0.5), lineWidth: 2)
                            )
                    )
                    .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()) { _ in
                        currentTime = Date()
                    }
            })
            
            // Optional: Auto-animate button
            Button("Start Auto Animation") {
                startAutoAnimation()
            }
            .foregroundColor(.green)
            .padding()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.9))
    }
    
    private func makeShadowDynamic() {
        switch shadowLocation {
        case 0:
            shadowLocation = 50
        case 50:
            shadowLocation = -50
        case -50:
            shadowLocation = 50
        default:
            shadowLocation = 0
        }
    }
    
    private func startAutoAnimation() {
        withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
            shadowLocation = 50
        }
    }
}

#Preview {
    ContentView()
}
