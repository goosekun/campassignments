import UIKit

func lcp(_ words: [String]) -> String {
    var i : Int = 0
    var common = ""
    var flag = true
    for word in words {
        let compare = word[word.index(word.startIndex, offsetBy: i)]
        for word in words {
            if compare != word[word.index(word.startIndex, offsetBy: i)] {
                flag = false
                break
            }
        }
        
                                          
        if flag {
            common += String(compare)
                i += 1
            } else {
                break
            }
        
    }
    return common
}


let strs = ["float", "flower", "fly"]

print(lcp(strs))
