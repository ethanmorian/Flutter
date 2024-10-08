# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def isBalanced(self, root: Optional[TreeNode]) -> bool:
        def check_balance(node):
            if not node:
                return 0, True
            
            left_height, left_balanced = check_balance(node.left)
            right_height, right_balanced = check_balance(node.right)
            
            current_height = max(left_height, right_height) + 1
            current_balanced = (left_balanced and right_balanced and
                                abs(left_height - right_height) <= 1)
            
            return current_height, current_balanced
        
        _, balanced = check_balance(root)
        return balanced