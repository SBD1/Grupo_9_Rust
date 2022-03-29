--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

-- Started on 2022-03-28 21:27:00

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

--
-- TOC entry 889 (class 1247 OID 28134)
-- Name: enemy_grade; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enemy_grade AS ENUM (
    'scientist',
    'outpost-scientist',
    'heavy-scientist',
    'bandit'
);


ALTER TYPE public.enemy_grade OWNER TO postgres;

--
-- TOC entry 892 (class 1247 OID 28144)
-- Name: enum_boolean; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_boolean AS ENUM (
    'true',
    'false'
);


ALTER TYPE public.enum_boolean OWNER TO postgres;

--
-- TOC entry 883 (class 1247 OID 28116)
-- Name: enum_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_status AS ENUM (
    'HIGH',
    'MEDIUM',
    'LOW'
);


ALTER TYPE public.enum_status OWNER TO postgres;

--
-- TOC entry 874 (class 1247 OID 28072)
-- Name: equipment_slot; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.equipment_slot AS ENUM (
    'face',
    'head',
    'chest',
    'chest-armour',
    'feet',
    'legs',
    'leg-armour',
    'whole-body',
    'hands'
);


ALTER TYPE public.equipment_slot OWNER TO postgres;

--
-- TOC entry 871 (class 1247 OID 28058)
-- Name: fire_mode; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.fire_mode AS ENUM (
    'single',
    'auto',
    'semi-auto',
    'full-auto',
    'charged-fire',
    'pump'
);


ALTER TYPE public.fire_mode OWNER TO postgres;

--
-- TOC entry 868 (class 1247 OID 28042)
-- Name: item_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.item_type AS ENUM (
    'ranged',
    'resource',
    'melee',
    'clothes',
    'component',
    'consumable',
    'tea'
);


ALTER TYPE public.item_type OWNER TO postgres;

--
-- TOC entry 865 (class 1247 OID 28024)
-- Name: loot_grade; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.loot_grade AS ENUM (
    'primary',
    'resource',
    'barrel',
    'basic',
    'military',
    'tool',
    'food',
    'elite'
);


ALTER TYPE public.loot_grade OWNER TO postgres;

--
-- TOC entry 886 (class 1247 OID 28124)
-- Name: monument_tier; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.monument_tier AS ENUM (
    '0',
    '1',
    '2',
    '3'
);


ALTER TYPE public.monument_tier OWNER TO postgres;

--
-- TOC entry 880 (class 1247 OID 28104)
-- Name: node_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.node_type AS ENUM (
    'sulfur',
    'stone',
    'metal',
    'tree',
    'cactus'
);


ALTER TYPE public.node_type OWNER TO postgres;

--
-- TOC entry 877 (class 1247 OID 28092)
-- Name: status_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.status_type AS ENUM (
    'health',
    'mining',
    'woodcutting',
    'radiation',
    'scrap'
);


ALTER TYPE public.status_type OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 232 (class 1259 OID 28328)
-- Name: animals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.animals (
    charactersid integer NOT NULL,
    sound character varying(100) NOT NULL,
    modeltype character varying(30) NOT NULL
);


ALTER TABLE public.animals OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 28268)
-- Name: backpack; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.backpack (
    ownerid integer,
    id integer NOT NULL,
    avaliableslots integer,
    slot smallint,
    totalslots smallint
);


ALTER TABLE public.backpack OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 28267)
-- Name: backpack_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.backpack_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.backpack_id_seq OWNER TO postgres;

--
-- TOC entry 3634 (class 0 OID 0)
-- Dependencies: 224
-- Name: backpack_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.backpack_id_seq OWNED BY public.backpack.id;


--
-- TOC entry 217 (class 1259 OID 28202)
-- Name: biomes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.biomes (
    biomesid integer,
    coordinates integer,
    resourceabundance boolean,
    resourceavailability boolean,
    type character varying(30),
    climate integer
);


ALTER TABLE public.biomes OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 28227)
-- Name: characters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.characters (
    charactersid integer NOT NULL,
    name character varying(100) NOT NULL,
    "position" integer NOT NULL,
    charactermodel character varying(30) NOT NULL,
    type character varying(30) NOT NULL,
    item character varying(30) NOT NULL
);


ALTER TABLE public.characters OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 28197)
-- Name: climate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.climate (
    climateid integer,
    temperature numeric(4,1),
    event character varying(30),
    statuseffect character varying(30),
    visibility public.enum_status
);


ALTER TABLE public.climate OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 28359)
-- Name: items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.items (
    id integer NOT NULL,
    maxstacksize integer NOT NULL,
    itemname character varying(100) NOT NULL,
    itemtype public.item_type NOT NULL,
    lootgrade public.loot_grade
);


ALTER TABLE public.items OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 28381)
-- Name: clothing; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clothing (
    coldresistance numeric(4,2),
    radresistance numeric(4,2),
    explosionresistance numeric(4,2),
    meleeresistance numeric(4,2),
    rangedresistance numeric(4,2),
    biteresistance numeric(4,2),
    equipmentslot public.equipment_slot,
    wetresistance numeric(4,2)
)
INHERITS (public.items);


ALTER TABLE public.clothing OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 28262)
-- Name: combatlog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.combatlog (
    entercombatcharacters integer NOT NULL,
    indexlog integer NOT NULL,
    log character varying(100) NOT NULL
);


ALTER TABLE public.combatlog OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 28373)
-- Name: consumables; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.consumables (
    instantheal integer,
    healovertime integer,
    hidrationyield integer,
    bleedingyield integer,
    radiationyield integer,
    poisonyield integer,
    hungeryield integer,
    vomitchance numeric(4,2)
)
INHERITS (public.items);


ALTER TABLE public.consumables OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 28348)
-- Name: dialoguetext; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dialoguetext (
    dialogue character varying(100) NOT NULL,
    "character" integer NOT NULL
);


ALTER TABLE public.dialoguetext OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 28247)
-- Name: entercombatcharacters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entercombatcharacters (
    entercombatcharactersid integer NOT NULL,
    firstcharacter integer NOT NULL,
    secondcharacter integer NOT NULL
);


ALTER TABLE public.entercombatcharacters OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 28217)
-- Name: fauna; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fauna (
    fauna character varying(30) NOT NULL,
    biomes integer NOT NULL
);


ALTER TABLE public.fauna OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 28207)
-- Name: flora; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.flora (
    flora character varying(30) NOT NULL,
    biomes integer NOT NULL
);


ALTER TABLE public.flora OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 28237)
-- Name: gatheryield; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gatheryield (
    "character" integer NOT NULL,
    gatheryield character varying(30) NOT NULL
);


ALTER TABLE public.gatheryield OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 28180)
-- Name: havemapregion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.havemapregion (
    mapid integer NOT NULL,
    coordinates integer NOT NULL
);


