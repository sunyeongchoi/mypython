current_year = dt.today().year
print(current_year)
input_year = int(input('태어난 년도를 입력하시오 :'))
age = current_year - input_year + 1
print(age)

if 17 <= age < 20:

