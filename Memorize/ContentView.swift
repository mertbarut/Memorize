//
//  ContentView.swift
//  Memorize
//
//  Created by Mert Barut on 09.07.22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(viewModel.cards, content: { card in
                    CardView(card: card).aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                })
            }.foregroundColor(.red)
        }.padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        Group {
            ContentView(viewModel: game).preferredColorScheme(.dark).previewInterfaceOrientation(.portrait)
        }
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
   
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp
            {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3).fill()
                Text(card.content).font(.largeTitle)
            }
            else
            {
                shape.fill()
            }
        }
    }
}