ALTER TABLE public.havemapregion OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 28454)
-- Name: instanceditem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instanceditem (
    id integer NOT NULL,
    itemid integer,
    itemdurability double precision,
    quantity integer
);


ALTER TABLE public.instanceditem OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 28453)
-- Name: instanceditem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.instanceditem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.instanceditem_id_seq OWNER TO postgres;

--
-- TOC entry 3635 (class 0 OID 0)
-- Dependencies: 251
-- Name: instanceditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.instanceditem_id_seq OWNED BY public.instanceditem.id;


--
-- TOC entry 235 (class 1259 OID 28358)
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.items_id_seq OWNER TO postgres;

--
-- TOC entry 3636 (class 0 OID 0)
-- Dependencies: 235
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;


--
-- TOC entry 248 (class 1259 OID 28422)
-- Name: lootcrates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lootcrates (
    quantifyofitens integer,
    id integer NOT NULL,
    grade public.loot_grade
);


ALTER TABLE public.lootcrates OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 28421)
-- Name: lootcrates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lootcrates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lootcrates_id_seq OWNER TO postgres;

--
-- TOC entry 3637 (class 0 OID 0)
-- Dependencies: 247
-- Name: lootcrates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lootcrates_id_seq OWNED BY public.lootcrates.id;


--
-- TOC entry 228 (class 1259 OID 28301)
-- Name: maincharacter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.maincharacter (
    charactersid integer NOT NULL,
    owner integer NOT NULL
);


ALTER TABLE public.maincharacter OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 28150)
-- Name: maps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.maps (
    id integer NOT NULL,
    mapid integer
);


ALTER TABLE public.maps OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 28149)
-- Name: maps_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.maps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.maps_id_seq OWNER TO postgres;

--
-- TOC entry 3638 (class 0 OID 0)
-- Dependencies: 209
-- Name: maps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.maps_id_seq OWNED BY public.maps.id;


--
-- TOC entry 237 (class 1259 OID 28365)
-- Name: meleeweapons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.meleeweapons (
    attackrange integer,
    headdamage integer,
    chestdamage integer,
    legdamage integer,
    armsdamage integer,
    treegatherrate integer,
    oregatherrate integer,
    fleshgatherrate integer,
    canbethrown boolean
)
INHERITS (public.items);


ALTER TABLE public.meleeweapons OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 28164)
-- Name: monuments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.monuments (
    monumentsize integer,
    id integer NOT NULL,
    lootgrade public.monument_tier,
    enemygrade public.enemy_grade,
    regions character varying(5),
    name character varying(10)
);


ALTER TABLE public.monuments OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 28163)
-- Name: monuments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.monuments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.monuments_id_seq OWNER TO postgres;

--
-- TOC entry 3639 (class 0 OID 0)
-- Dependencies: 212
-- Name: monuments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.monuments_id_seq OWNED BY public.monuments.id;


--
-- TOC entry 231 (class 1259 OID 28318)
-- Name: npcs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.npcs (
    charactersid integer NOT NULL,
    isagressive public.enum_boolean NOT NULL,
    aggrorange character varying(30) NOT NULL,
    enemygrade character varying(30) NOT NULL,
    type character varying(30) NOT NULL
);


ALTER TABLE public.npcs OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 28443)
-- Name: party; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.party (
    partyid integer NOT NULL,
    "character" integer NOT NULL,
    capacity integer NOT NULL
);


ALTER TABLE public.party OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 28276)
-- Name: playercharacters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.playercharacters (
    charactersid integer NOT NULL,
    hydration integer NOT NULL,
    poisoned integer NOT NULL,
    hunger integer NOT NULL,
    type character varying(30) NOT NULL,
    equipeditems1 integer,
    equipeditems2 integer,
    equipeditems3 integer,
    equipeditems4 integer,
    equipeditems5 integer,
    backpack integer NOT NULL
);


ALTER TABLE public.playercharacters OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 28369)
-- Name: rangedweapons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rangedweapons (
    attackrange integer,
    headdamage integer,
    chestdamage integer,
    legdamage integer,
    armsdamage integer,
    accuracymodifier numeric(4,2),
    firerate integer,
    firemode public.fire_mode,
    modslots integer,
    ammocapacity integer,
    recoil integer
)
INHERITS (public.items);


ALTER TABLE public.rangedweapons OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 28291)
-- Name: recruitablecharacters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recruitablecharacters (
    charactersid integer NOT NULL,
    specialization character varying(30) NOT NULL,
    recruited public.enum_boolean NOT NULL
);


ALTER TABLE public.recruitablecharacters OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 28172)
-- Name: region; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.region (
    name character varying(30),
    coordinates integer,
    biome character varying(30),
    dangerlevel smallint,
    monument character varying(30)
);


ALTER TABLE public.region OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 28411)
-- Name: regionsmonuments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.regionsmonuments (
    name character varying(30) NOT NULL,
    regionmonument character varying(30) NOT NULL
);


ALTER TABLE public.regionsmonuments OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 28390)
-- Name: resourcenodes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resourcenodes (
    id integer NOT NULL,
    nodetype public.node_type,
    maxyield integer,
    durabilitydamage double precision
);


ALTER TABLE public.resourcenodes OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 28389)
-- Name: resourcenodes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.resourcenodes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resourcenodes_id_seq OWNER TO postgres;

--
-- TOC entry 3640 (class 0 OID 0)
-- Dependencies: 243
-- Name: resourcenodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.resourcenodes_id_seq OWNED BY public.resourcenodes.id;


--
-- TOC entry 245 (class 1259 OID 28396)
-- Name: resourcenodesgenerateitems; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resourcenodesgenerateitems (
    resourcenodes integer NOT NULL,
    item integer NOT NULL
);


ALTER TABLE public.resourcenodesgenerateitems OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 28385)
-- Name: resources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resources (
    isprimary boolean NOT NULL,
    isrefinable boolean NOT NULL
)
INHERITS (public.items);


ALTER TABLE public.resources OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 28312)
-- Name: respawnlocation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.respawnlocation (
    ownerid integer,
    id integer NOT NULL,
    description character varying(300),
    timer integer,
    coordinatex character varying(5),
    coordinatey character varying(5)
);


ALTER TABLE public.respawnlocation OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 28311)
-- Name: respawnlocation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.respawnlocation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.respawnlocation_id_seq OWNER TO postgres;

--
-- TOC entry 3641 (class 0 OID 0)
-- Dependencies: 229
-- Name: respawnlocation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.respawnlocation_id_seq OWNED BY public.respawnlocation.id;


--
-- TOC entry 233 (class 1259 OID 28338)
-- Name: scientists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scientists (
    charactersid integer NOT NULL,
    hasdialogue public.enum_boolean NOT NULL
);


