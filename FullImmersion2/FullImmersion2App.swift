//
//  FullImmersion2App.swift
//  FullImmersion2
//
//  Created by Brian McIntosh on 12/25/23.
//

import SwiftUI

@main
struct FullImmersion2App: App {

    @State var immersionMode:ImmersionStyle = .full //.progressive

    var body: some Scene {
        
        
        // Starting Window
        WindowGroup {
            ImmersiveControlView()
        }
        .defaultSize(width: 400, height: 200)
        //.windowStyle(.plain)
        
        
        //VR
        ImmersiveSpace(id: "ImmersiveView") {
            //VR View
            ImmersiveView()
        }
        .immersionStyle(selection: $immersionMode, in: .full) //entire passthrough will be blocked
                                                        //.progressive here as well
    }
}
