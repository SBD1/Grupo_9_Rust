--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

-- Started on 2022-04-25 18:44:45

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
-- TOC entry 883 (class 1247 OID 33326)
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
-- TOC entry 886 (class 1247 OID 33336)
-- Name: enum_boolean; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_boolean AS ENUM (
    'true',
    'false'
);


ALTER TYPE public.enum_boolean OWNER TO postgres;

--
-- TOC entry 877 (class 1247 OID 33310)
-- Name: enum_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_status AS ENUM (
    'HIGH',
    'MEDIUM',
    'LOW'
);


ALTER TYPE public.enum_status OWNER TO postgres;

--
-- TOC entry 868 (class 1247 OID 33266)
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
-- TOC entry 865 (class 1247 OID 33252)
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
-- TOC entry 862 (class 1247 OID 33236)
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
-- TOC entry 859 (class 1247 OID 33219)
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
-- TOC entry 880 (class 1247 OID 33318)
-- Name: monument_tier; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.monument_tier AS ENUM (
    'basic',
    'military',
    'elite'
);


ALTER TYPE public.monument_tier OWNER TO postgres;

--
-- TOC entry 874 (class 1247 OID 33298)
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
-- TOC entry 871 (class 1247 OID 33286)
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
-- TOC entry 240 (class 1255 OID 33504)
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
-- TOC entry 243 (class 1255 OID 33503)
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
-- TOC entry 241 (class 1255 OID 33501)
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
-- TOC entry 244 (class 1255 OID 33505)
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
-- TOC entry 242 (class 1255 OID 33502)
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
-- TOC entry 246 (class 1255 OID 33507)
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
-- TOC entry 245 (class 1255 OID 33506)
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
-- TOC entry 215 (class 1259 OID 33365)
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
    slot10 integer,
    slot11 integer,
    slot12 integer,
    slot13 integer,
    slot14 integer,
    slot15 integer,
    slot16 integer,
    slot17 integer,
    slot18 integer,
    slot19 integer,
    slot20 integer,
    slot21 integer,
    slot22 integer,
    slot23 integer,
    slot24 integer,
    slot25 integer,
    slot26 integer,
    slot27 integer,
    slot28 integer,
    slot29 integer,
    slot30 integer,
    slot31 integer,
    slot32 integer,
    slot33 integer,
    slot34 integer,
    slot35 integer,
    slot36 integer,
    slot37 integer,
    slot38 integer,
    slot39 integer,
    slot40 integer,
    slot41 integer,
    slot42 integer,
    slot43 integer,
    slot44 integer,
    slot45 integer,
    slot46 integer,
    slot47 integer,
    slot48 integer,
    slot49 integer,
    slot50 integer
);


ALTER TABLE public.backpack OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 33364)
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
-- TOC entry 3529 (class 0 OID 0)
-- Dependencies: 214
-- Name: backpack_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.backpack_id_seq OWNED BY public.backpack.id;


--
-- TOC entry 217 (class 1259 OID 33372)
-- Name: characters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.characters (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(30) NOT NULL
);


ALTER TABLE public.characters OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 33371)
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
-- TOC entry 3530 (class 0 OID 0)
-- Dependencies: 216
-- Name: characters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.characters_id_seq OWNED BY public.characters.id;


--
-- TOC entry 221 (class 1259 OID 33387)
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
-- TOC entry 226 (class 1259 OID 33409)
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
-- TOC entry 224 (class 1259 OID 33401)
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
-- TOC entry 239 (class 1259 OID 33489)
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
-- TOC entry 238 (class 1259 OID 33488)
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
-- TOC entry 3531 (class 0 OID 0)
-- Dependencies: 238
-- Name: instanceditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.instanceditem_id_seq OWNED BY public.instanceditem.id;


--
-- TOC entry 220 (class 1259 OID 33386)
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
-- TOC entry 3532 (class 0 OID 0)
-- Dependencies: 220
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;


