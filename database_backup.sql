--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cities; Type: TABLE; Schema: public; Owner: apple
--

CREATE TABLE public.cities (
    name character varying,
    id integer NOT NULL
);


ALTER TABLE public.cities OWNER TO apple;

--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: apple
--

CREATE SEQUENCE public.cities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cities_id_seq OWNER TO apple;

--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: apple
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- Name: trains; Type: TABLE; Schema: public; Owner: apple
--

CREATE TABLE public.trains (
    name character varying,
    id integer NOT NULL
);


ALTER TABLE public.trains OWNER TO apple;

--
-- Name: trains_cities; Type: TABLE; Schema: public; Owner: apple
--

CREATE TABLE public.trains_cities (
    id integer NOT NULL,
    city_id integer,
    train_id integer
);


ALTER TABLE public.trains_cities OWNER TO apple;

--
-- Name: trains_cities_id_seq; Type: SEQUENCE; Schema: public; Owner: apple
--

CREATE SEQUENCE public.trains_cities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trains_cities_id_seq OWNER TO apple;

--
-- Name: trains_cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: apple
--

ALTER SEQUENCE public.trains_cities_id_seq OWNED BY public.trains_cities.id;


--
-- Name: trains_id_seq; Type: SEQUENCE; Schema: public; Owner: apple
--

CREATE SEQUENCE public.trains_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trains_id_seq OWNER TO apple;

--
-- Name: trains_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: apple
--

ALTER SEQUENCE public.trains_id_seq OWNED BY public.trains.id;


--
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: apple
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- Name: trains id; Type: DEFAULT; Schema: public; Owner: apple
--

ALTER TABLE ONLY public.trains ALTER COLUMN id SET DEFAULT nextval('public.trains_id_seq'::regclass);


--
-- Name: trains_cities id; Type: DEFAULT; Schema: public; Owner: apple
--

ALTER TABLE ONLY public.trains_cities ALTER COLUMN id SET DEFAULT nextval('public.trains_cities_id_seq'::regclass);


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: apple
--

COPY public.cities (name, id) FROM stdin;
\.


--
-- Data for Name: trains; Type: TABLE DATA; Schema: public; Owner: apple
--

COPY public.trains (name, id) FROM stdin;
\.


--
-- Data for Name: trains_cities; Type: TABLE DATA; Schema: public; Owner: apple
--

COPY public.trains_cities (id, city_id, train_id) FROM stdin;
\.


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: apple
--

SELECT pg_catalog.setval('public.cities_id_seq', 9, true);


--
-- Name: trains_cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: apple
--

SELECT pg_catalog.setval('public.trains_cities_id_seq', 1, false);


--
-- Name: trains_id_seq; Type: SEQUENCE SET; Schema: public; Owner: apple
--

SELECT pg_catalog.setval('public.trains_id_seq', 11, true);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: apple
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: trains_cities trains_cities_pkey; Type: CONSTRAINT; Schema: public; Owner: apple
--

ALTER TABLE ONLY public.trains_cities
    ADD CONSTRAINT trains_cities_pkey PRIMARY KEY (id);


--
-- Name: trains trains_pkey; Type: CONSTRAINT; Schema: public; Owner: apple
--

ALTER TABLE ONLY public.trains
    ADD CONSTRAINT trains_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

