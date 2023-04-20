//
//  ContentView.swift
//  TrafficLightApp
//
//  Created by Elizabeth on 20/04/2023.
//

import SwiftUI

struct ContentView: View {
    private enum CurrentLight {
        case red, yellow, green
    }
    
    @State private var currentLight = CurrentLight.red
    @State private var greenOpacity = 0.3
    @State private var yellowOpacity = 0.3
    @State private var redOpacity = 0.3
    @State private var firstTimeTap = true
    
    var body: some View {
        VStack {
            Circle()
                .frame(width: 130)
                .foregroundColor(.red)
                .opacity(redOpacity)
                .overlay(Circle().stroke(Color.white, lineWidth: 3))
            Circle()
                .frame(width: 130)
                .foregroundColor(.yellow)
                .opacity(yellowOpacity)
                .overlay(Circle().stroke(Color.white, lineWidth: 3))
            Circle()
                    .frame(width: 130)
                    .foregroundColor(.green)
                    .opacity(greenOpacity)
                    .overlay(Circle().stroke(Color.white, lineWidth: 3))
            
            Spacer()
            
            Button(action: changeColor ) {
                Text(firstTimeTap ? "Start" : "Next")
                    .font(.title)
                    .foregroundColor(.white)
            }
                .frame(width: 200, height: 80)
                .background(Color.blue)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white, lineWidth: 4)
                )
        }
    }
    
    func changeColor() {
        firstTimeTap = false
        switch currentLight {
        case .red:
            greenOpacity = 0.3
            redOpacity = 1.0
            currentLight = .yellow
        case .yellow:
            redOpacity = 0.3
            yellowOpacity = 1.0
            currentLight = .green
        case .green:
            yellowOpacity = 0.3
            greenOpacity = 1.0
            currentLight = .red
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
