CREATE DATABASE NotesT3
GO

USE NotesT3
GO

CREATE TABLE Note(
	id INT IDENTITY(1, 1),
	title VARCHAR(100),
	content VARCHAR(255),
	updatedAt DATETIME DEFAULT GETDATE()
)
GO

INSERT INTO Note VALUES 
('Linux Commands', 'https://www.dummies.com/computers/operating-systems/linux/common-linux-commands/', GETDATE()),
('Garbanzo con Espinacas y Fideos', 'https://www.lecturas.com/recetas/garbanzos-fideos-y-espinacas_1929.html', GETDATE())

SELECT * FROM Note
DELETE FROM Note WHERE id = 3
DBCC CHECKIDENT('Note', RESEED, 2)