--
-- TOC entry 235 (class 1259 OID 33457)
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
-- TOC entry 234 (class 1259 OID 33456)
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
-- TOC entry 3533 (class 0 OID 0)
-- Dependencies: 234
-- Name: loot_crate_instance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.loot_crate_instance_id_seq OWNED BY public.loot_crate_instance.id;


--
-- TOC entry 233 (class 1259 OID 33450)
-- Name: lootcrates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lootcrates (
    item_quantity integer,
    id integer NOT NULL,
    grade public.loot_grade
);


ALTER TABLE public.lootcrates OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 33449)
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
-- TOC entry 3534 (class 0 OID 0)
-- Dependencies: 232
-- Name: lootcrates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lootcrates_id_seq OWNED BY public.lootcrates.id;


--
-- TOC entry 210 (class 1259 OID 33342)
-- Name: maps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.maps (
    id integer NOT NULL,
    mapid integer
);


ALTER TABLE public.maps OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 33341)
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
-- TOC entry 3535 (class 0 OID 0)
-- Dependencies: 209
-- Name: maps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.maps_id_seq OWNED BY public.maps.id;


--
-- TOC entry 222 (class 1259 OID 33393)
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
-- TOC entry 213 (class 1259 OID 33356)
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
-- TOC entry 212 (class 1259 OID 33355)
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
-- TOC entry 3536 (class 0 OID 0)
-- Dependencies: 212
-- Name: monuments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.monuments_id_seq OWNED BY public.monuments.id;


--
-- TOC entry 219 (class 1259 OID 33382)
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
-- TOC entry 237 (class 1259 OID 33478)
-- Name: party; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.party (
    id integer NOT NULL,
    "character" integer NOT NULL,
    capacity integer NOT NULL
);


ALTER TABLE public.party OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 33378)
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
-- TOC entry 223 (class 1259 OID 33397)
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
-- TOC entry 231 (class 1259 OID 33439)
-- Name: regionsmonuments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.regionsmonuments (
    name character varying(30) NOT NULL,
    regionmonument character varying(30) NOT NULL
);


ALTER TABLE public.regionsmonuments OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 33418)
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
-- TOC entry 228 (class 1259 OID 33417)
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
-- TOC entry 3537 (class 0 OID 0)
-- Dependencies: 228
-- Name: resourcenodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.resourcenodes_id_seq OWNED BY public.resourcenodes.id;


--
-- TOC entry 230 (class 1259 OID 33424)
-- Name: resourcenodesgenerateitems; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resourcenodesgenerateitems (
    resourcenodes integer NOT NULL,
    item integer NOT NULL
);


ALTER TABLE public.resourcenodesgenerateitems OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 33413)
-- Name: resources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resources (
    isprimary boolean NOT NULL,
    isrefinable boolean NOT NULL
)
INHERITS (public.items);


ALTER TABLE public.resources OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 33350)
-- Name: structures; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.structures (
    id integer NOT NULL,
    combat_enemy boolean,
    name character varying(30) NOT NULL
);


ALTER TABLE public.structures OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 33463)
-- Name: structurescontainslootcrates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.structurescontainslootcrates (
    structure integer NOT NULL,
    lootcrates integer NOT NULL
);


ALTER TABLE public.structurescontainslootcrates OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 33405)
-- Name: teas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teas (
    statusupgradetype character varying(15),
    upgradepercentage numeric(4,2)
)
INHERITS (public.consumables);


ALTER TABLE public.teas OWNER TO postgres;

--
-- TOC entry 3295 (class 2604 OID 33368)
-- Name: backpack id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backpack ALTER COLUMN id SET DEFAULT nextval('public.backpack_id_seq'::regclass);


--
-- TOC entry 3296 (class 2604 OID 33375)
-- Name: characters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters ALTER COLUMN id SET DEFAULT nextval('public.characters_id_seq'::regclass);


