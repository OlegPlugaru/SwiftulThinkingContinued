//
//  SoudsBootcamp.swift
//  SwiftulThinkingContinuedLearning
//
//  Created by Oleg Plugaru on 03.11.2023.
//

import SwiftUI
import AVKit

class SoundManager {
    static let instance = SoundManager()
   
    var player: AVAudioPlayer?
    
    enum SoundOption: String {
        case ding
        case crumple
    }
    
    func playSound(sound: SoundOption) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing sound. \(error.localizedDescription)")
        }
    }
}

struct SoudsBootcamp: View {
    
    var soundManager = SoundManager()
    
    var body: some View {
        VStack(spacing: 40) {
            Button("Play sound 1") {
                SoundManager.instance.playSound(sound: .crumple)
            }
            
            Button("Play sound 2") {
                SoundManager.instance.playSound(sound: .ding)
            }
        }
    }
}

#Preview {
    SoudsBootcamp()
}
