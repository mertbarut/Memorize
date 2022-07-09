//
//  ContentView.swift
//  Memorize
//
//  Created by Mert Barut on 09.07.22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 3)
                .padding(.horizontal)
                .foregroundColor(Color.blue)
            Text("Hello, World!")
                .foregroundColor(.indigo)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