--
-- TOC entry 3304 (class 2604 OID 33412)
-- Name: clothing id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clothing ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- TOC entry 3302 (class 2604 OID 33404)
-- Name: consumables id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consumables ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- TOC entry 3309 (class 2604 OID 33492)
-- Name: instanceditem id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instanceditem ALTER COLUMN id SET DEFAULT nextval('public.instanceditem_id_seq'::regclass);


--
-- TOC entry 3299 (class 2604 OID 33390)
-- Name: items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- TOC entry 3308 (class 2604 OID 33460)
-- Name: loot_crate_instance id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loot_crate_instance ALTER COLUMN id SET DEFAULT nextval('public.loot_crate_instance_id_seq'::regclass);


--
-- TOC entry 3307 (class 2604 OID 33453)
-- Name: lootcrates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lootcrates ALTER COLUMN id SET DEFAULT nextval('public.lootcrates_id_seq'::regclass);


--
-- TOC entry 3293 (class 2604 OID 33345)
-- Name: maps id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maps ALTER COLUMN id SET DEFAULT nextval('public.maps_id_seq'::regclass);


--
-- TOC entry 3300 (class 2604 OID 33396)
-- Name: meleeweapons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.meleeweapons ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- TOC entry 3294 (class 2604 OID 33359)
-- Name: monuments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monuments ALTER COLUMN id SET DEFAULT nextval('public.monuments_id_seq'::regclass);


--
-- TOC entry 3298 (class 2604 OID 33385)
-- Name: npcs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.npcs ALTER COLUMN id SET DEFAULT nextval('public.characters_id_seq'::regclass);


--
-- TOC entry 3297 (class 2604 OID 33381)
-- Name: playercharacters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playercharacters ALTER COLUMN id SET DEFAULT nextval('public.characters_id_seq'::regclass);


--
-- TOC entry 3301 (class 2604 OID 33400)
-- Name: rangedweapons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rangedweapons ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- TOC entry 3306 (class 2604 OID 33421)
-- Name: resourcenodes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resourcenodes ALTER COLUMN id SET DEFAULT nextval('public.resourcenodes_id_seq'::regclass);


--
-- TOC entry 3305 (class 2604 OID 33416)
-- Name: resources id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resources ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- TOC entry 3303 (class 2604 OID 33408)
-- Name: teas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teas ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- TOC entry 3498 (class 0 OID 33365)
-- Dependencies: 215
-- Data for Name: backpack; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.backpack (ownerid, id, slot01, slot02, slot03, slot04, slot05, slot06, slot07, slot08, slot09, slot10, slot11, slot12, slot13, slot14, slot15, slot16, slot17, slot18, slot19, slot20, slot21, slot22, slot23, slot24, slot25, slot26, slot27, slot28, slot29, slot30, slot31, slot32, slot33, slot34, slot35, slot36, slot37, slot38, slot39, slot40, slot41, slot42, slot43, slot44, slot45, slot46, slot47, slot48, slot49, slot50) FROM stdin;
15	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21	7	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
24	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3500 (class 0 OID 33372)
-- Dependencies: 217
-- Data for Name: characters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.characters (id, name, type) FROM stdin;
\.


--
-- TOC entry 3509 (class 0 OID 33409)
-- Dependencies: 226
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
-- TOC entry 3507 (class 0 OID 33401)
-- Dependencies: 224
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
-- TOC entry 3522 (class 0 OID 33489)
-- Dependencies: 239
-- Data for Name: instanceditem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.instanceditem (id, itemid, itemdurability, quantity) FROM stdin;
\.


--
-- TOC entry 3504 (class 0 OID 33387)
-- Dependencies: 221
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.items (id, maxstacksize, itemname, itemtype, lootgrade) FROM stdin;
\.


