# 1. 모듈명을 import 하기
from mycode import fah_converter
# 2. 모듈명을 import 하면서 alias 명 설정하기
from mycode import fah_converter as conv
# 3. import 된 함수 호출
from mycode.fah_converter import convert_c_to_f
# 4. 모듈에 속한 모든 함수 import 하기
from mycode.fah_converter import *
fah = convert_c_to_f(temperature)


'''
섭씨를 입력 받아서 화씨로 변환
소수점 이하 둘째자리로 출력
'''

print('변환하고 싶은 섭씨 온도를 입력하세요!')
temperature = float(input())
# 1. 모듈명.convert_c_to_f() 함수 호출
fah = fah_converter.convert_c_to_f(temperature)
# 2. aliasing 된 모듈명.convert_c_to_f() 함수 호출
fah = conv.convert_c_to_f(temperature)
# 3. import 된 convert_c_to_f() 함수 호출
fah = convert_c_to_f(temperature)



print('섭씨온도 :' , temperature)
print('화씨온도 :', fah)
print('화씨온도 : {:.2f}'.format(fah))

print(say_hello('Python'))

fah = ((9/5) * temperature ) + 32