ALTER TABLE public.scientists OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 28158)
-- Name: structures; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.structures (
    structureid integer NOT NULL,
    monument character varying(100) NOT NULL
);


ALTER TABLE public.structures OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 28428)
-- Name: structurescontainslootcrates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.structurescontainslootcrates (
    structure integer NOT NULL,
    lootcrates integer NOT NULL
);


ALTER TABLE public.structurescontainslootcrates OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 28377)
-- Name: teas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teas (
    statusupgradetype character varying(15),
    upgradepercentage numeric(4,2)
)
INHERITS (public.consumables);


ALTER TABLE public.teas OWNER TO postgres;

--
-- TOC entry 3343 (class 2604 OID 28271)
-- Name: backpack id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backpack ALTER COLUMN id SET DEFAULT nextval('public.backpack_id_seq'::regclass);


--
-- TOC entry 3350 (class 2604 OID 28384)
-- Name: clothing id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clothing ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- TOC entry 3348 (class 2604 OID 28376)
-- Name: consumables id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consumables ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- TOC entry 3354 (class 2604 OID 28457)
-- Name: instanceditem id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instanceditem ALTER COLUMN id SET DEFAULT nextval('public.instanceditem_id_seq'::regclass);


--
-- TOC entry 3345 (class 2604 OID 28362)
-- Name: items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- TOC entry 3353 (class 2604 OID 28425)
-- Name: lootcrates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lootcrates ALTER COLUMN id SET DEFAULT nextval('public.lootcrates_id_seq'::regclass);


--
-- TOC entry 3341 (class 2604 OID 28153)
-- Name: maps id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maps ALTER COLUMN id SET DEFAULT nextval('public.maps_id_seq'::regclass);


--
-- TOC entry 3346 (class 2604 OID 28368)
-- Name: meleeweapons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.meleeweapons ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- TOC entry 3342 (class 2604 OID 28167)
-- Name: monuments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monuments ALTER COLUMN id SET DEFAULT nextval('public.monuments_id_seq'::regclass);


--
-- TOC entry 3347 (class 2604 OID 28372)
-- Name: rangedweapons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rangedweapons ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- TOC entry 3352 (class 2604 OID 28393)
-- Name: resourcenodes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resourcenodes ALTER COLUMN id SET DEFAULT nextval('public.resourcenodes_id_seq'::regclass);


--
-- TOC entry 3351 (class 2604 OID 28388)
-- Name: resources id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resources ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- TOC entry 3344 (class 2604 OID 28315)
-- Name: respawnlocation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.respawnlocation ALTER COLUMN id SET DEFAULT nextval('public.respawnlocation_id_seq'::regclass);


--
-- TOC entry 3349 (class 2604 OID 28380)
-- Name: teas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teas ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- TOC entry 3607 (class 0 OID 28328)
-- Dependencies: 232
-- Data for Name: animals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.animals (charactersid, sound, modeltype) FROM stdin;
1	roar, roooor	aligator
2	ssssss	snake
3	auuu	wolf
\.


--
-- TOC entry 3600 (class 0 OID 28268)
-- Dependencies: 225
-- Data for Name: backpack; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.backpack (ownerid, id, avaliableslots, slot, totalslots) FROM stdin;
1	1	4	2	4
2	2	4	2	4
3	3	4	2	4
\.


--
-- TOC entry 3592 (class 0 OID 28202)
-- Dependencies: 217
-- Data for Name: biomes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.biomes (biomesid, coordinates, resourceabundance, resourceavailability, type, climate) FROM stdin;
1	1	f	t	Temperate Grassland Plains	1
2	1	f	t	Temperate Grassland Hills	2
3	1	f	t	Temperate Forest	3
\.


--
-- TOC entry 3595 (class 0 OID 28227)
-- Dependencies: 220
-- Data for Name: characters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.characters (charactersid, name, "position", charactermodel, type, item) FROM stdin;
1	Character1	10	model1	type1	item1
2	Character2	5	model2	type2	item2
3	Character3	20	model3	type3	item3
\.


--
-- TOC entry 3591 (class 0 OID 28197)
-- Dependencies: 216
-- Data for Name: climate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.climate (climateid, temperature, event, statuseffect, visibility) FROM stdin;
1	30.3	event1	status1	\N
2	5.4	event2	status2	\N
3	20.2	event3	status3	\N
\.


