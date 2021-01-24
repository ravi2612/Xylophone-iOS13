//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {

    var player: AVAudioPlayer?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        
    playSound()
        
    }
    func playSound() {
        guard let url = Bundle.main.url(forResource: "C", withExtension: "wav") else {
            return
        }

        do {
            /// this codes for making this app ready to takeover the device audio
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /// change fileTypeHint according to the type of your audio file (you can omit this)

            /// for iOS 11 onward, use :
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /// else :
            /// player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3)

            // no need for prepareToPlay because prepareToPlay is happen automatically when calling play()
            guard let player = player else { return }
            player.play()
        } catch let error {
            print("error: \(error.localizedDescription)")
        }
    }
    
    
    
}
