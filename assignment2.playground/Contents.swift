import UIKit

func compute(nums : [Int], target : Int) -> (Int, Int) {
    var sum = -1
    var tuple = (-1, -1)
    var flag = false
    for i in 0..<nums.count {
        for j in 0..<nums.count {
            if i == j {
                continue
            }
            sum = nums[i] + nums[j]
            if sum == target {
                tuple = (i, j)
                flag = true
                break
            }
        }
        if flag {
            break
        }
    }
    
    return tuple
        
}


let nums = [3, 2, 4]
print(compute(nums: nums, target: 6))
