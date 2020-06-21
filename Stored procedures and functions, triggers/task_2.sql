/*
В таблице products есть два текстовых поля: name с названием товара и description с его описанием. 
Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема. 
Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены. 
При попытке присвоить полям NULL-значение необходимо отменить операцию.
*/

DELIMITER //

CREATE TRIGGER  auto_insert_prod_on_insert BEFORE INSERT ON products
FOR EACH ROW BEGIN
  IF new.name is null and new.description is null THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Нужно указать наименование и/или описание продукта';
  END IF;
END//
DELIMITER ;

INSERT INTO products
  (name, description)
VALUES
  ('test-1',NULL),
  (NULL, 'test-2'),
  (NULL, NULL);

DELIMITER //
CREATE TRIGGER auto_update_prod_on_update BEFORE UPDATE on products
FOR EACH ROW
BEGIN
  if NEW.name is null
		and NEW.description is null then signal sqlstate '45000' set
	MESSAGE_TEXT = 'Нужно указать наименование и/или описание продукта';
  end if;
end//
DELIMITER //

update products 
set name = null, description = null 
where id = 1;
