
BEGIN;


CREATE TABLE IF NOT EXISTS public."AEROPORTO"
(
    "Codigo_aeroporto" int NOT NULL,
    "Nome" varchar(50),
    "Cidade" varchar(50),
    "Estado" varchar(25),
    PRIMARY KEY ("Codigo_aeroporto")
);

CREATE TABLE IF NOT EXISTS public."VOO"
(
    "Numero_voo" int NOT NULL,
    "Companhia_aerea" varchar(100),
    "Dias_da_semana" varchar(100),
    PRIMARY KEY ("Numero_voo")
);

CREATE TABLE IF NOT EXISTS public."TRECHO_VOO"
(
    "Numero_voo" int NOT NULL CONSTRAINT unico UNIQUE,
    "Numero_trecho" int NOT NULL CONSTRAINT unico2 UNIQUE,
    "Codigo_aeroporto_partida" int,
    "Horario_partida_previsto" varchar(10),
    "Codigo_aeroporto_chegada" int,
    "Horario_chegada_previsto" varchar(10)
);

CREATE TABLE IF NOT EXISTS public."INSTANCIA_TRECHO"
(
    "Numero_voo" int NOT NULL CONSTRAINT unico4 UNIQUE,
    "Numero_trecho" int NOT NULL CONSTRAINT unico5 UNIQUE,
    "Data_" varchar(10) NOT NULL CONSTRAINT unico6 UNIQUE,
    "Numero_assentos_disponiveis" int,
    "Codigo_aeronave" int,
    "Codigo_aeroporto_partida" int,
    "Horario_partida" varchar(10),
    "Codigo_aeroporto_chegada" int,
    "Horario_chegada" varchar(10)
);

CREATE TABLE IF NOT EXISTS public."TARIFA"
(
    "Numero_voo" int,
    "Codigo_tarifa" int,
    "Quantidade" int,
    "Restricoes" varchar(50)
);

CREATE TABLE IF NOT EXISTS public."TIPO_AERONAVE"
(
    "Nome_tipo_aeronave" varchar(100) NOT NULL,
    "Qtd_max_assentos" int,
    "Companhia" varchar(100),
    PRIMARY KEY ("Nome_tipo_aeronave")
);

CREATE TABLE IF NOT EXISTS public."AERONAVE"
(
    "Codigo_aeronave" int NOT NULL,
    "Numero_total_assentos" int,
    "Tipo_aeronave" varchar(100),
    PRIMARY KEY ("Codigo_aeronave")
);

CREATE TABLE IF NOT EXISTS public."RESERVA_ASSENTO"
(
    "Numero_voo" int NOT NULL CONSTRAINT unico7 UNIQUE,
    "Numero_trecho" int NOT NULL CONSTRAINT unico8 UNIQUE,
    "Data_" varchar(10) NOT NULL CONSTRAINT unico9 UNIQUE,
    "Numero_assento" int,
    "Nome_cliente" varchar(100),
    "Telefone_cliente" varchar(15)
);

CREATE TABLE IF NOT EXISTS public."PODE_POUSAR"
(
    "Codigo_aeroporto" int NOT NULL,
    "Nome_tipo_aeronave" varchar(100) NOT NULL
);

ALTER TABLE IF EXISTS public."TRECHO_VOO"
    ADD FOREIGN KEY ("Numero_voo")
    REFERENCES public."VOO" ("Numero_voo") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."TRECHO_VOO"
    ADD FOREIGN KEY ("Codigo_aeroporto_partida")
    REFERENCES public."AEROPORTO" ("Codigo_aeroporto") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."TRECHO_VOO"
    ADD FOREIGN KEY ("Codigo_aeroporto_chegada")
    REFERENCES public."AEROPORTO" ("Codigo_aeroporto") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."INSTANCIA_TRECHO"
    ADD FOREIGN KEY ("Codigo_aeronave")
    REFERENCES public."AERONAVE" ("Codigo_aeronave") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."INSTANCIA_TRECHO"
    ADD FOREIGN KEY ("Numero_trecho")
    REFERENCES public."TRECHO_VOO" ("Numero_trecho") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."INSTANCIA_TRECHO"
    ADD FOREIGN KEY ("Codigo_aeroporto_partida")
    REFERENCES public."AEROPORTO" ("Codigo_aeroporto") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."INSTANCIA_TRECHO"
    ADD FOREIGN KEY ("Codigo_aeroporto_chegada")
    REFERENCES public."AEROPORTO" ("Codigo_aeroporto") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."INSTANCIA_TRECHO"
    ADD FOREIGN KEY ("Numero_voo")
    REFERENCES public."TRECHO_VOO" ("Numero_voo") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."TARIFA"
    ADD FOREIGN KEY ("Numero_voo")
    REFERENCES public."VOO" ("Numero_voo") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."AERONAVE"
    ADD FOREIGN KEY ("Tipo_aeronave")
    REFERENCES public."TIPO_AERONAVE" ("Nome_tipo_aeronave") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."RESERVA_ASSENTO"
    ADD FOREIGN KEY ("Numero_voo")
    REFERENCES public."INSTANCIA_TRECHO" ("Numero_voo") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."RESERVA_ASSENTO"
    ADD FOREIGN KEY ("Numero_trecho")
    REFERENCES public."INSTANCIA_TRECHO" ("Numero_trecho") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."RESERVA_ASSENTO"
    ADD FOREIGN KEY ("Data_")
    REFERENCES public."INSTANCIA_TRECHO" ("Data_") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."RESERVA_ASSENTO"
    ADD FOREIGN KEY ("Data_")
    REFERENCES public."INSTANCIA_TRECHO" ("Data_") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."PODE_POUSAR"
    ADD FOREIGN KEY ("Codigo_aeroporto")
    REFERENCES public."AEROPORTO" ("Codigo_aeroporto") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."PODE_POUSAR"
    ADD FOREIGN KEY ("Nome_tipo_aeronave")
    REFERENCES public."TIPO_AERONAVE" ("Nome_tipo_aeronave") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;