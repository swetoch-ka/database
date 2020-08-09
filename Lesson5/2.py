# -*- coding: utf8 -*-
# 2. Создать текстовый файл (не программно),
# сохранить в нем несколько строк, выполнить подсчет количества строк, количества слов в каждой строке.

my_list = ['String_1: Hello my friend\n', 'String_2: My name is Swetoch\n', 'String_3: And you\n']
with open("2_text.txt", 'w+') as my_obj:
    my_obj.writelines(my_list)
with open("2_text.txt") as my_obj:
    lines = 0
    letters = 0
    for line in my_obj:
        lines += line.count("\n")
        list_letters = line.split()
        letters = len(list_letters)
        print(f"В {lines} строке - {letters} слов")
    print(f"В файле - {lines} строк(и)")
