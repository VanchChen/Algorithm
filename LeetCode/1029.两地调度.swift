/*
 * @lc app=leetcode.cn id=1029 lang=swift
 *
 * [1029] 两地调度
 *
 * https://leetcode-cn.com/problems/two-city-scheduling/description/
 *
 * algorithms
 * Easy (57.04%)
 * Likes:    53
 * Dislikes: 0
 * Total Accepted:    5.2K
 * Total Submissions: 9.1K
 * Testcase Example:  '[[10,20],[30,200],[400,50],[30,20]]'
 *
 * 公司计划面试 2N 人。第 i 人飞往 A 市的费用为 costs[i][0]，飞往 B 市的费用为 costs[i][1]。
 * 
 * 返回将每个人都飞到某座城市的最低费用，要求每个城市都有 N 人抵达。
 * 
 * 
 * 
 * 示例：
 * 
 * 输入：[[10,20],[30,200],[400,50],[30,20]]
 * 输出：110
 * 解释：
 * 第一个人去 A 市，费用为 10。
 * 第二个人去 A 市，费用为 30。
 * 第三个人去 B 市，费用为 50。
 * 第四个人去 B 市，费用为 20。
 * 
 * 最低总费用为 10 + 30 + 50 + 20 = 110，每个城市都有一半的人在面试。
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 1 <= costs.length <= 100
 * costs.length 为偶数
 * 1 <= costs[i][0], costs[i][1] <= 1000
 * 
 * 
 */

// @lc code=start
class Solution {
    func twoCitySchedCost(_ costs: [[Int]]) -> Int {
        if costs.count == 0 {
            return 0
        }

        var total = 0, leftCount = 0
        var diffLeftDic = [Int: Int](), diffRightDic = [Int: Int]()
        var minLeft = 1000, minRight = 1000, maxLeft = 0, maxRight = 0
        for cost in costs {
            var diff = 0
            if cost[0] < cost[1] {
                total += cost[0]
                diff = cost[1] - cost[0]
                minRight = min(minRight, diff)
                maxRight = max(maxRight, diff)
                if diffRightDic[diff] == nil {
                    diffRightDic[diff] = 1
                } else {
                    diffRightDic[diff]! += 1
                }
                leftCount += 1
            } else {
                total += cost[1]
                diff = cost[0] - cost[1]
                minLeft = min(minLeft, diff)
                maxLeft = max(maxLeft, diff)
                if diffLeftDic[diff] == nil {
                    diffLeftDic[diff] = 1
                } else {
                    diffLeftDic[diff]! += 1
                }
            }
        }

        var remainCount = leftCount - costs.count / 2
        if remainCount == 0 {
            return total
        } 

        var diffDic = remainCount > 0 ? diffRightDic : diffLeftDic
        let diffMin = remainCount > 0 ? minRight : minLeft
        let diffMax = remainCount > 0 ? maxRight : maxLeft

        if remainCount < 0 {
            remainCount = -remainCount
        }

        for _ in 1...remainCount {
            for j in diffMin...diffMax {
                if diffDic[j] != nil && 
                   diffDic[j]! > 0 {
                    total += j
                    diffDic[j]! -= 1
                    break
                }
            }
        }

        return total
    }
}

// @lc code=end

