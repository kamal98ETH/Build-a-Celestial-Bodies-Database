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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    number_of_stars_in_billions integer,
    distance_in_kly integer,
    age_in_million_years integer,
    galaxy_types_id integer NOT NULL
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
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_types_id integer NOT NULL,
    name character varying,
    galaxies_with_same_type integer NOT NULL
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_type_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    age_in_millions_years integer,
    radius_in_km integer,
    distance_from_earth_in_light_minute integer,
    planet_id integer NOT NULL
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
    description text,
    has_water boolean,
    has_life boolean,
    distance_from_earth_in_ly numeric(4,2),
    age_in_millions_years integer,
    planet_types_id integer NOT NULL,
    star_id integer NOT NULL
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
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying NOT NULL,
    planets_with_same_type integer NOT NULL
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_type_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    star_type character varying,
    radius_in_km integer,
    distance_from_earth_in_ly double precision,
    age_in_million_years integer,
    galaxy_id integer NOT NULL
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The Milky Way is the galaxy that includes our Solar System, it appears like a hazy band of light seen in the night sky formed from stars that cannot be individually distingtuished be the naked eye', 100, 100, 13610, 1);
INSERT INTO public.galaxy VALUES (2, 'Whirlpool Galaxy', 'It s an interacting grand-design spiral galaxy with a Seyfert 2 active galactic nucleus, it lies in the constellation Canes Venatici, and was the first galaxy to be classified as a spiral galaxy', 100, 23160, 400, 1);
INSERT INTO public.galaxy VALUES (3, 'Pinwheel Galaxy', 'It was discovered by Pierre Mechain in 1781 and was communicated that year to Charles Meddier who verified its position for inclusion in the Messier Catalogue as one of its final entries', 1000, 20870, 23, 2);
INSERT INTO public.galaxy VALUES (4, 'Black Eye Galaxy', 'It was discovered by Edward Pigott in March 1779, and independently by Johann Elert Bode in April of the same year, as well as by charles Messier the next year', 100, 24010, 13280, 1);
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 'It s a peculiar galaxy of unclear classification in the constellation borders of Virgo and Corvus', 100, 29350, 13250, 1);
INSERT INTO public.galaxy VALUES (6, 'Tadpole Galaxy', 'its most dramatic feature is a trail of stars about 280000 light years long', NULL, 400000, 100, 1);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (1, 'Spiral galaxy', 5);
INSERT INTO public.galaxy_types VALUES (2, 'Face-on spiral galaxy', 1);
INSERT INTO public.galaxy_types VALUES (3, 'Elliptical galaxy', 0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'The Moon is Earth s only natural satellite, at about one-quarter the diameter of earth', 4530, 1737, 0, 1);
INSERT INTO public.moon VALUES (2, 'Io', 'Io, or Jupiter I is the innermost and thired largest of the foor Galilean moond of Jupiter', 4500, 1821, 35, 5);
INSERT INTO public.moon VALUES (3, 'Titan', 'is the largest moon of Saturn and the second largest natural satellite in the solar system', 4003, 2574, 41, 6);
INSERT INTO public.moon VALUES (4, 'Europa', 'it s the smallest of the four Galilean moons orbitiong Jupiter, and the sixth closest to the planet of all the 80 known moons of Jupiter', 4503, 1560, 35, 5);
INSERT INTO public.moon VALUES (5, 'Mimas', 'Mimas, also designated Saturn I, is a moon of Saturn which was discovered in 1789 by William Herschel', 4025, 198, 35, 6);
INSERT INTO public.moon VALUES (6, 'Genymed', 'it s a satellite of Jupiter, is the largest and most massive of the solar system moons', 4503, 2634, 35, 5);
INSERT INTO public.moon VALUES (7, 'Enceladus', 'it s mostly covered by fres, clean ice, making it one of the most reflective bodies of the solar system', 1000, 252, 35, 6);
INSERT INTO public.moon VALUES (8, 'Lapetus', 'Lapetus is the third largest natural satellite of Saturn and the eleventh largest in the solar system', 4567, 734, 35, 6);
INSERT INTO public.moon VALUES (9, 'Phobos', 'it ss named after the Greek deity Phobos, a son and twin brother of Deimos', 4503, 11, 4, 2);
INSERT INTO public.moon VALUES (10, 'Trilton', 'is the largest natural satellite of the planet Neptune, and was the first Neptunian moon to diescovered', 4503, 1353, 241, 9);
INSERT INTO public.moon VALUES (11, 'Cellisto', 'is the third largest moon in the solar system after Ganymede and Saturns largest moon Titan and the largest object inthe solar system that may not be jproperly differentiated', 4503, 2410, 35, 5);
INSERT INTO public.moon VALUES (12, 'Hyperion', 'it is distingtuished by its irregular shpe, its chaotic rotation, and its unexplained sponge-like appearance, it was the first non-round moon to be discovered', NULL, 135, 35, 6);
INSERT INTO public.moon VALUES (13, 'Rhea', 'it is the smallest body in the solar system of which precise measurements have ocnfirmed a shape consistent with hydrostatic eqyilibrium', 4000, 733, 35, 6);
INSERT INTO public.moon VALUES (14, 'Titaniia', 'it is the largest of the moons of Uranus and the eighth largest moon in the solar system', 4600, 788, 151, 10);
INSERT INTO public.moon VALUES (15, 'Umbriel', 'it was discovered at the same time as Ariel and named after a character in Alexander Pope s poem The rape of the Lock', 4500, 584, 151, 10);
INSERT INTO public.moon VALUES (16, 'Dione', 'it is named after the Titaness Dione of Greek mythology', 4000, 561, 35, 6);
INSERT INTO public.moon VALUES (17, 'Nereid', 'it is of all known moons iin the solar system that has the most eccentric orbit', NULL, 170, 241, 9);
INSERT INTO public.moon VALUES (18, 'Pan', 'it is a ring shepherd and is responsible for keeping the Encke Gap free of ring particles', NULL, 14, 35, 5);
INSERT INTO public.moon VALUES (19, 'Herse', 'it was discovered on 8 february 2003 by the astronomers Brett J.Gladman, Jogn J. Kavelaars, Jean-Marc Petit, and Lynne Allen and also by a team of astronomers at the University of Hawaii', NULL, 1, 35, 5);
INSERT INTO public.moon VALUES (20, 'Eirene', 'it was recovered in 2017 and given its permanent designation that year', NULL, 2, 35, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Earth is the third planet from the sun and the only astronomical object known to habor life', true, true, 0.00, 4543, 1, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Mars is the fourth planey from the Sun and the second smallest planet in the Solar System, being only larger than Mercury', true, false, 0.00, 4603, 1, 1);
INSERT INTO public.planet VALUES (3, 'Mercury', 'Mercury is the smallest planet in the Solar System and the closest to the Sun', true, false, 0.00, 4503, 1, 1);
INSERT INTO public.planet VALUES (4, 'Venus', 'Venus is the second planey from the Sun and is named after the Roman goddess of love and beauty', false, false, 0.00, 4503, 1, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Jupiter is the fifth planet from the Sun and the largest in the Solar System', false, false, 0.00, 4603, 2, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Saturn is the sixth planet from the Sun and the second largest in the solar system after jupiter', false, false, 0.00, 4503, 2, 1);
INSERT INTO public.planet VALUES (7, 'Kepler-235 c', 'it s an extrasolar planet that orbits the star kepler-235 in the constellation of Lyra', NULL, false, NULL, NULL, 3, 5);
INSERT INTO public.planet VALUES (8, 'Kepler-235 b', 'it s an extrasolar planet that orbits the star kepler-235 in the constellation of Lyra', NULL, false, NULL, NULL, 4, 5);
INSERT INTO public.planet VALUES (9, 'Neptune', 'Neptune is the eigth and farthest known dolar planet from the Sun', true, false, 0.00, 4503, 5, 1);
INSERT INTO public.planet VALUES (10, 'Uranus', 'Uranus is the seventh planet from the sun, its name is a reference to the Greek god of sky, Uranus', true, false, 0.00, 4503, 5, 1);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri B', 'it s an exoplanet orbiting in the habitable zone of the red dwarf star Proxima Centauri', true, false, 4.23, 4850, 3, 6);
INSERT INTO public.planet VALUES (12, 'Proxima Centauri D', 'it s a candidate orbiting the red dwarf star Proxima Centauri', true, false, 4.23, 4800, 3, 6);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'Terrestrial planet', 4);
INSERT INTO public.planet_types VALUES (2, 'Gas giant', 2);
INSERT INTO public.planet_types VALUES (3, 'Super earth', 3);
INSERT INTO public.planet_types VALUES (4, 'Neptune-like', 1);
INSERT INTO public.planet_types VALUES (5, 'Ice giant', 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The Sun is the star at the center of our Solar System, it is nearly perfect ball of got plasma', 'G dwarf star', 696340, 0, 4603, 1);
INSERT INTO public.star VALUES (2, 'Polaris', 'Polaris is a star in the northem circumpolar constellation of Ursa Minor', 'Cepheid variable', 35000000, 323, 70, 1);
INSERT INTO public.star VALUES (3, 'Vega', 'Vega is the brightest star in the northern constellation of Lyra', 'A0V', 1643200, 25.05, 455, 1);
INSERT INTO public.star VALUES (4, 'Sirius', 'Sirius is the brightest star in the night sky', 'A0 or A1', 1200000, 8.611, 230, 1);
INSERT INTO public.star VALUES (5, 'Kepler 235', 'Kepler 235 is a star, has at least 4 extrasolar planets believed to be in orbit around the star', 'K-type', 382987, 1396, NULL, 1);
INSERT INTO public.star VALUES (6, 'Alpha Centauri C', 'Proxima Centauri is a small, low-mass star', 'Sequence red dwarf', 10780, 4.2465, 4853, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: galaxy_types_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_type_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: planet_types_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_type_id_seq', 5, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 18, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


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
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


--
-- Name: galaxy_types galaxy_types_type_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_type_id_key UNIQUE (galaxy_types_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


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
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


--
-- Name: planet_types planet_types_type_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_type_id_key UNIQUE (planet_types_id);


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
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: galaxy galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_type_id_fkey FOREIGN KEY (galaxy_types_id) REFERENCES public.galaxy_types(galaxy_types_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: planet planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_type_id_fkey FOREIGN KEY (planet_types_id) REFERENCES public.planet_types(planet_types_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

