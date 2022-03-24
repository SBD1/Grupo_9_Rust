--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

-- Started on 2022-03-24 16:16:10

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
-- TOC entry 218 (class 1259 OID 17079)
-- Name: clothing; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clothing (
    itemid integer NOT NULL,
    maxstacksize integer NOT NULL,
    itemname character varying(100) NOT NULL,
    lootgrade character varying(15) NOT NULL,
    itemtype character varying(20) NOT NULL,
    craftable boolean NOT NULL,
    compositionid integer,
    coldresistance numeric(4,2),
    radresistance numeric(4,2),
    explosionresistance numeric(4,2),
    meleeresistance numeric(4,2),
    rangedresistance numeric(4,2),
    biteresistance numeric(4,2),
    equipmentslot numeric(4,2),
    wetresistance numeric(4,2)
);


ALTER TABLE public.clothing OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17078)
-- Name: clothing_itemid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clothing_itemid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clothing_itemid_seq OWNER TO postgres;

--
-- TOC entry 3404 (class 0 OID 0)
-- Dependencies: 217
-- Name: clothing_itemid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clothing_itemid_seq OWNED BY public.clothing.itemid;


--
-- TOC entry 222 (class 1259 OID 17093)
-- Name: components; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.components (
    itemid integer NOT NULL,
    maxstacksize integer NOT NULL,
    itemname character varying(100) NOT NULL,
    lootgrade character varying(15) NOT NULL,
    itemtype character varying(20) NOT NULL,
    craftable boolean NOT NULL,
    compositionid integer
);


ALTER TABLE public.components OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17092)
-- Name: components_itemid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.components_itemid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.components_itemid_seq OWNER TO postgres;

--
-- TOC entry 3405 (class 0 OID 0)
-- Dependencies: 221
-- Name: components_itemid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.components_itemid_seq OWNED BY public.components.itemid;


--
-- TOC entry 220 (class 1259 OID 17086)
-- Name: consumables; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.consumables (
    itemid integer NOT NULL,
    maxstacksize integer NOT NULL,
    itemname character varying(100) NOT NULL,
    lootgrade character varying(15) NOT NULL,
    itemtype character varying(20) NOT NULL,
    craftable boolean NOT NULL,
    compositionid integer,
    instantheal integer,
    healovertime integer,
    hidrationyield integer,
    bleedingyield integer,
    radiationyield integer,
    poisionyield integer,
    hungeryield integer,
    vomitchance numeric(4,2)
);


ALTER TABLE public.consumables OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17085)
-- Name: consumables_itemid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.consumables_itemid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.consumables_itemid_seq OWNER TO postgres;

--
-- TOC entry 3406 (class 0 OID 0)
-- Dependencies: 219
-- Name: consumables_itemid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.consumables_itemid_seq OWNED BY public.consumables.itemid;


--
-- TOC entry 226 (class 1259 OID 17111)
-- Name: instanceditem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instanceditem (
    itemid integer,
    instanceid integer NOT NULL,
    itemdurability double precision,
    quantity integer
);


ALTER TABLE public.instanceditem OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17106)
-- Name: itemcomposition; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.itemcomposition (
    itemid integer NOT NULL,
    compositionid integer NOT NULL,
    comp1 integer NOT NULL,
    compquantity1 integer NOT NULL,
    comp2 integer,
    compquantity2 integer,
    comp3 integer,
    compquantity3 integer,
    comp4 integer,
    compquantity4 integer
);


ALTER TABLE public.itemcomposition OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 17051)
-- Name: items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.items (
    itemid integer NOT NULL,
    maxstacksize integer NOT NULL,
    itemname character varying(100) NOT NULL,
    itemtype character varying(20) NOT NULL,
    craftable boolean NOT NULL,
    lootgrade integer,
    compositionid integer
);


ALTER TABLE public.items OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 17050)
-- Name: items_itemid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.items_itemid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.items_itemid_seq OWNER TO postgres;

--
-- TOC entry 3407 (class 0 OID 0)
-- Dependencies: 209
-- Name: items_itemid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.items_itemid_seq OWNED BY public.items.itemid;


--
-- TOC entry 214 (class 1259 OID 17065)
-- Name: meleeweapons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.meleeweapons (
    itemid integer NOT NULL,
    maxstacksize integer NOT NULL,
    itemname character varying(100) NOT NULL,
    lootgrade character varying(15) NOT NULL,
    itemtype character varying(20) NOT NULL,
    craftable boolean NOT NULL,
    compositionid integer,
    attackrange integer,
    headdamage integer,
    chestdamage integer,
    legdamage integer,
    armsdamage integer,
    treegatherrate integer,
    oregatherrate integer,
    fleshgatherrate integer,
    canbethrown boolean
);


