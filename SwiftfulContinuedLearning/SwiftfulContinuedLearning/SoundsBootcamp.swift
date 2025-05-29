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
    
    private init() {} // As a singleton, its must not be initialized out of this class.
    
    // MARK: PROPERTIES
    static let instance = SoundManager() // Singleton
    var player: AVAudioPlayer?
    
    // MARK: ENUM
    enum SoundOption: String {
        case tada
        case badum
    }
    
    // MARK: FUNCTIONS
    
    /// Plays sound in a singleton instance.
    ///
    /// Play sound conforms enum value SoundOption. When no sound passed as argument, default value is SoundOption.tada.
    ///
    /// - Parameters:
    ///    - sound: Sound option
    ///
    /// ```
    ///     playSound(sound: .tada)
    /// ```
    func playSound(sound: SoundOption = .tada) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
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
                SoundManager.instance.playSound()
            }
            Button("Play sound two") {
                SoundManager.instance.playSound(sound: .badum)
            }
        }
    }
}

// MARK: PREVIEW
#Preview {
    SoundsBootcamp()
}
