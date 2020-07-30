# join() 함수 : list -> str
colors = ['red', 'yellow', 'green']
result = ' '.join(colors)
print(result)
result = '/'.join(colors)
print(result)

# split() 함수 : str -> list
langs = 'python, java, c#, scalar'
result  = langs.split(',')
print(type(result), result)
a,b,c,d = langs.split(',')
print(a,b,c,)

langs = 'python java c# scalar'
# 공백으로 구분하는 문자열인 경우에는
# split() 함수에서 구분자를 주지 않아도 된다.
result = langs.split()
print(result)

# 일반적인 for loop
my_list = []
for val in range(10):
    if val % 2 == 0:
        my_list.append(val)
print(my_list)

# List Comprehension (포괄적인 리스트)
my_list2 = [val for val in range(10)]
print(my_list2)

my_list3 = [val for val in range(10) if val % 2 == 0]
print(my_list3)

my_list4 = [val if val % 2 == 0 else 10 for val in range(10)]
print(my_list4)

# 2. 문자열 타입 list comprehension
word1 = 'Hello'
word2 = 'World'
# for i in word1:
#     for j in word2:
#         print(i+j)
my_list5 = [i+j for i in word1 for j in word2]
print(my_list5)


my_list = [i+j for i in word1 for j in word2 if i == j]
print(my_list)

words = 'Yesterday love was such an easy game to play'.split()
print(words)

word_lists = []
for w in words:
    word_list = [w.upper(),w.lower(), len(w)]
    word_lists.append(word_list)
# print(word_lists)

stuff = [[w.upper(), w.lower(), len(w)] for w in words]
print(stuff)

for word_list in stuff:
    print(word_list)


# indexed traversal
langs_list = 'python java c# scalar'.split()
# Bad
for idx in range(len(langs_list)):
    print(f'idx = {idx}, value={langs_list[idx]}')

# Good - enumerate() 함수
for idx, lang in enumerate(langs_list):
    print(f'idx={idx}, value={lang}')


print(enumerate(langs_list))
print(list(enumerate(langs_list)))


# Dict Comprehension
my_dict = {idx:val.capitalize() for idx, val in enumerate('Yesterday love was such an easy game to play'.split())}
print(my_dict)


# Variable Exchange
a = 10
b = 20
# bad
tmp = a
a = b = tmp

a = 100
b = 200
# good
a, b = b, a
print(a, b)

# Sequence UnPacking
a, *rest = [1, 2, 3]
print(a, rest)

a, *middle, c = [1, 2, 3, 4]
print(a, middle, c)

a, *middle, c = [6, 7, 8, 9]
print(a, middle, c)

# Judgement T, F
# Bad
attr = True
if attr == True:
    pass
# Good
if attr:
    pass

attr = None
# Bad
if attr == None:
    pass
# good
if attr is None:
    pass

# zip() 함수
a, b, c = zip((1,2,3), (10,20,30), (100,200,300))
print(a,b,c)

for val in zip((1,2,3),(10,20,30),(100,200,300)):
    print(type(val))

# index가 같은 값을 tuple로 묶어서 합을 계산해서 List에 저장함
sum_list = [sum(val) for val in zip((1,2,3),(10,20,30),(100,200,300))]
print(sum_list)

# Enumerate & Zip
a_list = ['a1', 'a2', 'a3']
b_list = ['b1', 'b2', 'b3']
for i, (a,b) in enumerate(zip(a_list, b_list)):
    print(i, a, b)