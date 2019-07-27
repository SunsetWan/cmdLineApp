//
//  ReadJSONModule.swift
//  FileManagerBasic
//
//  Created by sunsetwan on 2019/7/24.
//  Copyright © 2019 sunsetwan. All rights reserved.
//

import Foundation
import SwiftyJSON


extension String {
    var fittingCamelConvention: String {
        return components(separatedBy: "_").enumerated().map({ $0 == 0 ? $1 : $1.capitalized }).joined()
    }
}

struct MetaData {
    var key: String?
    var value: Any?
    var type: String?
}

var record = MetaData()
var records = [MetaData]()


func readJSONFile(From path: NSURL, structName name: String) -> String {
    
    let header = """
import SwiftyJSON

struct \(name): JSONWrapperModel {

\tlet json: JSON

\tinit(json: JSON) {
\t\tself.json = json
\t}\n

"""
    
    
    var stringKing = ""
    stringKing.append(header)
    var jsonString: String = ""
    let json: JSON
    var indexNameArray = [String]()
    var valueOfindexName = [Any]()
    
    
    
    
    do {
       jsonString = try String(contentsOf: path as URL, encoding: .utf8)
//        print(jsonString)
    } catch {
        print("Unexpected error: \(error).")
    }
    
    json = JSON(parseJSON: jsonString)
    

    
    for (name, value): (String, Any) in json.dictionaryObject! {
        
        var temp = MetaData()
        temp.key = name
        temp.value = value
        
    
        
        if json[name].string != nil {
            
//            print(name)
            
            if name.hasSuffix("url") {
                 temp.type = "URL"
            } else {
                 temp.type = "string"
            }
            
//            temp.type = json[name].string!.hasSuffix("url") ? "URL" : "string"

            
        } else if json[name].int != nil {
            temp.type = "int"
        } else if json[name].bool != nil {
            temp.type = "bool"
        } else if json[name].double != nil {
            temp.type = "double"
        } else if json[name] == .null {
            
            if name.hasSuffix("id") {
                temp.type = "int"
            } else {
                temp.type = "<#placeHolder#>"
            }
            
//            temp.type = "<#placeHolder#>"
        }
        
        records.append(temp)
        
//        print(name)
//        print(value)
//        print("---------")
    }
    
   
    for index in records {
//        print("Key: \(index.key!)\nValue: \(index.value!)\nType: \(index.type!)\n")
        
        var isURL: Bool {
            if index.type! == "URL" {
                return true
            } else {
                return false
            }
        }
        
        let tempString = """
    var \(index.key!.fittingCamelConvention): \(isURL ? "URL" : index.type!.capitalized)? {
        return json["\(index.key!)"].\(isURL ? "url": index.type!)
    }\n\n
"""
        stringKing.append(tempString)
//        print(tempString)
        
    }
    
    stringKing.append("}")
//    print(stringKing)
    
    return stringKing
    
    
//   write(contentsOf: stringKing)
    
    
    



    
    
    
}
