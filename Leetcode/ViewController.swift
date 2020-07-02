//
//  ViewController.swift
//  Leetcode
//
//  Created by 罗心 on 2020/6/19.
//  Copyright © 2020 luoxin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


        let nums = [7,7,7,7]
        let b = smallerNumbersThanCurrent(nums)

    }

//    1365. 有多少小于当前数字的数字
    func smallerNumbersThanCurrent(_ nums: [Int]) -> [Int] {

        var result:[Int] = []
        for i in 0..<nums.count{
            var count = 0
            for j in 0..<nums.count{
                if nums[i]>nums[j]{
                    count += 1
                } else {
                    count += 0
                }
            }
            result.append(count)
        }
        return result;
    }


//    58. 最后一个单词的长度
    func lengthOfLastWord(_ s: String) -> Int {
        return s.split(separator: " ").count > 0 ? s.split(separator: " ")[s.split(separator: " ").count-1].count : 0
    }


//    1046. 最后一块石头的重量
    func lastStoneWeight(_ stones: [Int]) -> Int {
        var st = stones.sorted()
        while st.count >= 2 {
            st = st.sorted()
            let a = st.popLast()!
            let b = st.popLast()!
            st.append(a-b)
        }
        return st[0]
    }



//    1281. 整数的各位积和之差
    func subtractProductAndSum(_ n: Int) -> Int {
        var plus = 1
        var sum = 0
        for c in String(n) {
            plus *= Int(c.description)!
            sum += Int(c.description)!
        }
        return plus - sum
    }


//    剑指 Offer 58 - II. 左旋转字符串
    func reverseLeftWords(_ s: String, _ n: Int) -> String {

        return String(s.suffix(s.count - n)) + String(s.prefix(n))
    }

//    27. 移除元素
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {

       nums = nums.filter {
            $0 != val
        }

        return nums.count

    }

//    283. 移动零
    func moveZeroes(_ nums: inout [Int]) {
        var count = nums.count
        var zeroCount = 0
        for i in nums {

            if i == 0 {
                nums.remove(at: nums.count - count)
                zeroCount += 1
            }
            count -= 1
        }
        for _ in 0..<zeroCount{
            nums.append(0)
        }

    }

//    1304. 和为零的N个唯一整数
    func sumZero(_ n: Int) -> [Int] {
        var array:[Int] = []
        var sum = 0
        for i in 0..<n-1{
            sum += i
            array.append(i)
        }
        array.append(-sum)
        return array
    }


//    1450. 在既定时间做作业的学生人数
    func busyStudent(_ startTime: [Int], _ endTime: [Int], _ queryTime: Int) -> Int {
        var result = 0
        for i in 0..<startTime.count{
            let start = startTime[i]
            let end = endTime[i]
            if queryTime >= start && queryTime <= end {
                result += 1
            }
        }

        return result
    }

//    1389. 按既定顺序创建目标数组
    func createTargetArray(_ nums: [Int], _ index: [Int]) -> [Int] {
        var result:[Int] = []
        for i in 0..<index.count {
            result.insert(nums[i], at: index[i])
        }
        return result
    }


//    1295. 统计位数为偶数的数字
    func findNumbers(_ nums: [Int]) -> Int {

        var result = 0;
        for number in nums {
            let numString = String(number)
            if (numString.count % 2 == 0) {
                result += 1
            }
        }
        return result

    }




//    1108. IP 地址无效化
    func defangIPaddr(_ address: String) -> String {
        let invalidIP = address.replacingOccurrences(of: ".", with: "[.]")
        return invalidIP
    }



//    1342. 将数字变成 0 的操作次数
    func numberOfSteps (_ num: Int) -> Int {

        var count = 0
        var newNum = num

        while newNum != 0 {
            if newNum%2 == 0 {
                        newNum = num / 2
                    } else {
                        newNum -= 1
                    }
            count += 1
        }

        return count

       }

//    771. 宝石与石头
    func numJewelsInStones(_ J: String, _ S: String) -> Int {
        var count = 0
        for i in S {
            if J.contains(i) {
                count += 1
            }
        }
        return count;
    }


//    1470. 重新排列数组
    func shuffle(_ nums: [Int], _ n: Int) -> [Int] {

        var arrayResult:[Int] = []
        for i in 0..<n {
            arrayResult.append(nums[i])
            arrayResult.append(nums[i+n])
        }

        return arrayResult
    }


//    1431. 拥有最多糖果的孩子
    func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {

        var result:[Bool] = []
        let max = candies.max()!
        for i in 0..<candies.count{

            if ((candies[i] + extraCandies) >= max){
                result.append(true)
            } else {
                result.append(false)
            }
        }
        return result
    }

//    1480. 一维数组的动态和
    func runningSum(_ nums: [Int]) -> [Int] {

        var result = [nums[0]];
        for i in 1..<nums.count{
           result.append(nums[i]+result[i-1])
        }
        return result
    }

    //1. 两数之和
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for i in 0..<nums.count {
           let a = nums[i]
           for j in i+1..<nums.count{
               let b = nums[j]
               if (a + b == target) {
                   return [i,j]
               }
           }
        }
        return [0,0]
    }


}

