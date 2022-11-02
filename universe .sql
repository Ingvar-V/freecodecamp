--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    comet_description text,
    comet_diameter numeric,
    name character varying NOT NULL
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy_description text,
    galaxy_distance_earth_mln_lya numeric,
    galaxy_local_group boolean,
    mw_galaxy_satellite boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    moon_description text,
    planet_id integer,
    moon_radius_km numeric,
    moon_mass_nearths numeric
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    planet_description text,
    planet_age_mlns_years integer,
    planet_distance_from_earth_mln_km numeric,
    planet_has_life boolean,
    planet_is_spherical boolean,
    planet_diameter_km integer,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    star_description text,
    galaxy_id integer,
    star_mass numeric,
    star_radius numeric
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Comet 103P', 1.6, 'Hartley2');
INSERT INTO public.comet VALUES (2, 'Comet 19P', 8, 'Borrely');
INSERT INTO public.comet VALUES (3, '2I', 5, 'Borisov');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'The Milky Way', 'The Milky Way galaxy', NULL, true, true);
INSERT INTO public.galaxy VALUES (2, 'Ursa Major', ' Ursa Major', 0.33, true, true);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 'The Large Magellanic Cloud', 0.163, true, true);
INSERT INTO public.galaxy VALUES (4, 'Barnards Galaxy', 'Barnards Galaxy NGC 6822', 1.63, true, true);
INSERT INTO public.galaxy VALUES (5, 'Andromeda Galaxy', 'The Andromeda Galaxy NGC 224', 2.56, true, true);
INSERT INTO public.galaxy VALUES (6, 'M82 Galaxy', 'Messier 82 Galaxy NGC 3034', 11.51, false, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Phobos', 'Satellite of Mars', 1, 11.27, 1.78);
INSERT INTO public.moon VALUES (2, 'Deimos', 'Satellite of Mars', 1, 10.5, 1.53);
INSERT INTO public.moon VALUES (3, 'Io', 'Satellite of Jupiter', 4, 18.5, 8.9);
INSERT INTO public.moon VALUES (4, 'Europe', 'Satellite of Jupiter', 4, 10.3, 2.3);
INSERT INTO public.moon VALUES (5, 'Gamnymede', 'Satellite of Jupiter', 4, 8.1, 1.9);
INSERT INTO public.moon VALUES (6, 'Callisto', 'Satellite of Jupiter', 4, 6.4, 2.7);
INSERT INTO public.moon VALUES (7, 'Titan', 'Satellite of Saturn', 5, 3.2, 4.1);
INSERT INTO public.moon VALUES (8, 'Rhea', 'Satellite of Saturn', 5, 2.44, 3.61);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Satellite of Saturn', 5, 2.5, 2.48);
INSERT INTO public.moon VALUES (10, 'Latepus', 'Satellite of Saturn', 5, 3.4, 1.85);
INSERT INTO public.moon VALUES (11, 'Hyperion', 'Satellite of Saturn', 5, 5.1, 4.5);
INSERT INTO public.moon VALUES (12, 'Mimas', 'Satellite of Saturn', 5, 3.2, 6.12);
INSERT INTO public.moon VALUES (13, 'Phoebe', 'Satellite of Saturn', 5, 1.79, 2.2);
INSERT INTO public.moon VALUES (14, 'Atlas', 'Satellite of Saturn', 5, 4.9, 3.2);
INSERT INTO public.moon VALUES (15, 'Prometheus', 'Satellite of Saturn', 5, 2.3, 4.1);
INSERT INTO public.moon VALUES (16, 'Pandora', 'Satellite of Saturn', 5, 1.3, 5.21);
INSERT INTO public.moon VALUES (17, 'Methone', 'Satellite of Saturn', 5, 0.3, 2.01);
INSERT INTO public.moon VALUES (18, 'Pallene', 'Satellite of Saturn', 5, 4.3, 4.1);
INSERT INTO public.moon VALUES (19, 'Anthe', 'Satellite of Saturn', 5, 1.23, 1.1);
INSERT INTO public.moon VALUES (20, 'Tarqeq', 'Satellite of Saturn', 5, 0.23, 0.1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mars', 'Mars is the 4th planet from the Sun', 4, 401.3, false, false, 3396, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Venus is the 2nd planet from the Sun', 5, 38, false, false, 12103, 1);
INSERT INTO public.planet VALUES (3, '41 Lyncs b', 'Arkas ia an extrasolar planet', 3, 280, false, true, 1879, 2);
INSERT INTO public.planet VALUES (4, 'Jupiter', 'Jupiter is the 5th planet from the Sun', 4, 40, false, true, 4862, 1);
INSERT INTO public.planet VALUES (5, 'Saturn', 'Saturn is the 6th planet from the Sun', 5, 50, false, true, 3982, 1);
INSERT INTO public.planet VALUES (6, 'Earth', 'Earth is the 3rd planet from the Sun', 4, 0, true, true, 12111, 1);
INSERT INTO public.planet VALUES (7, 'pluto', 'Pluto is the dwarf planet', 3, 110, false, true, 12, 1);
INSERT INTO public.planet VALUES (8, 'Uranus', 'Uranus is the planet', 4, 150, false, true, 15832, 1);
INSERT INTO public.planet VALUES (9, 'Centaurs', 'Centaurs is icy body-like comet', 1, 1, false, false, 132, 1);
INSERT INTO public.planet VALUES (10, 'Ceres', 'Ceres is the largest asteroid', 1, 1, false, false, 12, 1);
INSERT INTO public.planet VALUES (11, 'Pallas', 'Pallas is the largest asteroid in the asteroid belt after Ceres', 1, 1, false, false, 42, 1);
INSERT INTO public.planet VALUES (12, 'Vesta', 'Vesta is the largest asteroid in the asteroid belt after Ceres', 1, 1, false, false, 4, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Alioth', 'Epsilon Ursae Majoris', 2, 2.91, 4.14);
INSERT INTO public.star VALUES (1, 'Sun', 'The Sun star', 1, 1.99, 6.95);
INSERT INTO public.star VALUES (3, 'WOH G64', 'Red supergiant star in the Lagre Magellanic Cloud', 3, 1.54, 3.26);
INSERT INTO public.star VALUES (4, 'Rukbat', 'Rukbat also named Alfa Sagittarii star in the constellation of Sagittarius.', 4, 2.7, 2.2);
INSERT INTO public.star VALUES (5, 'Alpheratz', 'Alpheratz also named Alfa Andromedae is the brightest star in the constellation of Andromeda.', 5, 3.5, 1.9);
INSERT INTO public.star VALUES (6, 'SN 2014J', 'Supernova in the constellation of M82 Galaxy (Cigar Galaxy).', 6, 2.46, 3.8);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: comet unique_comet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT unique_comet_name UNIQUE (name);


--
-- Name: moon moon_moon_planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_planet_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_planet_star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_star_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

