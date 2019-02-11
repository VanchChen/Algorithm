/*
 * @lc app=leetcode.cn id=7 lang=swift
 *
 * [7] 整数反转
 *
 * https://leetcode-cn.com/problems/reverse-integer/description/
 *
 * algorithms
 * Easy (31.08%)
 * Total Accepted:    73.9K
 * Total Submissions: 237.7K
 * Testcase Example:  '123'
 *
 * 给出一个 32 位的有符号整数，你需要将这个整数中每位上的数字进行反转。
 * 
 * 示例 1:
 * 
 * 输入: 123
 * 输出: 321
 * 
 * 
 * 示例 2:
 * 
 * 输入: -123
 * 输出: -321
 * 
 * 
 * 示例 3:
 * 
 * 输入: 120
 * 输出: 21
 * 
 * 
 * 注意:
 * 
 * 假设我们的环境只能存储得下 32 位的有符号整数，则其数值范围为 [−231,  231 − 1]。请根据这个假设，如果反转后整数溢出那么就返回 0。
 * 
 */
class Solution {
    func reverse(_ x: Int) -> Int {
        var x = x
        var res = 0 
        while x != 0 {
            if res < Int(Int32.min) / 10 || res > Int(Int32.max) / 10 {
                return 0
            }
            res = res * 10 + x % 10
            x /= 10
        }
        return res
    }
}
