# -*- coding: utf8 -*-
# 3. Создать текстовый файл (не программно),
# построчно записать фамилии сотрудников и величину их окладов (не менее 10 строк).
# Определить, кто из сотрудников имеет оклад менее 20 тыс., вывести фамилии этих сотрудников.
# Выполнить подсчет средней величины дохода сотрудников.
# Пример файла:
# Иванов 23543.12
# Петров 13749.32

my_str = {'Ivanov': 10154, 'Petrov': 15452, 'Sidorov': 16145.12, 'Gromov': 20445.50, 'Rikov': 16456, 'Popov': 25004,
          'Koppola': 30245, 'Vagner': 404530, 'Levin': 20452, 'Kasparov': 15000.25}
try:
    with open("3_text.txt", 'w') as my_obj:
        for name, salary in my_str.items():
            my_obj.write(name + " " + str(salary) + "\n")
except IOError:
    print("Произошла ошибка ввода-вывода!")

sal = []
count = 0
persons = []
try:
    with open("3_text.txt", "r") as my_obj:
        for line in my_obj:
            tokens = line.split()
            if float(tokens[1]) <= 20000:
                persons.append(tokens[0])
            sal.append(tokens[1])
            count += 1
except IOError:
    print("Произошла ошибка ввода-вывода!")

result = sum(map(float, sal)) / len(sal)
print(f"Оклад меньше 20 т.р. у следующих сотрудников: {persons}")
print(f"Величина среднего оклада: {result}")
