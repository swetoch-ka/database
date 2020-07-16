# 5. Запросите у пользователя значения выручки и издержек фирмы.
# Определите, с каким финансовым результатом работает фирма
# (прибыль — выручка больше издержек, или убыток — издержки больше выручки).
# Выведите соответствующее сообщение.
# Если фирма отработала с прибылью, вычислите рентабельность выручки (соотношение прибыли к выручке).
# Далее запросите численность сотрудников фирмы и определите прибыль фирмы в расчете на одного сотрудника.

revenue = int(input("Введите значение выручки фирмы >>>"))
costs = int(input("Введите значение издержек фирмы >>>"))

if revenue - costs > 0:
    print("Фирма отработала с прибылью")

    profitability = round((revenue - costs) / revenue, 3)
    print("Рентабельность фирмы = ", profitability)

    employees = int(input("Введите численность сотрудников фирмы >>>"))
    profitability_empl = round((revenue - costs) / employees, 3)
    print("Прибыль фирмы в расчете на одного сотрудника = ", profitability_empl)
elif revenue == costs:
    print("Фирма отработала в ноль")
else:
    print("Фирма отработала в убыток")
