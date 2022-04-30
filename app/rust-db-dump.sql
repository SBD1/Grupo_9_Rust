--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

-- Started on 2022-04-29 23:50:50

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
-- TOC entry 878 (class 1247 OID 33622)
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
-- TOC entry 881 (class 1247 OID 33632)
-- Name: enum_boolean; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_boolean AS ENUM (
    'true',
    'false'
);


ALTER TYPE public.enum_boolean OWNER TO postgres;

--
-- TOC entry 872 (class 1247 OID 33606)
-- Name: enum_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_status AS ENUM (
    'HIGH',
    'MEDIUM',
    'LOW'
);


ALTER TYPE public.enum_status OWNER TO postgres;

--
-- TOC entry 863 (class 1247 OID 33562)
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
-- TOC entry 860 (class 1247 OID 33548)
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
-- TOC entry 857 (class 1247 OID 33532)
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
-- TOC entry 854 (class 1247 OID 33514)
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
-- TOC entry 875 (class 1247 OID 33614)
-- Name: monument_tier; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.monument_tier AS ENUM (
    'basic',
    'military',
    'elite'
);


ALTER TYPE public.monument_tier OWNER TO postgres;

--
-- TOC entry 869 (class 1247 OID 33594)
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
-- TOC entry 866 (class 1247 OID 33582)
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

--
-- TOC entry 241 (class 1255 OID 33750)
-- Name: insert_biomes(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.insert_biomes() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    PERFORM * FROM Biomes WHERE biomesID = new.biomesID;
    IF FOUND THEN
        RAISE EXCEPTION 'Biome already exists';
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.insert_biomes() OWNER TO postgres;

--
-- TOC entry 237 (class 1255 OID 33749)
-- Name: insert_climate(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.insert_climate() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    PERFORM * FROM Climate WHERE climateID = new.climateID;
    IF FOUND THEN
        RAISE EXCEPTION 'Climate already exists';
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.insert_climate() OWNER TO postgres;

--
-- TOC entry 235 (class 1255 OID 33747)
-- Name: insert_map(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.insert_map() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    PERFORM * FROM Maps WHERE mapID = new.mapID;
    IF FOUND THEN
        RAISE EXCEPTION 'Map already exists';
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.insert_map() OWNER TO postgres;

--
-- TOC entry 242 (class 1255 OID 33751)
-- Name: insert_party(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.insert_party() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    PERFORM * FROM Party WHERE partyID = new.partyID;
    IF FOUND THEN
        RAISE EXCEPTION 'Party already exists';
    END IF;
    PERFORM * FROM Party where character = new.character;
    IF FOUND THEN
        RAISE EXCEPTION 'Character is already in a party';
    END IF;
    PERFORM * FROM Party where capacity = 8;
    IF FOUND THEN
        RAISE EXCEPTION 'Party is already full';
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.insert_party() OWNER TO postgres;

--
-- TOC entry 236 (class 1255 OID 33748)
-- Name: insert_region(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.insert_region() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    PERFORM * FROM Region WHERE name = new.name;
    IF FOUND THEN
        RAISE EXCEPTION 'Region already exists';
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.insert_region() OWNER TO postgres;

--
-- TOC entry 244 (class 1255 OID 33753)
-- Name: insertbackpack(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.insertbackpack() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE PlayerCharacters SET backpack = new.id WHERE id = new.ownerID;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.insertbackpack() OWNER TO postgres;

--
-- TOC entry 243 (class 1255 OID 33752)
-- Name: insertcharacter_backpack(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.insertcharacter_backpack() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO backpack(ownerID) VALUES (new.id);
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.insertcharacter_backpack() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 213 (class 1259 OID 33652)
-- Name: backpack; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.backpack (
    ownerid integer,
    id integer NOT NULL,
    slot01 integer,
    slot02 integer,
    slot03 integer,
    slot04 integer,
    slot05 integer,
    slot06 integer,
    slot07 integer,
    slot08 integer,
    slot09 integer,
    slot10 integer
);


ALTER TABLE public.backpack OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 33651)
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
-- TOC entry 3490 (class 0 OID 0)
-- Dependencies: 212
-- Name: backpack_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.backpack_id_seq OWNED BY public.backpack.id;


--
-- TOC entry 215 (class 1259 OID 33659)
-- Name: characters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.characters (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(30) NOT NULL
);


ALTER TABLE public.characters OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 33658)
-- Name: characters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.characters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.characters_id_seq OWNER TO postgres;

--
-- TOC entry 3491 (class 0 OID 0)
-- Dependencies: 214
-- Name: characters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.characters_id_seq OWNED BY public.characters.id;


--
-- TOC entry 219 (class 1259 OID 33674)
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
-- TOC entry 224 (class 1259 OID 33696)
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
-- TOC entry 222 (class 1259 OID 33688)
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
-- TOC entry 234 (class 1259 OID 33736)
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
-- TOC entry 233 (class 1259 OID 33735)
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
-- TOC entry 3492 (class 0 OID 0)
-- Dependencies: 233
-- Name: instanceditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.instanceditem_id_seq OWNED BY public.instanceditem.id;


--
-- TOC entry 218 (class 1259 OID 33673)
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
-- TOC entry 3493 (class 0 OID 0)
-- Dependencies: 218
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;


--
-- TOC entry 231 (class 1259 OID 33719)
-- Name: loot_crate_instance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.loot_crate_instance (
    id integer NOT NULL,
    loot_grade public.loot_grade,
    item1_id integer,
    item2_id integer,
    item3_id integer,
    item4_id integer,
    item5_id integer,
    item6_id integer,
    item7_id integer
);


ALTER TABLE public.loot_crate_instance OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 33718)
-- Name: loot_crate_instance_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.loot_crate_instance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.loot_crate_instance_id_seq OWNER TO postgres;

--
-- TOC entry 3494 (class 0 OID 0)
-- Dependencies: 230
-- Name: loot_crate_instance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.loot_crate_instance_id_seq OWNED BY public.loot_crate_instance.id;


--
-- TOC entry 229 (class 1259 OID 33712)
-- Name: lootcrates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lootcrates (
    item_quantity integer,
    id integer NOT NULL,
    grade public.loot_grade
);


ALTER TABLE public.lootcrates OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 33711)
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
-- TOC entry 3495 (class 0 OID 0)
-- Dependencies: 228
-- Name: lootcrates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lootcrates_id_seq OWNED BY public.lootcrates.id;


--
-- TOC entry 220 (class 1259 OID 33680)
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
-- TOC entry 211 (class 1259 OID 33643)
-- Name: monuments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.monuments (
    id integer NOT NULL,
    monumentsize integer,
    lootgrade public.monument_tier,
    name character varying(30)
);


ALTER TABLE public.monuments OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 33642)
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
-- TOC entry 3496 (class 0 OID 0)
-- Dependencies: 210
-- Name: monuments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.monuments_id_seq OWNED BY public.monuments.id;


--
-- TOC entry 217 (class 1259 OID 33669)
-- Name: npcs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.npcs (
    isagressive boolean NOT NULL,
    typenpc character varying(30) NOT NULL,
    grade character varying(30) NOT NULL
)
INHERITS (public.characters);


ALTER TABLE public.npcs OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 33725)
-- Name: party; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.party (
    id integer NOT NULL,
    "character" integer NOT NULL,
    capacity integer NOT NULL
);


ALTER TABLE public.party OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 33665)
-- Name: playercharacters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.playercharacters (
    hydration integer NOT NULL,
    poisoned integer NOT NULL,
    hunger integer NOT NULL,
    equipeditems1 integer,
    equipeditems2 integer,
    equipeditems3 integer,
    equipeditems4 integer,
    equipeditems5 integer,
    backpack integer
)
INHERITS (public.characters);


ALTER TABLE public.playercharacters OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 33684)
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
-- TOC entry 227 (class 1259 OID 33705)
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
-- TOC entry 226 (class 1259 OID 33704)
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
-- TOC entry 3497 (class 0 OID 0)
-- Dependencies: 226
-- Name: resourcenodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.resourcenodes_id_seq OWNED BY public.resourcenodes.id;


