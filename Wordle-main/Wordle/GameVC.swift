
import UIKit


class GameVC: UIViewController, UITextFieldDelegate {

    var game:Wordle = Wordle()

    @IBOutlet weak var dedLetters: UILabel!
    @IBOutlet var guessField: TextFieldVC!
    @IBOutlet var grid: UIStackView!
    var Incorrectletters:[String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guessField.delegate = self
        self.guessField.isEnabled = true
        resetView()
    }
    
    func resetView() {
        self.game = Wordle()
        guessField.delegate = self
        self.guessField.isEnabled = true
        dedLetters.text = ""
        Incorrectletters = []
        print(self.game.key)
        var x = 0
        for case let hStack as UIStackView in grid.subviews {
            hStack.tag = x
            var y = 0
            for case let letterLbl as LetterVC in hStack.arrangedSubviews {
                letterLbl.letter.letter = ""
                letterLbl.letter.type = .empty
                letterLbl.letter.letterIndex = y
              
                letterLbl.updateView()
                y+=1
            }
            x+=1
        }
    }
    func textFieldShouldReturn(_ textField:UITextField) -> Bool {
        let word = textField.text ?? ""
        //print("guess: \(word)")
        userEnteredGuess(userWord: word)
        return true
    }
    func userEnteredGuess(userWord: String) {
        validateGuess(userWord: userWord)
        
        if game.isSolved { endGame(solved: true)}
        else if game.numGuesses == game.maxGuessesAllowed { endGame(solved: false)}
    }
    func validateGuess(userWord: String) {
        if ((game.dictionary.isValid(phrase: userWord.uppercased())) && (userWord.count == game.maxLetterLength)) {
            print("word \(userWord) is valid")
            addGuess(userWord: userWord)
        }
        else { self.guessField.shake()   }
        self.guessField.text = ""
    }
    func addGuess(userWord: String) {
        print("got here")
        game.numGuesses += 1
        let thisRow = game.numGuesses - 1 // for the two extra labels/field
        if (userWord == game.key) { game.isSolved = true }
        let row = (grid.arrangedSubviews[thisRow + 2] as! UIStackView).arrangedSubviews as! [LetterVC] //??
        for letter in row {

            letter.updateView(withGuess: userWord, key: game.key)
            if(letter.letter.type == .incorrect && Incorrectletters.contains(letter.letter.letter) == false ){
                Incorrectletters.append(letter.letter.letter)
                
            }
            print("updated")
        }
        dedLetters.text = Incorrectletters.joined(separator: ", ")
        
    }
//    @IBAction func goToHelp(_ sender: Any) {
//        performSegue(withIdentifier: "toHelp", sender: self)
//    }
//    @IBAction func goToSettings(_ sender: Any) {
//        performSegue(withIdentifier: "toSettings", sender: self)
//    }
    func endGame(solved: Bool) {
        self.guessField.isEnabled = false
        if solved {
            let alert = UIAlertController(title: "YOU WON!!", message: "", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Play again", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else {
            let alert = UIAlertController(title: "YOU LOST :(", message: "", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Play again", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        resetView()
        
    }
}

