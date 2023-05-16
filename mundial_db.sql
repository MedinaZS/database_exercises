CREATE TABLE "equipos" (
  "id" integer PRIMARY KEY,
  "nombre" varchar NOT NULL,
  "grupo_id" integer NOT NULL
);

CREATE TABLE "grupos" (
  "id" integer PRIMARY KEY,
  "nombre" varchar NOT NULL
);

CREATE TABLE "fases" (
  "id" integer PRIMARY KEY,
  "nombre" varchar NOT NULL
);

CREATE TABLE "partidos" (
  "id" integer PRIMARY KEY,
  "equipo_id_1" integer NOT NULL,
  "equipo_id_2" integer NOT NULL,
  "fecha" date NOT NULL,
  "lugar" varchar NOT NULL,
  "hora" time NOT NULL,
  "goles_equipo_1" integer NOT NULL,
  "goles_equipo_2" integer NOT NULL,
  "fase_id" integer NOT NULL
);

ALTER TABLE "equipos" ADD FOREIGN KEY ("grupo_id") REFERENCES "grupos" ("id");

ALTER TABLE "partidos" ADD FOREIGN KEY ("equipo_id_1") REFERENCES "equipos" ("id");

ALTER TABLE "partidos" ADD FOREIGN KEY ("equipo_id_2") REFERENCES "equipos" ("id");

ALTER TABLE "partidos" ADD FOREIGN KEY ("fase_id") REFERENCES "fases" ("id");