--
-- TOC entry 225 (class 1259 OID 33700)
-- Name: resources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resources (
    isprimary boolean NOT NULL,
    isrefinable boolean NOT NULL
)
INHERITS (public.items);


ALTER TABLE public.resources OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 33637)
-- Name: structures; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.structures (
    id integer NOT NULL,
    combat_enemy boolean,
    name character varying(30) NOT NULL
);


ALTER TABLE public.structures OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 33692)
-- Name: teas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teas (
    statusupgradetype character varying(15),
    upgradepercentage numeric(4,2)
)
INHERITS (public.consumables);


ALTER TABLE public.teas OWNER TO postgres;

--
-- TOC entry 3277 (class 2604 OID 33655)
-- Name: backpack id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backpack ALTER COLUMN id SET DEFAULT nextval('public.backpack_id_seq'::regclass);


--
-- TOC entry 3278 (class 2604 OID 33662)
-- Name: characters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters ALTER COLUMN id SET DEFAULT nextval('public.characters_id_seq'::regclass);


--
-- TOC entry 3286 (class 2604 OID 33699)
-- Name: clothing id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clothing ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- TOC entry 3284 (class 2604 OID 33691)
-- Name: consumables id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consumables ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- TOC entry 3291 (class 2604 OID 33739)
-- Name: instanceditem id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instanceditem ALTER COLUMN id SET DEFAULT nextval('public.instanceditem_id_seq'::regclass);


--
-- TOC entry 3281 (class 2604 OID 33677)
-- Name: items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- TOC entry 3290 (class 2604 OID 33722)
-- Name: loot_crate_instance id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loot_crate_instance ALTER COLUMN id SET DEFAULT nextval('public.loot_crate_instance_id_seq'::regclass);


--
-- TOC entry 3289 (class 2604 OID 33715)
-- Name: lootcrates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lootcrates ALTER COLUMN id SET DEFAULT nextval('public.lootcrates_id_seq'::regclass);


--
-- TOC entry 3282 (class 2604 OID 33683)
-- Name: meleeweapons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.meleeweapons ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- TOC entry 3276 (class 2604 OID 33646)
-- Name: monuments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monuments ALTER COLUMN id SET DEFAULT nextval('public.monuments_id_seq'::regclass);


--
-- TOC entry 3280 (class 2604 OID 33672)
-- Name: npcs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.npcs ALTER COLUMN id SET DEFAULT nextval('public.characters_id_seq'::regclass);


--
-- TOC entry 3279 (class 2604 OID 33668)
-- Name: playercharacters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playercharacters ALTER COLUMN id SET DEFAULT nextval('public.characters_id_seq'::regclass);


--
-- TOC entry 3283 (class 2604 OID 33687)
-- Name: rangedweapons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rangedweapons ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- TOC entry 3288 (class 2604 OID 33708)
-- Name: resourcenodes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resourcenodes ALTER COLUMN id SET DEFAULT nextval('public.resourcenodes_id_seq'::regclass);


--
-- TOC entry 3287 (class 2604 OID 33703)
-- Name: resources id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resources ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- TOC entry 3285 (class 2604 OID 33695)
-- Name: teas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teas ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- TOC entry 3462 (class 0 OID 33652)
-- Dependencies: 213
-- Data for Name: backpack; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.backpack (ownerid, id, slot01, slot02, slot03, slot04, slot05, slot06, slot07, slot08, slot09, slot10) FROM stdin;
14	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20	7	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
24	11	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
25	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
26	13	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
27	14	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
28	15	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
29	16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
30	17	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
31	18	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
32	19	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
33	20	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
34	21	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
35	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
36	23	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
37	24	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
38	25	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
39	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
40	27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
41	28	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
42	29	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
43	30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
44	31	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
45	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
46	33	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
47	34	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
48	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
49	36	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
50	37	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
51	38	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
52	39	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
53	40	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
54	41	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
55	42	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
56	43	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
57	44	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
58	45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
59	46	39	\N	\N	\N	\N	\N	\N	\N	\N	\N
60	47	39	\N	\N	\N	\N	\N	\N	\N	\N	\N
61	48	39	\N	\N	\N	\N	\N	\N	\N	\N	\N
62	49	39	\N	\N	\N	\N	\N	\N	\N	\N	\N
63	50	39	\N	\N	\N	\N	\N	\N	\N	\N	\N
64	51	39	\N	\N	\N	\N	\N	\N	\N	\N	\N
65	52	39	\N	\N	\N	\N	\N	\N	\N	\N	\N
66	53	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
67	54	39	\N	\N	\N	\N	\N	\N	\N	\N	\N
97	84	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
70	57	38	19	80	38	19	80	\N	\N	\N	\N
72	59	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
73	60	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
74	61	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
75	62	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
98	85	\N	\N	\N	40	64	\N	\N	\N	\N	\N
71	58	28	29	79	81	22	31	\N	\N	\N	\N
76	63	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
77	64	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
78	65	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
79	66	63	\N	\N	\N	\N	\N	\N	\N	\N	\N
80	67	67	79	81	75	29	31	\N	\N	\N	\N
81	68	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
82	69	81	31	32	28	\N	\N	\N	\N	\N	\N
68	55	41	41	52	25	25	52	52	52	\N	\N
83	70	21	50	52	18	62	\N	\N	\N	\N	\N
99	86	73	18	64	49	\N	\N	\N	\N	\N	\N
84	71	73	63	\N	\N	\N	\N	\N	\N	\N	\N
100	87	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
101	88	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
102	89	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
103	90	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
85	72	24	64	37	62	27	\N	\N	\N	\N	\N
86	73	62	\N	\N	\N	\N	\N	\N	\N	\N	\N
87	74	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
88	75	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
104	91	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
69	56	39	41	\N	\N	25	\N	\N	52	\N	\N
89	76	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
90	77	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
91	78	17	47	\N	\N	\N	\N	\N	\N	\N	\N
92	79	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
105	92	52	49	20	\N	\N	\N	\N	\N	\N	\N
93	80	19	50	37	27	24	\N	\N	\N	\N	\N
106	93	41	53	59	\N	\N	\N	\N	\N	\N	\N
94	81	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
107	94	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
95	82	49	27	76	18	69	\N	\N	\N	\N	\N
96	83	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3464 (class 0 OID 33659)
-- Dependencies: 215
-- Data for Name: characters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.characters (id, name, type) FROM stdin;
\.


