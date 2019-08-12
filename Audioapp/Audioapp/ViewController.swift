//
//  ViewController.swift
//  Audioapp
//
//  Created by trainee on 23/07/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

    class ViewController: UIViewController, AVAudioPlayerDelegate {
        
      
        @IBOutlet weak var btnPlay: UIButton!
        
      
       
        var audioPlayer = AVAudioPlayer()
       
   
   override func viewDidLoad() {
       super.viewDidLoad()
    
    
        do{
            try audioPlayer = AVAudioPlayer(contentsOf:URL.init(fileURLWithPath:Bundle.main.path(forResource: "music", ofType: "mp3")!))
            audioPlayer.prepareToPlay()

            let audioSession = AVAudioSession.sharedInstance()
            do{
                try audioSession.setCategory(AVAudioSession.Category.playback)

            }
        } catch{
            print("error")
    }
   
        }
    
    
    @IBAction func btnWatchVideo(_ sender: Any) {
        if let path = Bundle.main.path(forResource: "SampleVideo_1280x720_1mb", ofType: "mp4")
        {
            let video = AVPlayer(url: URL(fileURLWithPath: path))
            let videoPlayer = AVPlayerViewController()
            videoPlayer.player = video
            present(videoPlayer, animated: true, completion:
                {
                    video.play()
            })
            
        }
    }
 
        @IBAction func btnPlayAudio(_ sender: Any) {
        if audioPlayer.isPlaying{
        audioPlayer.play()
        }
        else{
            
        }
    }
        
        @IBAction func btnPause(_ sender: Any) {
       
            
        }
        

     
    
}

