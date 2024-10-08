# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution:
    def getIntersectionNode(self, headA: ListNode, headB: ListNode) -> Optional[ListNode]:
        if not headA or not headB:
            return None
        
        a_pointer, b_pointer = headA, headB
        
        while a_pointer != b_pointer:
            a_pointer = a_pointer.next if a_pointer else headB
            b_pointer = b_pointer.next if b_pointer else headA
        
        return a_pointer 