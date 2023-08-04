index = int(input())
a = list(map(int, input().split()))

a.sort()
if index == 1:
    print(a[0] * a[0])
else:
    print(a[0]*a[len(a)-1])