ALTER TABLE public.meleeweapons OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 17064)
-- Name: meleeweapons_itemid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.meleeweapons_itemid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.meleeweapons_itemid_seq OWNER TO postgres;

--
-- TOC entry 3408 (class 0 OID 0)
-- Dependencies: 213
-- Name: meleeweapons_itemid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.meleeweapons_itemid_seq OWNED BY public.meleeweapons.itemid;


--
-- TOC entry 216 (class 1259 OID 17072)
-- Name: rangedweapons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rangedweapons (
    itemid integer NOT NULL,
    maxstacksize integer NOT NULL,
    itemname character varying(100) NOT NULL,
    lootgrade character varying(15) NOT NULL,
    itemtype character varying(20) NOT NULL,
    craftable boolean NOT NULL,
    compositionid integer,
    attackrange integer,
    headdamage integer,
    chestdamage integer,
    legdamage integer,
    armsdamage integer,
    accuracymodifier numeric(4,2),
    firerate integer,
    firemode character varying(25),
    modslots integer,
    ammocapacity integer,
    recoil integer
);


ALTER TABLE public.rangedweapons OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 17071)
-- Name: rangedweapons_itemid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rangedweapons_itemid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rangedweapons_itemid_seq OWNER TO postgres;

--
-- TOC entry 3409 (class 0 OID 0)
-- Dependencies: 215
-- Name: rangedweapons_itemid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rangedweapons_itemid_seq OWNED BY public.rangedweapons.itemid;


--
-- TOC entry 212 (class 1259 OID 17058)
-- Name: resources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resources (
    itemid integer NOT NULL,
    maxstacksize integer NOT NULL,
    itemname character varying(100) NOT NULL,
    lootgrade character varying(15) NOT NULL,
    itemtype character varying(20) NOT NULL,
    craftable boolean NOT NULL,
    isprimary boolean NOT NULL,
    isrefinable boolean NOT NULL,
    compositionid integer
);


ALTER TABLE public.resources OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 17057)
-- Name: resources_itemid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.resources_itemid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resources_itemid_seq OWNER TO postgres;

--
-- TOC entry 3410 (class 0 OID 0)
-- Dependencies: 211
-- Name: resources_itemid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.resources_itemid_seq OWNED BY public.resources.itemid;


--
-- TOC entry 224 (class 1259 OID 17100)
-- Name: teas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teas (
    itemid integer NOT NULL,
    maxstacksize integer NOT NULL,
    itemname character varying(100) NOT NULL,
    lootgrade character varying(15) NOT NULL,
    itemtype character varying(20) NOT NULL,
    craftable boolean NOT NULL,
    compositionid integer,
    statusupgradetype character varying(15),
    upgradepercentage numeric(4,2),
    instantheal integer,
    healovertime integer,
    hidrationyield integer,
    bleedingyield integer,
    radiationyield integer,
    poisionyield integer,
    hungeryield integer,
    vomitchance numeric(4,2)
);


ALTER TABLE public.teas OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17099)
-- Name: teas_itemid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teas_itemid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teas_itemid_seq OWNER TO postgres;

--
-- TOC entry 3411 (class 0 OID 0)
-- Dependencies: 223
-- Name: teas_itemid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teas_itemid_seq OWNED BY public.teas.itemid;


--
-- TOC entry 3211 (class 2604 OID 17082)
-- Name: clothing itemid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clothing ALTER COLUMN itemid SET DEFAULT nextval('public.clothing_itemid_seq'::regclass);


--
-- TOC entry 3213 (class 2604 OID 17096)
-- Name: components itemid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components ALTER COLUMN itemid SET DEFAULT nextval('public.components_itemid_seq'::regclass);


--
-- TOC entry 3212 (class 2604 OID 17089)
-- Name: consumables itemid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consumables ALTER COLUMN itemid SET DEFAULT nextval('public.consumables_itemid_seq'::regclass);


--
-- TOC entry 3207 (class 2604 OID 17054)
-- Name: items itemid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items ALTER COLUMN itemid SET DEFAULT nextval('public.items_itemid_seq'::regclass);


--
-- TOC entry 3209 (class 2604 OID 17068)
-- Name: meleeweapons itemid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.meleeweapons ALTER COLUMN itemid SET DEFAULT nextval('public.meleeweapons_itemid_seq'::regclass);


--
-- TOC entry 3210 (class 2604 OID 17075)
-- Name: rangedweapons itemid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rangedweapons ALTER COLUMN itemid SET DEFAULT nextval('public.rangedweapons_itemid_seq'::regclass);


--
-- TOC entry 3208 (class 2604 OID 17061)
-- Name: resources itemid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resources ALTER COLUMN itemid SET DEFAULT nextval('public.resources_itemid_seq'::regclass);


--
-- TOC entry 3214 (class 2604 OID 17103)
-- Name: teas itemid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teas ALTER COLUMN itemid SET DEFAULT nextval('public.teas_itemid_seq'::regclass);