--
-- TOC entry 3518 (class 0 OID 33457)
-- Dependencies: 235
-- Data for Name: loot_crate_instance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.loot_crate_instance (id, loot_grade, item1_id, item2_id, item3_id, item4_id, item5_id, item6_id, item7_id) FROM stdin;
17	basic	38	80	78	\N	\N	\N	\N
18	basic	27	69	73	19	53	\N	\N
19	basic	20	37	\N	\N	\N	\N	\N
20	basic	78	53	80	\N	\N	\N	\N
21	basic	73	69	52	61	\N	\N	\N
22	basic	78	53	38	\N	\N	\N	\N
23	basic	69	41	21	\N	\N	\N	\N
24	basic	63	61	53	\N	\N	\N	\N
25	resource	14	12	\N	\N	\N	\N	\N
26	food	110	87	\N	\N	\N	\N	\N
27	military	32	51	\N	\N	\N	\N	\N
28	barrel	59	76	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3516 (class 0 OID 33450)
-- Dependencies: 233
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
-- TOC entry 3493 (class 0 OID 33342)
-- Dependencies: 210
-- Data for Name: maps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.maps (id, mapid) FROM stdin;
\.


--
-- TOC entry 3505 (class 0 OID 33393)
-- Dependencies: 222
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
-- TOC entry 3496 (class 0 OID 33356)
-- Dependencies: 213
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
-- TOC entry 3502 (class 0 OID 33382)
-- Dependencies: 219
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
-- TOC entry 3520 (class 0 OID 33478)
-- Dependencies: 237
-- Data for Name: party; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.party (id, "character", capacity) FROM stdin;
\.


--
-- TOC entry 3501 (class 0 OID 33378)
-- Dependencies: 218
-- Data for Name: playercharacters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.playercharacters (id, name, type, hydration, poisoned, hunger, equipeditems1, equipeditems2, equipeditems3, equipeditems4, equipeditems5, backpack) FROM stdin;
1	Character1	Player	1	2	3	\N	\N	\N	\N	\N	\N
15	Kyo	player	100	0	120	43	\N	\N	\N	\N	1
16	Yes	player	100	0	120	43	\N	\N	\N	\N	2
17	Kyo	player	100	0	120	43	\N	\N	\N	\N	3
18	Molib	player	100	0	120	43	\N	\N	\N	\N	4
19	dsadsaf	player	100	0	120	43	\N	\N	\N	\N	5
20	yes	player	100	0	120	43	\N	\N	\N	\N	6
21	yes	player	100	0	120	43	\N	\N	\N	\N	7
22	yes	player	100	0	120	43	\N	\N	\N	\N	8
23	id	player	100	0	120	43	\N	\N	\N	\N	9
24	y6es	player	100	0	120	43	\N	\N	\N	\N	10
\.


--
-- TOC entry 3506 (class 0 OID 33397)
-- Dependencies: 223
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
-- TOC entry 3514 (class 0 OID 33439)
-- Dependencies: 231
-- Data for Name: regionsmonuments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.regionsmonuments (name, regionmonument) FROM stdin;
\.


--
-- TOC entry 3512 (class 0 OID 33418)
-- Dependencies: 229
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
-- TOC entry 3513 (class 0 OID 33424)
-- Dependencies: 230
-- Data for Name: resourcenodesgenerateitems; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resourcenodesgenerateitems (resourcenodes, item) FROM stdin;
\.


--
-- TOC entry 3510 (class 0 OID 33413)
-- Dependencies: 227
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
-- TOC entry 3494 (class 0 OID 33350)
-- Dependencies: 211
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
-- TOC entry 3519 (class 0 OID 33463)
-- Dependencies: 236
-- Data for Name: structurescontainslootcrates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.structurescontainslootcrates (structure, lootcrates) FROM stdin;
\.


--
-- TOC entry 3508 (class 0 OID 33405)
-- Dependencies: 225
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
-- TOC entry 3538 (class 0 OID 0)
-- Dependencies: 214
-- Name: backpack_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.backpack_id_seq', 10, true);


