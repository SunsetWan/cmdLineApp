import Foundation
import SwiftyJSON
import Commander
import Crayon


//print("Hello, world!")
//print("Fuck!")

let jsonFileUrl = NSURL(fileURLWithPath: "/Users/sunsetwan/json2.txt")

command(
//    Option("name", default: "world"),
//    Option("count", default: 1, description: "The number of times to print.")
//    Argument<String>("name", description: "Your name"),
//    Argument<Int>("count", description: "Your surname"),
//    Argument<String>("jsonString", description:" raw string value of json data")

    Argument<String>("inputFilePath", description:"the Path of your raw json data"),
    Argument<String>("outputFileName", description:"result is \"outputFileName.swift file\"")
) {  inputFilePath,  outputFileName in
//    for _ in 0..<count {
//        print("Hello \(name)")
//    }

    let inputFilePath = NSURL(fileURLWithPath: inputFilePath)

    let outputFileURL = NSURL(fileURLWithPath: "./\(outputFileName).swift")

    let fileContents = readJSONFile(From: inputFilePath, structName: outputFileName)

    write(To: outputFileURL, contentsOf: fileContents)
    
//    print("Sucess!".onYellow())
    
//    print(crayon.red.bgMagenta.bold.underline.on("red bgMagenta bild underline"))
    

    print(cy.yellow.on("Success!"))
//    print(cy.fg(.coral).bg(.lightGreen).bold.on("hi"))


}.run()


//command(
//    Option("name", default: "world"),
//    Option("count", default: 1, description: "The number of times to print."),
//    Argument<String>("inputFilePath", description:" raw string value of json data")
//) { name, count, inputFilePath in
//    for _ in 0..<count {
//        print("Hello \(name)")
//        print(inputFilePath)
//    }
//    }.run()
