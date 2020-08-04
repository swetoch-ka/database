# 1. Реализовать скрипт, в котором должна быть предусмотрена функция расчета заработной платы сотрудника.
# В расчете необходимо использовать формулу: (выработка в часах*ставка в час) + премия.
#  Для выполнения расчета для конкретных значений необходимо запускать скрипт с параметрами.

import sys

from Lesson4 import my_mod

try:
    file, name, hours, rate, bonus = sys.argv
except ValueError:
    print('Invalid args')
    exit()
print(f' Заработная плата сотрудника {name} = {my_mod.calculate(int(hours), int(rate), int(bonus))}')
