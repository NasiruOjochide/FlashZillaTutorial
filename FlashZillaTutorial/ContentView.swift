//
//  ContentView.swift
//  FlashZillaTutorial
//
//  Created by Danjuma Nasiru on 06/03/2023.
//

import SwiftUI

struct ContentView: View {
    @State  private var currentAmount = 0.0
    @State private var finalAmount = 1.0
    @State  private var angleCurrentAmount = Angle.zero
    @State private var angleFinalAmount = Angle.zero
    
    // how far the circle has been dragged
        @State private var offset = CGSize.zero

        // whether it is currently being dragged or not
        @State private var isDragging = false
    
    var body: some View {
        VStack{
            Text("tap gesture!")
                .padding()
                .onTapGesture(count: 2){
                    print("tapped")
                }
            Text("long press gesture")
                .padding()
                .onLongPressGesture(minimumDuration: 2, perform: {
                    print("long pressed")
                }, onPressingChanged: {ispressed in
                    print("In progress \(ispressed)")
                })
            
            Text("scale effect")
                .padding()
                .scaleEffect(finalAmount + currentAmount)
                .gesture(
                    MagnificationGesture()
                        .onChanged { amount in
                            currentAmount = amount - 1
                        }
                        .onEnded { amount in
                            finalAmount += currentAmount
                            currentAmount = 0
                        }
                )
            
            Text("Rotation Effect")
                .padding()
                .rotationEffect(angleCurrentAmount + angleFinalAmount)
                .gesture(
                    RotationGesture()
                        .onChanged { angle in
                            angleCurrentAmount = angle
                        }
                        .onEnded { angle in
                            angleFinalAmount += angleCurrentAmount
                            angleCurrentAmount = .zero
                        }
                )
            
            VStack {
                Text("clashing gestures!")
                    .onTapGesture {
                        print("Text tapped")
                    }
            }
            .padding()
            .onTapGesture {
                print("VStack tapped")
            }
        }
        
        VStack {
            Text("high priority gesture!")
                .onTapGesture {
                    print("Text tapped")
                }
        }
        .padding()
        .highPriorityGesture(
            TapGesture()
                .onEnded { _ in
                    print("VStack tapped")
                }
        )
        
        VStack {
            Text("simultaneous gesture")
                .onTapGesture {
                    print("Text tapped")
                }
        }
        .padding()
        .simultaneousGesture(
            TapGesture()
                .onEnded { _ in
                    print("VStack tapped")
                }
        )
        
        
        // a drag gesture that updates offset and isDragging as it moves around
        let dragGesture = DragGesture()
            .onChanged{value in
                offset = value.translation
            }
            .onEnded{_ in
                withAnimation{
                    offset = .zero
                    isDragging = false
                }
            }
        
        // a long press gesture that enables isDragging
        let longPress = LongPressGesture()
            .onEnded{value in
                withAnimation{
                    isDragging = true
                }
            }
        
        // a combined gesture that forces the user to long press then drag
        let combinedGesture = longPress.sequenced(before: dragGesture)
        
        // a 64x64 circle that scales up when it's dragged, sets its offset to whatever we had back from the drag gesture, and uses our combined gesture
        Circle()
            .fill(.red)
            .frame(width: 64, height: 64)
            .scaleEffect(isDragging ? 1.5 : 1)
            .offset(offset)
            .gesture(combinedGesture)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