--
-- TOC entry 3539 (class 0 OID 0)
-- Dependencies: 216
-- Name: characters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.characters_id_seq', 24, true);


--
-- TOC entry 3540 (class 0 OID 0)
-- Dependencies: 238
-- Name: instanceditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.instanceditem_id_seq', 1, false);


--
-- TOC entry 3541 (class 0 OID 0)
-- Dependencies: 220
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.items_id_seq', 123, true);


--
-- TOC entry 3542 (class 0 OID 0)
-- Dependencies: 234
-- Name: loot_crate_instance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.loot_crate_instance_id_seq', 28, true);


--
-- TOC entry 3543 (class 0 OID 0)
-- Dependencies: 232
-- Name: lootcrates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lootcrates_id_seq', 1, false);


--
-- TOC entry 3544 (class 0 OID 0)
-- Dependencies: 209
-- Name: maps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.maps_id_seq', 1, false);


--
-- TOC entry 3545 (class 0 OID 0)
-- Dependencies: 212
-- Name: monuments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.monuments_id_seq', 1, false);


--
-- TOC entry 3546 (class 0 OID 0)
-- Dependencies: 228
-- Name: resourcenodes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.resourcenodes_id_seq', 5, true);


--
-- TOC entry 3321 (class 2606 OID 33370)
-- Name: backpack backpack_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backpack
    ADD CONSTRAINT backpack_pkey PRIMARY KEY (id);


--
-- TOC entry 3323 (class 2606 OID 33377)
-- Name: characters characters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters
    ADD CONSTRAINT characters_pkey PRIMARY KEY (id);


--
-- TOC entry 3341 (class 2606 OID 33494)
-- Name: instanceditem instanceditem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instanceditem
    ADD CONSTRAINT instanceditem_pkey PRIMARY KEY (id);


--
-- TOC entry 3325 (class 2606 OID 33392)
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- TOC entry 3335 (class 2606 OID 33462)
-- Name: loot_crate_instance loot_crate_instance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loot_crate_instance
    ADD CONSTRAINT loot_crate_instance_pkey PRIMARY KEY (id);


--
-- TOC entry 3333 (class 2606 OID 33455)
-- Name: lootcrates lootcrates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lootcrates
    ADD CONSTRAINT lootcrates_pkey PRIMARY KEY (id);


--
-- TOC entry 3311 (class 2606 OID 33349)
-- Name: maps maps_mapid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maps
    ADD CONSTRAINT maps_mapid_key UNIQUE (mapid);


--
-- TOC entry 3313 (class 2606 OID 33347)
-- Name: maps maps_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maps
    ADD CONSTRAINT maps_pkey PRIMARY KEY (id);


--
-- TOC entry 3317 (class 2606 OID 33363)
-- Name: monuments monuments_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monuments
    ADD CONSTRAINT monuments_name_key UNIQUE (name);


--
-- TOC entry 3319 (class 2606 OID 33361)
-- Name: monuments monuments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monuments
    ADD CONSTRAINT monuments_pkey PRIMARY KEY (id);


--
-- TOC entry 3339 (class 2606 OID 33482)
-- Name: party pk_party; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.party
    ADD CONSTRAINT pk_party PRIMARY KEY (id);


--
-- TOC entry 3331 (class 2606 OID 33443)
-- Name: regionsmonuments pk_regionsmonuments; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regionsmonuments
    ADD CONSTRAINT pk_regionsmonuments PRIMARY KEY (name, regionmonument);


--
-- TOC entry 3329 (class 2606 OID 33428)
-- Name: resourcenodesgenerateitems pk_resourcenodesgenerateitems; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resourcenodesgenerateitems
    ADD CONSTRAINT pk_resourcenodesgenerateitems PRIMARY KEY (resourcenodes, item);


--
-- TOC entry 3315 (class 2606 OID 33354)
-- Name: structures pk_structures; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structures
    ADD CONSTRAINT pk_structures PRIMARY KEY (id);


