//
//  ImmersiveView.swift
//  FullImmersion2
//
//  Created by Brian McIntosh on 12/25/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    var body: some View {
        
        RealityView { content in
            
            //Skybox entity
            guard let skyBoxEntity = createSkyBox() else {
                print("Error loading skybox entity")
                return
            }
            
            //Get Earth Entity
            let earthEntity = await createEarthModel()
            
            //Add to RealityView
            content.add(skyBoxEntity)
            content.add(earthEntity)
        }
    }
    
    private func createSkyBox() -> Entity? {
        
        //we need a MESH and a MATERIAL
        
        //Mesh
        let largeSphere = MeshResource.generateSphere(radius: 1000)
        
        //Material
        var skyBoxMaterial = UnlitMaterial()
        do {
            let texture = try TextureResource.load(named: "StarryNight")
            //apply texture to material
            skyBoxMaterial.color = .init(texture: .init(texture))
        }catch{
            print("Error loading texture: \(error)")
        }
        
        //SkyBox Entity
        let skyBoxEntity = Entity()
        skyBoxEntity.components.set(
            ModelComponent(
                mesh: largeSphere,
                materials: [skyBoxMaterial]
            )
        )
        
        //Map texture to inner surface
        skyBoxEntity.scale *= .init(x: -1, y: 1, z: 1)
        
        return skyBoxEntity
        
    }
    
    private func createEarthModel() async -> Entity {
        
        guard let earthEntity = try? await Entity(named: "Scene", in: realityKitContentBundle) else {
            fatalError("Cannot load Earth model")
        }
        
        return earthEntity
    }
}

#Preview {
    ImmersiveView()
}
