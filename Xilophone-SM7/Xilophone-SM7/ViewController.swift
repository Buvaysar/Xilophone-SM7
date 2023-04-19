//
//  ViewController.swift
//  Xilophone-SM7
//
//  Created by Magomadov on 07.04.2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer?
    @IBAction func ButtonTapped(_ sender: UIButton) {
//        print ("button \(sender.currentTitle!) tapped.")
        playSound(SoundName: sender.currentTitle!)
        sender.alpha = 0.5 //button's alpha reduced to half
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            //Bring's sender's opacity back up to fully opaque.
            sender.alpha = 1.0            
        }
    }
    
        
    func playSound(SoundName: String) {
        guard let path = Bundle.main.path(forResource: SoundName, ofType:"wav") else {
            return }
        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    
    
}



