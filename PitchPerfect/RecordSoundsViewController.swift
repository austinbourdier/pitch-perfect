//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Austin Bourdier on 8/14/16.
//  Copyright © 2016 Austin Bourdier. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController {

    
    @IBOutlet var recordButton: UIButton!
    @IBOutlet var stopRecordingButton: UIButton!
    @IBOutlet var recordingLabel: UILabel!
    
    var audioRecorder:AVAudioRecorder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func recordAudio(sender: AnyObject) {
        print("recording...")
        recordingLabel.text = "recording in progress"
        stopRecordingButton.enabled = true
        recordButton.enabled = false
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        
        try! audioRecorder = AVAudioRecorder(URL: filePath!, settings: [:])
        
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }

    @IBAction func stopRecording(sender: AnyObject) {
        print("recording stopped!")
        recordingLabel.text = "Tap to record"
        stopRecordingButton.enabled = false
        recordButton.enabled = true
    }
    
    override func viewWillAppear(animated: Bool) {
        print("viewWillAppear called")
        stopRecordingButton.enabled = false
    }

    
    
}

