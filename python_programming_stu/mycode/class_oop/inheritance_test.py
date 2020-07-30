# 부모 클래스 Person 선언
class Person(object):
    # 생성자
    def __init__(self, name, age, gender):
        self.name = name
        self.age = age
        self.gender = gender

    def about_me(self):
        print(f'Person의 이름은 {self.name} ,나이는 {self.age} 세 입니다')

# 자식 클래스
class Employee(Person):
    def __init__(self, name, age, gender, salary, hire_date):
        super().__init__(name, age, gender)
        self.salary = salary
        self.hire_date = hire_date

    def about_me(self):
        super().about_me()
        print(f'급여는 {self.salary}, 입사일자는 {self.hire_date}')



myPerson = Person('길동', 30, '남')
myEmployee = Employee('둘리', 10, '남', 300000, '2020/02/10')
myPerson.about_me()
myEmployee.about_me()

def talk(self):
    