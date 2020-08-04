# Функция для расчета з/п сотрудника по формуле: (выработка в часах*ставка в час) + премия
def calculate(hours, rate, bonus):
    try:
        return (hours * rate) + bonus
    except TypeError:
        return
