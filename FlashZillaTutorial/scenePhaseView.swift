//
//  scenePhaseView.swift
//  FlashZillaTutorial
//
//  Created by Danjuma Nasiru on 08/03/2023.
//

import SwiftUI

struct scenePhaseView: View {
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .padding()
            .onChange(of: scenePhase, perform: {newPhase in
                if newPhase == .active{
                    print("Active")
                }else if newPhase == .inactive{
                    print("inActive")
                }else if newPhase == .background{
                    print("background")
                }
            })
    }
}

struct scenePhaseView_Previews: PreviewProvider {
    static var previews: some View {
        scenePhaseView()
    }
}
