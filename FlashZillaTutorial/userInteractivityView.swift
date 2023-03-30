//
//  userInteractivityView.swift
//  FlashZillaTutorial
//
//  Created by Danjuma Nasiru on 07/03/2023.
//

import SwiftUI

struct userInteractivityView: View {
    var body: some View {
        VStack{
            ZStack {
                Rectangle()
                    .fill(.blue)
                    .frame(width: 300, height: 300)
                    .onTapGesture {
                        print("Rectangle tapped!")
                    }

                Circle()
                    .fill(.red)
                    .frame(width: 300, height: 300)
                //this makes the entire frame clickable instead of just the circle
                    .contentShape(Rectangle())
                    .onTapGesture {
                        print("Circle tapped!")
                    }
                //removes tap functionality from view, basically ignores it
                    .allowsHitTesting(false)
            }
            
            VStack {
                Text("Hello")
                Spacer().frame(height: 100)
                Text("World")
            }
            //without the contentshape, the space between the two texts provided by the spacer will be ignored and not be tappable.
            .contentShape(Rectangle())
            .onTapGesture {
                print("VStack tapped!")
            }
        }
    }
}

struct userInteractivityView_Previews: PreviewProvider {
    static var previews: some View {
        userInteractivityView()
    }
}