--
-- TOC entry 3473 (class 0 OID 33696)
-- Dependencies: 224
-- Data for Name: clothing; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clothing (id, maxstacksize, itemname, itemtype, lootgrade, coldresistance, radresistance, explosionresistance, meleeresistance, rangedresistance, biteresistance, equipmentslot, wetresistance) FROM stdin;
48	1	Bandana Mask	clothes	barrel	0.10	0.03	0.00	0.10	0.05	0.03	face	0.00
49	1	Wolf Headdress	clothes	basic	0.06	0.04	0.13	0.60	0.30	0.10	head	0.00
50	1	Wood Armour Helmet	clothes	basic	0.07	0.02	0.00	0.25	0.15	0.03	head	0.00
51	1	Coffee Can Helmet	clothes	military	0.00	0.05	0.08	0.50	0.35	0.08	head	0.00
52	1	Riot Helmet	clothes	basic	0.06	0.05	0.08	0.80	0.25	0.13	head	0.00
53	1	Bucket Helmet	clothes	basic	0.06	0.04	0.08	0.50	0.20	0.08	head	0.00
54	1	Facemask	clothes	elite	-0.04	0.00	0.08	0.70	0.50	0.08	head	0.00
55	1	Boonie Hat	clothes	barrel	0.07	0.02	0.00	0.15	0.15	0.03	head	0.00
56	1	Beanie	clothes	barrel	0.07	0.01	0.00	0.10	0.10	0.03	head	0.00
57	1	Cap	clothes	barrel	0.07	0.01	0.00	0.10	0.10	0.03	head	0.00
58	1	Tank Top	clothes	barrel	0.05	0.02	0.00	0.05	0.05	0.03	chest	0.00
59	1	Burlap Shirt	clothes	barrel	0.07	0.02	0.00	0.10	0.10	0.03	chest	0.00
60	1	Hide Vest	clothes	barrel	0.05	0.02	0.00	0.10	0.15	0.08	chest	0.00
61	1	T-Shirt	clothes	basic	0.04	0.03	0.00	0.10	0.10	0.04	chest	0.00
62	1	Hoodie	clothes	basic	0.08	0.05	0.00	0.15	0.15	0.06	chest	0.00
63	1	Hide Poncho	clothes	basic	0.08	0.05	0.00	0.10	0.10	0.05	chest-armour	0.00
64	1	Wood Chestplate	clothes	basic	0.00	0.05	0.05	0.40	0.10	0.05	chest-armour	0.00
65	1	Metal Chestplate	clothes	elite	-0.08	0.00	0.00	0.20	0.25	0.03	chest-armour	0.00
66	1	Jacker	clothes	military	0.10	0.05	0.00	0.20	0.15	0.07	chest-armour	0.00
67	1	Roadsign Jacket	clothes	military	-0.08	0.00	0.00	0.25	0.20	0.10	chest-armour	0.00
68	1	Shorts	clothes	barrel	0.07	0.02	0.00	0.10	0.10	0.03	legs	0.00
69	1	Pants	clothes	basic	0.08	0.05	0.00	0.15	0.15	0.03	legs	0.00
70	1	Hide Pants	clothes	barrel	0.04	0.02	0.00	0.10	0.10	0.08	legs	0.00
71	1	Burlap Trousers	clothes	barrel	0.07	0.02	0.00	0.10	0.10	0.03	legs	0.00
72	1	Frog Boots	clothes	elite	0.08	0.05	0.00	0.00	0.00	0.00	feet	1.00
73	1	Hide Boots	clothes	basic	0.05	0.02	0.00	0.05	0.05	0.03	feet	0.00
74	1	Burlap Shoes	clothes	barrel	0.03	0.02	0.00	0.05	0.05	0.02	feet	0.00
75	1	Boots	clothes	military	0.08	0.03	0.00	0.10	0.10	0.03	feet	0.00
76	1	Leather Gloves	clothes	barrel	0.03	0.02	0.00	0.05	0.05	0.02	hands	0.00
77	1	Road Sign Gloves	clothes	military	0.00	0.04	0.02	0.10	0.10	0.05	hands	0.00
78	1	Wood Armour Pants	clothes	basic	0.00	0.05	0.05	0.40	0.10	0.05	leg-armour	0.00
79	1	Road Sign Kilt	clothes	military	-0.08	0.00	0.00	0.25	0.20	0.10	leg-armour	0.00
80	1	Bone Armour	clothes	basic	0.00	0.08	0.07	0.40	0.25	0.13	whole-body	0.00
81	1	Hazmat Suit	clothes	military	0.08	0.50	0.05	0.30	0.30	0.08	whole-body	0.00
82	1	Heavy Hazmat Suit	clothes	elite	0.12	0.70	0.10	0.50	0.50	0.15	whole-body	0.00
\.


--
-- TOC entry 3471 (class 0 OID 33688)
-- Dependencies: 222
-- Data for Name: consumables; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.consumables (id, maxstacksize, itemname, itemtype, lootgrade, instantheal, healovertime, hidrationyield, bleedingyield, radiationyield, poisonyield, hungeryield, vomitchance) FROM stdin;
83	20	Apple	consumable	food	2	0	15	0	0	0	30	0.00
84	20	Mushroom	consumable	food	3	0	5	0	0	0	15	0.00
85	20	Raspberry	consumable	food	10	0	20	0	0	-5	40	0.00
86	20	Blueberry	consumable	food	10	0	20	0	0	-5	30	0.00
87	20	Cactus Flesh	consumable	food	0	3	20	0	0	0	20	0.00
88	20	Tune Can	consumable	food	0	2	15	0	0	0	50	0.00
89	20	Can of Beans	consumable	food	0	4	25	0	0	0	100	0.00
90	20	Chocolate Bar	consumable	food	0	2	1	0	0	0	100	0.00
91	20	Chicken Breast	consumable	food	0	10	3	0	0	0	40	0.00
92	20	Deer Meat	consumable	food	0	10	3	0	0	0	40	0.00
93	20	Wolf Meat	consumable	food	0	5	1	0	0	0	60	0.00
94	20	Pork Meat	consumable	food	0	5	1	0	0	0	60	0.00
95	20	Bear Meat	consumable	food	0	5	1	0	0	0	100	0.00
96	20	Corn	consumable	food	0	6	5	0	0	0	40	0.00
97	20	Pumpkin	consumable	food	0	10	30	0	0	0	100	0.00
98	5	Water Bottle	consumable	food	0	0	200	-20	0	0	0	0.00
99	10	Anti-Radiation	consumable	food	0	0	-50	0	-25	0	0	0.00
100	10	Bandage	consumable	food	0	5	0	-5	0	-2	0	0.00
101	5	Medical Syringe	consumable	food	15	20	0	0	-10	0	-2	0.00
102	2	Large Medkit	consumable	food	0	100	-15	-15	-10	0	-10	0.00
\.


--
-- TOC entry 3483 (class 0 OID 33736)
-- Dependencies: 234
-- Data for Name: instanceditem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.instanceditem (id, itemid, itemdurability, quantity) FROM stdin;
\.


--
-- TOC entry 3468 (class 0 OID 33674)
-- Dependencies: 219
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.items (id, maxstacksize, itemname, itemtype, lootgrade) FROM stdin;
\.


