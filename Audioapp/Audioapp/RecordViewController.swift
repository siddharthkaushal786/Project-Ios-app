//
//  RecordViewController.swift
//  Audioapp
//
//  Created by trainee on 24/07/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit
import AVFoundation

class RecordViewController: UIViewController, AVAudioRecorderDelegate {
    
    @IBOutlet weak var Recordbutton: UIButton!
    var recordingSession : AVAudioSession!
    var audioRecorder    :AVAudioRecorder!
    var numberOfRecords = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setting Up session
        recordingSession = AVAudioSession.sharedInstance()
        AVAudioSession.sharedInstance().requestRecordPermission { (PerMision) in
            if PerMision
            {
                print("accepted")
            }
            
        }
    }
    
    // Function that get path in directory
        func getDIrectory() -> URL
        {
            let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            let documentDirectory = paths[0]
            return documentDirectory
            
        }
    
    //Function that display alert
    func displayAlert (title: String, message: String ){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "dismiss", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
        
    @IBAction func btnRecord(_ sender: Any) {
        
        //Check for active recorder
        if audioRecorder == nil
        {
            numberOfRecords += 1
            let fileName = getDIrectory().appendingPathComponent("\(numberOfRecords).m4a")
            let settings = [AVFormatIDKey:Int(kAudioFormatMPEG4AAC), AVSampleRateKey: 1200, AVNumberOfChannelsKey: 1, AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue]
           
            //start audio recording
            do
            {
                audioRecorder = try AVAudioRecorder(url: fileName, settings: settings)
                audioRecorder.delegate = self
                audioRecorder.record()
                Recordbutton.setTitle("Stop Recording", for: .normal)
            }
            catch
            {
                displayAlert(title: "Oops!", message: "Recording Failed")
            }
        }
        else
        {
            //stoping audio recording
            audioRecorder.stop()
            audioRecorder = nil
            Recordbutton.setTitle("start recording", for: .normal)
        }
    }
   
}
