//
//  ContentView.swift
//  Test-Manipulating-3D-Texture-With-Image
//
//  Created by Brayton Lordianto on 4/10/23.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        let anchor = AnchorEntity()

        
        // Load the 3D model of the painting cover
        let modelEntity: ModelEntity = try! ModelEntity.loadModel(named: "frame1")
                
        var material = SimpleMaterial()
        material.color = .init(tint: .white.withAlphaComponent(0.999),
                            texture: .init(try! .load(named: "birb.jpeg")))
        material.metallic = .float(1.0)
        material.roughness = .float(0.0)
        modelEntity.model!.materials[0] = material
        anchor.addChild(modelEntity)

        print("DEBUG: \(modelEntity.model!.materials.count)")
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(anchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
