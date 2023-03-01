USE generation;
SELECT * FROM ProductoProveedor;
SELECT * FROM Cliente;
SELECT * FROM Boleta;
SELECT * FROM Producto;
SELECT * FROM Proveedor;
#eliminar columna de mediodePago de Cliente
ALTER TABLE Cliente DROP COLUMN medioDePago; 

#agregar la columna correo a cliente
ALTER TABLE Cliente add correo VARCHAR(50);


#Cliente:
	#cliente_id INTEGER,
    #nombre VARCHAR(25),
    #direccion VARCHAR(50),
    #valoracion INTEGER,
    #rutCliente VARCHAR(15)
	#correo VARCHAR(50),

#Boleta
	#boleta_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    #nroBoleta BIGINT,
    #fecha DATE,
    #total FLOAT
	#cliente_id

#Limpio la tabla cliente
DELETE FROM CLIENTE; 

#Agregar clientes
INSERT INTO Cliente (nombre, dirección, valoracion, rutCliente, correo)
VALUES ("Fabi", "calleTobar2", 5, "19578456-3", "fabi@gmail.com");

INSERT INTO Cliente (nombre, dirección, valoracion, rutCliente, correo)
VALUES ("Diana", "calleGutti3", 5, "20576472-0", "diana@gmail.com");

INSERT INTO Cliente (nombre, dirección, valoracion, rutCliente, correo)
VALUES ("Lore", "calleFachinetti", 5, "18369852-4", "lore@gmail.com");

INSERT INTO Cliente (nombre, dirección, valoracion, rutCliente, correo)
VALUES ("Brandon", "calleLopez4", 5, "21879654-8", "brandon@gmail.com");

INSERT INTO Cliente (nombre, dirección, valoracion, rutCliente, correo)
VALUES ("Fer", "calleBahamondes", 5, "18321951-2", "fer@gmail.com"); 

#Agregar datos a boleta
INSERT INTO Boleta (nroBoleta, fecha, total, cliente_id)
VALUES (45678912345, '2025-03-10', 13590.99, 4);

INSERT INTO Boleta (nroBoleta, fecha, total, cliente_id)
VALUES (12345645678, '2025-01-05', 78596, 5);

INSERT INTO Boleta (nroBoleta, fecha, total, cliente_id)
VALUES (45678912365, '2025-08-23', 6540, 6);

INSERT INTO Boleta (nroBoleta, fecha, total, cliente_id)
VALUES (96325874178, '2025-04-28', 45682, 7);

INSERT INTO Boleta (nroBoleta, fecha, total, cliente_id)
VALUES (74125896365, '2025-06-30', 32000, 8);

INSERT INTO Boleta (nroBoleta, fecha, total, cliente_id)
VALUES (85236974125, '2025-10-31', 84000, 5);

#Agregar la columna medio de pago a boleta
ALTER TABLE Boleta add medioPago VARCHAR(25);

#Agregar el medio de pago a cada cliente en boleta

UPDATE Boleta
SET medioPago = "crédito"
WHERE cliente_id = 4;

UPDATE Boleta
SET medioPago = "efectivo"
WHERE cliente_id = 5;

UPDATE Boleta
SET medioPago = "crédito"
WHERE cliente_id = 6;

UPDATE Boleta
SET medioPago = "débito"
WHERE cliente_id = 7;

UPDATE Boleta
SET medioPago = "crédito"
WHERE cliente_id = 8;

UPDATE Boleta
SET medioPago = "débito"
WHERE nroBoleta = 85236974125;

#Renombrar la columna dirección´por direccion en Cliente.
ALTER TABLE Cliente RENAME COLUMN dirección TO direccion; 


#Agregar productos a la tabla Producto. 

INSERT INTO Producto (nombre, precio)
VALUES ("mousepad", 36000);

INSERT INTO Producto (nombre, precio)
VALUES ("adaptador hdmi", 16000);

INSERT INTO Producto (nombre, precio)
VALUES ("tarjetero", 1000);

INSERT INTO Producto (nombre, precio)
VALUES ("teclado", 15000);

#Agregar producto a proveedor

INSERT INTO Proveedor (nombre, rol, contacto, fechaVisita)
VALUES ("MousepadLab", 56879, "mousepadlab@gmail.com", '2023-01-28');

INSERT INTO Proveedor (nombre, rol, contacto, fechaVisita)
VALUES ("Mercado Libre", 36958, "mercado@contacto.cl", '2023-02-10');

INSERT INTO Proveedor (nombre, rol, contacto, fechaVisita)
VALUES ("Mercadito", 45789, "negocio@gmail.com", '2022-09-10');

INSERT INTO Proveedor (nombre, rol, contacto, fechaVisita)
VALUES ("lapolar", 12786, "lapolar@gmail.com", '2023-02-03');
















