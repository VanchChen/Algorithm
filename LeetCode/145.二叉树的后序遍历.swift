/*
 * @lc app=leetcode.cn id=145 lang=swift
 *
 * [145] 二叉树的后序遍历
 *
 * https://leetcode-cn.com/problems/binary-tree-postorder-traversal/description/
 *
 * algorithms
 * Hard (69.56%)
 * Likes:    208
 * Dislikes: 0
 * Total Accepted:    45.6K
 * Total Submissions: 65.6K
 * Testcase Example:  '[1,null,2,3]'
 *
 * 给定一个二叉树，返回它的 后序 遍历。
 * 
 * 示例:
 * 
 * 输入: [1,null,2,3]  
 * ⁠  1
 * ⁠   \
 * ⁠    2
 * ⁠   /
 * ⁠  3 
 * 
 * 输出: [3,2,1]
 * 
 * 进阶: 递归算法很简单，你可以通过迭代算法完成吗？
 * 
 */

// @lc code=start
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Solution {
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var curNode : TreeNode? = TreeNode(-1)
        curNode!.left = root
        
        var preNode : TreeNode
        var result = [Int]()
        
        func reverseTree(from: TreeNode?, to: TreeNode?) {
            var x = from, y = from?.right, z = y?.right
            while y?.val != to?.val {
                y?.right = x
                x = y
                y = z
                z = y?.right
            }
           
            to?.right = x
        }
        
        func printReverse(from: TreeNode, to: TreeNode, result: inout [Int]) {
            if from.val == to.val {
                result.append(from.val)
                return
            }
            if from.right?.val == to.val {
                result.append(to.val)
                result.append(from.val)
                return
            }
            
            reverseTree(from: from, to: to)
            
            var curNode = to
            while curNode.val != from.val {
                result.append(curNode.val)
                curNode = curNode.right!
            }
            result.append(from.val)
            
            reverseTree(from: to, to: from)
        }
        
        while curNode != nil {
            if curNode!.left != nil {
                preNode = curNode!.left!
                while preNode.right != nil &&
                    preNode.right!.val != curNode!.val {
                    preNode = preNode.right!
                }
                if preNode.right == nil {
                    preNode.right = curNode
                    curNode = curNode!.left!
                } else {
                    printReverse(from: curNode!.left!, to: preNode, result: &result)
                    preNode.right = nil
                    curNode = curNode!.right
                }
            } else {
                curNode = curNode!.right
            }
        }
        
        return result
    }
}
// @lc code=end