--
-- TOC entry 3480 (class 0 OID 33719)
-- Dependencies: 231
-- Data for Name: loot_crate_instance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.loot_crate_instance (id, loot_grade, item1_id, item2_id, item3_id, item4_id, item5_id, item6_id, item7_id) FROM stdin;
1	military	31	66	75	51	\N	\N	\N
2	food	103	96	112	\N	\N	\N	\N
3	barrel	68	76	\N	\N	\N	\N	\N
4	military	79	66	\N	\N	\N	\N	\N
5	military	29	79	22	66	75	\N	\N
6	food	93	89	\N	\N	\N	\N	\N
7	military	81	77	\N	\N	\N	\N	\N
8	resource	46	47	\N	\N	\N	\N	\N
9	basic	24	78	52	37	63	\N	\N
10	military	26	51	31	\N	\N	\N	\N
11	food	90	97	104	\N	\N	\N	\N
12	military	26	29	51	75	81	\N	\N
13	basic	25	18	\N	\N	\N	\N	\N
14	military	26	32	22	39	79	\N	\N
15	military	29	28	81	22	26	75	\N
16	resource	47	46	16	\N	\N	\N	\N
17	food	121	85	94	\N	\N	\N	\N
18	basic	38	19	24	\N	\N	\N	\N
19	basic	23	64	63	37	69	\N	\N
20	basic	53	73	\N	\N	\N	\N	\N
21	food	105	107	104	\N	\N	\N	\N
22	military	81	39	31	79	\N	\N	\N
23	basic	78	18	38	49	20	\N	\N
24	basic	38	80	\N	\N	\N	\N	\N
25	basic	61	21	38	62	\N	\N	\N
26	food	120	83	\N	\N	\N	\N	\N
27	military	22	26	\N	\N	\N	\N	\N
28	resource	13	15	\N	\N	\N	\N	\N
29	basic	37	52	49	64	\N	\N	\N
30	barrel	55	60	\N	\N	\N	\N	\N
31	basic	25	20	\N	\N	\N	\N	\N
32	food	111	112	\N	\N	\N	\N	\N
33	food	101	122	107	\N	\N	\N	\N
34	basic	25	52	\N	\N	\N	\N	\N
35	barrel	60	76	\N	\N	\N	\N	\N
36	basic	62	19	80	78	50	\N	\N
37	military	77	51	\N	\N	\N	\N	\N
38	military	28	66	\N	\N	\N	\N	\N
39	basic	20	19	52	21	18	\N	\N
40	resource	12	17	\N	\N	\N	\N	\N
41	military	79	81	32	66	\N	\N	\N
42	military	31	29	75	77	51	66	\N
43	tool	36	\N	\N	\N	\N	\N	\N
44	barrel	76	71	\N	\N	\N	\N	\N
45	tool	36	\N	\N	\N	\N	\N	\N
46	primary	11	\N	\N	\N	\N	\N	\N
47	barrel	55	\N	\N	\N	\N	\N	\N
50	barrel	59	\N	\N	\N	\N	\N	\N
51	resource	13	15	14	\N	\N	\N	\N
54	tool	36	\N	\N	\N	\N	\N	\N
55	barrel	70	\N	\N	\N	\N	\N	\N
56	primary	9	\N	\N	\N	\N	\N	\N
57	elite	35	82	72	54	34	\N	\N
58	primary	8	\N	\N	\N	\N	\N	\N
59	food	120	\N	\N	\N	\N	\N	\N
60	basic	24	25	20	\N	\N	\N	\N
61	resource	13	17	\N	\N	\N	\N	\N
62	military	29	26	66	67	75	\N	\N
63	primary	7	\N	\N	\N	\N	\N	\N
64	resource	47	15	43	\N	\N	\N	\N
65	basic	49	69	64	80	38	\N	\N
66	primary	1	\N	\N	\N	\N	\N	\N
67	barrel	48	60	\N	\N	\N	\N	\N
68	basic	18	20	\N	\N	\N	\N	\N
69	resource	12	46	14	\N	\N	\N	\N
70	basic	49	21	53	\N	\N	\N	\N
71	basic	69	53	61	41	\N	\N	\N
72	primary	3	\N	\N	\N	\N	\N	\N
73	barrel	70	\N	\N	\N	\N	\N	\N
74	basic	50	21	61	40	63	\N	\N
75	basic	18	\N	\N	\N	\N	\N	\N
76	basic	62	52	78	61	63	\N	\N
77	barrel	60	\N	\N	\N	\N	\N	\N
78	food	85	91	87	\N	\N	\N	\N
79	food	109	112	\N	\N	\N	\N	\N
80	military	31	66	81	79	29	67	\N
81	military	51	22	\N	\N	\N	\N	\N
82	basic	19	\N	\N	\N	\N	\N	\N
83	primary	42	\N	\N	\N	\N	\N	\N
84	barrel	57	71	\N	\N	\N	\N	\N
85	military	81	29	26	\N	\N	\N	\N
86	basic	62	\N	\N	\N	\N	\N	\N
87	resource	16	17	\N	\N	\N	\N	\N
88	basic	38	\N	\N	\N	\N	\N	\N
89	barrel	48	\N	\N	\N	\N	\N	\N
90	basic	21	24	78	23	\N	\N	\N
91	barrel	55	\N	\N	\N	\N	\N	\N
92	basic	63	\N	\N	\N	\N	\N	\N
93	tool	36	\N	\N	\N	\N	\N	\N
94	basic	27	\N	\N	\N	\N	\N	\N
95	basic	40	80	61	20	\N	\N	\N
96	resource	46	\N	\N	\N	\N	\N	\N
97	resource	46	\N	\N	\N	\N	\N	\N
98	barrel	71	58	\N	\N	\N	\N	\N
99	basic	37	73	27	\N	\N	\N	\N
100	basic	49	78	27	63	\N	\N	\N
101	basic	19	38	\N	\N	\N	\N	\N
102	military	66	\N	\N	\N	\N	\N	\N
103	resource	45	44	13	\N	\N	\N	\N
104	resource	45	\N	\N	\N	\N	\N	\N
105	basic	61	21	18	27	62	\N	\N
106	military	51	\N	\N	\N	\N	\N	\N
107	military	75	51	\N	\N	\N	\N	\N
108	military	51	75	81	67	29	\N	\N
109	military	29	75	77	31	\N	\N	\N
110	food	83	\N	\N	\N	\N	\N	\N
111	resource	46	15	\N	\N	\N	\N	\N
112	basic	62	41	73	64	\N	\N	\N
113	basic	52	53	\N	\N	\N	\N	\N
114	primary	6	\N	\N	\N	\N	\N	\N
115	basic	61	69	49	53	38	\N	\N
116	basic	53	\N	\N	\N	\N	\N	\N
117	elite	82	33	35	72	\N	\N	\N
118	military	29	67	81	75	\N	\N	\N
119	basic	73	80	\N	\N	\N	\N	\N
120	primary	9	\N	\N	\N	\N	\N	\N
121	food	103	\N	\N	\N	\N	\N	\N
122	resource	16	13	\N	\N	\N	\N	\N
123	elite	72	54	65	\N	\N	\N	\N
124	military	28	\N	\N	\N	\N	\N	\N
125	tool	36	\N	\N	\N	\N	\N	\N
126	barrel	71	48	\N	\N	\N	\N	\N
127	food	95	117	122	\N	\N	\N	\N
128	elite	54	34	33	65	\N	\N	\N
129	barrel	55	76	\N	\N	\N	\N	\N
130	basic	41	52	37	\N	\N	\N	\N
131	food	121	90	\N	\N	\N	\N	\N
132	tool	36	\N	\N	\N	\N	\N	\N
133	military	22	67	29	31	66	81	\N
134	food	109	112	120	\N	\N	\N	\N
135	barrel	74	\N	\N	\N	\N	\N	\N
136	military	39	79	81	\N	\N	\N	\N
137	barrel	55	\N	\N	\N	\N	\N	\N
138	resource	43	\N	\N	\N	\N	\N	\N
139	primary	8	\N	\N	\N	\N	\N	\N
140	food	119	86	\N	\N	\N	\N	\N
141	basic	61	20	\N	\N	\N	\N	\N
142	resource	43	\N	\N	\N	\N	\N	\N
143	military	51	\N	\N	\N	\N	\N	\N
144	resource	12	14	44	\N	\N	\N	\N
145	resource	43	46	15	\N	\N	\N	\N
146	military	75	39	79	81	28	31	\N
147	tool	36	\N	\N	\N	\N	\N	\N
148	tool	36	\N	\N	\N	\N	\N	\N
149	barrel	76	\N	\N	\N	\N	\N	\N
150	military	67	22	39	29	\N	\N	\N
151	military	67	77	\N	\N	\N	\N	\N
152	tool	36	\N	\N	\N	\N	\N	\N
153	military	28	\N	\N	\N	\N	\N	\N
154	food	107	110	98	\N	\N	\N	\N
155	food	110	\N	\N	\N	\N	\N	\N
156	food	104	116	\N	\N	\N	\N	\N
157	resource	12	14	\N	\N	\N	\N	\N
158	basic	23	24	\N	\N	\N	\N	\N
159	basic	49	\N	\N	\N	\N	\N	\N
160	military	75	32	\N	\N	\N	\N	\N
161	food	113	102	93	\N	\N	\N	\N
162	tool	36	\N	\N	\N	\N	\N	\N
163	primary	2	\N	\N	\N	\N	\N	\N
164	barrel	76	48	\N	\N	\N	\N	\N
165	military	75	29	66	32	67	28	\N
166	barrel	57	\N	\N	\N	\N	\N	\N
167	military	67	81	29	31	32	28	\N
168	resource	46	15	\N	\N	\N	\N	\N
169	barrel	74	70	\N	\N	\N	\N	\N
170	basic	80	61	25	40	19	\N	\N
171	military	31	\N	\N	\N	\N	\N	\N
172	food	99	118	\N	\N	\N	\N	\N
173	military	66	31	29	\N	\N	\N	\N
174	military	81	22	51	\N	\N	\N	\N
175	elite	72	35	34	30	33	54	82
176	barrel	60	\N	\N	\N	\N	\N	\N
177	barrel	76	58	\N	\N	\N	\N	\N
178	food	112	109	108	\N	\N	\N	\N
179	elite	54	35	33	30	72	\N	\N
180	elite	33	\N	\N	\N	\N	\N	\N
181	elite	65	33	72	54	\N	\N	\N
182	elite	72	\N	\N	\N	\N	\N	\N
183	basic	27	62	\N	\N	\N	\N	\N
184	food	88	84	\N	\N	\N	\N	\N
185	military	31	67	\N	\N	\N	\N	\N
186	food	83	119	\N	\N	\N	\N	\N
187	resource	17	14	45	\N	\N	\N	\N
188	food	121	110	\N	\N	\N	\N	\N
189	primary	9	\N	\N	\N	\N	\N	\N
190	military	66	39	28	\N	\N	\N	\N
191	military	51	39	29	\N	\N	\N	\N
192	primary	5	\N	\N	\N	\N	\N	\N
193	basic	73	49	40	20	62	\N	\N
194	basic	64	61	24	\N	\N	\N	\N
195	primary	5	\N	\N	\N	\N	\N	\N
196	military	79	75	81	29	\N	\N	\N
197	resource	14	\N	\N	\N	\N	\N	\N
198	barrel	76	60	\N	\N	\N	\N	\N
199	primary	3	\N	\N	\N	\N	\N	\N
200	basic	64	38	73	18	49	\N	\N
201	military	39	\N	\N	\N	\N	\N	\N
202	primary	7	\N	\N	\N	\N	\N	\N
203	barrel	68	70	\N	\N	\N	\N	\N
204	basic	38	21	41	64	\N	\N	\N
205	primary	6	\N	\N	\N	\N	\N	\N
206	basic	23	78	19	\N	\N	\N	\N
207	military	81	67	77	75	\N	\N	\N
208	resource	12	15	45	\N	\N	\N	\N
209	food	114	84	\N	\N	\N	\N	\N
210	basic	21	\N	\N	\N	\N	\N	\N
211	food	100	\N	\N	\N	\N	\N	\N
212	barrel	58	\N	\N	\N	\N	\N	\N
213	military	29	77	22	79	32	39	\N
214	basic	37	40	\N	\N	\N	\N	\N
215	military	32	39	\N	\N	\N	\N	\N
216	tool	36	\N	\N	\N	\N	\N	\N
217	barrel	48	\N	\N	\N	\N	\N	\N
218	military	66	75	81	32	39	\N	\N
219	basic	27	23	50	73	\N	\N	\N
220	primary	6	\N	\N	\N	\N	\N	\N
221	basic	24	61	\N	\N	\N	\N	\N
222	military	39	32	66	22	26	81	\N
223	primary	8	\N	\N	\N	\N	\N	\N
224	resource	45	14	16	\N	\N	\N	\N
225	military	66	51	79	77	39	\N	\N
226	military	66	28	81	29	77	\N	\N
227	food	102	98	114	\N	\N	\N	\N
228	basic	64	25	78	69	\N	\N	\N
229	military	39	79	\N	\N	\N	\N	\N
230	resource	13	\N	\N	\N	\N	\N	\N
231	primary	8	\N	\N	\N	\N	\N	\N
232	military	51	\N	\N	\N	\N	\N	\N
233	tool	36	\N	\N	\N	\N	\N	\N
234	military	39	22	\N	\N	\N	\N	\N
235	barrel	71	\N	\N	\N	\N	\N	\N
236	barrel	68	76	\N	\N	\N	\N	\N
237	primary	3	\N	\N	\N	\N	\N	\N
238	military	75	\N	\N	\N	\N	\N	\N
239	tool	36	\N	\N	\N	\N	\N	\N
240	basic	78	\N	\N	\N	\N	\N	\N
241	basic	40	\N	\N	\N	\N	\N	\N
242	barrel	57	\N	\N	\N	\N	\N	\N
243	military	67	\N	\N	\N	\N	\N	\N
244	military	26	\N	\N	\N	\N	\N	\N
245	tool	36	\N	\N	\N	\N	\N	\N
246	barrel	71	\N	\N	\N	\N	\N	\N
247	tool	36	\N	\N	\N	\N	\N	\N
248	basic	27	\N	\N	\N	\N	\N	\N
249	resource	12	\N	\N	\N	\N	\N	\N
250	military	77	\N	\N	\N	\N	\N	\N
251	primary	6	\N	\N	\N	\N	\N	\N
252	primary	6	\N	\N	\N	\N	\N	\N
253	resource	17	\N	\N	\N	\N	\N	\N
254	military	79	\N	\N	\N	\N	\N	\N
255	basic	61	\N	\N	\N	\N	\N	\N
256	basic	50	\N	\N	\N	\N	\N	\N
257	food	92	\N	\N	\N	\N	\N	\N
258	tool	36	\N	\N	\N	\N	\N	\N
259	tool	36	\N	\N	\N	\N	\N	\N
260	basic	38	\N	\N	\N	\N	\N	\N
261	food	101	\N	\N	\N	\N	\N	\N
263	primary	3	\N	\N	\N	\N	\N	\N
264	barrel	71	\N	\N	\N	\N	\N	\N
265	resource	45	\N	\N	\N	\N	\N	\N
267	food	84	\N	\N	\N	\N	\N	\N
268	primary	3	\N	\N	\N	\N	\N	\N
269	primary	10	\N	\N	\N	\N	\N	\N
271	primary	1	\N	\N	\N	\N	\N	\N
272	military	26	67	31	\N	\N	\N	\N
273	basic	64	52	69	\N	\N	\N	\N
274	basic	18	61	69	41	\N	\N	\N
276	primary	7	\N	\N	\N	\N	\N	\N
277	primary	9	\N	\N	\N	\N	\N	\N
278	resource	13	12	\N	\N	\N	\N	\N
279	primary	10	\N	\N	\N	\N	\N	\N
282	tool	36	\N	\N	\N	\N	\N	\N
283	food	102	\N	\N	\N	\N	\N	\N
285	barrel	76	\N	\N	\N	\N	\N	\N
286	tool	36	\N	\N	\N	\N	\N	\N
288	tool	36	\N	\N	\N	\N	\N	\N
289	resource	47	\N	\N	\N	\N	\N	\N
290	basic	61	25	38	64	69	\N	\N
291	resource	12	16	\N	\N	\N	\N	\N
292	basic	50	21	63	61	\N	\N	\N
293	tool	36	\N	\N	\N	\N	\N	\N
294	primary	3	\N	\N	\N	\N	\N	\N
295	resource	43	\N	\N	\N	\N	\N	\N
296	primary	1	\N	\N	\N	\N	\N	\N
297	barrel	74	\N	\N	\N	\N	\N	\N
298	basic	37	53	\N	\N	\N	\N	\N
299	barrel	56	\N	\N	\N	\N	\N	\N
300	primary	7	\N	\N	\N	\N	\N	\N
302	military	32	\N	\N	\N	\N	\N	\N
303	military	81	66	31	\N	\N	\N	\N
304	military	81	39	75	67	22	\N	\N
305	basic	52	20	\N	\N	\N	\N	\N
306	tool	36	\N	\N	\N	\N	\N	\N
307	basic	18	\N	\N	\N	\N	\N	\N
309	resource	16	12	44	\N	\N	\N	\N
310	food	95	102	92	\N	\N	\N	\N
311	food	91	\N	\N	\N	\N	\N	\N
312	basic	64	38	18	69	61	\N	\N
313	basic	80	41	27	53	64	\N	\N
314	resource	17	12	46	\N	\N	\N	\N
315	food	86	99	109	\N	\N	\N	\N
317	tool	36	\N	\N	\N	\N	\N	\N
318	barrel	60	\N	\N	\N	\N	\N	\N
319	food	109	93	\N	\N	\N	\N	\N
320	barrel	71	\N	\N	\N	\N	\N	\N
321	basic	40	\N	\N	\N	\N	\N	\N
322	tool	36	\N	\N	\N	\N	\N	\N
323	resource	44	\N	\N	\N	\N	\N	\N
325	tool	36	\N	\N	\N	\N	\N	\N
326	food	120	93	\N	\N	\N	\N	\N
327	basic	50	41	64	69	62	\N	\N
329	tool	36	\N	\N	\N	\N	\N	\N
330	food	123	104	\N	\N	\N	\N	\N
335	basic	78	40	52	20	\N	\N	\N
336	food	112	120	\N	\N	\N	\N	\N
337	resource	13	\N	\N	\N	\N	\N	\N
339	resource	13	\N	\N	\N	\N	\N	\N
340	tool	36	\N	\N	\N	\N	\N	\N
341	primary	5	\N	\N	\N	\N	\N	\N
342	barrel	48	71	\N	\N	\N	\N	\N
343	food	119	\N	\N	\N	\N	\N	\N
344	food	114	94	85	\N	\N	\N	\N
346	resource	44	\N	\N	\N	\N	\N	\N
347	primary	9	\N	\N	\N	\N	\N	\N
348	basic	69	25	20	24	\N	\N	\N
350	tool	36	\N	\N	\N	\N	\N	\N
351	tool	36	\N	\N	\N	\N	\N	\N
353	basic	52	25	\N	\N	\N	\N	\N
354	basic	52	80	62	19	27	\N	\N
355	basic	80	27	\N	\N	\N	\N	\N
356	food	107	122	111	\N	\N	\N	\N
357	barrel	56	70	\N	\N	\N	\N	\N
358	resource	16	47	44	\N	\N	\N	\N
360	resource	43	45	\N	\N	\N	\N	\N
361	basic	38	25	\N	\N	\N	\N	\N
362	tool	36	\N	\N	\N	\N	\N	\N
363	barrel	58	48	\N	\N	\N	\N	\N
364	tool	36	\N	\N	\N	\N	\N	\N
365	basic	64	\N	\N	\N	\N	\N	\N
366	tool	36	\N	\N	\N	\N	\N	\N
367	food	102	94	109	\N	\N	\N	\N
368	food	114	\N	\N	\N	\N	\N	\N
369	basic	18	\N	\N	\N	\N	\N	\N
371	resource	13	14	16	\N	\N	\N	\N
372	barrel	48	\N	\N	\N	\N	\N	\N
373	basic	21	\N	\N	\N	\N	\N	\N
374	food	84	\N	\N	\N	\N	\N	\N
375	tool	36	\N	\N	\N	\N	\N	\N
376	tool	36	\N	\N	\N	\N	\N	\N
377	tool	36	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3478 (class 0 OID 33712)
-- Dependencies: 229
-- Data for Name: lootcrates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lootcrates (item_quantity, id, grade) FROM stdin;
5	1	basic
2	2	barrel
3	3	resource
6	4	military
3	5	tool
3	6	food
7	7	elite
\.


