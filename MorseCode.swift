var englishText = "this is a secret message"

var secretMessage = ".... --- .-- -.. -.--   .--. .- .-. - -. . .-."
// Both have a String Var

// Add your code below 🤫
var letterToMorse: [String: String] = [
  "a": ".-",
  "b": "-...",
  "c": "-.-.",
  "d": "-..",
  "e": ".",
  "f": "..-.",
  "g": "--.",
  "h": "....",
  "i": "..",
  "j": ".---",
  "k": "-.-",
  "l": ".-..",
  "m": "--",
  "n": "-.",
  "o": "---",
  "p": ".--.",
  "q": "--.-",
  "r": ".-.",
  "s": "...",
  "t": "-",
  "u": "..-",
  "v": "...-",
  "w": ".--",
  "x": "-..-",
  "y": "-.--",
  "z": "--..",
  ".": ".-.-.-",
  "?": "..--..",
  ",": "--..--",
  "!": "-.-.--"
] // dictionary of english alphabet (key) to morse library (value)

var morseText: String = ""
//print(morseText)

for element in englishText {
  // for loop to iterate over string englishText
  if let morseChar = letterToMorse["\(element)"] {
    // if var morseChar = 'a letter' (key) in letterToMorse dictionary from element in englishText than append that key's value to the empty string morseText'
    morseText.append("\(morseChar) ")
    // appends morseChar found to morseText using .append
  } else {
    morseText.append("   ")
    // appends three spaces to morseText signifying no key matches englishText
  }
} // for-in loop ends
print(morseText)

/* translating morse code */
var decodedMessage: String = ""

// Array of Morse Code Letters
var morseCodeArray: [String] = [] // Empty string created
//print(morseCodeArray)

// to keep track of current Morse Code letter
var currMorse: String = ""

/* Morse Code Rules: 
single space - between letters 
tripple space - between words
*/

for char in secretMessage {
  // loops through secretMessage
  if char != " " {
    currMorse.append(char)
    // if char is not a space, it will append it to currMorse
  } else {
    // else statement only when char in secretMessage is a space
    switch currMorse {
      // switch statement to determine which space is found
      case "":
        currMorse += " "
        // if case 1: "", we have hit the first space between two morse code letters. currMorse will have a single space since we are converting morse to english
      case " ":
        morseCodeArray.append(" ")
        currMorse = ""
        // if case 2: " " found means we found space between two words and we will reset currMorse to empty string. Then morseCodeArray will be appened with a single space. currMorse reset to empty string. 
      default:
        morseCodeArray.append("\(currMorse)")
        currMorse = ""
        // default case found when space between two letters. Appends all characters to morseCodeArray and resets currMorse to empty string
    }
  }
}
morseCodeArray.append(currMorse)
// append statment finishes populating morseCodeArray
print(morseCodeArray)

// Now we create vice-versa dictionary with key's as morse code alphabet and values's as english alphabet

var morseToLetter: [String: String] = [:]
//print(morseToLetter)

for (letter, morseChar) in letterToMorse {
  // for-in loop using tuple (letter, morseChar) to iterate through letterToMorse
  morseToLetter[morseChar] = letter
  // assignment as follows: newDictionary[morseChar] = english letter. The vice versa of the old dictionary letterToMorse
}
//print(morseToLetter) - testing to see if worked

// decoding time! 
for morseValue in morseCodeArray {
  // iterating through morseCodeArray with placeholder morseValue
  if let letterChar = morseToLetter[morseValue] {
    // stores morseValue from morseToLetter in letterChar
    decodedMessage.append(letterChar)
    // appends letterChar to decodedMessage
  } else {
    decodedMessage.append(" ")
    // else statment executed only if morseValue has no existing key, then morseValue is a space. 
  }
}

// printing final message: 
print(decodedMessage)