--
-- TOC entry 3616 (class 0 OID 28381)
-- Dependencies: 241
-- Data for Name: clothing; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clothing (id, maxstacksize, itemname, itemtype, lootgrade, coldresistance, radresistance, explosionresistance, meleeresistance, rangedresistance, biteresistance, equipmentslot, wetresistance) FROM stdin;
483	1	Bandana Mask	clothes	barrel	0.10	0.03	0.00	0.10	0.05	0.03	face	0.00
484	1	Wolf Headdress	clothes	basic	0.06	0.04	0.13	0.60	0.30	0.10	head	0.00
485	1	Wood Armour Helmet	clothes	basic	0.07	0.02	0.00	0.25	0.15	0.03	head	0.00
486	1	Coffee Can Helmet	clothes	military	0.00	0.05	0.08	0.50	0.35	0.08	head	0.00
487	1	Riot Helmet	clothes	basic	0.06	0.05	0.08	0.80	0.25	0.13	head	0.00
488	1	Bucket Helmet	clothes	basic	0.06	0.04	0.08	0.50	0.20	0.08	head	0.00
489	1	Facemask	clothes	elite	-0.04	0.00	0.08	0.70	0.50	0.08	head	0.00
490	1	Boonie Hat	clothes	barrel	0.07	0.02	0.00	0.15	0.15	0.03	head	0.00
491	1	Beanie	clothes	barrel	0.07	0.01	0.00	0.10	0.10	0.03	head	0.00
492	1	Cap	clothes	barrel	0.07	0.01	0.00	0.10	0.10	0.03	head	0.00
493	1	Tank Top	clothes	barrel	0.05	0.02	0.00	0.05	0.05	0.03	chest	0.00
494	1	Burlap Shirt	clothes	barrel	0.07	0.02	0.00	0.10	0.10	0.03	chest	0.00
495	1	Hide Vest	clothes	barrel	0.05	0.02	0.00	0.10	0.15	0.08	chest	0.00
496	1	T-Shirt	clothes	basic	0.04	0.03	0.00	0.10	0.10	0.04	chest	0.00
497	1	Hoodie	clothes	basic	0.08	0.05	0.00	0.15	0.15	0.06	chest	0.00
498	1	Hide Poncho	clothes	basic	0.08	0.05	0.00	0.10	0.10	0.05	chest-armour	0.00
499	1	Wood Chestplate	clothes	basic	0.00	0.05	0.05	0.40	0.10	0.05	chest-armour	0.00
500	1	Metal Chestplate	clothes	elite	-0.08	0.00	0.00	0.20	0.25	0.03	chest-armour	0.00
501	1	Jacker	clothes	military	0.10	0.05	0.00	0.20	0.15	0.07	chest-armour	0.00
502	1	Roadsign Jacket	clothes	military	-0.08	0.00	0.00	0.25	0.20	0.10	chest-armour	0.00
503	1	Shorts	clothes	barrel	0.07	0.02	0.00	0.10	0.10	0.03	legs	0.00
504	1	Pants	clothes	basic	0.08	0.05	0.00	0.15	0.15	0.03	legs	0.00
505	1	Hide Pants	clothes	barrel	0.04	0.02	0.00	0.10	0.10	0.08	legs	0.00
506	1	Burlap Trousers	clothes	barrel	0.07	0.02	0.00	0.10	0.10	0.03	legs	0.00
507	1	Frog Boots	clothes	elite	0.08	0.05	0.00	0.00	0.00	0.00	feet	1.00
508	1	Hide Boots	clothes	basic	0.05	0.02	0.00	0.05	0.05	0.03	feet	0.00
509	1	Burlap Shoes	clothes	barrel	0.03	0.02	0.00	0.05	0.05	0.02	feet	0.00
510	1	Boots	clothes	military	0.08	0.03	0.00	0.10	0.10	0.03	feet	0.00
511	1	Leather Gloves	clothes	barrel	0.03	0.02	0.00	0.05	0.05	0.02	hands	0.00
512	1	Road Sign Gloves	clothes	military	0.00	0.04	0.02	0.10	0.10	0.05	hands	0.00
513	1	Wood Armour Pants	clothes	basic	0.00	0.05	0.05	0.40	0.10	0.05	leg-armour	0.00
514	1	Road Sign Kilt	clothes	military	-0.08	0.00	0.00	0.25	0.20	0.10	leg-armour	0.00
515	1	Bone Armour	clothes	basic	0.00	0.08	0.07	0.40	0.25	0.13	whole-body	0.00
516	1	Hazmat Suit	clothes	military	0.08	0.50	0.05	0.30	0.30	0.08	whole-body	0.00
517	1	Heavy Hazmat Suit	clothes	elite	0.12	0.70	0.10	0.50	0.50	0.15	whole-body	0.00
\.


--
-- TOC entry 3598 (class 0 OID 28262)
-- Dependencies: 223
-- Data for Name: combatlog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.combatlog (entercombatcharacters, indexlog, log) FROM stdin;
\.


--
-- TOC entry 3614 (class 0 OID 28373)
-- Dependencies: 239
-- Data for Name: consumables; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.consumables (id, maxstacksize, itemname, itemtype, lootgrade, instantheal, healovertime, hidrationyield, bleedingyield, radiationyield, poisonyield, hungeryield, vomitchance) FROM stdin;
518	20	Apple	consumable	food	2	0	15	0	0	0	30	0.00
519	20	Mushroom	consumable	food	3	0	5	0	0	0	15	0.00
520	20	Raspberry	consumable	food	10	0	20	0	0	-5	40	0.00
521	20	Blueberry	consumable	food	10	0	20	0	0	-5	30	0.00
522	20	Cactus Flesh	consumable	food	0	3	20	0	0	0	20	0.00
523	20	Tune Can	consumable	food	0	2	15	0	0	0	50	0.00
524	20	Can of Beans	consumable	food	0	4	25	0	0	0	100	0.00
525	20	Chocolate Bar	consumable	food	0	2	1	0	0	0	100	0.00
526	20	Chicken Breast	consumable	food	0	10	3	0	0	0	40	0.00
527	20	Deer Meat	consumable	food	0	10	3	0	0	0	40	0.00
528	20	Wolf Meat	consumable	food	0	5	1	0	0	0	60	0.00
529	20	Pork Meat	consumable	food	0	5	1	0	0	0	60	0.00
530	20	Bear Meat	consumable	food	0	5	1	0	0	0	100	0.00
531	20	Corn	consumable	food	0	6	5	0	0	0	40	0.00
532	20	Pumpkin	consumable	food	0	10	30	0	0	0	100	0.00
533	5	Water Bottle	consumable	food	0	0	200	-20	0	0	0	0.00
534	10	Anti-Radiation	consumable	food	0	0	-50	0	-25	0	0	0.00
535	10	Bandage	consumable	food	0	5	0	-5	0	-2	0	0.00
536	5	Medical Syringe	consumable	food	15	20	0	0	-10	0	-2	0.00
537	2	Large Medkit	consumable	food	0	100	-15	-15	-10	0	-10	0.00
\.


--
-- TOC entry 3609 (class 0 OID 28348)
-- Dependencies: 234
-- Data for Name: dialoguetext; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dialoguetext (dialogue, "character") FROM stdin;
\.


--
-- TOC entry 3597 (class 0 OID 28247)
-- Dependencies: 222
-- Data for Name: entercombatcharacters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.entercombatcharacters (entercombatcharactersid, firstcharacter, secondcharacter) FROM stdin;
\.


--
-- TOC entry 3594 (class 0 OID 28217)
-- Dependencies: 219
-- Data for Name: fauna; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fauna (fauna, biomes) FROM stdin;
\.


--
-- TOC entry 3593 (class 0 OID 28207)
-- Dependencies: 218
-- Data for Name: flora; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.flora (flora, biomes) FROM stdin;
\.


--
-- TOC entry 3596 (class 0 OID 28237)
-- Dependencies: 221
-- Data for Name: gatheryield; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gatheryield ("character", gatheryield) FROM stdin;
\.


--
-- TOC entry 3590 (class 0 OID 28180)
-- Dependencies: 215
-- Data for Name: havemapregion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.havemapregion (mapid, coordinates) FROM stdin;
\.


--
-- TOC entry 3627 (class 0 OID 28454)
-- Dependencies: 252
-- Data for Name: instanceditem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.instanceditem (id, itemid, itemdurability, quantity) FROM stdin;
\.


--
-- TOC entry 3611 (class 0 OID 28359)
-- Dependencies: 236
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.items (id, maxstacksize, itemname, itemtype, lootgrade) FROM stdin;
\.


--
-- TOC entry 3623 (class 0 OID 28422)
-- Dependencies: 248
-- Data for Name: lootcrates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lootcrates (quantifyofitens, id, grade) FROM stdin;
\.


--
-- TOC entry 3603 (class 0 OID 28301)
-- Dependencies: 228
-- Data for Name: maincharacter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.maincharacter (charactersid, owner) FROM stdin;
1	1
3	2
2	3
\.


