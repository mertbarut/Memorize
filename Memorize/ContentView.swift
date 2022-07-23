//
//  ContentView.swift
//  Memorize
//
//  Created by Mert Barut on 09.07.22.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🧑‍🏫", "👩‍🔧", "👩‍🚀", "👩‍💼", "👮", "👷", "💂",
                  "🕵️", "🧑‍⚕️", "🧑‍🌾", "🧑‍🍳", "🧑‍🎓", "🧑‍🎤", "🧑‍🏭",
                  "🧑‍💻", "🧑‍💼", "🧑‍🔧", "🧑‍🔬", "🧑‍🎨", "🧑‍🚒", "🧑‍✈️",
                  "🧑‍⚖️"]
    @State var emojiCount = 4
    
    var body: some View {
        ZStack {
            VStack {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                        ForEach(emojis[0..<emojiCount], id: \.self, content: { emoji in
                            CardView(content: emoji).aspectRatio(3/4, contentMode: .fit)
                        })
                    }.foregroundColor(.red)
                }
                Spacer()
                HStack {
                    addCardButton
                    Spacer()
                    removeCardButton
                }.padding(.horizontal)
            }.padding(.all)
        }
    }
    
    var addCardButton: some View {
        return Button(
            action: {
                if (emojiCount < emojis.count) {
                    emojiCount += 1
                }
                    
            },
            label: {
                VStack {
                    Image(systemName: "plus.circle").font(.largeTitle)
                }
            }
        )
    }
    
    var removeCardButton: some View {
        return Button(
            action: {
                if (emojiCount != 1) {
                    emojiCount -= 1
                }
            },
            label: {
                VStack {
                    Image(systemName: "minus.circle").font(.largeTitle)
                }
            }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().preferredColorScheme(.dark).previewInterfaceOrientation(.portrait)
        }
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp
            {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3).fill()
            Text(content).font(.largeTitle)
            }
            else
            {
                shape.fill()
            }
        }.onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}