--
-- TOC entry 3469 (class 0 OID 33680)
-- Dependencies: 220
-- Data for Name: meleeweapons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.meleeweapons (id, maxstacksize, itemname, itemtype, lootgrade, attackrange, headdamage, chestdamage, legdamage, armsdamage, treegatherrate, oregatherrate, fleshgatherrate, canbethrown) FROM stdin;
36	1	Machete	melee	tool	2	70	35	29	35	0	0	1	t
37	1	Salvage Sword	melee	basic	2	100	50	45	50	0	0	1	t
38	1	Salvage Cleaver	melee	basic	2	120	60	50	55	0	0	1	t
39	1	Longsword	melee	military	2	150	75	36	45	0	0	1	t
40	1	Mace	melee	basic	2	100	50	45	50	0	0	0	t
41	1	Stone Spear	melee	basic	2	70	35	35	28	0	0	0	t
42	1	Spear	melee	primary	2	30	25	25	13	0	0	0	t
43	1	Rock	melee	resource	1	20	10	8	8	1	1	1	t
44	1	Stone Hatchet	melee	resource	2	20	10	8	8	1	0	1	t
45	1	Stone Pickaxe	melee	resource	2	20	10	8	8	0	1	1	t
46	1	Hatchet	melee	resource	2	30	25	13	25	1	0	1	t
47	1	Pickaxe	melee	resource	2	30	25	13	25	0	1	1	t
\.