--
-- TOC entry 3585 (class 0 OID 28150)
-- Dependencies: 210
-- Data for Name: maps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.maps (id, mapid) FROM stdin;
1	1
2	2
3	3
\.


--
-- TOC entry 3612 (class 0 OID 28365)
-- Dependencies: 237
-- Data for Name: meleeweapons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.meleeweapons (id, maxstacksize, itemname, itemtype, lootgrade, attackrange, headdamage, chestdamage, legdamage, armsdamage, treegatherrate, oregatherrate, fleshgatherrate, canbethrown) FROM stdin;
471	1	Machete	melee	tool	2	70	35	29	35	0	0	1	t
472	1	Salvage Sword	melee	basic	2	100	50	45	50	0	0	1	t
473	1	Salvage Cleaver	melee	basic	2	120	60	50	55	0	0	1	t
474	1	Longsword	melee	military	2	150	75	36	45	0	0	1	t
475	1	Mace	melee	basic	2	100	50	45	50	0	0	0	t
476	1	Stone Spear	melee	basic	2	70	35	35	28	0	0	0	t
477	1	Spear	melee	primary	2	30	25	25	13	0	0	0	t
478	1	Rock	melee	resource	1	20	10	8	8	1	1	1	t
479	1	Stone Hatchet	melee	resource	2	20	10	8	8	1	0	1	t
480	1	Stone Pickaxe	melee	resource	2	20	10	8	8	0	1	1	t
481	1	Hatchet	melee	resource	2	30	25	13	25	1	0	1	t
482	1	Pickaxe	melee	resource	2	30	25	13	25	0	1	1	t
\.


--
-- TOC entry 3588 (class 0 OID 28164)
-- Dependencies: 213
-- Data for Name: monuments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.monuments (monumentsize, id, lootgrade, enemygrade, regions, name) FROM stdin;
1	1	0	scientist	lest	Monument1
1	2	1	scientist	lest	Monument2
1	3	2	scientist	lest	Monument3
\.


--
-- TOC entry 3606 (class 0 OID 28318)
-- Dependencies: 231
-- Data for Name: npcs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.npcs (charactersid, isagressive, aggrorange, enemygrade, type) FROM stdin;
1	false	30	50	type1
2	true	40	60	type2
3	false	80	70	type3
\.


--
-- TOC entry 3625 (class 0 OID 28443)
-- Dependencies: 250
-- Data for Name: party; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.party (partyid, "character", capacity) FROM stdin;
\.


--
-- TOC entry 3601 (class 0 OID 28276)
-- Dependencies: 226
-- Data for Name: playercharacters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.playercharacters (charactersid, hydration, poisoned, hunger, type, equipeditems1, equipeditems2, equipeditems3, equipeditems4, equipeditems5, backpack) FROM stdin;
1	10	20	30	type1	1	2	3	4	5	1
2	30	20	10	type2	1	5	4	3	2	2
3	30	10	20	type3	1	3	5	4	2	3
\.


--
-- TOC entry 3613 (class 0 OID 28369)
-- Dependencies: 238
-- Data for Name: rangedweapons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rangedweapons (id, maxstacksize, itemname, itemtype, lootgrade, attackrange, headdamage, chestdamage, legdamage, armsdamage, accuracymodifier, firerate, firemode, modslots, ammocapacity, recoil) FROM stdin;
453	1	Hunting Bow	ranged	basic	150	80	50	35	40	0.50	1	single	0	1	0
454	1	Crossbow	ranged	basic	200	102	60	45	45	0.75	0	single	2	1	0
455	1	Compound Bow	ranged	basic	250	100	50	40	40	0.65	1	charged-fire	0	1	0
456	1	Waterpipe Shotgun	ranged	basic	10	210	180	75	75	1.00	0	single	0	1	2
457	1	Pump Shotgun	ranged	military	10	280	210	80	80	1.00	1	pump	2	6	2
458	1	Eoka Pistol	ranged	basic	10	210	180	75	75	1.00	0	single	0	1	2
459	1	Double Barrel Shotgun	ranged	basic	10	210	180	75	75	1.00	1	semi-auto	2	2	2
460	1	Nailgun	ranged	basic	60	36	18	12	8	2.00	3	semi-auto	0	16	1
461	1	Python Revolver	ranged	military	350	110	55	45	45	2.00	2	semi-auto	3	6	4
462	1	Revolver	ranged	basic	250	70	35	26	26	2.00	2	semi-auto	1	8	2
463	1	Custom SMG	ranged	military	200	60	35	30	35	2.00	3	full-auto	3	24	3
464	1	Thompson	ranged	military	250	76	38	30	30	2.50	3	full-auto	3	20	3
465	1	MP5A4	ranged	elite	350	70	35	29	35	3.00	3	full-auto	3	30	2
466	1	Semi-Automatic Pistol	ranged	military	250	80	40	30	40	3.00	2	semi-auto	3	10	2
467	1	Semi-Automatic Rifle	ranged	military	350	80	40	30	40	3.00	2	semi-auto	3	16	2
468	1	LR-300 Assault Rifle	ranged	elite	400	80	40	30	40	3.00	3	semi-auto	3	30	2
469	1	AK47 Assault Rifle	ranged	elite	450	85	45	35	45	3.00	3	full-auto	3	30	4
470	1	Bolt Action Rifle	ranged	elite	900	150	75	50	50	5.00	1	single	3	4	5
\.


--
-- TOC entry 3602 (class 0 OID 28291)
-- Dependencies: 227
-- Data for Name: recruitablecharacters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recruitablecharacters (charactersid, specialization, recruited) FROM stdin;
1	Melee Weapons	true
2	Bows	false
3	Handguns	true
\.


--
-- TOC entry 3589 (class 0 OID 28172)
-- Dependencies: 214
-- Data for Name: region; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.region (name, coordinates, biome, dangerlevel, monument) FROM stdin;
\.


--
-- TOC entry 3621 (class 0 OID 28411)
-- Dependencies: 246
-- Data for Name: regionsmonuments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.regionsmonuments (name, regionmonument) FROM stdin;
\.


--
-- TOC entry 3619 (class 0 OID 28390)
-- Dependencies: 244
-- Data for Name: resourcenodes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resourcenodes (id, nodetype, maxyield, durabilitydamage) FROM stdin;
36	sulfur	300	7.5
37	stone	1000	7.5
38	metal	600	7.5
39	tree	500	3.75
40	cactus	3	2.5
\.


--
-- TOC entry 3620 (class 0 OID 28396)
-- Dependencies: 245
-- Data for Name: resourcenodesgenerateitems; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resourcenodesgenerateitems (resourcenodes, item) FROM stdin;
\.