--
-- TOC entry 3337 (class 2606 OID 33467)
-- Name: structurescontainslootcrates pk_structurescontainslootcrates; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structurescontainslootcrates
    ADD CONSTRAINT pk_structurescontainslootcrates PRIMARY KEY (structure, lootcrates);


--
-- TOC entry 3327 (class 2606 OID 33423)
-- Name: resourcenodes resourcenodes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resourcenodes
    ADD CONSTRAINT resourcenodes_pkey PRIMARY KEY (id);


--
-- TOC entry 3350 (class 2620 OID 33511)
-- Name: backpack insertbackpack; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER insertbackpack AFTER INSERT ON public.backpack FOR EACH ROW EXECUTE FUNCTION public.insertbackpack();


--
-- TOC entry 3349 (class 2620 OID 33508)
-- Name: maps insertmap; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER insertmap BEFORE INSERT ON public.maps FOR EACH ROW EXECUTE FUNCTION public.insert_map();


--
-- TOC entry 3352 (class 2620 OID 33509)
-- Name: party insertparty; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER insertparty BEFORE INSERT ON public.party FOR EACH ROW EXECUTE FUNCTION public.insert_party();


--
-- TOC entry 3351 (class 2620 OID 33510)
-- Name: playercharacters instanciatecharacter; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER instanciatecharacter AFTER INSERT ON public.playercharacters FOR EACH ROW EXECUTE FUNCTION public.insertcharacter_backpack();


--
-- TOC entry 3347 (class 2606 OID 33483)
-- Name: party fk_party_characters; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.party
    ADD CONSTRAINT fk_party_characters FOREIGN KEY ("character") REFERENCES public.characters(id) ON DELETE RESTRICT;


--
-- TOC entry 3344 (class 2606 OID 33444)
-- Name: regionsmonuments fk_regionsmonuments_monuments; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regionsmonuments
    ADD CONSTRAINT fk_regionsmonuments_monuments FOREIGN KEY (name) REFERENCES public.monuments(name) ON DELETE RESTRICT;


--
-- TOC entry 3343 (class 2606 OID 33434)
-- Name: resourcenodesgenerateitems fk_resourcenodesgenerateitems_items; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resourcenodesgenerateitems
    ADD CONSTRAINT fk_resourcenodesgenerateitems_items FOREIGN KEY (item) REFERENCES public.items(id) ON DELETE RESTRICT;


--
-- TOC entry 3342 (class 2606 OID 33429)
-- Name: resourcenodesgenerateitems fk_resourcenodesgenerateitems_resourcenodes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resourcenodesgenerateitems
    ADD CONSTRAINT fk_resourcenodesgenerateitems_resourcenodes FOREIGN KEY (resourcenodes) REFERENCES public.resourcenodes(id) ON DELETE RESTRICT;


--
-- TOC entry 3346 (class 2606 OID 33473)
-- Name: structurescontainslootcrates fk_structurescontainslootcrates_lootcrates; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structurescontainslootcrates
    ADD CONSTRAINT fk_structurescontainslootcrates_lootcrates FOREIGN KEY (lootcrates) REFERENCES public.lootcrates(id) ON DELETE RESTRICT;


--
-- TOC entry 3345 (class 2606 OID 33468)
-- Name: structurescontainslootcrates fk_structurescontainslootcrates_structures; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structurescontainslootcrates
    ADD CONSTRAINT fk_structurescontainslootcrates_structures FOREIGN KEY (structure) REFERENCES public.structures(id) ON DELETE RESTRICT;


--
-- TOC entry 3348 (class 2606 OID 33495)
-- Name: instanceditem instanceditem_itemid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instanceditem
    ADD CONSTRAINT instanceditem_itemid_fkey FOREIGN KEY (itemid) REFERENCES public.items(id);


--
-- TOC entry 3528 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2022-04-25 18:44:46

--
-- PostgreSQL database dump complete
--

