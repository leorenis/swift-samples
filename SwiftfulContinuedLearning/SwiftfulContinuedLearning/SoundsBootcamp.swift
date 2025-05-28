//
//  SoundsBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 28/05/25.
// Free Sound: https://www.freesoundslibrary.com/tada-sound/
//

import SwiftUI
import AVKit

// MARK: CLASSES

/// Class SoundManager is a Singleton responsible for manager sounds in our App.
class SoundManager {
    
    // MARK: PROPERTIES
    static let instance = SoundManager()
    var player: AVAudioPlayer?
    
    // MARK: FUNCTIONS
    
    /// Plays sound in a singleton instance.
    ///
    /// ```
    ///     playSound()
    /// ```
    func playSound() {
        guard let url = URL(string: "") else { return }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
    
}
/// Struct used to training how to create sounds effect.
struct SoundsBootcamp: View {
    // MARK: PROPERTIES
    
    // MARK: BODY
    var body: some View {
        VStack(spacing: 24) {
            Button("Play sound one") {
                
            }
            Button("Play sound two") {
                
            }
        }
    }
}

// MARK: PREVIEW
#Preview {
    SoundsBootcamp()
}