--
-- TOC entry 3390 (class 0 OID 17079)
-- Dependencies: 218
-- Data for Name: clothing; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clothing (itemid, maxstacksize, itemname, lootgrade, itemtype, craftable, compositionid, coldresistance, radresistance, explosionresistance, meleeresistance, rangedresistance, biteresistance, equipmentslot, wetresistance) FROM stdin;
\.


--
-- TOC entry 3394 (class 0 OID 17093)
-- Dependencies: 222
-- Data for Name: components; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.components (itemid, maxstacksize, itemname, lootgrade, itemtype, craftable, compositionid) FROM stdin;
\.


--
-- TOC entry 3392 (class 0 OID 17086)
-- Dependencies: 220
-- Data for Name: consumables; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.consumables (itemid, maxstacksize, itemname, lootgrade, itemtype, craftable, compositionid, instantheal, healovertime, hidrationyield, bleedingyield, radiationyield, poisionyield, hungeryield, vomitchance) FROM stdin;
\.


--
-- TOC entry 3398 (class 0 OID 17111)
-- Dependencies: 226
-- Data for Name: instanceditem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.instanceditem (itemid, instanceid, itemdurability, quantity) FROM stdin;
\.


--
-- TOC entry 3397 (class 0 OID 17106)
-- Dependencies: 225
-- Data for Name: itemcomposition; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.itemcomposition (itemid, compositionid, comp1, compquantity1, comp2, compquantity2, comp3, compquantity3, comp4, compquantity4) FROM stdin;
\.


--
-- TOC entry 3382 (class 0 OID 17051)
-- Dependencies: 210
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.items (itemid, maxstacksize, itemname, itemtype, craftable, lootgrade, compositionid) FROM stdin;
\.


--
-- TOC entry 3386 (class 0 OID 17065)
-- Dependencies: 214
-- Data for Name: meleeweapons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.meleeweapons (itemid, maxstacksize, itemname, lootgrade, itemtype, craftable, compositionid, attackrange, headdamage, chestdamage, legdamage, armsdamage, treegatherrate, oregatherrate, fleshgatherrate, canbethrown) FROM stdin;
\.


--
-- TOC entry 3388 (class 0 OID 17072)
-- Dependencies: 216
-- Data for Name: rangedweapons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rangedweapons (itemid, maxstacksize, itemname, lootgrade, itemtype, craftable, compositionid, attackrange, headdamage, chestdamage, legdamage, armsdamage, accuracymodifier, firerate, firemode, modslots, ammocapacity, recoil) FROM stdin;
\.


--
-- TOC entry 3384 (class 0 OID 17058)
-- Dependencies: 212
-- Data for Name: resources; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resources (itemid, maxstacksize, itemname, lootgrade, itemtype, craftable, isprimary, isrefinable, compositionid) FROM stdin;
1	1000	Wood	primary	resource	f	t	f	\N
2	1000	Stone	primary	resource	f	t	f	\N
3	1000	Bone Fragments	primary	resource	f	t	f	\N
4	1000	Leather	primary	resource	f	t	f	\N
5	1000	Cloth	primary	resource	f	t	f	\N
6	1000	Scrap	primary	resource	f	t	f	\N
7	100	High Quality Metal Ore	primary	resource	f	t	t	\N
8	500	Animal Fat	primary	resource	f	t	t	\N
9	500	Crude Oil	primary	resource	f	t	t	\N
10	1000	Metal Ore	primary	resource	f	t	t	\N
11	1000	Sulfur Ore	primary	resource	f	t	t	\N
12	100	High Quality Metal	resource	resource	t	f	f	\N
13	500	Low Grade Fuel	resource	resource	t	f	f	\N
14	1000	Metal Fragments	resource	resource	t	f	f	\N
15	1000	Sulfur	resource	resource	t	f	f	\N
16	1000	Charcoal	resource	resource	t	f	f	\N
17	1000	Gunpowder	resource	resource	t	f	f	\N
\.


--
-- TOC entry 3396 (class 0 OID 17100)
-- Dependencies: 224
-- Data for Name: teas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teas (itemid, maxstacksize, itemname, lootgrade, itemtype, craftable, compositionid, statusupgradetype, upgradepercentage, instantheal, healovertime, hidrationyield, bleedingyield, radiationyield, poisionyield, hungeryield, vomitchance) FROM stdin;
\.


--
-- TOC entry 3412 (class 0 OID 0)
-- Dependencies: 217
-- Name: clothing_itemid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clothing_itemid_seq', 1, false);


--
-- TOC entry 3413 (class 0 OID 0)
-- Dependencies: 221
-- Name: components_itemid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.components_itemid_seq', 1, false);


