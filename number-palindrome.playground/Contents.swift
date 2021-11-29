import UIKit

func compute(n : inout Int) {
    let input = n
    let reverse = reverseNum(input: n)
    var temp : Int = input + reverse
    print(temp)
    //check palindrome
    if check(n: temp) {
        print(temp)
        return
    }
    else {
        print("Passing " + String(temp))
        compute(n: &temp)
    }
}

func reverseNum(input : Int) -> Int {
    var n = input
    var reverse: Int = 0
    
    while (n != 0) {

        reverse = reverse * 10

        reverse = reverse + n % 10

        n = n / 10

    }
//    print(reverse)
    return reverse
}

func check(n : Int) -> Bool{
    let temp : String = String(n)
    if temp.count % 2 == 1 {
        return false
    }
    
    let comp = String(reverseNum(input: n))
    if comp == temp {
        return true
    }
    else {
        return false
    }
}

var input = 7235
compute(n: &input)
