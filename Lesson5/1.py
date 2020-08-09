# -*- coding: utf8 -*-
# 1. Создать программно файл в текстовом формате, записать в него построчно данные, вводимые пользователем.
# Об окончании ввода данных свидетельствует пустая строка.

try:
    with open("1_text.txt", 'a') as my_obj:
        while True:
            my_str = input('Введите текст. Для прекращения ввода оставьте стороку пустой >>> ')
            if not my_str:
                break
            my_obj.write(my_str+'\n')
        # content = my_obj.read()
        # print(content)
except IOError:
    print("Произошла ошибка ввода-вывода!")

try:
    with open("1_text.txt", 'r') as my_obj:
        for line in my_obj:
            print(line)
except IOError:
    print("Произошла ошибка ввода-вывода!")

