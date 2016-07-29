//
//  RecordedAudio.swift
//  PicthPerfect
//
//  Created by Leqi Long on 5/29/16.
//  Copyright © 2016 Student. All rights reserved.
//

import Foundation

class RecordedAudio {
    var url = NSURL()
    var title = ""
    
    init(fileURL: NSURL, fileTitle: String){
        url = fileURL
        title = fileTitle
    }
    
    class func getURL() -> NSURL?{
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        let currentDateTime = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateFormat = "ddMMyyyy-HHmmss"
        let recordingName = formatter.stringFromDate(currentDateTime)+".wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        print(filePath)
        return filePath
    }
    
    
}