//
//  ViewController.swift
//  Lab_Shake_play_Sound
//
//  Created by gai lowvapong on 2/15/17.
//  Copyright © 2017 gai lowvapong. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {

     var player = AVAudioPlayer()
     var audiopath = ""
     var soundname = ["boing","explosion","hit","knife","shoot","swish","wah","warble"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        if event?.subtype == UIEventSubtype.motionShake {
            
            
            let rannum = Int(arc4random_uniform(UInt32(soundname.count)))
            
            
            audiopath = Bundle.main.path(forResource: String(soundname[rannum]), ofType: "mp3")!
            
            
            do{
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audiopath))
            }
            catch{
                print("error")
            }
            
            
            player.play()
            print(rannum)
            print(soundname[rannum])
        }
    }
    
}

