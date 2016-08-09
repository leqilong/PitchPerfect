//
//  ViewController.swift
//  PicthPerfect
//
//  Created by Leqi Long on 5/28/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {

    @IBOutlet weak var startRecording: UIButton!
    @IBOutlet weak var tapToRecord: UILabel!
    @IBOutlet weak var stopRecording: UIButton!
    @IBOutlet weak var pauseRecording: UIButton!
    
    
    
    var audioRecorder: AVAudioRecorder!
    var recordedAudio: RecordedAudio!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.contents = UIImage(named: "blurry_wallpaper_recording.jpeg")?.CGImage
        tapToRecord.adjustsFontSizeToFitWidth = true
    }
    
    
    @IBAction func startRecording(sender: AnyObject) {
        tapToRecord.text = "Recording in Process..."
        startRecording.enabled = false
        stopRecording.enabled = true
        pauseRecording.enabled = true
        
       recordedAudio = RecordedAudio(fileURL: RecordedAudio.getURL()!, fileTitle: "Title")
        try! audioRecorder = AVAudioRecorder(URL: recordedAudio.url, settings: [:])
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        try! session.setActive(true)
        
        audioRecorder.delegate = self
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    @IBAction func pauseRecording(sender: AnyObject) {
        stopRecording.enabled = true
        startRecording.enabled = true
        tapToRecord.text = "Tap to Continue"
        
        audioRecorder.pause()
    }
    
    @IBAction func stopRecording(sender: AnyObject) {
        tapToRecord.text = "Tap to Record"
        startRecording.enabled = true
        stopRecording.enabled = false
        
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder, successfully flag: Bool) {
        print("Finished recording!")
        if (flag){ //if the recording was successful
            self.performSegueWithIdentifier("stopRecording", sender: audioRecorder.url)
        }else{
            print("Saving file failed")
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "stopRecording"{
            let nav = segue.destinationViewController as! UINavigationController
            let vc = nav.viewControllers[0] as! PlaySoundsViewController
            let recordedAudioURL = sender as! NSURL
            vc.recordedAudioURL = recordedAudioURL
        }
    }
    override func viewWillAppear(animated: Bool) {
        stopRecording.enabled = false
        pauseRecording.enabled = false
    }
}

