-- Start

    /* Deployment of Desafío N°1118 by Jose Cheuquepil*/

/* 1. Name database: desafio1118

tablas: movies - reparto */

        -- Requirements:

-- 3. Obtener el ID de la película “Titanic”.

    -- Respuesta: id = 2.

    -- Query:

SELECT id FROM movies WHERE pelicula = 'Titanic';

--4. Listar a todos los actores que aparecen en la película "Titanic".

    -- Query:

SELECT reparto.actor
    FROM movies
    JOIN reparto ON movies.id = reparto.id
    WHERE movies.id = 2;

-- 5. Consultar en cuántas películas del top 100 participa Harrison Ford.

    -- Respuesta: en 8 películas.
    
    -- Query:

SELECT COUNT(*) AS nro_peliculas
    FROM movies
    WHERE id IN (
    SELECT id
    FROM reparto
    WHERE actor = 'Harrison Ford'
    );

-- 6. Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente.
    
    -- Respuesta: Ver Anexo - Hoja Req6.

    -- Query:

SELECT pelicula
    FROM movies
    WHERE year_movies BETWEEN 1990 AND 1999
    ORDER BY pelicula ASC;

-- 7. Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser nombrado para la consulta como “longitud_titulo”.

    --Respuesta: Ver Anexo - Hoja Req7.

    -- Query:

SELECT pelicula, LENGTH(pelicula) AS longitud_titulo
    FROM movies;

-- 8. Consultar cual es la longitud más grande entre todos los títulos de las películas.

    -- Respuesta: 52.

    -- Query::

SELECT MAX(LENGTH(pelicula)) AS longitud_maxima
    FROM movies;

    -- The end.

/* En caso de utilizar PgAdmin (PostgreSQL), puede ocupar la siguiente Query para copiar las Tablas.
Nota: verifique el header en cada tabla */

COPY movies(id, pelicula, year,director) FROM 'Downloads/tablas/peliculas.csv' csv header;
COPY movies(id, actor) FROM 'Downloads/tablas/reparto.csv' csv header;
-- reemplace: "Downloads/tablas" por la ruta donde ha descargado las tablas.

/* Updates:
1) Name of file: peliculas.csv to movies.csv.
2) The (id,actor) Header was added in the file reparto.csv.
3) Column: Año estreno by yeaar_movies */