/*
 * @lc app=leetcode.cn id=9 lang=swift
 *
 * [9] 回文数
 *
 * https://leetcode-cn.com/problems/palindrome-number/description/
 *
 * algorithms
 * Easy (55.67%)
 * Total Accepted:    63.5K
 * Total Submissions: 114K
 * Testcase Example:  '121'
 *
 * 判断一个整数是否是回文数。回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。
 * 
 * 示例 1:
 * 
 * 输入: 121
 * 输出: true
 * 
 * 
 * 示例 2:
 * 
 * 输入: -121
 * 输出: false
 * 解释: 从左向右读, 为 -121 。 从右向左读, 为 121- 。因此它不是一个回文数。
 * 
 * 
 * 示例 3:
 * 
 * 输入: 10
 * 输出: false
 * 解释: 从右向左读, 为 01 。因此它不是一个回文数。
 * 
 * 
 * 进阶:
 * 
 * 你能不将整数转为字符串来解决这个问题吗？
 * 
 */
class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0 else {
            return false
        }
        
        var x = x
        var div = 1
        
        while (x / div >= 10) {
            div = div * 10
        }
        
        while (x > 0) {
            var left = x / div
            var right = x % 10
            
            if (left != right) {
                return false
            }
            
            x = (x % div) / 10
            div = div / 100
        }

        return true
    }

    func isPalindrome2(_ x: Int) -> Bool {
        let string = String(x)
        var s = 0
        var e = string.count - 1
        while (s < e) {
            if string[string.index(string.startIndex, offsetBy:s)] !=
                string[string.index(string.startIndex, offsetBy:e)] {
                return false
            }
            s += 1
            e -= 1
        } 
        return true
    }
}
