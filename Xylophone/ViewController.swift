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
        playSound(note: sender.titleLabel?.text)
        blurify(sender)
    }
    
    func playSound(note: String?) {
        guard let url = Bundle.main.url(forResource: note, withExtension: "wav")
            else { return }
        
        do {
            let audioSession = AVAudioSession.sharedInstance()
            try audioSession.setCategory(.playback, mode: .default)
            try audioSession.setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            
            guard let player = player else { return }
            
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func blurify(_ button: UIButton){
        button.alpha = 0.5
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            button.alpha = 1.0
        }
    }
    
}

