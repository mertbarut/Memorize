//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Mert Barut on 09.07.22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
