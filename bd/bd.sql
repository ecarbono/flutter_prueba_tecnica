PGDMP     *                	    z            postgres    15.0    15.0                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    5    postgres    DATABASE     j   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE postgres;
                postgres    false                       0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    3591                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            	           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    2            ?            1259    16398    usuarios    TABLE     ?   CREATE TABLE public.usuarios (
    nombre text,
    apellido text,
    fecha_nacimiento text,
    direccion_1 text,
    direccion_2 text,
    direccion_3 text,
    user_id bigint NOT NULL
);
    DROP TABLE public.usuarios;
       public         heap    postgres    false            ?            1259    16411    usuarios_sec    SEQUENCE     }   CREATE SEQUENCE public.usuarios_sec
    START WITH 20220000
    INCREMENT BY 10
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.usuarios_sec;
       public          postgres    false                       0    16398    usuarios 
   TABLE DATA           v   COPY public.usuarios (nombre, apellido, fecha_nacimiento, direccion_1, direccion_2, direccion_3, user_id) FROM stdin;
    public          postgres    false    215   3       
           0    0    usuarios_sec    SEQUENCE SET     A   SELECT pg_catalog.setval('public.usuarios_sec', 20220710, true);
          public          postgres    false    216            q           2606    16450    usuarios usuarios_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (user_id);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public            postgres    false    215                |   x???1?0??>EO?؆Xf??E?P5H!???7Ri?????????x?4??
Ď??0(??p `?ɬ?=?xE??/???crB"熪b?Q??z?)??a???|$?܄???????wD? 0?:?     