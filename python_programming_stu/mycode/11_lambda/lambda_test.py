# 일반적인 함수 정의
def add(x, y):
    return x + y
print(add(10, 20))
# lambda 함수 정의
add2 = lambda x, y : x + y
print(add2(100,200))

#제곱승, 곱하기, 나누기 람다함수로 정의해서 호출
my_pow = lambda x: x ** 2
print(my_pow(2))
print((lambda x: x ** 2)(3))

my_div = lambda x: x /2
print(my_div(10))

my_arr = [1,2,3,4,5]
result = map(lambda x: x * 2, my_arr)
print(result)
print(list(result))

result = list(map(lambda x: x * 2, my_arr))
print(list(result))

# [1,2,3,4,5] + [1,2,3,4,5]
#add(1,1) add(2,2)



f_pow = lambda x: x**2
result = map(f_pow, my_arr)
print(next(result))

#filter 함수
result = filter(lambda x: x > 2, my_arr)
print(result)
print(list(result))

for val in filter(lambda x: x > 2, my_arr):
    print(val)


# reduce
# functools.py 라는 모듈 안에 있는 reduce 함수를 불러오기
from functools import reduce
result = reduce(lambda x, y: x+y, my_arr)
print(result)


