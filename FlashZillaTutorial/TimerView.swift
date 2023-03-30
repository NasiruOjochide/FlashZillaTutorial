//
//  TimerView.swift
//  FlashZillaTutorial
//
//  Created by Danjuma Nasiru on 07/03/2023.
//
import Combine
import SwiftUI

struct TimerView: View {
    let timer = Timer.publish(every: 2,tolerance: 0.5, on: .main, in: .common).autoconnect()
    @State private var counter = 0
    
    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .onReceive(timer, perform: {time in
                    print("The time is now \(time)")
                })
            
            Text("Hello, World!")
                .onReceive(timer) { time in
                    if counter == 5 {
                        timer.upstream.connect().cancel()
                    } else {
                        print("The time is now \(time)")
                    }
                    
                    counter += 1
                }
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
