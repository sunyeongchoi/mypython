# Product 클래스 선언
class Product(object):
    # 생성자
    def __init__(self, name):
        # __name이 private 변수
        self.__name = name
    def __str__(self):
        return 'Product의 이름은 {}'.format(self.__name)

    @property
    def name(self):
        return self.__name

    @name.setter
    def name(self, name):
        self.__name = name
# 객체생성
product = Product('텔레비젼')
# AttributeError: 'Product' object has no attribute '__name'
#print(product.__name)
#getter 함수 호출
print(product.name)
# setter 함수 호출
product.name = 'TV'
print(product.name)