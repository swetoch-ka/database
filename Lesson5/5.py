# -*- coding: utf8 -*-
"""
4. Создать (программно) текстовый файл, записать в него программно набор чисел, разделенных пробелами.
 Программа должна подсчитывать сумму чисел в файле и выводить ее на экран.
"""


try:
    with open('5_text.txt', 'w+') as my_obj:
        line = input('Введите цифры через пробел >>>')
        my_obj.writelines(line)
        my_numb = line.split()
        print(sum(map(int, my_numb)))
except IOError:
    print('Ошибка в файле')
except ValueError:
    print('Неправильно набран номер. Ошибка ввода-вывода')

