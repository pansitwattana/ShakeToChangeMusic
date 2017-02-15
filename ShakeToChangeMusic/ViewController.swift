//
//  ViewController.swift
//  ShakeToChangeMusic
//
//  Created by Pansit Wattana on 2/15/17.
//  Copyright © 2017 Pansit Wattana. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var audioPlayer = AVAudioPlayer()
    
    var music = ["boing", "explosion", "hit", "knife", "shoot", "swish", "wah", "warble"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEventSubtype.motionShake{
            ChangeMusic()
        }
    }
    
    
    func ChangeMusic() {
        
        let index = Int(arc4random_uniform(UInt32(music.count)))
        
        let audioPath = Bundle.main.path(forResource: music[index], ofType: "mp3")
        
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
        }
        catch {
            //error
        }
        
        audioPlayer.play()
    }
}

