#문자열 처리
greet = 'Hello' * 4 + '\n'
print(greet)
print(greet + greet)
print("I like 'Apple' ")
print('I like \'Python\'')


my_int = 100
flag = True
print(type(my_int), type(flag))
result = str(my_int) + str(flag)
print(type(result), result)

greeting = 'Hello world!'
print(greeting[1])
print(greeting[11])
#print(greeting[12])

#문자열 slicing
print(greeting[2:5])

#str 의 여러가지 함수들 사용하기
word = 'GOOD manufacturing Practice'
print(word)
print(word.upper())
print(word)

my_wordlist = word.split(' ')
print(my_wordlist)

#list -> str : unpacking
str1, str2, str3 = my_wordlist
print(str1)
print(str2)
print(str3)

#packing
my_list = ['a', 'b', 'c',]
#unpacking



print(word.title())
print(word.capitalize())