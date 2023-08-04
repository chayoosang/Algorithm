index = int(input())
toatal = 0
for i in range(1, index+1):
    toatal += (index//i) * i

print(toatal)