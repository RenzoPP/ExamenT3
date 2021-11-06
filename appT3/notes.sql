CREATE DATABASE NotesT3
GO

USE NotesT3
GO

CREATE TABLE Note(
	id INT IDENTITY(1, 1),
	title VARCHAR(100),
	content VARCHAR(255),
	updatedAt DATETIME
)
GO

INSERT INTO NOTE VALUES 
('Linux Commands', 'https://www.dummies.com/computers/operating-systems/linux/common-linux-commands/', GETDATE()),
('Garbanzo con Espinacas y Fideos', 'https://www.lecturas.com/recetas/garbanzos-fideos-y-espinacas_1929.html', GETDATE())