--
-- TOC entry 3617 (class 0 OID 28385)
-- Dependencies: 242
-- Data for Name: resources; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resources (id, maxstacksize, itemname, itemtype, lootgrade, isprimary, isrefinable) FROM stdin;
436	1000	Wood	resource	primary	t	f
437	1000	Stone	resource	primary	t	f
438	1000	Bone Fragments	resource	primary	t	f
439	1000	Leather	resource	primary	t	f
440	1000	Cloth	resource	primary	t	f
441	1000	Scrap	resource	primary	t	f
442	100	High Quality Metal Ore	resource	primary	t	t
443	500	Animal Fat	resource	primary	t	t
444	500	Crude Oil	resource	primary	t	t
445	1000	Metal Ore	resource	primary	t	t
446	1000	Sulfur Ore	resource	primary	t	t
447	100	High Quality Metal	resource	resource	f	f
448	500	Low Grade Fuel	resource	resource	f	f
449	1000	Metal Fragments	resource	resource	f	f
450	1000	Sulfur	resource	resource	f	f
451	1000	Charcoal	resource	resource	f	f
452	1000	Gunpowder	resource	resource	f	f
\.


--
-- TOC entry 3605 (class 0 OID 28312)
-- Dependencies: 230
-- Data for Name: respawnlocation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.respawnlocation (ownerid, id, description, timer, coordinatex, coordinatey) FROM stdin;
\.


--
-- TOC entry 3608 (class 0 OID 28338)
-- Dependencies: 233
-- Data for Name: scientists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scientists (charactersid, hasdialogue) FROM stdin;
1	true
2	false
3	true
\.


--
-- TOC entry 3586 (class 0 OID 28158)
-- Dependencies: 211
-- Data for Name: structures; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.structures (structureid, monument) FROM stdin;
1	Structure1
2	Structure2
3	Structure3
\.


--
-- TOC entry 3624 (class 0 OID 28428)
-- Dependencies: 249
-- Data for Name: structurescontainslootcrates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.structurescontainslootcrates (structure, lootcrates) FROM stdin;
\.


--
-- TOC entry 3615 (class 0 OID 28377)
-- Dependencies: 240
-- Data for Name: teas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teas (id, maxstacksize, itemname, itemtype, lootgrade, instantheal, healovertime, hidrationyield, bleedingyield, radiationyield, poisonyield, hungeryield, vomitchance, statusupgradetype, upgradepercentage) FROM stdin;
538	5	Normal Max Health Tea	tea	food	0	0	0	0	0	0	0	0.00	health	0.05
539	5	Advanced Max Health Tea	tea	food	0	0	0	0	0	0	0	0.00	health	0.13
540	5	Pure Max Health Tea	tea	food	0	0	0	0	0	0	0	0.00	health	0.20
541	5	Normal Healing Tea	tea	food	0	0	30	0	0	0	0	0.00	health	0.00
542	5	Advanced Healing Tea	tea	food	0	45	0	0	0	0	0	0.00	health	0.00
543	5	Pure Healing Tea	tea	food	0	60	0	0	0	0	0	0.00	health	0.00
544	5	Normal Ore Tea	tea	food	0	0	0	0	0	0	0	0.00	mining	0.10
545	5	Advanced Ore Tea	tea	food	0	0	0	0	0	0	0	0.00	mining	0.30
546	5	Pure Ore Tea	tea	food	0	0	0	0	0	0	0	0.00	mining	0.50
547	5	Normal Wood Tea	tea	food	0	0	0	0	0	0	0	0.00	woodcutting	0.10
548	5	Advanced Wood Tea	tea	food	0	0	0	0	0	0	0	0.00	woodcutting	0.30
549	5	Pure Wood Tea	tea	food	0	0	0	0	0	0	0	0.00	woodcutting	0.50
550	5	Normal Scrap Tea	tea	food	0	0	0	0	0	0	0	0.00	scrap	0.10
551	5	Advanced Scrap Tea	tea	food	0	0	0	0	0	0	0	0.00	scrap	0.30
552	5	Pure Scrap Tea	tea	food	0	0	0	0	0	0	0	0.00	scrap	0.50
553	5	Normal Radiation Tea	tea	food	0	0	0	0	-60	0	0	0.00	radiation	0.00
554	5	Advanced Radiation Tea	tea	food	0	0	0	-80	0	0	0	0.00	radiation	0.00
555	5	Pure Radiation Tea	tea	food	0	0	0	0	0	0	-100	0.00	radiation	0.00
556	5	Normal Radiation Resistance Tea	tea	food	0	0	0	0	0	0	0	0.00	radiation	0.10
557	5	Advanced Radiation Resistance Tea	tea	food	0	0	0	0	0	0	0	0.00	radiation	0.30
558	5	Pure Radiation Resistance Tea	tea	food	0	0	0	0	0	0	0	0.00	radiation	0.50
\.


--
-- TOC entry 3642 (class 0 OID 0)
-- Dependencies: 224
-- Name: backpack_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.backpack_id_seq', 1, false);


--
-- TOC entry 3643 (class 0 OID 0)
-- Dependencies: 251
-- Name: instanceditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.instanceditem_id_seq', 1, false);


--
-- TOC entry 3644 (class 0 OID 0)
-- Dependencies: 235
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.items_id_seq', 558, true);


--
-- TOC entry 3645 (class 0 OID 0)
-- Dependencies: 247
-- Name: lootcrates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lootcrates_id_seq', 1, false);


--
-- TOC entry 3646 (class 0 OID 0)
-- Dependencies: 209
-- Name: maps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.maps_id_seq', 1, false);


--
-- TOC entry 3647 (class 0 OID 0)
-- Dependencies: 212
-- Name: monuments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.monuments_id_seq', 1, false);


--
-- TOC entry 3648 (class 0 OID 0)
-- Dependencies: 243
-- Name: resourcenodes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.resourcenodes_id_seq', 40, true);


--
-- TOC entry 3649 (class 0 OID 0)
-- Dependencies: 229
-- Name: respawnlocation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.respawnlocation_id_seq', 1, false);


--
-- TOC entry 3386 (class 2606 OID 28275)
-- Name: backpack backpack_ownerid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backpack
    ADD CONSTRAINT backpack_ownerid_key UNIQUE (ownerid);


--
-- TOC entry 3388 (class 2606 OID 28273)
-- Name: backpack backpack_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backpack
    ADD CONSTRAINT backpack_pkey PRIMARY KEY (id);


--
-- TOC entry 3372 (class 2606 OID 28206)
-- Name: biomes biomes_biomesid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.biomes
    ADD CONSTRAINT biomes_biomesid_key UNIQUE (biomesid);


--
-- TOC entry 3370 (class 2606 OID 28201)
-- Name: climate climate_climateid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.climate
    ADD CONSTRAINT climate_climateid_key UNIQUE (climateid);


