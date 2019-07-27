//
//  WriteModule.swift
//  FileManagerBasic
//
//  Created by sunsetwan on 2019/7/24.
//  Copyright © 2019 sunsetwan. All rights reserved.
//

import Foundation


func write(To url: NSURL, contentsOf contents: String) {
    
    // Create file
    FileManager.default.createFile(atPath: url.absoluteString!, contents: nil, attributes: nil)
    
    // write
    do {
        try contents.write(to: url as URL, atomically: false, encoding: .utf8)
    } catch {
        print("Unexpected error: \(error).")
    }
}




