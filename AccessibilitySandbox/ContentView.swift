//
//  ContentView.swift
//  AccessibilitySandbox
//
//  Created by Shashank B on 05/03/25.
//

import SwiftUI

struct ContentView: View {
    let pictures = [
        "ales-krivec-15949",
        "galina-n-189483",
        "kevin-horstmann-141705",
        "nicolas-tissot-335096"
    ]
    
    let labels = [
        "Tulips",
        "Frozen tree buds",
        "Sunflowers",
        "Fireworks",
    ]

    @State private var selectedPicture = Int.random(in: 0...3)

    var body: some View {
        ScrollView {
            
            //using image and addinf on tap gesture works but bad for the accessibilty
            //        Image(pictures[selectedPicture])
            //            .resizable()
            //            .scaledToFit()
            //            .onTapGesture {
            //                selectedPicture = Int.random(in: 0...3)
            //            }
            //            .accessibilityLabel(labels[selectedPicture])
            //            .accessibilityAddTraits(.isButton)
            
            
            //you can use button and label instead
            Button {
                selectedPicture = Int.random(in: 0...3)
            } label: {
                Image(pictures[selectedPicture])
                    .resizable()
                    .scaledToFit()
            }
            .accessibilityLabel(labels[selectedPicture])
            
            
            //if image is not imp for accessibility
            Image(decorative: "character")
            
            //        OR
            Image(.character)
                .accessibilityHidden(true)
            
            VStack {
                Text("Your score is")
                Text("1000")
                    .font(.title)
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Your score is 1000")
        }
    }
}

#Preview {
    ContentView()
}
