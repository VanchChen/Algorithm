/*
 * @lc app=leetcode.cn id=144 lang=swift
 *
 * [144] 二叉树的前序遍历
 *
 * https://leetcode-cn.com/problems/binary-tree-preorder-traversal/description/
 *
 * algorithms
 * Medium (63.44%)
 * Likes:    191
 * Dislikes: 0
 * Total Accepted:    61K
 * Total Submissions: 96.1K
 * Testcase Example:  '[1,null,2,3]'
 *
 * 给定一个二叉树，返回它的 前序 遍历。
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
 * 输出: [1,2,3]
 * 
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
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var curNode = root
        var preNode : TreeNode
        var result = [Int]()
        
        while curNode != nil {
            if curNode!.left != nil {
                preNode = curNode!.left!
                while preNode.right != nil &&
                    preNode.right!.val != curNode!.val {
                    preNode = preNode.right!
                }
                if preNode.right == nil {
                    preNode.right = curNode
                    result.append(curNode!.val)
                    curNode = curNode!.left!
                } else {
                    preNode.right = nil
                    curNode = curNode!.right
                }
            } else {
                result.append(curNode!.val)
                curNode = curNode!.right
            }
        }
        
        return result
    }
}
// @lc code=end

