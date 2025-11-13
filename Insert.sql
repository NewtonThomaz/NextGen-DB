-- INSERINDO SENSORES DE UMIDADE
INSERT INTO sensor_umidade (ip_umidade) VALUES
( '192.168.0.10'),
( '192.168.0.11'),
( '192.168.0.12'),
( '192.168.0.13'),
( '192.168.0.14'),
( '192.168.0.15'),
( '192.168.0.16'),
( '192.168.0.17'),
( '192.168.0.18'),
( '192.168.0.19');

-- INSERINDO SENSORES DE TEMPERATURA
INSERT INTO Sensor_Temperatura (ip_temperatura) VALUES
( '192.168.1.10'),
( '192.168.1.11'),
( '192.168.1.12'),
( '192.168.1.13'),
( '192.168.1.14'),
( '192.168.1.15'),
( '192.168.1.16'),
( '192.168.1.17'),
( '192.168.1.18'),
( '192.168.1.19');

-- INSERINDO LEITURAS DE UMIDADE
INSERT INTO leitura_umidade (id_sensor, umidade, data_hora) VALUES
( (SELECT id FROM sensor_umidade LIMIT 1 OFFSET 0), 45.2, NOW() - INTERVAL '10 hour'),
( (SELECT id FROM sensor_umidade LIMIT 1 OFFSET 1), 48.7, NOW() - INTERVAL '9 hour'),
( (SELECT id FROM sensor_umidade LIMIT 1 OFFSET 2), 50.3, NOW() - INTERVAL '8 hour'),
( (SELECT id FROM sensor_umidade LIMIT 1 OFFSET 3), 52.1, NOW() - INTERVAL '7 hour'),
( (SELECT id FROM sensor_umidade LIMIT 1 OFFSET 4), 46.9, NOW() - INTERVAL '6 hour'),
( (SELECT id FROM sensor_umidade LIMIT 1 OFFSET 5), 44.8, NOW() - INTERVAL '5 hour'),
( (SELECT id FROM sensor_umidade LIMIT 1 OFFSET 6), 49.6, NOW() - INTERVAL '4 hour'),
( (SELECT id FROM sensor_umidade LIMIT 1 OFFSET 7), 51.0, NOW() - INTERVAL '3 hour'),
( (SELECT id FROM sensor_umidade LIMIT 1 OFFSET 8), 47.5, NOW() - INTERVAL '2 hour'),
( (SELECT id FROM sensor_umidade LIMIT 1 OFFSET 9), 53.1, NOW() - INTERVAL '1 hour');


-- INSERINDO LEITURAS DE TEMPERATURA
INSERT INTO leitura_temperatura (id_sensor, temperatura, data_hora) VALUES
( (SELECT id FROM sensor_temperatura LIMIT 1 OFFSET 0), 24.6, NOW() - INTERVAL '10 hour'),
( (SELECT id FROM sensor_temperatura LIMIT 1 OFFSET 1), 25.3, NOW() - INTERVAL '9 hour'),
( (SELECT id FROM sensor_temperatura LIMIT 1 OFFSET 2), 26.1, NOW() - INTERVAL '8 hour'),
( (SELECT id FROM sensor_temperatura LIMIT 1 OFFSET 3), 24.8, NOW() - INTERVAL '7 hour'),
( (SELECT id FROM sensor_temperatura LIMIT 1 OFFSET 4), 27.0, NOW() - INTERVAL '6 hour'),
( (SELECT id FROM sensor_temperatura LIMIT 1 OFFSET 5), 26.5, NOW() - INTERVAL '5 hour'),
( (SELECT id FROM sensor_temperatura LIMIT 1 OFFSET 6), 25.9, NOW() - INTERVAL '4 hour'),
( (SELECT id FROM sensor_temperatura LIMIT 1 OFFSET 7), 24.3, NOW() - INTERVAL '3 hour'),
( (SELECT id FROM sensor_temperatura LIMIT 1 OFFSET 8), 28.1, NOW() - INTERVAL '2 hour'),
( (SELECT id FROM sensor_temperatura LIMIT 1 OFFSET 9), 27.4, NOW() - INTERVAL '1 hour');
