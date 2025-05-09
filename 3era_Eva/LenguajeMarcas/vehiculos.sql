-- Crear una tabla de vehículos (id, modelo, especificaciones(color, puertas, tipo, potencia))

CREATE TABLE vehiculo (id SERIAL NOT NULL, 
                     modelo VARCHAR(50) NOT NULL, 
                     especificaciones JSONB NULL
);
INSERT INTO vehiculo (modelo, especificaciones)
VALUES (
    'SEAT Ibiza',
    '{
        "color" : "negro",
        "puertas" : "5",
        "tipo" : "Mu viejo",
        "potencia" : "7777 caballitos"
    }'
);

INSERT INTO vehiculo (modelo, especificaciones)
VALUES (
    'Opel Zafira',
    '{
        "color" : "turquesa",
        "puertas" : "5",
        "tipo" : "gasolina",
        "potencia" : "200"
    }'
);




-- Para hacer un select de una parte concreta del jsonB
SELECT id, modelo, especificaciones ->> 'color' AS color FROM vehiculo;

-- Para filtrar datos en la clauula WHERE:
SELECT id, modelo, especificaciones ->> 'color' AS color  from vehiculo
WHERE especificaciones @> '{"color" : "turquesa"}';
    -- o
SELECT id, modelo, especificaciones ->> 'tipo' AS tipo FROM vehiculo
WHERE especificaciones ->> 'color' = 'negro';

-- Actualizar un valor en el JSONB
UPDATE vehiculo SET especificaciones = jsonB_SET (especificaciones, '{potencia}', '100')  -- Si fuese una dadena de texto, tendríamos que haberla puesto así: '"newCadenaTexto"'
WHERE id = 1;


-- Añadir un nuevo campo al Json

UPDATE vehiculo SET especificaciones = jsonB_SET (especificaciones, '{propietario}', '"Cristina"')
WHERE id = 1;

UPDATE vehiculo SET especificaciones = jsonB_SET (especificaciones, '{propietario}', '"Jesus"')
WHERE id = 2;