--
-- TOC entry 3460 (class 0 OID 33643)
-- Dependencies: 211
-- Data for Name: monuments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.monuments (id, monumentsize, lootgrade, name) FROM stdin;
1	10	basic	Lighthouse
2	10	basic	Warehouse
3	10	basic	Harbour
4	15	military	Water Treatment Plant
5	15	military	The Dome
6	15	military	Airfield
7	20	elite	Giant Excavator
8	20	elite	Launch Site
9	20	elite	Military Tunnel
\.


--
-- TOC entry 3466 (class 0 OID 33669)
-- Dependencies: 217
-- Data for Name: npcs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.npcs (id, name, type, isagressive, typenpc, grade) FROM stdin;
2	M249 Scientist	NPC	t	Scientist	elite
3	M92 Scientist	NPC	t	Scientist	basic
4	LR300 Scientist	NPC	t	Scientist	military
5	AK Bandit	NPC	t	Bandit	elite
6	Tommy Bandit	NPC	t	Bandit	military
7	Revolver Bandit	NPC	t	Bandit	basic
8	Hunter	NPC	f	Bandit	basic
9	Boar	NPC	t	Animal	basic
10	Deer	NPC	f	Animal	basic
11	Wolf	NPC	t	Animal	military
12	Bear	NPC	t	Animal	military
13	Polar Bear	NPC	t	Animal	elite
\.


--
-- TOC entry 3481 (class 0 OID 33725)
-- Dependencies: 232
-- Data for Name: party; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.party (id, "character", capacity) FROM stdin;
\.


