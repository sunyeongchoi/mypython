# abstract method를 가진 부모 클래스 선언
class Animal(object):
    def __init__(self, name):
        self.name = name
    # abstract method
    def talk(self):
        raise NotImplementedError('자식클래스에서 반드시 구현해야 함')

class Cat(Animal):
    def talk(self):
        return 'Meow'

class Dog(Animal):
    def talk(self):
        return 'Woof'

    def pet(self):
        return 'I,m Pet'

my_ani = Animal('동물')
print(my_ani.name)
# my_ani.talk()

animals = [Cat('고양이'), Dog('강아지1'), Dog('강아지1')]
for ani in animals:
    print(ani.talk())
    # print(ani.pet())

