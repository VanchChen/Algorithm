/*
 * @lc app=leetcode.cn id=835 lang=swift
 *
 * [835] 链表组件
 *
 * https://leetcode-cn.com/problems/image-overlap/description/
 *
 * algorithms
 * Medium (53.33%)
 * Likes:    14
 * Dislikes: 0
 * Total Accepted:    1.1K
 * Total Submissions: 1.9K
 * Testcase Example:  '[[1,1,0],[0,1,0],[0,1,0]]\n[[0,0,0],[0,1,1],[0,0,1]]'
 *
 * 给出两个图像 A 和 B ，A 和 B 为大小相同的二维正方形矩阵。（并且为二进制矩阵，只包含0和1）。
 * 
 * 我们转换其中一个图像，向左，右，上，或下滑动任何数量的单位，并把它放在另一个图像的上面。之后，该转换的重叠是指两个图像都具有 1 的位置的数目。
 * 
 * （请注意，转换不包括向任何方向旋转。）
 * 
 * 最大可能的重叠是什么？
 * 
 * 示例 1:
 * 
 * 输入：A = [[1,1,0],
 * ⁠         [0,1,0],
 * [0,1,0]]
 * B = [[0,0,0],
 * [0,1,1],
 * [0,0,1]]
 * 输出：3
 * 解释: 将 A 向右移动一个单位，然后向下移动一个单位。
 * 
 * 注意: 
 * 
 * 
 * 1 <= A.length = A[0].length = B.length = B[0].length <= 30
 * 0 <= A[i][j], B[i][j] <= 1
 * 
 * 
 */

// @lc code=start
class Solution {
    func largestOverlap(_ A: [[Int]], _ B: [[Int]]) -> Int {
        //保证数组个数相同
        guard A.count == B.count else {
            return 0
        }

        let count = A.count

        //数组转数字
        var numA = [Int](); var numB = [Int]()
        for i in 0..<count {
            var tmpA = 0; var tmpB = 0
            for j in 0..<count {
                tmpA <<= 1
                tmpB <<= 1

                tmpA += A[i][j]
                tmpB += B[i][j]
            }
            numA.append(tmpA)
            numB.append(tmpB)
        }

        var final = 0
        //上下左右最多移动n个，[-n+1，n-1]
        for i in (-count+1)..<count {
            for j in (-count+1)..<count {
                var tmp = 0
                //计算移动后1重叠的个数
                for k in 0..<count {
                    if (k + i) < 0 || (k + i) >= count {
                        continue
                    }
                    
                    var result = 0
                    if j < 0 {
                        //左移到负轴
                        result = numA[k] & (numB[k + i] << abs(j))
                    } else {
                        result = numA[k] & (numB[k + i] >> j)
                    }
                    //计算合并结果包含1的个数
                    var oneCount = 0
                    while result > 0 {
                        result -= result & -result
                        oneCount += 1
                    }
                    tmp += oneCount
                }
                final = max(final, tmp)
            }
        }

        return final
    }
}
// @lc code=end

