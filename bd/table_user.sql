-- Table: public.usuarios

-- DROP TABLE IF EXISTS public.usuarios;

CREATE TABLE IF NOT EXISTS public.usuarios
(
    nombre text COLLATE pg_catalog."default",
    apellido text COLLATE pg_catalog."default",
    fecha_nacimiento text COLLATE pg_catalog."default",
    direccion_1 text COLLATE pg_catalog."default",
    direccion_2 text COLLATE pg_catalog."default",
    direccion_3 text COLLATE pg_catalog."default",
    user_id bigint NOT NULL,
    CONSTRAINT usuarios_pkey PRIMARY KEY (user_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.usuarios
    OWNER to postgres;