import Foundation
import SwiftyJSON
import Commander
import Crayon



let jsonFileUrl = NSURL(fileURLWithPath: "/Users/sunsetwan/json2.txt")

command(
    Argument<String>("inputFilePath", description:"the Path of your raw json data. Example: /Users/userID/json.txt"),
    Argument<String>("outputFileName", description:"result is \"outputFileName.swift file\"")
) {  inputFilePath,  outputFileName in

    let inputFilePath = NSURL(fileURLWithPath: inputFilePath)

    let outputFileURL = NSURL(fileURLWithPath: "./\(outputFileName).swift")

    let fileContents = readJSONFile(From: inputFilePath, structName: outputFileName)

    write(To: outputFileURL, contentsOf: fileContents)
    
    print(cy.yellow.on("Success!"))

}.run()

