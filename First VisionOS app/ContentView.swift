//
//  ContentView.swift
//  First VisionOS app
//
//  Created by Nethan on 22/6/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @Environment(\.supportsMultipleWindows) private var supportsMultipleWindows
       @Environment(\.openWindow) private var openWindow
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @State var text = ""
    var body: some View {
        
        HStack {
      
            NavigationSplitView {
                List {
                    Text("HI bruh")
                }
                .navigationTitle("Sidebar")
            } detail: {
                VStack {
                    HStack {
                        Text("Hello, world!")
                        
                        TextField("Hi", text: $text)
                        
                        
                        
                    }
                    Button("Show Solar System") {
                        Task {
                            let result = await openImmersiveSpace(id: "sphere")
                            if case .error = result {
                                print("An error occurred")
                            }
                        }
                    }
                }
                .navigationTitle("Content")
                .padding()
            }
        
       
                
            
        }
        
        
    }
}


struct SphereView: View {


    @State var scale = false


    var body: some View {
        RealityView { content in
            let model = ModelEntity(
                         mesh: .generateSphere(radius: 0.1),
                         materials: [SimpleMaterial(color: .white, isMetallic: true)])
            content.add(model)
            
        } update: { content in
            if let model = content.entities.first {
                model.transform.scale = scale ? [1.2, 1.2, 1.2] : [1.0, 1.0, 1.0]
            }
        }


    }
}

struct SecondView: View {
    var body: some View {
        NavigationSplitView {
            List {
                Text("HI bruh")
            }
            .navigationTitle("Sidebar")
        } detail: {
            VStack {
                HStack {
                    Text("Hello, world!")
                    
                   
                    
                }
            }
            .navigationTitle("Content")
            .padding()
        }
    }
}


#Preview {
    ContentView()
}
