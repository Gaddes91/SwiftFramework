//
//  File.swift
//  SwiftFramework
//
//  Created by Matthew Gaddes on 23/08/2015.
//  Copyright (c) 2015 Matthew Gaddes. All rights reserved.
//

import Foundation

extension String {
    
    // Remove part of the initial string
    func remove(stringToRemove: String) -> String {
        return stringByReplacingOccurrencesOfString(stringToRemove, withString: "")
    }
    
    // Remove part of the initial string and replace with newly-specified string
    func replace(oldString: String, newString: String) -> String {
        return stringByReplacingOccurrencesOfString(oldString, withString: newString)
    }
    
    /* Capitalise all words in a string, with exceptions provided by the user.
     * The first word in the output string will always be capitalised, due to the call to the extension below, entitled capitaliseFirstLetterOnly()
     */
    func capitaliseWithExceptions(exceptions: String) -> String {
        
        // Capitalise every word
        var inputCap = self.capitalizedString
        var exceptionCap = exceptions.capitalizedString
        
        // Split strings into an array of individual words using the whitespace character as a delimiter
        var inputArray = split(inputCap) {$0 == " "}
        var exceptionArray = split(exceptionCap) {$0 == " "}
        
        for var i = 0; i < exceptionArray.count; {
            
            for var j = 0; j < inputArray.count; {
                
                if exceptionArray[i] == inputArray[j] {
                    
                    // Constant holding the lowercase value of the current string
                    let temp = inputArray[j].lowercaseString
                    // Replace current (capitalised) value with lowercase value
                    inputArray[j] = temp
                }
                
                j = j + 1
            }
            
            i = i + 1
        }
        
        // Call on extension created below to capitalise the first letter only
        let output = " ".join(inputArray).capitaliseFirstLetterOnly()
        
        return output
    }
    
    // Capitalise only the first letter of a string
    func capitaliseFirstLetterOnly() -> String {
        
        // Separate the input string into an array of individual characters
        var inputArray = Array(self)
        
        // Create a variable of type String to hold only the first letter of the input string
        var temp = ""
        temp.append(inputArray[0])
        
        // Capitalise the character
        let tempCap = temp.capitalizedString
        
        // Replace the initial (non-capitalised) character with the new (capitalised) character
        // Place the new (capitalised) character into the array at the position of the original character
        inputArray[0] = Character(tempCap)
        
        // Turn array back into a String
        let output = String(inputArray)
        
        return output
    }
    
}

