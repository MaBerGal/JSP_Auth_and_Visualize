CREATE TABLE Desarrollador (
    codigo      INTEGER, 
    nombre      VARCHAR(50),
    sede        VARCHAR(50),
    foto        VARCHAR(200),
    PRIMARY KEY (codigo)
);

CREATE TABLE Banda (
    codigo      INTEGER, 
    nombre      VARCHAR(50),
    genero      VARCHAR(50),
    foto        VARCHAR(200),
    PRIMARY KEY (codigo)
);

CREATE TABLE Fabricante (
    codigo      INTEGER, 
    nombre      VARCHAR(50),
    sede        VARCHAR(50),
    foto        VARCHAR(200),
    PRIMARY KEY (codigo)
);

CREATE TABLE Consolas (
    codigo      INTEGER, 
    nombre      VARCHAR(50),
    fabricanteCodigo INTEGER CONSTRAINT consolaFKfabricante REFERENCES Fabricante,
    lanzamiento DATE,
    foto        VARCHAR(200),
    PRIMARY KEY (codigo)
);

CREATE TABLE Juego (
    codigo      INTEGER, 
    titulo      VARCHAR(100),
    genero      VARCHAR(50),
    desarrolladorCodigo INTEGER CONSTRAINT juegoFKdesarrollador REFERENCES Desarrollador,
    consolaCodigo INTEGER CONSTRAINT juegoFKconsola REFERENCES Consolas,
    bandaCodigo INTEGER CONSTRAINT juegoFKbanda REFERENCES Banda,
    foto        VARCHAR(200),
    PRIMARY KEY (codigo)
);

CREATE TABLE Jugador (
    codigo      INTEGER, 
    nombre      VARCHAR(50),
    edad        INTEGER,
    consolaCodigo INTEGER CONSTRAINT jugadorFKconsola REFERENCES Consolas,
    foto        VARCHAR(200),
    PRIMARY KEY (codigo)
);


-- Inserts para Fabricantes
INSERT INTO Fabricante VALUES (1,'Sony','Japón', 'images/sony.png');
INSERT INTO Fabricante VALUES (2,'Microsoft','Estados Unidos', 'images/microsoft.png');
INSERT INTO Fabricante VALUES (3,'Nintendo','Japón', 'images/nintendo.png');
INSERT INTO Fabricante VALUES (4,'Varios',NULL, 'images/varios.png');

-- Inserts para Desarrolladores
INSERT INTO Desarrollador VALUES (1,'Nintendo','Japón', 'images/nintendo.png');
INSERT INTO Desarrollador VALUES (2,'Team Cherry','Australia', 'images/teamcherry.png');
INSERT INTO Desarrollador VALUES (3,'Naughty Dog','Estados Unidos', 'images/naughtydog.png');
INSERT INTO Desarrollador VALUES (4,'Bungie','Estados Unidos', 'images/bungie.png');

-- Inserts para Bandas
INSERT INTO Banda VALUES (1,'Koji Kondo','Folk/Fantasy', 'images/kojikondo.jpg');
INSERT INTO Banda VALUES (2,'Christopher Larkin','Ambient', 'images/larkin.png');
INSERT INTO Banda VALUES (3,'Greg Edmonson','Epic/Electronic', 'images/greg.jpg');
INSERT INTO Banda VALUES (4,'Martin O Donnell','Classical/Fusion', 'images/martin.jpg');

-- Inserts para Consolas
INSERT INTO Consolas VALUES (1,'PlayStation 5',1,'2020-11-12', 'images/ps5.png');
INSERT INTO Consolas VALUES (2,'Xbox Series X',2,'2020-11-10', 'images/xbox.png');
INSERT INTO Consolas VALUES (3,'Nintendo Switch',3,'2017-03-03', 'images/switch.png');
INSERT INTO Consolas VALUES (4,'PC Gaming',NULL,NULL, 'images/pcgame.png');

-- Inserts para Juegos
INSERT INTO Juego VALUES (1,'The Legend of Zelda: Ocarina of Time','Action-Adventure',1,3,1, 'images/zelda.png');
INSERT INTO Juego VALUES (2,'Hollow Knight','Metroidvania',2,4,2, 'images/hollowknight.png');
INSERT INTO Juego VALUES (3,'Uncharted 2: Among Thieves','Third Person Shooter',3,1,3, 'images/uncharted2.png');
INSERT INTO Juego VALUES (4,'Halo','First Person Shooter',4,2,4, 'images/halo.png');

-- Inserts para Jugadores
INSERT INTO Jugador VALUES (1,'Scadi',26,3, 'images/scadi.jpg');
INSERT INTO Jugador VALUES (2,'Ryukishi',45,2, 'images/ryukishi.png');
INSERT INTO Jugador VALUES (3,'Michelangello',51,1, 'images/michelangello.png');
INSERT INTO Jugador VALUES (4,'Verdunch',19,3, 'images/verdunch.png');
