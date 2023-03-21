//
//  StepperExampleView.swift
//  Beyond The Basics
//
//  Created by Ron Erez on 12/12/22.
//

import SwiftUI

struct StepperExampleView: View {
    @State var howHungryAmI: Int = 0
    
    var body: some View {
        VStack {
            Text("Stepper")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            
            Stepper(value: $howHungryAmI.animation(), in: 0...10) {
                Text("How hungry are you ?")
                    .font(.headline)
                    .fontWeight(.bold)

            }
            .padding()
            
            if howHungryAmI <= 3 {
                NiceText(
                    text: "I'm not very hungry",
                    font: .subheadline,
                    weight: .regular)
               
            } else if howHungryAmI >= 4 && howHungryAmI <= 7 {
                NiceText(
                    text: "I'm pretty hungry",
                    font: .headline,
                    weight: .semibold)
                
            } else {
                NiceText(
                    text: "I need hummus now !",
                    font: .title,
                    weight: .black)
            }
            
            Text("\(howHungryAmI)")
                .padding()
                .background(Color.purple)
                .clipShape(Circle())
        }
        
        
        
    }
}

struct NiceText: View {
    let text: String
    let font: Font
    let weight: Font.Weight
    var body: some View {
        Text(text)
            .font(font)
            .fontWeight(weight)

    }
}

struct StepperExampleView_Previews: PreviewProvider {
    static var previews: some View {
        StepperExampleView()
    }
}
