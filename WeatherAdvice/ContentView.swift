//
//  ContentView.swift
//  WeatherAdvice
//
//  Created by Philip Keller on 3/3/23.
//

import SwiftUI

struct ContentView: View {
    @State private var temp = ""
    @State private var imageName = ""
    @State private var adviceMessage = ""
    @FocusState private var textFieldIsFocused: Bool
    
    var body: some View {
        VStack {
            Text("Weather Advice")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundColor(.blue)
            
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
            
            Spacer()
            
            Text(adviceMessage)
                .font(.largeTitle)
                .frame(height: 80)
                .minimumScaleFactor(0.5)
            
            Spacer()
            
            HStack {
                Text("What is the temp?")
                
                TextField("", text: $temp)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 65)
                    .overlay {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.gray, lineWidth: 2)
                    }
                    .keyboardType(.numberPad)
                    .focused($textFieldIsFocused)
            }
            .font(.title)
            
            Button {
                giveAdvice()
                textFieldIsFocused = false
            } label: {
                Text("Get Advice!")
            }
            .buttonStyle(.borderedProminent)
            .tint(.blue)
            .font(.title2)
            .disabled(temp.isEmpty)
            
        }
        .padding()
    }
    
    func giveAdvice() {
        guard let temperature = Int(temp) else {return}
        switch temperature {
        case 76...:
            adviceMessage = "It's hot out!"
            imageName = "hot"
        case 63..<76:
            adviceMessage = "Nice and mild."
            imageName = "mild"
        case 45..<63:
            adviceMessage = "Nice and mild."
            imageName = "cool"
        case 33..<45:
            adviceMessage = "Nice and mild."
            imageName = "cold"
        default:
            adviceMessage = "Bundle up, it's freezing!"
            imageName = "freezing"
            
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
