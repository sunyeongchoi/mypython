# for ~ in 구문 사용
#start의 default 값은 0
#end는 exclusive -1
for val in [0,1,2]:
    print(val)

#range(start, end, 증가치) 함수, 증가치의 default 값은 1
for val in range(0, 10):
    print(val)


for val in range(0, 20, 2):
    print(val)

for val in range(0,1,-1):
    print(val)


# 문자열 타입의 리스트
favor_hobby = ['fishing', 'reading', 'shopping']
for hobby in favor_hobby:
    print('{} is my favorite hobby'.format(hobby))

#dict 타입(dictionary)
wish_travel_city = {'bangkok':'Thai', 'LA':'USA','Seoul':'Korea'}
print(type(wish_travel_city))
print(wish_travel_city['LA'])
#key, value를 출력할때 keys() 함수

#key, value 를 출력할 때 items() 함수 사용
for city, country in wish_travel_city.items():
    print(f'{city} in {country}')

import random

for val in range(1,11):
    ticket = random.randint(1,100)
    print(ticket)

# for 구문 대신 while
# for val in range(10):
#   print(val)

idx = 0
while idx < 10:
    print(idx)
    idx += 1

print('break----')
for val in range(10):
    if val == 5: break
    print(val)

print('continue----')
for val in range(10):
    if val == 5: continue
    print(val)
else:
    print("EOP")

import random
guess_number = random.randint(1,100)