--
-- TOC entry 3366 (class 2606 OID 28186)
-- Name: havemapregion havemapregion_mapid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.havemapregion
    ADD CONSTRAINT havemapregion_mapid_key UNIQUE (mapid);


--
-- TOC entry 3420 (class 2606 OID 28459)
-- Name: instanceditem instanceditem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instanceditem
    ADD CONSTRAINT instanceditem_pkey PRIMARY KEY (id);


--
-- TOC entry 3406 (class 2606 OID 28364)
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- TOC entry 3414 (class 2606 OID 28427)
-- Name: lootcrates lootcrates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lootcrates
    ADD CONSTRAINT lootcrates_pkey PRIMARY KEY (id);


--
-- TOC entry 3356 (class 2606 OID 28157)
-- Name: maps maps_mapid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maps
    ADD CONSTRAINT maps_mapid_key UNIQUE (mapid);


--
-- TOC entry 3358 (class 2606 OID 28155)
-- Name: maps maps_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maps
    ADD CONSTRAINT maps_pkey PRIMARY KEY (id);


--
-- TOC entry 3362 (class 2606 OID 28171)
-- Name: monuments monuments_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monuments
    ADD CONSTRAINT monuments_name_key UNIQUE (name);


--
-- TOC entry 3364 (class 2606 OID 28169)
-- Name: monuments monuments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monuments
    ADD CONSTRAINT monuments_pkey PRIMARY KEY (id);


--
-- TOC entry 3400 (class 2606 OID 28332)
-- Name: animals pk_animals; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.animals
    ADD CONSTRAINT pk_animals PRIMARY KEY (charactersid);


--
-- TOC entry 3378 (class 2606 OID 28231)
-- Name: characters pk_characters; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters
    ADD CONSTRAINT pk_characters PRIMARY KEY (charactersid);


--
-- TOC entry 3384 (class 2606 OID 28266)
-- Name: combatlog pk_combatlog; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.combatlog
    ADD CONSTRAINT pk_combatlog PRIMARY KEY (entercombatcharacters, indexlog);


--
-- TOC entry 3404 (class 2606 OID 28352)
-- Name: dialoguetext pk_dialoguetext; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dialoguetext
    ADD CONSTRAINT pk_dialoguetext PRIMARY KEY (dialogue);


--
-- TOC entry 3382 (class 2606 OID 28251)
-- Name: entercombatcharacters pk_entercombatcharacters; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entercombatcharacters
    ADD CONSTRAINT pk_entercombatcharacters PRIMARY KEY (entercombatcharactersid);


--
-- TOC entry 3376 (class 2606 OID 28221)
-- Name: fauna pk_fauna; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fauna
    ADD CONSTRAINT pk_fauna PRIMARY KEY (fauna);


--
-- TOC entry 3374 (class 2606 OID 28211)
-- Name: flora pk_flora; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flora
    ADD CONSTRAINT pk_flora PRIMARY KEY (flora);


--
-- TOC entry 3380 (class 2606 OID 28241)
-- Name: gatheryield pk_gatheryield; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gatheryield
    ADD CONSTRAINT pk_gatheryield PRIMARY KEY ("character", gatheryield);


--
-- TOC entry 3368 (class 2606 OID 28184)
-- Name: havemapregion pk_havemapregion; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.havemapregion
    ADD CONSTRAINT pk_havemapregion PRIMARY KEY (mapid, coordinates);


--
-- TOC entry 3394 (class 2606 OID 28305)
-- Name: maincharacter pk_maincharacter; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maincharacter
    ADD CONSTRAINT pk_maincharacter PRIMARY KEY (charactersid, owner);


--
-- TOC entry 3398 (class 2606 OID 28322)
-- Name: npcs pk_npcs; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.npcs
    ADD CONSTRAINT pk_npcs PRIMARY KEY (charactersid);


--
-- TOC entry 3418 (class 2606 OID 28447)
-- Name: party pk_party; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.party
    ADD CONSTRAINT pk_party PRIMARY KEY (partyid);


--
-- TOC entry 3390 (class 2606 OID 28280)
-- Name: playercharacters pk_playercharacters; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playercharacters
    ADD CONSTRAINT pk_playercharacters PRIMARY KEY (charactersid);


--
-- TOC entry 3392 (class 2606 OID 28295)
-- Name: recruitablecharacters pk_recruitablecharacters; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recruitablecharacters
    ADD CONSTRAINT pk_recruitablecharacters PRIMARY KEY (charactersid);


--
-- TOC entry 3412 (class 2606 OID 28415)
-- Name: regionsmonuments pk_regionsmonuments; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regionsmonuments
    ADD CONSTRAINT pk_regionsmonuments PRIMARY KEY (name, regionmonument);


--
-- TOC entry 3410 (class 2606 OID 28400)
-- Name: resourcenodesgenerateitems pk_resourcenodesgenerateitems; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resourcenodesgenerateitems
    ADD CONSTRAINT pk_resourcenodesgenerateitems PRIMARY KEY (resourcenodes, item);


--
-- TOC entry 3402 (class 2606 OID 28342)
-- Name: scientists pk_scientists; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scientists
    ADD CONSTRAINT pk_scientists PRIMARY KEY (charactersid);


--
-- TOC entry 3360 (class 2606 OID 28162)
-- Name: structures pk_structures; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structures
    ADD CONSTRAINT pk_structures PRIMARY KEY (structureid);


--
-- TOC entry 3416 (class 2606 OID 28432)
-- Name: structurescontainslootcrates pk_structurescontainslootcrates; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structurescontainslootcrates
    ADD CONSTRAINT pk_structurescontainslootcrates PRIMARY KEY (structure, lootcrates);


--
-- TOC entry 3408 (class 2606 OID 28395)
-- Name: resourcenodes resourcenodes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resourcenodes
    ADD CONSTRAINT resourcenodes_pkey PRIMARY KEY (id);


--
-- TOC entry 3396 (class 2606 OID 28317)
-- Name: respawnlocation respawnlocation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.respawnlocation
    ADD CONSTRAINT respawnlocation_pkey PRIMARY KEY (id);


--
-- TOC entry 3435 (class 2606 OID 28333)
-- Name: animals fk_animals_characters; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.animals
    ADD CONSTRAINT fk_animals_characters FOREIGN KEY (charactersid) REFERENCES public.characters(charactersid) ON DELETE RESTRICT;


--
-- TOC entry 3426 (class 2606 OID 28232)
-- Name: characters fk_characters_climate; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

--
-- TOC entry 3423 (class 2606 OID 28192)
-- Name: havemapregion fk_coordinates_havemapregion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.havemapregion
    ADD CONSTRAINT fk_coordinates_havemapregion FOREIGN KEY (coordinates) REFERENCES public.structures(structureid) ON DELETE RESTRICT;


