# -*- coding: utf8 -*-
"""
Создать (не программно) текстовый файл со следующим содержимым:
One — 1
Two — 2
Three — 3
Four — 4
Необходимо написать программу, открывающую файл на чтение
и считывающую построчно данные. При этом английские
числительные должны заменяться на русские.
Новый блок строк должен записываться в новый текстовый файл.
"""
my_str = {'One': 'Один', 'Two': 'Два', 'Three': 'Три', 'Four': 'Четыре'}

new_file = []
with open('4_text.txt', 'r') as my_obj:
    for line in my_obj:
        i = line.split('-', 1)
        new_file.append(my_str[i[0]] + '-' + i[1])
    print(new_file)

with open('4_text_new.txt', 'w') as file_obj_2:
    file_obj_2.writelines(new_file)
