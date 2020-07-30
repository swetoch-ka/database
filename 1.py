# 1. Реализовать функцию, принимающую два числа (позиционные аргументы) и
# выполняющую их деление. Числа запрашивать у пользователя, предусмотреть
# обработку ситуации деления на ноль.


def func_div(arg_1, arg_2):
    try:
        res = round(arg_1 / arg_2, 2)
    except ValueError:
        return 'Ошибка при выполнении операции'
    except ZeroDivisionError:
        return "Делить на ноль нельзя!"

    return res


number_1 = int(input("Введите первое число (делимое) >>>"))
number_2 = int(input("Введите второе число (делитель) >>>"))

print(func_div(number_1, number_2))
