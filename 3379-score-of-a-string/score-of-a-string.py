class Solution:
    def scoreOfString(self, s: str):
        self.s = s
        asc = []
        for char in s:
            asc.append(ord(char))
        print(asc)
    
        score = 0
        for i in range(len(asc)-1):
            score += abs(asc[i]-asc[i+1])
            
            
        return score



# solution = Solution()
# result = solution.scoreOfString('int')
# print(result)
