# #Case 1
# class Solution():
#     def add(self, a,b):
#         return a+b
#     pass
#
#
# solu = Solution()
#
# a = 10
# b = 15
# c = solu.add(a,b)
# print("c is {}".format(c))

#
# #Case 2
# '''
# Result：[0,0,1,1,2,3,3,4] --> [0,1,2,3,4]
# '''
# class Solution:
#     def removeDuplicates(self, nums: "list[int]") -> "int":
#         #if length of list is less than 1, directly return
#         if len(nums)<=1:
#             return nums
#
#         idx1 = 0
#         idx2 = 1
#
#         while(idx2<len(nums)):
#             # idx1++
#             if nums[idx1] != nums[idx2]:
#                 idx1 += 1
#                 nums[idx1] = nums[idx2]
#                 idx2 += 1
#                 pass
#             else:
#                 idx2 += 1
#                 pass
#             pass
#         return nums
#
#
# sol = Solution()
# TestList = [0,0,1,1,2,3,3,4]
# print(sol.removeDuplicates(TestList))










