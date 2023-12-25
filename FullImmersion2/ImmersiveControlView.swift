//
//  ImmersiveControlView.swift
//  FullImmersion2
//
//  Created by Brian McIntosh on 12/25/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveControlView: View {
    
    //actions stored in the view's environment
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    var body: some View {
        VStack {
            Button {
                //Present VR World
                Task {
                    await openImmersiveSpace(id: "ImmersiveView")
                }
            } label: {
                //Label("Full Immersive", systemImage: "visionpro")
                Image(systemName: "visionpro")
            }
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ImmersiveControlView()
}
