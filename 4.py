# -*- coding: utf8 -*-
# 4.Реализуйте базовый класс Car. У данного класса должны быть следующие атрибуты:
# speed, color, name, is_police (булево).
# А также методы: go, stop, turn(direction), которые должны сообщать, что машина
# поехала, остановилась, повернула (куда).
# Опишите несколько дочерних классов: TownCar, SportCar, WorkCar, PoliceCar.
# Добавьте в базовый класс метод show_speed, который должен показывать текущую скорость автомобиля.
# Для классов TownCar и WorkCar переопределите метод show_speed.
# При значении скорости свыше 60 (TownCar) и 40 (WorkCar) должно выводиться сообщение о превышении скорости.
# Создайте экземпляры классов, передайте значения атрибутов.
# Выполните доступ к атрибутам, выведите результат. Выполните вызов методов и также покажите результат.

class Car:

    def __init__(self, speed, color, name, is_police):
        self.speed = speed
        self.color = color
        self.name = name
        self.is_police = is_police

    def go(self):
        return f'{self.name} is started'

    def stop(self):
        return f'{self.name} is stopped'

    def turn(self, direction):
        return f'{self.name} is turned to {direction}'


class TownCar(Car):
    def __init__(self, speed, color, name, is_police):
        super().__init__(speed, color, name, is_police)


class SportCar(Car):
    def __init__(self, speed, color, name, is_police):
        super().__init__(speed, color, name, is_police)


class WorkCar(Car):
    def __init__(self, speed, color, name, is_police):
        super().__init__(speed, color, name, is_police)


class PoliceCar(Car):
    def __init__(self, speed, color, name, is_police):
        super().__init__(speed, color, name, is_police)


ford = TownCar(40, 'black', 'Ford', False)
print(ford.name, ford.color, ford.speed, ford.is_police)
print(ford.go(), ford.turn('right'), ford.stop())

sport = SportCar(120, 'red', 'Sport', False)
print(f'{sport.name} {sport.color} {sport.speed} {sport.is_police}')
print(sport.go(), sport.turn('right'), sport.stop())

work = WorkCar(80, 'black', 'WorkCar', False)
print(f'{work.name} {work.color} {work.speed} {work.is_police}')
print(work.go(), work.turn('right'), work.stop())

police = PoliceCar(100, 'white', 'PoliceCar', True)
print(f'{police.name} {police.color} {police.speed} {police.is_police}')
print(police.go(), police.turn('right'), police.stop())