--
-- TOC entry 3414 (class 0 OID 0)
-- Dependencies: 219
-- Name: consumables_itemid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.consumables_itemid_seq', 1, false);


--
-- TOC entry 3415 (class 0 OID 0)
-- Dependencies: 209
-- Name: items_itemid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.items_itemid_seq', 1, false);


--
-- TOC entry 3416 (class 0 OID 0)
-- Dependencies: 213
-- Name: meleeweapons_itemid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.meleeweapons_itemid_seq', 1, false);


--
-- TOC entry 3417 (class 0 OID 0)
-- Dependencies: 215
-- Name: rangedweapons_itemid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rangedweapons_itemid_seq', 1, false);


--
-- TOC entry 3418 (class 0 OID 0)
-- Dependencies: 211
-- Name: resources_itemid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.resources_itemid_seq', 17, true);


--
-- TOC entry 3419 (class 0 OID 0)
-- Dependencies: 223
-- Name: teas_itemid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teas_itemid_seq', 1, false);


--
-- TOC entry 3224 (class 2606 OID 17084)
-- Name: clothing clothing_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clothing
    ADD CONSTRAINT clothing_pkey PRIMARY KEY (itemid);


--
-- TOC entry 3228 (class 2606 OID 17098)
-- Name: components components_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components
    ADD CONSTRAINT components_pkey PRIMARY KEY (itemid);


--
-- TOC entry 3226 (class 2606 OID 17091)
-- Name: consumables consumables_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consumables
    ADD CONSTRAINT consumables_pkey PRIMARY KEY (itemid);


--
-- TOC entry 3234 (class 2606 OID 17115)
-- Name: instanceditem instanceditem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instanceditem
    ADD CONSTRAINT instanceditem_pkey PRIMARY KEY (instanceid);


--
-- TOC entry 3232 (class 2606 OID 17110)
-- Name: itemcomposition itemcomposition_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.itemcomposition
    ADD CONSTRAINT itemcomposition_pkey PRIMARY KEY (compositionid);


--
-- TOC entry 3216 (class 2606 OID 17056)
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (itemid);


--
-- TOC entry 3220 (class 2606 OID 17070)
-- Name: meleeweapons meleeweapons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.meleeweapons
    ADD CONSTRAINT meleeweapons_pkey PRIMARY KEY (itemid);


--
-- TOC entry 3222 (class 2606 OID 17077)
-- Name: rangedweapons rangedweapons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rangedweapons
    ADD CONSTRAINT rangedweapons_pkey PRIMARY KEY (itemid);


--
-- TOC entry 3218 (class 2606 OID 17063)
-- Name: resources resources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resources
    ADD CONSTRAINT resources_pkey PRIMARY KEY (itemid);


--
-- TOC entry 3230 (class 2606 OID 17105)
-- Name: teas teas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teas
    ADD CONSTRAINT teas_pkey PRIMARY KEY (itemid);


--
-- TOC entry 3241 (class 2606 OID 17116)
-- Name: instanceditem instanceditem_itemid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instanceditem
    ADD CONSTRAINT instanceditem_itemid_fkey FOREIGN KEY (itemid) REFERENCES public.items(itemid);


--
-- TOC entry 3237 (class 2606 OID 17131)
-- Name: itemcomposition itemcomposition_comp1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.itemcomposition
    ADD CONSTRAINT itemcomposition_comp1_fkey FOREIGN KEY (comp1) REFERENCES public.items(itemid);


--
-- TOC entry 3238 (class 2606 OID 17136)
-- Name: itemcomposition itemcomposition_comp2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.itemcomposition
    ADD CONSTRAINT itemcomposition_comp2_fkey FOREIGN KEY (comp2) REFERENCES public.items(itemid);


--
-- TOC entry 3239 (class 2606 OID 17141)
-- Name: itemcomposition itemcomposition_comp3_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.itemcomposition
    ADD CONSTRAINT itemcomposition_comp3_fkey FOREIGN KEY (comp3) REFERENCES public.items(itemid);


--
-- TOC entry 3240 (class 2606 OID 17146)
-- Name: itemcomposition itemcomposition_comp4_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.itemcomposition
    ADD CONSTRAINT itemcomposition_comp4_fkey FOREIGN KEY (comp4) REFERENCES public.items(itemid);


--
-- TOC entry 3236 (class 2606 OID 17126)
-- Name: itemcomposition itemcomposition_itemid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.itemcomposition
    ADD CONSTRAINT itemcomposition_itemid_fkey FOREIGN KEY (itemid) REFERENCES public.items(itemid);


--
-- TOC entry 3235 (class 2606 OID 17121)
-- Name: items items_compositionid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_compositionid_fkey FOREIGN KEY (compositionid) REFERENCES public.itemcomposition(compositionid);


-- Completed on 2022-03-24 16:16:10

--
-- PostgreSQL database dump complete
--

