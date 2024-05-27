

import Foundation

enum LetterTypes {
    case correct
    case misplaced
    case incorrect
    case empty
}


class Letter {
    var letter: String = ""
    var wordIndex: Int = 0
    var letterIndex: Int = 0
    var type = LetterTypes.empty
    
    
    func setLetterValue(guess: String) {
        letter = String(guess[guess.index(guess.startIndex, offsetBy: letterIndex)])
    }
    func assignTypeFrom(key: String) -> LetterTypes {
        if letter.count != 1 {
            type = LetterTypes.empty
        }
            //TODO: figure this entie thing out
        if key.contains(letter) {
            
            let keyLetter = String(key[key.index(key.startIndex, offsetBy: letterIndex)])
            print("\(keyLetter), \(letter)")
            if keyLetter == letter {
                type = LetterTypes.correct
            }
            else {
                type = LetterTypes.misplaced
            }
        }
        else {
            type = LetterTypes.incorrect
        }
        return type
    }
}
