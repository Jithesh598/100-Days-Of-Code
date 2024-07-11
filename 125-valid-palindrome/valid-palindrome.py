class Solution:
    def isPalindrome(self, s):
        v = s.lower()
        x = []
        for i in v:
            if i.isalnum():
                x.append(i)
        y = ''.join(x)
        return y == y[::-1]
