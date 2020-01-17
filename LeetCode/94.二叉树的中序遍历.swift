/*
 * @lc app=leetcode.cn id=94 lang=swift
 *
 * [94] 二叉树的中序遍历
 *
 * https://leetcode-cn.com/problems/binary-tree-inorder-traversal/description/
 *
 * algorithms
 * Medium (69.58%)
 * Likes:    364
 * Dislikes: 0
 * Total Accepted:    93.2K
 * Total Submissions: 134K
 * Testcase Example:  '[1,null,2,3]'
 *
 * 给定一个二叉树，返回它的中序 遍历。
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
 * 输出: [1,3,2]
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
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
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
                    curNode = curNode!.left!
                } else {
                    preNode.right = nil
                    result.append(curNode!.val)
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

