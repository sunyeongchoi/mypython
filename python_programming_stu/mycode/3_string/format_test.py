#1.%formating : c언어 Style
#2. String format 함수 : {} 에 대응하는 값을 format() 의 인자로 전달
#3.f-string : python3.6 이상에서만 사용

temperature = 36
print('1.온도 값은 %d' %(temperature))
print('2.온도 값은 {}'.format(temperature))
print(f'3.온도 값은 {temperature}')

#padding
print('product {0:10s}, price per unit {1:10.3f}'.format("Apple",5.243))
print('product {0:>10s}, price per unit {1:10.3f}'.format("Apple",5.243))

#naming
print('product {0:10s}, price per unit {1:10.3f}'.format("Apple",5.243))