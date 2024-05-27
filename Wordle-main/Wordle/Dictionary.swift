
import Foundation

class Dictionary {
    private var dictionary: [String] = []
    private let lenghtLimit = 5
    init() {
        loadFile(name: "dictionary")
    }

    private func loadFile(name : String) {
        //load file
        guard let file = Bundle.main.url(forResource: name, withExtension: "txt") else {
            fatalError("can't find \(name)")
        }

        do {
            let fileContents = try String(contentsOf: file, encoding: String.Encoding.utf8)
            dictionary = fileContents.components(separatedBy: "\n")
        } catch {
            fatalError("can't parse \(name), check ditionary class file")
        }
        

        
        dictionary.removeAll{ $0.count != lenghtLimit}

    }
    
    func isValid(phrase : String) -> Bool {
        
        return dictionary.contains(phrase)
    }
    func random() -> String {
        return dictionary[Int.random(in: 0..<dictionary.count)]
    }
    
    

}
