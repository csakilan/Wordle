
import Foundation
class Wordle {
    var key : String
    var numGuesses : Int = 0
    var isSolved : Bool = false
    let maxGuessesAllowed: Int = 6
    let maxLetterLength = 5
    
    let dictionary = Dictionary()

    init(correctWord: String) {
        self.key = correctWord
    }
    init() {
        self.key = self.dictionary.random()
    }
    
    
}
