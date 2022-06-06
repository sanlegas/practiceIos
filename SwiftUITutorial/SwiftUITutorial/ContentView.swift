//
//  ContentView.swift
//  SwiftUITutorial
//
//  Created by ISAAC DAVID SANTIAGO on 05/06/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View{
        VStack {
            Text("Bienvenidos al curso de swfit")
                .font(.largeTitle)
                .foregroundColor(Color.blue)
                .padding()
                .background(Color.gray)
            Spacer()
            ZStack{
                Text("")
                    .frame(maxWidth:.infinity,
                           maxHeight: .infinity)
                    .background(Color.gray).padding()
                Text("")
                    .frame(maxWidth:.infinity,
                           maxHeight: .infinity)
                    .background(Color.green).padding(40)
                Text("")
                    .frame(maxWidth:.infinity,
                           maxHeight: .infinity)
                    .background(Color.red).padding(60)
                Text("")
                    .frame(maxWidth:.infinity,
                           maxHeight: .infinity)
                    .background(Color.blue).padding(80)
            }
            Spacer()
            Text("Holass").padding()
                .background(
                    Color.gray
                    )
            Text("Bienvenidos a SanlegasDev").padding()
                .background(Color.gray)
        }.background(Color.yellow)
    }
}
 