--
-- TOC entry 3437 (class 2606 OID 28353)
-- Name: dialoguetext fk_dialoguetext_characters; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dialoguetext
    ADD CONSTRAINT fk_dialoguetext_characters FOREIGN KEY ("character") REFERENCES public.characters(charactersid) ON DELETE RESTRICT;


--
-- TOC entry 3428 (class 2606 OID 28252)
-- Name: entercombatcharacters fk_entercombatcharacters_characters_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entercombatcharacters
    ADD CONSTRAINT fk_entercombatcharacters_characters_1 FOREIGN KEY (firstcharacter) REFERENCES public.characters(charactersid) ON DELETE RESTRICT;


--
-- TOC entry 3429 (class 2606 OID 28257)
-- Name: entercombatcharacters fk_entercombatcharacters_characters_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entercombatcharacters
    ADD CONSTRAINT fk_entercombatcharacters_characters_2 FOREIGN KEY (secondcharacter) REFERENCES public.characters(charactersid) ON DELETE RESTRICT;


--
-- TOC entry 3425 (class 2606 OID 28222)
-- Name: fauna fk_fauna_biomes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fauna
    ADD CONSTRAINT fk_fauna_biomes FOREIGN KEY (biomes) REFERENCES public.biomes(biomesid) ON DELETE RESTRICT;


--
-- TOC entry 3424 (class 2606 OID 28212)
-- Name: flora fk_flora_biomes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flora
    ADD CONSTRAINT fk_flora_biomes FOREIGN KEY (biomes) REFERENCES public.biomes(biomesid) ON DELETE RESTRICT;


--
-- TOC entry 3427 (class 2606 OID 28242)
-- Name: gatheryield fk_gatheryield_characters; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gatheryield
    ADD CONSTRAINT fk_gatheryield_characters FOREIGN KEY ("character") REFERENCES public.characters(charactersid) ON DELETE RESTRICT;


--
-- TOC entry 3433 (class 2606 OID 28306)
-- Name: maincharacter fk_maincharacter_characters; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maincharacter
    ADD CONSTRAINT fk_maincharacter_characters FOREIGN KEY (charactersid) REFERENCES public.characters(charactersid) ON DELETE RESTRICT;


--
-- TOC entry 3422 (class 2606 OID 28187)
-- Name: havemapregion fk_mapid_havemapregion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.havemapregion
    ADD CONSTRAINT fk_mapid_havemapregion FOREIGN KEY (mapid) REFERENCES public.maps(mapid) ON DELETE RESTRICT;


--
-- TOC entry 3434 (class 2606 OID 28323)
-- Name: npcs fk_npcs_characters; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.npcs
    ADD CONSTRAINT fk_npcs_characters FOREIGN KEY (charactersid) REFERENCES public.characters(charactersid) ON DELETE RESTRICT;


--
-- TOC entry 3443 (class 2606 OID 28448)
-- Name: party fk_party_characters; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.party
    ADD CONSTRAINT fk_party_characters FOREIGN KEY ("character") REFERENCES public.characters(charactersid) ON DELETE RESTRICT;


--
-- TOC entry 3431 (class 2606 OID 28286)
-- Name: playercharacters fk_playercharacters_backpack; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playercharacters
    ADD CONSTRAINT fk_playercharacters_backpack FOREIGN KEY (backpack) REFERENCES public.backpack(ownerid) ON DELETE RESTRICT;


--
-- TOC entry 3430 (class 2606 OID 28281)
-- Name: playercharacters fk_playercharacters_characters; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playercharacters
    ADD CONSTRAINT fk_playercharacters_characters FOREIGN KEY (charactersid) REFERENCES public.characters(charactersid) ON DELETE RESTRICT;


--
-- TOC entry 3432 (class 2606 OID 28296)
-- Name: recruitablecharacters fk_recruitablecharacters_characters; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recruitablecharacters
    ADD CONSTRAINT fk_recruitablecharacters_characters FOREIGN KEY (charactersid) REFERENCES public.characters(charactersid) ON DELETE RESTRICT;


--
-- TOC entry 3440 (class 2606 OID 28416)
-- Name: regionsmonuments fk_regionsmonuments_monuments; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regionsmonuments
    ADD CONSTRAINT fk_regionsmonuments_monuments FOREIGN KEY (name) REFERENCES public.monuments(name) ON DELETE RESTRICT;


--
-- TOC entry 3439 (class 2606 OID 28406)
-- Name: resourcenodesgenerateitems fk_resourcenodesgenerateitems_items; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resourcenodesgenerateitems
    ADD CONSTRAINT fk_resourcenodesgenerateitems_items FOREIGN KEY (item) REFERENCES public.items(id) ON DELETE RESTRICT;


--
-- TOC entry 3438 (class 2606 OID 28401)
-- Name: resourcenodesgenerateitems fk_resourcenodesgenerateitems_resourcenodes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resourcenodesgenerateitems
    ADD CONSTRAINT fk_resourcenodesgenerateitems_resourcenodes FOREIGN KEY (resourcenodes) REFERENCES public.resourcenodes(id) ON DELETE RESTRICT;


--
-- TOC entry 3436 (class 2606 OID 28343)
-- Name: scientists fk_scientists_characters; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scientists
    ADD CONSTRAINT fk_scientists_characters FOREIGN KEY (charactersid) REFERENCES public.characters(charactersid) ON DELETE RESTRICT;


--
-- TOC entry 3442 (class 2606 OID 28438)
-- Name: structurescontainslootcrates fk_structurescontainslootcrates_lootcrates; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structurescontainslootcrates
    ADD CONSTRAINT fk_structurescontainslootcrates_lootcrates FOREIGN KEY (lootcrates) REFERENCES public.lootcrates(id) ON DELETE RESTRICT;


--
-- TOC entry 3441 (class 2606 OID 28433)
-- Name: structurescontainslootcrates fk_structurescontainslootcrates_structures; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structurescontainslootcrates
    ADD CONSTRAINT fk_structurescontainslootcrates_structures FOREIGN KEY (structure) REFERENCES public.structures(structureid) ON DELETE RESTRICT;


--
-- TOC entry 3444 (class 2606 OID 28460)
-- Name: instanceditem instanceditem_itemid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instanceditem
    ADD CONSTRAINT instanceditem_itemid_fkey FOREIGN KEY (itemid) REFERENCES public.items(id);


--
-- TOC entry 3421 (class 2606 OID 28175)
-- Name: region region_monument_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region
    ADD CONSTRAINT region_monument_fkey FOREIGN KEY (monument) REFERENCES public.monuments(name) ON DELETE RESTRICT;


--
-- TOC entry 3633 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2022-03-28 21:27:00

--
-- PostgreSQL database dump complete
--

