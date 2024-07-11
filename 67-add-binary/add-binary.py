class Solution:
    def addBinary(self, a, b):
        x = int(a,2)
        y = int(b,2)
        bi = x + y
        z = bin(bi)[2:]
        return z
        