# 3. Реализовать функцию my_func(), которая принимает три позиционных аргумента, и возвращает сумму наибольших двух аргументов.

def my_func(*args):
    try:
        my_list = list(args[0])
        print(my_list)
        var_min = min(my_list)
        my_list.remove(var_min)
        return sum(my_list)
    except TypeError:
        return 'Необходимо ввести число'


def my_number(count_number):
    my_list = []
    while count_number > 0:
        try:
            number = int(input("Введите число >>>"))
            my_list.append(number)
            count_number -= 1
        except ValueError:
            print('Необходимо ввести число')
    return tuple(my_list)

print(my_func(my_number(3)))