--
-- TOC entry 3465 (class 0 OID 33665)
-- Dependencies: 216
-- Data for Name: playercharacters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.playercharacters (id, name, type, hydration, poisoned, hunger, equipeditems1, equipeditems2, equipeditems3, equipeditems4, equipeditems5, backpack) FROM stdin;
1	Character1	Player	1	2	3	\N	\N	\N	\N	\N	\N
14	yes	player	100	0	120	43	\N	\N	\N	\N	1
15	yes	player	100	0	120	43	\N	\N	\N	\N	2
16	yes	player	100	0	120	43	\N	\N	\N	\N	3
17	yes	player	100	0	120	43	\N	\N	\N	\N	4
18	yes	player	100	0	120	43	\N	\N	\N	\N	5
19	yes	player	100	0	120	43	\N	\N	\N	\N	6
20	3	player	100	0	120	43	\N	\N	\N	\N	7
21	yes	player	100	0	120	43	\N	\N	\N	\N	8
22	yes	player	100	0	120	43	\N	\N	\N	\N	9
23	yes	player	100	0	120	43	\N	\N	\N	\N	10
24	yes	player	100	0	120	43	\N	\N	\N	\N	11
25	yes	player	100	0	120	43	\N	\N	\N	\N	12
26	3	player	100	0	120	43	\N	\N	\N	\N	13
27	yes	player	100	0	120	43	\N	\N	\N	\N	14
28	3	player	100	0	120	43	\N	\N	\N	\N	15
29	tes	player	100	0	120	43	\N	\N	\N	\N	16
30	yes	player	100	0	120	43	\N	\N	\N	\N	17
31	yes	player	100	0	120	43	\N	\N	\N	\N	18
32	yes	player	100	0	120	43	\N	\N	\N	\N	19
33	yes	player	100	0	120	43	\N	\N	\N	\N	20
34	yes	player	100	0	120	43	\N	\N	\N	\N	21
35	yes	player	100	0	120	43	\N	\N	\N	\N	22
36	yes	player	100	0	120	43	\N	\N	\N	\N	23
37	yes	player	100	0	120	43	\N	\N	\N	\N	24
38	1	player	100	0	120	43	\N	\N	\N	\N	25
39	yes	player	100	0	120	43	\N	\N	\N	\N	26
40	yes	player	100	0	120	43	\N	\N	\N	\N	27
41	yes	player	100	0	120	43	\N	\N	\N	\N	28
42	yes	player	100	0	120	43	\N	\N	\N	\N	29
43	yes	player	100	0	120	43	\N	\N	\N	\N	30
44	3	player	100	0	120	43	\N	\N	\N	\N	31
45		player	100	0	120	43	\N	\N	\N	\N	32
46	yes	player	100	0	120	43	\N	\N	\N	\N	33
47	yes	player	100	0	120	43	\N	\N	\N	\N	34
48	yes	player	100	0	120	43	\N	\N	\N	\N	35
49	papito	player	100	0	120	43	\N	\N	\N	\N	36
50	yes	player	100	0	120	43	\N	\N	\N	\N	37
51	yes	player	100	0	120	43	\N	\N	\N	\N	38
52	tonny	player	100	0	120	43	\N	\N	\N	\N	39
53	yes	player	100	0	120	43	\N	\N	\N	\N	40
54	yes	player	100	0	120	43	\N	\N	\N	\N	41
55	yes	player	100	0	120	43	\N	\N	\N	\N	42
56	tomas	player	100	0	120	43	\N	\N	\N	\N	43
57	yes	player	100	0	120	43	\N	\N	\N	\N	44
58	yes	player	100	0	120	43	\N	\N	\N	\N	45
59	tutu	player	100	0	120	43	\N	\N	\N	\N	46
60	23	player	100	0	120	43	\N	\N	\N	\N	47
61		player	100	0	120	43	\N	\N	\N	\N	48
62	yes	player	100	0	120	43	\N	\N	\N	\N	49
63	tes	player	100	0	120	43	\N	\N	\N	\N	50
64	yes	player	100	0	120	43	\N	\N	\N	\N	51
65	yes	player	100	0	120	43	\N	\N	\N	\N	52
66	1	player	100	0	120	43	39	\N	\N	\N	53
67	yes	player	100	0	120	43	\N	\N	\N	\N	54
68	yes	player	100	0	120	43	\N	\N	\N	\N	55
69	yes	player	100	0	120	43	\N	\N	\N	\N	56
70	yes	player	100	0	120	43	\N	\N	\N	\N	57
87	yes	player	100	0	120	43	\N	\N	\N	\N	74
71	yes	player	100	0	120	43	39	\N	\N	\N	58
72	Kyo	player	100	0	120	43	\N	\N	\N	\N	59
73	yes	player	100	0	120	43	\N	\N	\N	\N	60
74	Kyo	player	100	0	120	43	\N	\N	\N	\N	61
75	yes	player	100	0	120	43	\N	\N	\N	\N	62
76	yes	player	100	0	120	43	\N	\N	\N	\N	63
77	yes	player	100	0	120	43	\N	\N	\N	\N	64
78	yes	player	100	0	120	43	\N	\N	\N	\N	65
79	yes	player	100	0	120	43	\N	\N	\N	\N	66
80	yes	player	100	0	120	43	\N	\N	\N	\N	67
81	yes	player	100	0	120	43	\N	\N	\N	\N	68
82	yes	player	100	0	120	43	\N	\N	\N	\N	69
83	yes	player	100	0	120	43	\N	\N	\N	\N	70
84	yes	player	100	0	120	43	\N	\N	\N	\N	71
85	yes	player	100	0	120	43	\N	\N	\N	\N	72
86	yes	player	100	0	120	43	\N	\N	\N	\N	73
88	yes	player	100	0	120	43	\N	\N	\N	\N	75
89	yes	player	100	0	120	43	62	\N	\N	\N	76
90	yes	player	100	0	120	43	\N	\N	\N	\N	77
91	3	player	100	0	120	43	\N	\N	\N	\N	78
92	yes	player	100	0	120	43	\N	\N	\N	\N	79
93	yes	player	100	0	120	43	\N	\N	\N	\N	80
101	yes	player	100	0	120	43	\N	\N	\N	\N	88
95	yes	player	100	0	120	43	23	49	24	\N	82
94	yes	player	100	0	120	43	24	80	\N	\N	81
98	yes	player	100	0	120	43	20	37	62	\N	85
96	yes	player	100	0	120	43	\N	\N	\N	\N	83
97	yes	player	100	0	120	43	54	\N	\N	\N	84
99	yes	player	100	0	120	43	41	53	19	49	86
100	1	player	100	0	120	43	\N	\N	\N	\N	87
102	1	player	100	0	120	43	\N	\N	\N	\N	89
103	yes	player	100	0	120	43	\N	\N	\N	\N	90
104	yes	player	100	0	120	43	\N	\N	\N	\N	91
105	yes	player	100	0	120	43	\N	\N	\N	\N	92
106	yes	player	100	0	120	43	\N	\N	\N	\N	93
107	Kyo	player	100	0	120	43	\N	\N	\N	\N	94
\.


--
-- TOC entry 3470 (class 0 OID 33684)
-- Dependencies: 221
-- Data for Name: rangedweapons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rangedweapons (id, maxstacksize, itemname, itemtype, lootgrade, attackrange, headdamage, chestdamage, legdamage, armsdamage, accuracymodifier, firerate, firemode, modslots, ammocapacity, recoil) FROM stdin;
18	1	Hunting Bow	ranged	basic	150	80	50	35	40	0.50	1	single	0	1	0
19	1	Crossbow	ranged	basic	200	102	60	45	45	0.75	0	single	2	1	0
20	1	Compound Bow	ranged	basic	250	100	50	40	40	0.65	1	charged-fire	0	1	0
21	1	Waterpipe Shotgun	ranged	basic	10	210	180	75	75	1.00	0	single	0	1	2
22	1	Pump Shotgun	ranged	military	10	280	210	80	80	1.00	1	pump	2	6	2
23	1	Eoka Pistol	ranged	basic	10	210	180	75	75	1.00	0	single	0	1	2
24	1	Double Barrel Shotgun	ranged	basic	10	210	180	75	75	1.00	1	semi-auto	2	2	2
25	1	Nailgun	ranged	basic	60	36	18	12	8	2.00	3	semi-auto	0	16	1
26	1	Python Revolver	ranged	military	350	110	55	45	45	2.00	2	semi-auto	3	6	4
27	1	Revolver	ranged	basic	250	70	35	26	26	2.00	2	semi-auto	1	8	2
28	1	Custom SMG	ranged	military	200	60	35	30	35	2.00	3	full-auto	3	24	3
29	1	Thompson	ranged	military	250	76	38	30	30	2.50	3	full-auto	3	20	3
30	1	MP5A4	ranged	elite	350	70	35	29	35	3.00	3	full-auto	3	30	2
31	1	Semi-Automatic Pistol	ranged	military	250	80	40	30	40	3.00	2	semi-auto	3	10	2
32	1	Semi-Automatic Rifle	ranged	military	350	80	40	30	40	3.00	2	semi-auto	3	16	2
33	1	LR-300 Assault Rifle	ranged	elite	400	80	40	30	40	3.00	3	semi-auto	3	30	2
34	1	AK47 Assault Rifle	ranged	elite	450	85	45	35	45	3.00	3	full-auto	3	30	4
35	1	Bolt Action Rifle	ranged	elite	900	150	75	50	50	5.00	1	single	3	4	5
\.


--
-- TOC entry 3476 (class 0 OID 33705)
-- Dependencies: 227
-- Data for Name: resourcenodes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resourcenodes (id, nodetype, maxyield, durabilitydamage) FROM stdin;
1	sulfur	300	7.5
2	stone	1000	7.5
3	metal	600	7.5
4	tree	500	3.75
5	cactus	10	2.5
\.


--
-- TOC entry 3474 (class 0 OID 33700)
-- Dependencies: 225
-- Data for Name: resources; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resources (id, maxstacksize, itemname, itemtype, lootgrade, isprimary, isrefinable) FROM stdin;
1	1000	Wood	resource	primary	t	f
2	1000	Stone	resource	primary	t	f
3	1000	Bone Fragments	resource	primary	t	f
4	1000	Leather	resource	primary	t	f
5	1000	Cloth	resource	primary	t	f
6	1000	Scrap	resource	primary	t	f
7	100	High Quality Metal Ore	resource	primary	t	t
8	500	Animal Fat	resource	primary	t	t
9	500	Crude Oil	resource	primary	t	t
10	1000	Metal Ore	resource	primary	t	t
11	1000	Sulfur Ore	resource	primary	t	t
12	100	High Quality Metal	resource	resource	f	f
13	500	Low Grade Fuel	resource	resource	f	f
14	1000	Metal Fragments	resource	resource	f	f
15	1000	Sulfur	resource	resource	f	f
16	1000	Charcoal	resource	resource	f	f
17	1000	Gunpowder	resource	resource	f	f
\.


