//Сортировка мастеров по коэффициенту в порядке убывания

SELECT firstName, lastName, coefficient FROM master
WHERE firstName LIKE 'R%'
ORDER BY coefficient DESC
LIMIT 15;

//Получение имени мастера, названия услуги и ее категории по таблице master_services

SELECT m.firstName, m.lastName, s.name, c.category
FROM master_services ms
INNER JOIN master m ON ms.master_id = m.id
INNER JOIN services s ON ms.service_id = s.id
INNER JOIN category c ON s.category_id = c.id;

//запрос, который выводит имя категории и счетчик количества, где коэффициент мастера больше 2
SELECT c.category, COUNT(*) AS count
FROM master_services ms
JOIN services s ON s.id = ms.service_id
JOIN category c ON c.id = s.category_id
JOIN master m ON m.id = ms.master_id
WHERE m.coefficient > 2
GROUP BY c.category;

//(SELECT MAX(COUNT(*))
FROM master_services ms
JOIN services s ON s.id = ms.service_id
JOIN category c ON c.id = s.category_id
JOIN master m ON m.id = ms.master_id
GROUP BY c.category)

//запрос, который выводит имя клиента наименование услуги и окончательную стоимость
SELECT c.firstName AS 'clientName', s.name AS 'serviceName', (s.price*m.coefficient) AS finalPrice
FROM client_master_services cms
JOIN master_services ms ON cms.master_service_id = ms.id
JOIN client c ON c.id = cms.client_id
JOIN services s ON s.id = ms.service_id
JOIN master m ON m.id = ms.master_id;


//запрос, который выводит имя клиента наименование услуги, категорию и имя мастера
SELECT c.firstName AS 'clientName', s.name AS 'serviceName', cat.category, m.firstName AS 'masterName'
FROM client_master_services cms
JOIN master_services ms ON cms.master_service_id = ms.id
JOIN client c ON c.id = cms.client_id
JOIN services s ON s.id = ms.service_id
JOIN category cat ON cat.id = s.category_id
JOIN master m ON m.id = ms.master_id
WHERE m.firstName = 'Valerie' AND m.lastName = 'Reinger';