# class Solution:
#     def strStr(self, haystack: str, needle: str) -> int:
        
        
# class Solution:
#     def strStr(self, haystack, needle):
#         self.haystack = haystack
#         self.needle = needle
#         for index, character in enumerate(haystack):
#             if needle in haystack:
#                 return index
#             else:
#                 return -1
            
class Solution:
    def strStr(self, haystack, needle):
        # Use the find method to get the index of the first occurrence
        index = haystack.find(needle)
        return index


# class Solution:
#     def find_all_indexes(self, string, substring):
#         return [i for i in range(len(string)) if string.startswith(substring, i)]
    
#     def strStr(self, haystack, needle):
#         self.haystack = haystack
#         self.needle = needle
        
#         if needle in haystack:  # Check if needle is in haystack
#             indexes = self.find_all_indexes(haystack, needle)
#             if len(indexes) > 1:
#                 print(indexes[0])  # Print the second occurrence if it exists
#             return indexes
        
#         return -1  # Return -1 if needle is not found

        
# haystack = "sadbutsad"
# needle = "sad"
# i = find_all_indexes(haystack, needle)
# print(i[1])
