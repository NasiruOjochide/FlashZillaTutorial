//
//  accessibilityExtra.swift
//  FlashZillaTutorial
//
//  Created by Danjuma Nasiru on 08/03/2023.
//

import SwiftUI

struct accessibilityExtra: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var withoutColor
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    @Environment(\.accessibilityReduceTransparency) var transparency
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    @State private var scale = 1.0
    
    
    var body: some View {
        VStack{
            HStack {
                if withoutColor {
                    Image(systemName: "checkmark.circle")
                }
                
                Text("Success")
            }
            .padding()
            .background(withoutColor ? .black : .green)
            .foregroundColor(.white)
            .clipShape(Capsule())
            
            
            Text("Josh")
                .scaleEffect(scale)
                .onTapGesture {
                    if reduceMotion {
                        scale *= 1.5
                    } else {
                        withAnimation {
                            scale *= 1.5
                        }
                    }
                }
        }
        Text("Hello, World!")
            .padding()
            .background(reduceTransparency ? .black : .black.opacity(0.5))
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
    
    func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
        if UIAccessibility.isReduceMotionEnabled {
            return try body()
        } else {
            return try withAnimation(animation, body)
        }
    }
    
}

struct accessibilityExtra_Previews: PreviewProvider {
    static var previews: some View {
        accessibilityExtra()
    }
}
