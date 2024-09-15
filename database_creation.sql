-- Table: public.donor

-- DROP TABLE IF EXISTS public.donor;

CREATE TABLE IF NOT EXISTS public.donor
(
    donor_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    full_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    phone_number character varying(50) COLLATE pg_catalog."default" NOT NULL,
    blood_group character varying(50) COLLATE pg_catalog."default" NOT NULL,
    gender character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT donor_id_prkey PRIMARY KEY (donor_id),
    CONSTRAINT donor_phone_number_key UNIQUE (phone_number)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.donor
    OWNER to postgres;


-- Table: public.blooddonationpoint

-- DROP TABLE IF EXISTS public.blooddonationpoint;

CREATE TABLE IF NOT EXISTS public.blooddonationpoint
(
    bdp_number integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    phone_number character varying(50) COLLATE pg_catalog."default" NOT NULL,
    address character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT bdp_number_prkey PRIMARY KEY (bdp_number),
    CONSTRAINT blooddonationpoint_phone_number_key UNIQUE (phone_number)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.blooddonationpoint
    OWNER to postgres;


-- Table: public.donation

-- DROP TABLE IF EXISTS public.donation;

CREATE TABLE IF NOT EXISTS public.donation
(
    donation_number integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    donation_amount integer NOT NULL,
    conversion_date character varying(50) COLLATE pg_catalog."default" NOT NULL,
    donor_id integer NOT NULL,
    bdp_number integer NOT NULL,
    CONSTRAINT donation_number_prkey PRIMARY KEY (donation_number),
    CONSTRAINT bdp_number_frkey FOREIGN KEY (bdp_number)
        REFERENCES public.blooddonationpoint (bdp_number) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT donor_id_frkey FOREIGN KEY (donor_id)
        REFERENCES public.donor (donor_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.donation
    OWNER to postgres;



-- Table: public.hospital

-- DROP TABLE IF EXISTS public.hospital;

CREATE TABLE IF NOT EXISTS public.hospital
(
    hospital_number integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    phone_number character varying(50) COLLATE pg_catalog."default" NOT NULL,
    address character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT hospital_number_prkey PRIMARY KEY (hospital_number),
    CONSTRAINT hospital_phone_number_key UNIQUE (phone_number)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.hospital
    OWNER to postgres;


-- Table: public.hospital_blooddonationpoint

-- DROP TABLE IF EXISTS public.hospital_blooddonationpoint;

CREATE TABLE IF NOT EXISTS public.hospital_blooddonationpoint
(
    id_tab integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    hospital_number integer NOT NULL,
    bdp_number integer NOT NULL,
    CONSTRAINT id_tab_prkey PRIMARY KEY (id_tab),
    CONSTRAINT bdp_number_frkey FOREIGN KEY (bdp_number)
        REFERENCES public.blooddonationpoint (bdp_number) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT hospital_number_frkey FOREIGN KEY (hospital_number)
        REFERENCES public.hospital (hospital_number) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.hospital_blooddonationpoint
    OWNER to postgres;