--
-- TOC entry 3458 (class 0 OID 33637)
-- Dependencies: 209
-- Data for Name: structures; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.structures (id, combat_enemy, name) FROM stdin;
1	f	Eletric Central
2	t	Eletric Central 2
3	f	Regular Building
4	f	Parkour Puzzle
5	t	Special Loot Room
6	f	Recycler
7	f	Old Abandoned Cars
8	t	Old Abandoned Cars 2
9	f	Loot Room
10	t	Loot Room 2
\.


--
-- TOC entry 3472 (class 0 OID 33692)
-- Dependencies: 223
-- Data for Name: teas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teas (id, maxstacksize, itemname, itemtype, lootgrade, instantheal, healovertime, hidrationyield, bleedingyield, radiationyield, poisonyield, hungeryield, vomitchance, statusupgradetype, upgradepercentage) FROM stdin;
103	5	Normal Max Health Tea	tea	food	0	0	0	0	0	0	0	0.00	health	0.05
104	5	Advanced Max Health Tea	tea	food	0	0	0	0	0	0	0	0.00	health	0.13
105	5	Pure Max Health Tea	tea	food	0	0	0	0	0	0	0	0.00	health	0.20
106	5	Normal Healing Tea	tea	food	0	0	30	0	0	0	0	0.00	health	0.00
107	5	Advanced Healing Tea	tea	food	0	45	0	0	0	0	0	0.00	health	0.00
108	5	Pure Healing Tea	tea	food	0	60	0	0	0	0	0	0.00	health	0.00
109	5	Normal Ore Tea	tea	food	0	0	0	0	0	0	0	0.00	mining	0.10
110	5	Advanced Ore Tea	tea	food	0	0	0	0	0	0	0	0.00	mining	0.30
111	5	Pure Ore Tea	tea	food	0	0	0	0	0	0	0	0.00	mining	0.50
112	5	Normal Wood Tea	tea	food	0	0	0	0	0	0	0	0.00	woodcutting	0.10
113	5	Advanced Wood Tea	tea	food	0	0	0	0	0	0	0	0.00	woodcutting	0.30
114	5	Pure Wood Tea	tea	food	0	0	0	0	0	0	0	0.00	woodcutting	0.50
115	5	Normal Scrap Tea	tea	food	0	0	0	0	0	0	0	0.00	scrap	0.10
116	5	Advanced Scrap Tea	tea	food	0	0	0	0	0	0	0	0.00	scrap	0.30
117	5	Pure Scrap Tea	tea	food	0	0	0	0	0	0	0	0.00	scrap	0.50
118	5	Normal Radiation Tea	tea	food	0	0	0	0	-60	0	0	0.00	radiation	0.00
119	5	Advanced Radiation Tea	tea	food	0	0	0	-80	0	0	0	0.00	radiation	0.00
120	5	Pure Radiation Tea	tea	food	0	0	0	0	0	0	-100	0.00	radiation	0.00
121	5	Normal Radiation Resistance Tea	tea	food	0	0	0	0	0	0	0	0.00	radiation	0.10
122	5	Advanced Radiation Resistance Tea	tea	food	0	0	0	0	0	0	0	0.00	radiation	0.30
123	5	Pure Radiation Resistance Tea	tea	food	0	0	0	0	0	0	0	0.00	radiation	0.50
\.


--
-- TOC entry 3498 (class 0 OID 0)
-- Dependencies: 212
-- Name: backpack_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.backpack_id_seq', 94, true);


--
-- TOC entry 3499 (class 0 OID 0)
-- Dependencies: 214
-- Name: characters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.characters_id_seq', 107, true);


--
-- TOC entry 3500 (class 0 OID 0)
-- Dependencies: 233
-- Name: instanceditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.instanceditem_id_seq', 1, false);


--
-- TOC entry 3501 (class 0 OID 0)
-- Dependencies: 218
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.items_id_seq', 123, true);


--
-- TOC entry 3502 (class 0 OID 0)
-- Dependencies: 230
-- Name: loot_crate_instance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.loot_crate_instance_id_seq', 379, true);


--
-- TOC entry 3503 (class 0 OID 0)
-- Dependencies: 228
-- Name: lootcrates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lootcrates_id_seq', 1, false);


--
-- TOC entry 3504 (class 0 OID 0)
-- Dependencies: 210
-- Name: monuments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.monuments_id_seq', 1, false);


--
-- TOC entry 3505 (class 0 OID 0)
-- Dependencies: 226
-- Name: resourcenodes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.resourcenodes_id_seq', 5, true);


--
-- TOC entry 3299 (class 2606 OID 33657)
-- Name: backpack backpack_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backpack
    ADD CONSTRAINT backpack_pkey PRIMARY KEY (id);


--
-- TOC entry 3301 (class 2606 OID 33664)
-- Name: characters characters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters
    ADD CONSTRAINT characters_pkey PRIMARY KEY (id);


--
-- TOC entry 3313 (class 2606 OID 33741)
-- Name: instanceditem instanceditem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instanceditem
    ADD CONSTRAINT instanceditem_pkey PRIMARY KEY (id);


--
-- TOC entry 3303 (class 2606 OID 33679)
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- TOC entry 3309 (class 2606 OID 33724)
-- Name: loot_crate_instance loot_crate_instance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loot_crate_instance
    ADD CONSTRAINT loot_crate_instance_pkey PRIMARY KEY (id);


--
-- TOC entry 3307 (class 2606 OID 33717)
-- Name: lootcrates lootcrates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lootcrates
    ADD CONSTRAINT lootcrates_pkey PRIMARY KEY (id);


--
-- TOC entry 3295 (class 2606 OID 33650)
-- Name: monuments monuments_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monuments
    ADD CONSTRAINT monuments_name_key UNIQUE (name);


--
-- TOC entry 3297 (class 2606 OID 33648)
-- Name: monuments monuments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monuments
    ADD CONSTRAINT monuments_pkey PRIMARY KEY (id);


--
-- TOC entry 3311 (class 2606 OID 33729)
-- Name: party pk_party; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.party
    ADD CONSTRAINT pk_party PRIMARY KEY (id);


--
-- TOC entry 3293 (class 2606 OID 33641)
-- Name: structures pk_structures; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structures
    ADD CONSTRAINT pk_structures PRIMARY KEY (id);


--
-- TOC entry 3305 (class 2606 OID 33710)
-- Name: resourcenodes resourcenodes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resourcenodes
    ADD CONSTRAINT resourcenodes_pkey PRIMARY KEY (id);


--
-- TOC entry 3316 (class 2620 OID 33757)
-- Name: backpack insertbackpack; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER insertbackpack AFTER INSERT ON public.backpack FOR EACH ROW EXECUTE FUNCTION public.insertbackpack();


--
-- TOC entry 3318 (class 2620 OID 33755)
-- Name: party insertparty; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER insertparty BEFORE INSERT ON public.party FOR EACH ROW EXECUTE FUNCTION public.insert_party();


--
-- TOC entry 3317 (class 2620 OID 33756)
-- Name: playercharacters instanciatecharacter; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER instanciatecharacter AFTER INSERT ON public.playercharacters FOR EACH ROW EXECUTE FUNCTION public.insertcharacter_backpack();


--
-- TOC entry 3314 (class 2606 OID 33730)
-- Name: party fk_party_characters; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.party
    ADD CONSTRAINT fk_party_characters FOREIGN KEY ("character") REFERENCES public.characters(id) ON DELETE RESTRICT;


--
-- TOC entry 3315 (class 2606 OID 33742)
-- Name: instanceditem instanceditem_itemid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instanceditem
    ADD CONSTRAINT instanceditem_itemid_fkey FOREIGN KEY (itemid) REFERENCES public.items(id);


--
-- TOC entry 3489 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2022-04-29 23:50:50

--
-- PostgreSQL database dump complete
--

