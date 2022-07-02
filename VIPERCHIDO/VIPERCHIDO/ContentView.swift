//
//  ContentView.swift
//  VIPERCHIDO
//
//  Created by ISAAC DAVID SANTIAGO on 14/06/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
        Button(action: {
            print("actionButton")
            let vc = sanlegasRouter.createModule()
            //self.navigationController?.pushViewController(vc, animated: true)
            NavigationLink(destination: vc.view) {
                                Text("Show View")
                            }
                            .navigationTitle("Navigation")
        }, label: { Text("Boton") })
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
