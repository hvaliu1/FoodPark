--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: authentication; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE authentication (
    id integer NOT NULL,
    user_name character varying(255),
    created timestamp without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    token text
);


ALTER TABLE authentication OWNER TO postgres;

--
-- Name: authentication_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE authentication_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE authentication_id_seq OWNER TO postgres;

--
-- Name: authentication_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE authentication_id_seq OWNED BY authentication.id;


--
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE category (
    id integer NOT NULL,
    category_name character varying(255),
    subcategory_name character varying(255)
);


ALTER TABLE category OWNER TO postgres;

--
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE category_id_seq OWNER TO postgres;

--
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE category_id_seq OWNED BY category.id;


--
-- Name: cooking_methods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cooking_methods (
    id integer NOT NULL,
    product_id integer,
    cooking_method character varying(255),
    measure_from double precision,
    measure_to double precision,
    size_metric character varying(255),
    cooking_temperature character varying(25),
    timing_from double precision,
    timing_to double precision,
    timing_metric character varying(255),
    timing_per character varying(255)
);


ALTER TABLE cooking_methods OWNER TO postgres;

--
-- Name: cooking_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cooking_methods_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cooking_methods_id_seq OWNER TO postgres;

--
-- Name: cooking_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cooking_methods_id_seq OWNED BY cooking_methods.id;


--
-- Name: cooking_tips; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cooking_tips (
    id integer NOT NULL,
    product_id integer,
    tips text,
    safe_minimum_temperature integer,
    rest_time integer,
    rest_time_metric character varying(255)
);


ALTER TABLE cooking_tips OWNER TO postgres;

--
-- Name: cooking_tips_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cooking_tips_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cooking_tips_id_seq OWNER TO postgres;

--
-- Name: cooking_tips_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cooking_tips_id_seq OWNED BY cooking_tips.id;


--
-- Name: data_dictionary; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE data_dictionary (
    id integer NOT NULL,
    sheet character varying(255),
    column_name character varying(255),
    description text
);


ALTER TABLE data_dictionary OWNER TO postgres;

--
-- Name: data_dictionary_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE data_dictionary_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE data_dictionary_id_seq OWNER TO postgres;

--
-- Name: data_dictionary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE data_dictionary_id_seq OWNED BY data_dictionary.id;


--
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE product (
    id integer NOT NULL,
    category_id integer,
    name character varying(255),
    name_subtitle character varying(255),
    keywords text,
    pantry_min integer,
    pantry_max integer,
    pantry_metric character varying(255),
    pantry_tips text,
    dop_pantry_min integer,
    dop_pantry_max integer,
    dop_pantry_metric character varying(255),
    dop_pantry_tips character varying(255),
    pantry_after_opening_min integer,
    pantry_after_opening_max integer,
    pantry_after_opening_metric character varying(255),
    refrigerate_min integer,
    refrigerate_max integer,
    refrigerate_metric character varying(255),
    refrigerate_tips character varying(255),
    dop_refrigerate_min integer,
    dop_refrigerate_max integer,
    dop_refrigerate_metric character varying(255),
    dop_refrigerate_tips character varying(255),
    refrigerate_after_opening_min integer,
    refrigerate_after_opening_max integer,
    refrigerate_after_opening_metric character varying(255),
    refrigerate_after_thawing_min text,
    refrigerate_after_thawing_max integer,
    refrigerate_after_thawing_metric character varying(255),
    freeze_min integer,
    freeze_max integer,
    freeze_metric character varying(255),
    freeze_tips character varying(255),
    dop_freeze_min integer,
    dop_freeze_max integer,
    dop_freeze_metric character varying(255),
    dop_freeze_tips character varying(255)
);


ALTER TABLE product OWNER TO postgres;

--
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE product_id_seq OWNER TO postgres;

--
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE product_id_seq OWNED BY product.id;


--
-- Name: version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE version (
    id integer NOT NULL,
    data_version_number integer,
    current_version character varying(255),
    modified_date character varying(255),
    fsis_approved_flag boolean,
    approved_date character varying(255),
    notes text
);


ALTER TABLE version OWNER TO postgres;

--
-- Name: version_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE version_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE version_id_seq OWNER TO postgres;

--
-- Name: version_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE version_id_seq OWNED BY version.id;


--
-- Name: authentication id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY authentication ALTER COLUMN id SET DEFAULT nextval('authentication_id_seq'::regclass);


--
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY category ALTER COLUMN id SET DEFAULT nextval('category_id_seq'::regclass);


--
-- Name: cooking_methods id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cooking_methods ALTER COLUMN id SET DEFAULT nextval('cooking_methods_id_seq'::regclass);


--
-- Name: cooking_tips id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cooking_tips ALTER COLUMN id SET DEFAULT nextval('cooking_tips_id_seq'::regclass);


--
-- Name: data_dictionary id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY data_dictionary ALTER COLUMN id SET DEFAULT nextval('data_dictionary_id_seq'::regclass);


--
-- Name: product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product ALTER COLUMN id SET DEFAULT nextval('product_id_seq'::regclass);


--
-- Name: version id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY version ALTER COLUMN id SET DEFAULT nextval('version_id_seq'::regclass);


--
-- Data for Name: authentication; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY authentication (id, user_name, created, token) FROM stdin;
1	test	2018-10-28 11:35:38.419717	testtoken
9	test	2018-10-28 11:43:23.803818	testtoken1
\.


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY category (id, category_name, subcategory_name) FROM stdin;
1	Baby Food	\N
2	Baked Goods	Bakery
3	Baked Goods	Baking and Cooking
4	Baked Goods	Refrigerated Dough
5	Beverages	\N
6	Condiments, Sauces & Canned Goods	\N
7	Dairy Products & Eggs	\N
8	Food Purchased Frozen	\N
9	Grains, Beans & Pasta	\N
10	Meat	Fresh
11	Meat	Shelf Stable Foods
12	Meat	Smoked or Processed
13	Meat	Stuffed or Assembled
14	Poultry	Cooked or Processed
15	Poultry	Fresh
16	Poultry	Shelf Stable Foods
17	Poultry	Stuffed or Assembled
18	Produce	Fresh Fruits
19	Produce	Fresh Vegetables
20	Seafood	Fresh
21	Seafood	Shellfish
22	Seafood	Smoked
23	Shelf Stable Foods	\N
24	Vegetarian Proteins	\N
25	Deli & Prepared Foods	\N
\.


--
-- Data for Name: cooking_methods; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cooking_methods (id, product_id, cooking_method, measure_from, measure_to, size_metric, cooking_temperature, timing_from, timing_to, timing_metric, timing_per) FROM stdin;
1	34	Oven	4	8	pounds	325	23	30	minutes	pound
2	35	Oven	4	6	pounds	325	28	38	minutes	pound
3	36	Oven	2.5	4	pounds	325	30	35	minutes	pound
4	37	Oven	4	6	pounds	425	45	60	minutes	\N
5	38	Oven	2	3	pounds	425	35	45	minutes	\N
6	39	Braise	3	4	pounds	325	1.5	2.5	hours	\N
7	40	Broil/Grill	\N	\N	\N	\N	4	5	minutes	\N
8	41	Cover with liquid; simmer	1	1.5	inches	\N	2	3	hours	\N
9	42	Braise	4	8	ounces	325	1.5	2.5	hours	\N
10	43	Broil/Grill/Fry	4	8	ounces	\N	3	5	minutes	\N
11	44	Oven	5	7	pounds	325	20	25	minutes	pound
12	45	Oven	7	9	pounds	325	15	20	minutes	pound
13	46	Oven	4	7	pounds	325	25	30	minutes	pound
14	47	Oven	3	4	pounds	375	20	30	minutes	pound
15	48	Oven	3	4	pounds	325	30	35	minutes	pound
16	49	Broil/Grill	1	1.5	inches	\N	8	12	minutes	\N
17	50	Broil/Grill/Fry	4	8	ounces	\N	5	8	minutes	\N
18	51	Broil/Grill	1	1.5	inches	\N	7	11	minutes	\N
19	52	Broil/Grill	0.75	0.75	inches	\N	14	18	minutes	\N
20	53	Cover with liquid; simmer	1	1.5	inches	\N	1	1.5	hours	\N
21	54	Cover with liquid; simmer	0.75	1	pounds	\N	1	1.5	hours	\N
22	55	Braise	1.5	2	pounds	325	1	1.5	hours	\N
23	56	Oven	3	5	pounds	325	35	40	minutes	pound
24	57	Oven	3	5	pounds	325	35	40	minutes	pound
25	58	Oven	3	4	pounds	325	30	34	minutes	pound
26	59	Broil/Grill/Fry	4	8	ounces	\N	5	8	minutes	\N
27	60	Oven	2	5	pounds	325	20	30	minutes	pound
28	61	Oven	2	4	pounds	325	23	33	minutes	pound
29	63	Broil/Grill	0.75	1.5	inches	\N	8	9	minutes	\N
30	63	Skillet	0.25	0.75	inches	\N	3	4	minutes	\N
31	63	Braise	0.25	0.75	inches	325	6	8	minutes	\N
32	64	Broil/Grill	0.75	1.5	inches	\N	12	16	minutes	\N
33	64	Skillet	0.25	0.75	inches	\N	7	8	minutes	\N
34	64	Braise	0.25	0.75	inches	325	6	8	minutes	\N
35	65	Oven	4	6	pounds	325	20	30	minutes	pound
36	66	Oven	6	10	pounds	325	20	25	minutes	pound
37	67	Oven	0.5	1.5	pounds	425-450	20	30	minutes	\N
38	67	Broil/Grill	0.5	1.5	pounds	\N	20	20	minutes	\N
39	69	Braise	0.5	1	inches	325	8	10	minutes	\N
40	69	Skillet	0.5	1	inches	\N	8	10	minutes	\N
41	72	Oven	2	4	pounds	350	1.5	2	hours	\N
42	72	Braise	2	4	pounds	325	1.5	2	hours	\N
43	72	Broil/Grill	2	4	pounds	\N	1.5	2	hours	\N
44	73	Broil/Grill/Fry	4	8	ounces	\N	5	10	minutes	\N
45	74	Oven	3	6	pounds	350	45	45	minutes	pound
46	74	Braise	3	6	pounds	325	2	2.5	hours	\N
47	75	Broil/Grill	1	1	inches	\N	10	15	minutes	\N
48	75	Cover with liquid; simmer	1	1	inches	\N	45	60	minutes	\N
49	76	Oven	3	4	pounds	325	20	25	minutes	pound
50	83	Oven	10	14	pounds	325	15	18	minutes	pound
51	84	Oven	5	7	pounds	325	18	24	minutes	pound
52	85	Oven	7	9	pounds	325	10	18	minutes	pound
53	86	Oven	5	8	pounds	325	25	30	minutes	pound
54	87	Oven	3	10	pounds	325	15	20	minutes	pound
55	88	Oven	6	12	pounds	325	10	15	minutes	pound
56	89	Oven	10	14	pounds	325	18	20	minutes	pound
57	90	Oven	5	7	pounds	325	22	25	minutes	pound
58	91	Oven	3	4	pounds	325	35	40	minutes	pound
59	92	Oven	5	8	pounds	325	30	35	minutes	pound
60	93	Oven	2	4	pounds	325	35	40	minutes	pound
61	94	Oven	8	20	pounds	325	22	26	minutes	pound
62	95	Oven	5	8	pounds	325	24	28	minutes	pound
63	96	Oven	5	8	pounds	325	35	40	minutes	pound
64	97	Boil	6	16	pounds	\N	20	25	minutes	pound
65	113	Oven	5	7	pounds	350	20	30	minutes	pound
66	114	Oven	4	24	pounds	325	30	30	minutes	pound
67	115	Broil/Grill/Fry	4	8	ounces	\N	5	8	minutes	\N
68	116	Oven	6	8	ounces	350	30	40	minutes	\N
69	117	Oven	4	4	ounces	350	20	30	minutes	\N
70	118	Oven	4	8	ounces	350	40	50	minutes	\N
71	119	Oven	\N	\N	\N	325	30	40	minutes	\N
72	120	Oven	\N	\N	\N	325	20	30	minutes	\N
73	121	Oven	\N	\N	\N	325	40	50	minutes	\N
74	123	Oven	\N	\N	\N	375	20	20	minutes	pound
75	124	Oven	\N	\N	\N	350	18	20	minutes	pound
76	125	Oven	\N	\N	\N	325	20	25	minutes	pound
77	126	Oven	2	3	pounds	350	30	30	minutes	pound
78	127	Oven	\N	\N	\N	425	20	20	minutes	\N
79	128	Oven	4	8	pounds	375	20	30	minutes	pound
80	129	Oven	18	24	ounces	350	50	60	minutes	\N
81	81	Oven	\N	\N	\N	350	1	1	hour	pound
82	81	Cover with liquid; simmer	\N	\N	\N	\N	1	1	hour	pound
83	81	Slow Cooker (Low)	\N	\N	\N	\N	10	12	hours	\N
84	81	Slow Cooker (High)	\N	\N	\N	\N	5	6	hours	\N
85	106	Broil/Grill	1	1.5	inches	\N	20	35	minutes	\N
86	132	Broil/Grill	1	1.5	inches	\N	20	35	minutes	\N
87	135	Oven	\N	\N	\N	325	\N	\N	\N	\N
88	141	Oven	\N	\N	\N	325	30	30	minutes	\N
92	78	Broil/Grill/Fry	4	8	ounces	\N	5	8	minutes	\N
\.


--
-- Data for Name: cooking_tips; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cooking_tips (id, product_id, tips, safe_minimum_temperature, rest_time, rest_time_metric) FROM stdin;
1	21	Cook until yolk and white are firm.	\N	\N	\N
2	24	\N	160	\N	\N
3	34	\N	145	3	minutes
4	35	\N	145	3	minutes
5	36	\N	145	3	minutes
6	37	\N	145	3	minutes
7	38	\N	145	3	minutes
8	39	Braising is roasting or simmering less-tender meats with a small amount of liquid in a tightly covered pan.	145	3	minutes
9	40	Cooking times are per side. Use a food thermometer to check internal temperature, and cook longer if below safe temperature.	145	3	minutes
10	41	\N	145	3	minutes
11	42	Braising is roasting or simmering less-tender meats with a small amount of liquid in a tightly covered pan.	145	\N	\N
12	43	Cooking suggestions are for burgers. Cooking times are per side if grilling.	160	\N	\N
13	44	\N	145	3	minutes
14	45	\N	145	3	minutes
15	46	\N	145	3	minutes
16	47	\N	145	3	minutes
17	48	\N	145	3	minutes
18	49	\N	145	3	minutes
19	50	Cooking suggestions are for burgers. Cooking times are per side if grilling.	160	\N	\N
20	51	Cooking times are per side.	145	3	minutes
21	52	Cook 4 inches from heat.	145	3	minutes
22	53	\N	145	3	minutes
23	54	\N	145	3	minutes
24	55	Braising is roasting or simmering less-tender meats with a small amount of liquid in a tightly covered pan.	145	3	minutes
25	56	\N	145	3	minutes
26	57	\N	145	3	minutes
27	58	\N	145	3	minutes
28	59	Cooking suggestions are for burgers. Cooking times are per side if grilling.	160	\N	\N
29	60	When cooked to safe temperatures, fresh pork may still be pink inside - but it will be safe.	145	3	minutes
30	61	When cooked to safe temperatures, fresh pork may still be pink inside - but it will be safe.	145	3	minutes
34	63	When cooked to safe temperatures, fresh pork may still be pink inside - but it will be safe. Braising is roasting or simmering less-tender meats with a small amount of liquid in a tightly covered pan.	145	3	minutes
37	64	When cooked to safe temperatures, fresh pork may still be pink inside - but it will be safe. Braising is roasting or simmering less-tender meats with a small amount of liquid in a tightly covered pan.	145	3	minutes
38	65	When cooked to safe temperatures, fresh pork may still be pink inside - but it will be safe.	145	3	minutes
39	66	When cooked to safe temperatures, fresh pork may still be pink inside - but it will be safe.	145	3	minutes
40	67	When cooked to safe temperatures, fresh pork may still be pink inside - but it will be safe.	145	3	minutes
41	67	When cooked to safe temperatures, fresh pork may still be pink inside - but it will be safe.	145	3	minutes
43	69	When cooked to safe temperatures, fresh pork may still be pink inside - but it will be safe. Braising is roasting or simmering less-tender meats with a small amount of liquid in a tightly covered pan.	145	3	minutes
46	72	When cooked to safe temperatures, fresh pork may still be pink inside - but it will be safe. Braising is roasting or simmering less-tender meats with a small amount of liquid in a tightly covered pan.	145	3	minutes
48	73	cooking suggestions are for burgers. cooking times are per side if grilling.	160	\N	\N
49	74	When cooked to safe temperatures, fresh pork may still be pink inside - but it will be safe. Braising is roasting or simmering less-tender meats with a small amount of liquid in a tightly covered pan.	145	3	minutes
50	75	When cooked to safe temperatures, fresh pork may still be pink inside - but it will be safe.	145	3	minutes
51	76	\N	160	\N	\N
53	83	Reheat cooked hams packaged in USDA-inspected plants to 140°F and all others to 165°F.	140	\N	\N
54	84	Reheat cooked hams packaged in USDA-inspected plants to 140°F and all others to 165°F.	140	\N	\N
55	85	Reheat cooked hams packaged in USDA-inspected plants to 140°F and all others to 165°F.	140	\N	\N
56	86	Reheat cooked hams packaged in USDA-inspected plants to 140°F and all others to 165°F.	140	\N	\N
57	87	Reheat cooked hams packaged in USDA-inspected plants to 140°F and all others to 165°F.	140	\N	\N
58	88	Reheat cooked hams packaged in USDA-inspected plants to 140°F and all others to 165°F.	140	\N	\N
59	89	\N	145	3	minutes
60	90	\N	145	3	minutes
61	91	\N	145	3	minutes
62	92	\N	145	3	minutes
63	93	\N	145	3	minutes
64	94	\N	145	3	minutes
65	95	\N	145	3	minutes
66	96	\N	145	3	minutes
67	97	Before cooking, soak 4 to 12 hours with water in the refrigerator. After boiling, drain, glaze, and brown at 400°F for 15 minutes.	\N	\N	\N
68	113	Cooking times for poultry are for unstuffed birds. Check the internal temperature in the innermost part of the thigh, innermost part of the wing, and thickest part of the breast. Add 15 to 30 minutes for stuffed birds. Stuffed birds are ready when the internal temperature of stuffing reaches 165°F.	165	\N	\N
69	114	Cooking times for poultry are for unstuffed birds. Check the internal temperature in the innermost part of the thigh, innermost part of the wing, and thickest part of the breast. Add 15 to 30 minutes for stuffed birds. Stuffed birds are ready when the internal temperature of stuffing reaches 165°F.	165	\N	\N
70	115	Cooking suggestions are for burgers. Cooking times are per side if grilling.	165	\N	\N
71	116	\N	165	\N	\N
72	117	\N	165	\N	\N
73	118	\N	165	\N	\N
74	119	\N	165	\N	\N
75	120	\N	165	\N	\N
76	121	\N	165	\N	\N
77	122	Cooking times for poultry are for unstuffed birds. Add 15 to 30 minutes for stuffed birds. The internal temperature should reach 165°F in the center of the stuffing.	165	\N	\N
78	123	Check the internal temperature in the innermost part of the thigh, innermost part of the wing, and thickest part of the breast.	165	\N	\N
79	124	Check the internal temperature in the innermost part of the thigh, innermost part of the wing, and thickest part of the breast.	165	\N	\N
80	125	Check the internal temperature in the innermost part of the thigh, innermost part of the wing, and thickest part of the breast.	165	\N	\N
81	126	Cooking times for poultry are for unstuffed birds. Check the internal temperature in the innermost part of the thigh, innermost part of the wing, and thickest part of the breast. Add 15 to 30 minutes for stuffed birds. Stuffed birds are ready when the internal temperature of stuffing reaches 165°F.	165	\N	\N
82	127	Cooking times for poultry are for unstuffed birds. Check the internal temperature in the innermost part of the thigh, innermost part of the wing, and thickest part of the breast. Add 15 to 30 minutes for stuffed birds. Stuffed birds are ready when the internal temperature of stuffing reaches 165°F.	165	\N	\N
83	128	Cooking times for poultry are for unstuffed birds. Check the internal temperature in the innermost part of the thigh, innermost part of the wing, and thickest part of the breast. Add 15 to 30 minutes for stuffed birds. Stuffed birds are ready when the internal temperature of stuffing reaches 165°F.	165	\N	\N
84	129	Cooking times for poultry are for unstuffed birds. Check the internal temperature in the innermost part of the thigh, innermost part of the wing, and thickest part of the breast. Add 15 to 30 minutes for stuffed birds. Stuffed birds are ready when the internal temperature of stuffing reaches 165°F.	165	\N	\N
85	144	Cook until flesh is opaque and separates easily with a fork.	145	\N	\N
86	145	Cook until flesh is opaque and separates easily with a fork.	145	\N	\N
87	146	\N	145	\N	\N
88	150	Cook until flesh is milky white or opaque and firm.	\N	\N	\N
89	151	Cook until flesh is pearly and opaque.	\N	\N	\N
90	154	Cook until flesh is pearly and opaque.	\N	\N	\N
91	157	Cook until shells open during cooking.	\N	\N	\N
92	158	Cook until flesh is pearly and opaque.	\N	\N	\N
93	159	Cook until flesh is pearly and opaque.	\N	\N	\N
94	160	Cook until shells open during cooking.	\N	\N	\N
95	161	Cook until flesh is pearly and opaque.	\N	\N	\N
96	194	\N	165	\N	\N
97	81	Cooking methods apply covered in water.	\N	\N	\N
98	106	\N	145	3	minutes
99	132	\N	165	\N	\N
100	134	Follow packaging directions.	165	\N	\N
101	135	\N	165	\N	\N
102	141	\N	165	\N	\N
105	78	Cooking suggestions are for burgers. Cooking times are per side if grilling.	160	\N	\N
\.


--
-- Data for Name: data_dictionary; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY data_dictionary (id, sheet, column_name, description) FROM stdin;
1	Version	Data_Version_Number	Integer
2	Version	Modified_Date	Date
3	Version	FSIS_Approved_Flag	Character, Y or N
4	Version	Approved_Date	Date
5	Version	Notes	Text
6	Category	ID	Integer
7	Category	Category_Name	Text
8	Category	Subcategory_Name	Text
9	Product	ID	Integer
10	Product	Category_ID	Integer
11	Product	Name	Text
12	Product	Name_subtitle	Text
13	Product	Pantry_Min	Integer
14	Product	Pantry_Max	Integer
15	Product	Pantry_Metric	Days, Weeks, Months, When Ripe, Indefinitely, Not Recommended
16	Product	Pantry_tips	Text
17	Product	DOP_Pantry_Min	Integer
18	Product	DOP_Pantry_Max	Integer
19	Product	DOP_Pantry_Metric	Days, Weeks, Months, When Ripe, Indefinitely, Not Recommended
20	Product	DOP_Pantry_tips	Text
21	Product	Pantry_After_Opening_Min	Integer
22	Product	Pantry_After_Opening_Max	Integer
23	Product	Pantry_After_Opening_Metric	Days, Weeks, Months, When Ripe, Indefinitely, Not Recommended
24	Product	Refrigerate_Min	Integer
25	Product	Refrigerate_Max	Integer
26	Product	Refrigerate_Metric	Days, Weeks, Months, When Ripe, Indefinitely, Not Recommended
27	Product	Refrigerate_tips	Text
28	Product	DOP_Refrigerate_Min	Integer
29	Product	DOP_Refrigerate_Max	Integer
30	Product	DOP_Refrigerate_Metric	Days, Weeks, Months, When Ripe, Indefinitely, Not Recommended
31	Product	DOP_Refrigerate_tips	Text
32	Product	Refrigerate_After_Opening_Min	Integer
33	Product	Refrigerate_After_Opening_Max	Integer
34	Product	Refrigerate_After_Opening_Metric	Days, Weeks, Months, When Ripe, Indefinitely, Not Recommended, Package use-by date
35	Product	Refrigerate_After_Thawing_Min	Integer
36	Product	Refrigerate_After_Thawing_Max	Integer
37	Product	Refrigerate_After_Thawing_Metric	Days, Weeks, Months, When Ripe, Indefinitely, Not Recommended
38	Product	Freeze_Min	Integer
39	Product	Freeze_Max	Integer
40	Product	Freeze_Metric	Days, Weeks, Months, When Ripe, Indefinitely, Not Recommended
41	Product	Freeze_Tips	Text
42	Product	DOP_Freeze_Min	Integer
43	Product	DOP_Freeze_Max	Integer
44	Product	DOP_Freeze_Metric	Days, Weeks, Months, When Ripe, Indefinitely, Not Recommended
45	Product	DOP_Freeze_Tips	Text
46	CookingTips	ID	Integer
47	CookingTips	Product_ID	Integer
48	CookingTips	Tips	Text
49	CookingTips	Safe_Minimum_Temperature	Integer
50	CookingTips	Rest_Time	Integer
51	CookingTips	Rest Time_metric	hours, minutes, seconds
52	CookingMethods	ID	Integer
53	CookingMethods	Product_ID	Integer
54	CookingMethods	Cooking_Method	Text
55	CookingMethods	Measure_from	Decimal
56	CookingMethods	Measure_to	Decimal
57	CookingMethods	Size_metric	Pounds, Ounces, Inches
58	CookingMethods	Cooking_Temperature	Text
59	CookingMethods	Timing_from	Decimal
60	CookingMethods	Timing_to	Decimal
61	CookingMethods	Timing_metric	hours, minutes, seconds
62	CookingMethods	Timing_per	Pound, Ounce, Inch
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY product (id, category_id, name, name_subtitle, keywords, pantry_min, pantry_max, pantry_metric, pantry_tips, dop_pantry_min, dop_pantry_max, dop_pantry_metric, dop_pantry_tips, pantry_after_opening_min, pantry_after_opening_max, pantry_after_opening_metric, refrigerate_min, refrigerate_max, refrigerate_metric, refrigerate_tips, dop_refrigerate_min, dop_refrigerate_max, dop_refrigerate_metric, dop_refrigerate_tips, refrigerate_after_opening_min, refrigerate_after_opening_max, refrigerate_after_opening_metric, refrigerate_after_thawing_min, refrigerate_after_thawing_max, refrigerate_after_thawing_metric, freeze_min, freeze_max, freeze_metric, freeze_tips, dop_freeze_min, dop_freeze_max, dop_freeze_metric, dop_freeze_tips) FROM stdin;
1	7	Butter	\N	Butter	\N	\N	\N	May be left at room temperature for 1 - 2 days.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	9	Months	\N
2	7	Buttermilk	\N	Buttermilk	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	3	Months	\N
3	7	Cheese	hard such as cheddar, swiss, block parmesan	Cheese,cheddar, swiss,parmesan	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	6	Months	\N	3	4	Weeks	\N	\N	\N	\N	\N	\N	\N	6	6	Months	\N
4	7	Cheese	parmesan; shredded or grated	Cheese,parmesan,shredded,grated	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12	12	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
5	7	Cheese	shredded; cheddar, mozzarella, etc.	Cheese,shredded,cheddar,mozzarella	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Months	\N
6	7	Cheese	processed slices	Cheese,processed slices,slices,slice	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
7	7	Cheese	soft such as brie, bel paese, goat	Cheese,brie, bel paese, goat	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	6	Months	\N
8	7	Coffee creamer	liquid refrigerated	Coffee creamer,Coffee, creamer,liquid refrigerated	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	3	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9	7	Cottage cheese	\N	Cottage cheese,cheese	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2	Weeks	\N	1	1	Weeks	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
10	7	Cream cheese	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
11	7	Cream	whipping, ultrapasteurized	Cream,whipping,ultrapasteurized	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	Months	\N	1	1	Weeks	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
12	7	Cream	whipped, sweetened	Cream,whipped, sweetened	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Months	\N	\N	\N	\N	\N
13	7	Cream	half and half	Cream,half	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	4	Months	\N
14	7	Cream	heavy	Cream,heavy	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	10	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Months	\N
15	7	Cream	light	Cream,light	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Use for cooking.	3	4	Months	\N
16	7	Dips	sour cream based	Dips,sour cream based,sour,cream based,cream,dip	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
17	7	Egg substitutes	liquid	Egg substitutes,liquid,egg,substitutes,substitute	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	7	Days	\N	3	3	Days	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
20	7	Eggnog	commercial	Eggnog,commercial,egg,nog	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	6	Months	\N
21	7	Eggs	in shell	Eggs,in shell,egg,shell	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
22	7	Eggs	raw whites, yolks	Eggs,raw whites, yolks,egg,whites	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	4	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12	12	Months	\N	\N	\N	\N	\N
23	7	Eggs	hard boiled cooked	Eggs,egg,hard boiled cooked,boiled,hard boiled	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
24	7	Egg dishes	\N	Egg dishes,egg,dishes	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	3	Months	Freezing guidance applies to egg dishes after baking.	\N	\N	\N	\N
25	7	Kefir	fermented milk	Kefir,fermented milk,milk,fermented	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	Weeks	\N	1	2	Days	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
26	7	Margarine	\N	Margarine	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	6	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12	12	Months	\N
27	7	Milk	plain or flavored	Milk,plain,flavored,flavor	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Package use-by date	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	3	Months	\N
28	7	Pudding	\N	Pudding	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Package use-by date	\N	\N	\N	\N	\N	2	2	Days	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
29	7	Sour cream	\N	Sour cream,cream,sour	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Package use-by date	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
30	7	Whipped cream	aerosol can	Whipped cream,cream,aerosol can,can	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
31	7	Whipped topping	aerosol can	Whipped topping,topping,aerosol can,can,whipped	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	3	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
32	7	Whipped topping	tub	Whipped topping,topping,tub,whipped	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2	Weeks	\N	\N	\N	\N	\N	\N	\N	14	14	Months	\N	\N	\N	\N	\N
33	7	Yogurt	\N	Yogurt	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Weeks	\N	\N	\N	\N	\N	\N	\N	1	2	Months	\N	\N	\N	\N	\N
34	10	Beef	rib roast, bone-in	Beef,rib roast,bone-in,roast,bone,rib	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	12	Months	\N
35	10	Beef	rib roast; boneless, rolled	Beef,rib roast,boneless,rolled,roast,rib	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	12	Months	\N
36	10	Beef	round or rump roast	Beef,round,rump roast,roast	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	12	Months	\N
37	10	Beef	tenderloin, whole	Beef,tenderloin,whole	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	12	Months	\N
38	10	Beef	tenderloin, half	Beef,tenderloin,half	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	12	Months	\N
39	10	Beef	chuck roast, brisket	Beef,chuck roast,roast,brisket	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	12	Months	\N
40	10	Beef	steaks	Beef,steaks,steak	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	12	Months	\N
41	10	Beef	stew, cubes	Beef,stew, cubes,cube	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	12	Months	\N
42	10	Beef	short ribs	Beef,short ribs,ribs,rib	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	12	Months	\N
43	10	Beef	ground	Beef,ground	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Months	\N
44	10	Lamb	leg, bone-in - small	Lamb,leg,bone-in - small,bone-in,bone	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	12	Months	\N
45	10	Lamb	leg, bone-in - large	Lamb,leg,bone-in - large,bone-in,bone	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	12	Months	\N
46	10	Lamb	leg; boneless, rolled	Lamb,leg,boneless,rolled,bone	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	12	Months	\N
47	10	Lamb	crown roast	Lamb,crown roast,roast	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	12	Months	\N
48	10	Lamb	shoulder roast or shank leg half	Lamb,shoulder roast,roast,shoulder,shank leg half,half,shank,shank leg,leg	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	12	Months	\N
49	10	Lamb	cubes for kabobs	Lamb,cubes,kabobs,cube,kabob	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	12	Months	\N
50	10	Lamb	ground	Lamb,ground	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Months	\N
51	10	Lamb	chops, ribs, or loin	Lamb,chops,ribs,loin,rib	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	12	Months	\N
52	10	Lamb	leg steaks	Lamb,leg steaks,steaks,steak,leg	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	12	Months	\N
53	10	Lamb	stew meat, pieces	Lamb,stew,pieces,stew meat,meat,piece	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	12	Months	\N
54	10	Lamb	shanks	Lamb,shanks,shank	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	12	Months	\N
55	10	Lamb	breast, rolled	Lamb,breast,rolled	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	12	Months	\N
56	10	Veal	shoulder roast, boneless	Veal,shoulder,boneless,shoulder roast,roast	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	12	Months	\N
57	10	Veal	leg rump or round roast, boneless	Veal,leg rump,rump,leg,round,round roast,roast,boneless	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	12	Months	\N
58	10	Veal	loin roast, bone-in	Veal,loin roast,bone-in,roast,bone,loin	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	12	Months	\N
59	10	Veal	ground	Veal,ground	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Months	\N
60	10	Pork	loin roast, bone-in	Pork,loin roast,bone-in,roast,bone,loin	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	12	Months	\N
61	10	Pork	loin roast, boneless	Pork,loin,boneless,loin roast,roast	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	12	Months	\N
63	10	Pork	loin chops, bone-in	Pork,loin chops,bone-in,chops,bone,loin	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	12	Months	\N
179	25	Fruit, cut	\N	Fruit,cut	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Package use-by date	\N	\N	\N	\N	\N	4	4	Days	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
64	10	Pork	loin chops, boneless	Pork,loin,boneless,loin chops,chops	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	12	Months	\N
65	10	Pork	crown roast - small	Pork,roast,crown,crown roast - small,small,crown roast	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	12	Months	\N
66	10	Pork	crown roast - large	Pork,roast,crown,crown roast - large,large,crown roast	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	12	Months	\N
67	10	Pork	tenderloin	Pork,tenderloin	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	12	Months	\N
69	10	Pork	tenderloin medallions or loin cubes	Pork,tenderloin,tenderloin medallions,loin cubes,medallion,loin cube,loin,medallions,cube,cubes	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	12	Months	\N
70	10	Goat	tender whole cuts (legs, ribs, shoulder, loin)	Goat,tender whole cuts,legs,ribs,shoulder,loin,tender,whole cuts,leg,rib	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	12	Months	\N
71	10	Goat	less tender whole cuts (stew meat, riblets, shanks)	Goat,less tender whole cuts,stew meat,stew,meat,riblets,shanks,whole cuts,tender,less tender	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	12	Months	\N
72	10	Pork	ribs	Pork,ribs,rib	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	12	Months	\N
73	10	Pork	ground	Pork,ground	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Months	\N
74	10	Pork	shoulder	Pork,shoulder	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	12	Months	\N
75	10	Pork	loin, cubes	Pork,loin,cubes,cube	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	12	Months	\N
76	10	Venison	round, rump, loin, or rib roast	Venison,rump,round,loin,rib,rib roast,roast	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	12	Months	\N
77	10	Variety meats	liver, tongue, chitterlings, etc.	Variety meats,liver,tongue,chitterlings,meats,meat,chitterling	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Months	\N
78	10	Goat	ground	Goat,ground	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Months	\N
79	12	Bacon	\N	Bacon	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	Weeks	\N	1	1	Weeks	\N	\N	\N	\N	\N	\N	\N	1	1	Months	\N
81	12	Corned beef	in pouch with pickling juices	Corned beef,pouch,pickling juices,juices,juice	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5	7	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	Months	\N
82	12	Ham	canned (“keep refrigerated” label)	Ham,canned,keep refrigerated,label,refrigerated	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	9	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
83	12	Ham	fully cooked, bone-in, whole	Ham,fully cooked,bone-in,whole,cooked,bone	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Months	\N
84	12	Ham	fully cooked, bone-in, half	Ham,fully cooked,bone-in,half,cooked,bone	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Months	\N
85	12	Ham	fully cooked, slices, half, or spiral cut	Ham,fully cooked,slices,half,spiral cut,cooked,slice	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Months	\N
86	12	Ham	fully cooked, arm picnic shoulder, boneless	Ham,fully cooked,cooked,arm picnic shoulder,boneless,shoulder,arm picnic	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Months	\N
87	12	Ham	fully cooked, canned, boneless (refrigerated)	Ham,fully cooked,cooked,canned,boneless,refrigerated	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	9	Months	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	1	2	Months	\N
88	12	Ham	fully cooked, vacuum packed, boneless	Ham,fully cooked,cooked,vacuum packed,boneless	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Months	\N
89	12	Ham	fresh, cook-before-eating, bone-in, whole	Ham,fresh,cook-before-eating,bone-in,whole,bone	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Months	\N
90	12	Ham	fresh, cook-before-eating, bone-in, half	Ham,fresh,cook-before-eating,bone-in,half,bone	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Months	\N
91	12	Ham	fresh, cook-before-eating, shank or butt portion, bone-in	Ham,fresh,cook-before-eating,shank,butt portion,bone-in,bone	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Months	\N
92	12	Ham	fresh, cook-before-eating, arm picnic shoulder, boneless	Ham,fresh,cook-before-eating,before-eating,arm picnic shoulder,boneless,arm picnic,shoulder	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Months	\N
93	12	Ham	fresh, cook-before-eating, shoulder roll (butt), boneless	Ham,fresh,cook-before-eating,before-eating,shoulder roll,butt,boneless,roll	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Months	\N
94	12	Ham	fresh, uncooked, whole leg, bone-in	Ham,fresh,uncooked,whole leg,bone-in,cooked,leg,bone	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Months	\N
95	12	Ham	fresh, uncooked, whole leg, boneless	Ham,fresh,uncooked,whole leg,boneless,cooked,leg,bone	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Months	\N
96	12	Ham	fresh, uncooked, half leg, bone-in	Ham,fresh,uncooked,half leg,bone-in,bone,leg,cooked	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Months	\N
97	12	Ham	country ham (whole or half)	Ham,country ham,whole,half	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Months	\N
98	12	Hot dogs	\N	Hot dogs,hot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2	Weeks	\N	1	1	Weeks	\N	\N	\N	\N	\N	\N	\N	1	2	Months	\N
102	12	Sausage	raw bulk type or patties	Sausage,raw bulk type,patties,raw,patty	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Months	\N
103	12	Sausage	fully cooked smoked links, kielbasa	Sausage,fully cooked smoked links,kielbasa,smoked links,links,fully cooked,link	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Months	\N
104	12	Sausage	hard, dry (pepperoni), sliced	Sausage,hard,dry,pepperoni,sliced,slice,dry pepperoni	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	3	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Months	\N
105	13	Stuffed, raw pork chops	\N	Stuffed,raw pork chops,chops,raw pork,pork	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	9	Months	\N
106	13	Raw kabobs with vegetables	\N	Raw kabobs,vegetables,kabobs,kabob	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Months	\N
107	11	Bacon	fully cooked	Bacon,fully cooked,cooked	\N	\N	\N	\N	6	6	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5	14	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
108	11	Ham	shelf-stable cans	Ham,shelf stable cans,cans,shelf stable,shelf,stable,can	\N	\N	\N	\N	6	9	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5	14	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
109	11	Jerky	commercially dried	Jerky,commercially dried,dried	\N	\N	\N	\N	12	12	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	3	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
110	11	Jerky	homemade	Jerky,homemade	1	2	Months	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
111	11	Meat products	canned	Meat products,products,canned,meat,product	\N	\N	\N	\N	5	5	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
112	11	Retort pouches or boxes	\N	Retort pouches,boxes,box,retort,pouch	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
113	15	Chicken	whole	Chicken,whole	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12	12	Months	\N
114	15	Turkey	whole	Turkey,whole	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12	12	Months	\N
115	15	Ground turkey or chicken	\N	Ground turkey,chicken,turkey	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Months	\N
116	15	Chicken parts	breast halves, bone-in	Chicken parts,breast halves,bone-in,halves,bone,breast,chicken,half	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	9	Months	\N
117	15	Chicken parts	breast halves, boneless	Chicken parts,breast halves,boneless,chicken,breast,halves,half,bone	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	9	Months	\N
118	15	Chicken parts	legs or thighs	Chicken parts,legs,thighs,chicken,leg,thigh	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	9	Months	\N
119	15	Turkey parts	breast halves, bone-in	Turkey parts,breast halves,bone-in,halves,bone,breast,half,turkey	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	9	Months	\N
180	25	Guacamole	\N	Guacamole	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Months	\N	\N	\N	\N	\N
120	15	Turkey parts	breast halves, boneless	Turkey parts,breast,boneless,bone,turkey	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	9	Months	\N
121	15	Turkey parts	legs or thighs	Turkey parts,legs,thighs,turkey,leg,thigh	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	9	Months	\N
123	15	Duckling	domestic or wild, whole	Duckling,domestic,wild,whole	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	6	Months	\N
125	15	Goose	domestic or wild, whole	Goose,domestic,wild,whole	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	6	Months	\N
126	15	Pheasant	young, whole	Pheasant,young,whole	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	6	Months	\N
127	15	Quail	whole	Quail,whole	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	6	Months	\N
128	15	Capon	whole	Capon,whole	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12	12	Months	\N
129	15	Cornish Hens	whole	Cornish Hens,Hens,whole,Hen	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12	12	Months	\N
130	15	Giblets	\N	Giblets,giblet	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Months	\N
131	17	Stuffed, raw chicken breasts	\N	Stuffed,raw chicken breasts,breast,chicken,chicken breasts	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	9	Months	\N	\N	\N	\N	\N
132	17	Raw kabobs with vegetables	\N	Raw kabobs,vegetables,kabobs,kabob,vegetable	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Months	\N	\N	\N	\N	\N
133	17	Turducken	\N	Turducken	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	9	Months	\N
134	14	Chicken nuggets, patties	\N	Chicken nuggets, patties,chicken,nuggets,nugget,patty	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Days	\N	\N	\N	\N	1	3	Months	\N
135	14	Cooked poultry dishes	\N	Cooked poultry dishes,poultry dishes,poultry	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	6	Months	\N	\N	\N	\N	\N
136	14	Fried chicken	\N	Fried chicken,chicken	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	4	Months	\N	\N	\N	\N	\N
140	25	Poultry pieces	covered with gravy or broth	Poultry pieces,gravy,broth,poultry,pieces,piece	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Months	\N	\N	\N	\N	\N
141	14	Rotisserie chicken	\N	Rotisserie chicken,chicken,Rotisserie	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	4	Months	\N
142	16	Canned chicken	\N	Canned chicken,chicken,canned,can	\N	\N	\N	\N	5	5	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
143	16	Retort pouches or boxes	\N	Retort pouches,boxes,box,retort,pouch	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
144	20	Lean fish	cod, flounder, haddock, halibut, sole, etc.	Lean fish,cod, flounder,haddock,halibut,sole,fish	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	8	Months	\N
145	20	Lean fish	pollock, ocean perch, rockfish, sea trout.	Lean fish,pollock,ocean,rockfish, sea,sea trout,fish,ocean perch,perch,trout,rock	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	8	Months	\N
146	20	Fatty fish	bluefish, catfish, mackerel, mullet, salmon, tuna, etc.	Fatty fish,bluefish,catfish,mackerel,mullet,salmon,tuna,fish,fatty,blue,cat	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	3	Months	\N
147	20	Caviar	fresh, in jar	Caviar,fresh,jar	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	4	Weeks	\N	2	2	Days	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
148	20	Cooked fish	all	Cooked fish,fish,all	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Months	\N	\N	\N	\N	\N
149	20	Surimi seafood	\N	Surimi seafood,surimi,sea,food	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Package use-by date	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	9	Months	\N
150	21	Scallops	\N	Scallops,scallop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	3	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	18	Months	\N
151	21	Shrimp, crayfish	\N	Shrimp,crayfish,cray,fish	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	3	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	18	Months	\N
152	21	Squid	\N	Squid	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	3	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	18	Months	\N
153	21	Shucked clams, mussels, and oysters	\N	Shucked clams,mussels,oysters,clams,clam,mussels,mussel,oyster	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	10	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Months	\N
154	21	Crab meat	fresh	Crab meat,meat,fresh,crab	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	3	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	4	Months	\N	\N	\N	\N	\N
155	21	Crab meat	pasteurized	Crab meat,meat,pasteurized,crab	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	12	Months	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	4	10	Months	\N
156	21	Crab legs	king, dungeness, snow	Crab legs,king,dungeness,snow,crab,legs,leg	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	4	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	12	Months	\N
157	21	Live clams, mussels, crab, and oysters	\N	Live clams,mussels,crab,oysters,clams,clam,mussel,oyster	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	3	Months	\N
158	21	Fresh whole lobster	live	Fresh whole lobster,lobster,live,whole lobster	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	Days	It is not safe to cook and eat a whole lobster if it is dead at the time of preparation.	\N	\N	\N	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
159	21	Fresh lobster tails	cooked	Fresh lobster tails,tails,cooked,lobster tails,tail	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	3	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	4	Weeks	\N
160	21	Fresh clams, mussels, oysters	\N	Fresh clams,clams,oysters,clam,mussels,mussel,oyster	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5	10	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
161	21	Fresh whole lobster	frozen	Fresh whole lobster,lobster,frozen,whole lobster	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	4	Weeks	\N
162	21	Cooked shellfish	all	Cooked shellfish,shellfish,fish,cooked	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	3	Months	\N
163	22	Herring	glass packed, in wine sauce	Herring,glass packed,wine sauce,packed,glass,wine,sauce	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	6	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
164	22	Fish	hot smoked, air pack	Fish,hot smoked,air pack,hot,smoked,pack\n	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	14	45	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	12	Months	\N
165	22	Fish	hot smoked, vacuum pack	Fish,hot smoked,vacuum pack,hot,smoked,vacuum,pack	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	14	45	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	12	Months	\N
166	22	Fish	cold smoked, air pack	Fish,cold smoked,air pack,cold,smoked,pack	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	14	30	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	12	Months	\N
167	22	Fish	cold smoked, vacuum pack	Fish,cold smoked,vacuum pack,cold,smoked,vacuum,pack	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	21	30	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	12	Months	\N
168	24	Tofu	\N	Tofu	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5	5	Months	\N
169	24	Miso	\N	Miso	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
170	24	Soy flour	full-fat	Soy flour,full fat,soy,flour,fat	\N	\N	\N	\N	2	2	Months	\N	\N	\N	\N	\N	\N	\N	\N	6	6	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
171	24	Textured soy protein	(TSP)	Textured soy protein,protein,TSP,soy protein,soy	\N	\N	\N	\N	2	2	Years	\N	3	4	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
172	24	Re-hydrated textured soy protein	(TSP)	Re hydrated textured soy protein,protein,TSP,soy,soy protein,textured soy protein,Re hydrated 	\N	\N	\N	\N	3	4	Months	\N	\N	\N	\N	3	4	Days	Refrigeration time applies to prepared product.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
173	25	Leftovers	with meat, fish, poultry, or egg	Leftovers,meat,fish,poultry,egg,leftover	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	3	Months	\N	\N	\N	\N	\N
174	25	Leftovers	without meat, fish, poultry, or egg (such as cooked vegitables, rice, or potatoes)	leftover,leftovers,without meat,fish,poultry,egg,cooked vegetables,rice,potatoes,meat,vegetables,potato,vegetable	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Months	\N	\N	\N	\N	\N
175	25	Leftovers	pizza	Leftovers,pizza	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Months	\N	\N	\N	\N	\N
176	25	Commercial brand vacuum-packed dinners	with USDA seal	Commercial brand vacuum-packed dinners,brand vacuum packed dinners,USDA seal,USDA,seal,dinners,dinner,vacuum packed,vacuum packed dinner,packed dinner,packed	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
177	25	Cooked pasta	\N	Cooked pasta,pasta	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Months	\N	\N	\N	\N	\N
178	25	Cooked rice	\N	Cooked rice,rice	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	6	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	6	Months	\N	\N	\N	\N	\N
181	25	Hummus	commercial (pasteurized, with preservatives)	Hummus,commercial,pasteurized,preservatives,preservative	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	3	Months	\N	7	7	Days	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
183	25	Hummus	traditional (no preservatives, not pasteurized)	Hummus,traditional,no preservatives,not pasteurized,no preservative,preservatives,preservative,pasteurized	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	7	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
184	25	Luncheon meat or poultry	store-sliced	Luncheon meat,poultry,store sliced,meat,luncheon,store,sliced	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	1	2	Months	\N	\N	\N	\N	\N
185	25	Main dishes or meals	hot or refrigerated	Main dishes,meals,hot,refrigerated,dishes,dish,meal	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	\N	\N	\N	\N	\N	\N	\N	2	3	Months	\N	\N	\N	\N	\N
186	25	Meats	covered with gravy or broth	Meats,gravy,broth,meat	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	6	Months	\N	\N	\N	\N	\N
187	25	Olives	from olive bar	Olives,bar,olive	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
188	25	Pate	\N	Pate	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Days	\N	\N	\N	\N	\N	\N	\N	1	2	Months	\N	\N	\N	\N	\N
192	25	Luncheon meat or poultry	pre-packaged	Luncheon meat,luncheon,meat,poultry,packaged,pre packaged	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2	Weeks	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	1	2	Months	\N
193	25	Soup, stews	\N	Soup,stews,stew	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	3	Months	\N	\N	\N	\N	\N
194	25	Casseroles	\N	Casseroles,Casserole	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
195	2	Commercial bread products	including pan breads, flat breads, rolls, and buns	Commercial bread products,pan breads,flat breads,rolls,buns,bread products,bread,products,product,pan,breads,bread,flat,roll,bun	\N	\N	\N	\N	14	18	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	3	Weeks	\N	\N	\N	\N	\N	\N	\N	3	5	Months	\N
196	9	Tortillas	flour	Tortillas,Tortilla	\N	\N	\N	\N	3	3	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	3	Months	\N	\N	\N	\N	\N	\N	\N	6	6	Months	\N
197	2	Commercial cakes and muffins	\N	Commercial cakes,cake,muffin,muffins	\N	\N	\N	\N	3	7	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	10	Days	\N	\N	\N	\N	\N	\N	\N	6	6	Months	\N
198	2	Cheesecake	\N	Cheesecake,cake,cheese	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5	7	Days	\N	\N	\N	\N	\N	\N	\N	3	6	Months	\N
199	2	Cookies	soft	Cookies,soft,cookie	\N	\N	\N	\N	2	3	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8	12	Months	\N
200	2	Cookies	crispy	Cookies,crispy,cookie	\N	\N	\N	\N	4	6	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8	12	Months	\N
201	2	Dairy filled eclairs	\N	Dairy filled eclairs,dairy filled,eclairs,éclair,dairy	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	3	Days	\N	\N	\N	\N	\N	\N	\N	3	3	Months	\N
202	2	Doughnuts	\N	Doughnuts,doughnut,dough,nut	\N	\N	\N	\N	1	2	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2	Days	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
203	2	Fruit cake	\N	Fruit cake,fruit,cake	\N	\N	\N	\N	6	6	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12	12	Months	\N	\N	\N	\N	\N	\N	\N	12	12	Months	\N
204	2	Pastries, danish	\N	Pastries,danish,pastry	\N	\N	\N	\N	5	10	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	14	14	Months	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
205	2	Cream pies	banana cream, coconut cream, butterscotch	Pies,cream,pie, banana, banana cream,coconut,coconut cream,butterscotch	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
206	2	Chiffon pies	chocolate, lemon	Pies,chiffon,pie,chocolate,lemon,chocolate pie,lemon pie	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Days	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
207	2	Fruit pies	apple, peach, blueberry, apricot, cherry, blackberry	Pies,fruit,pie,apple,apple pie,peach,peach pie,blueberry,blueberry pie,cherry,cherry pie,apricot,apricot pie,blackberry,blackberry pie	1	2	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	Weeks	\N	\N	\N	8	8	Months	\N	\N	\N	\N	\N
208	2	Pies	mincemeat	Pies,mincemeat,pie,meat,mince	2	2	Hours	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	Weeks	\N	\N	\N	8	8	Months	\N	\N	\N	\N	\N
209	2	Pies	pecan	Pies,Pie,pecan	2	2	Hours	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	\N	\N	\N	1	2	Months	\N	\N	\N	\N	\N
210	2	Pies	pumpkin	Pies,Pie,pumpkin	2	2	Hours	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	\N	\N	\N	1	2	Months	\N	\N	\N	\N	\N
211	2	Quiche	\N	Quiche	2	2	Hours	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	2	3	Months	\N	\N	\N	\N	\N
212	3	Baking powder	\N	Baking powder,baking,powder	\N	\N	\N	\N	6	18	Months	\N	3	6	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
213	3	Baking soda	\N	Baking soda,soda,baking	\N	\N	\N	\N	2	3	Years	\N	6	6	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
214	3	Biscuit or pancake mix	\N	Biscuit,pancake mix,pancake,mix,cake	\N	\N	\N	\N	9	9	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
215	3	Cake, brownie, bread mixes	\N	Cake,brownie,bread mixes,bread,mixes,mix	\N	\N	\N	\N	12	18	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
216	3	Chocolate	unsweetened and semi-sweet, solid	Chocolate,unsweetened,semi sweet,solid,sweet	\N	\N	\N	\N	1	2	Years	\N	1	1	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
217	3	Cocoa and cocoa mixes	\N	Cocoa,cocoa mixes,mixes,mix	\N	\N	\N	\N	\N	\N	Indefinitely	\N	1	1	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
218	3	Cornmeal	regular, degerminated	Cornmeal,regular,degerminated,germinated,germinate,corn,meal	\N	\N	\N	\N	6	12	Months	\N	2	2	Years	\N	\N	\N	\N	\N	\N	\N	\N	1	1	Year	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
219	3	Cornmeal	stone ground or blue	Cornmeal,stone ground,blue,ground,stone,corn,meal	\N	\N	\N	\N	1	1	Months	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N	\N	\N	\N	2	4	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
220	3	Cornstarch	\N	Cornstarch,corn,starch	\N	\N	\N	\N	18	24	Months	\N	18	18	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
222	3	Flour	white	Flour,white	\N	\N	\N	\N	6	12	Months	\N	6	8	Months	\N	\N	\N	\N	\N	\N	\N	\N	1	1	Year	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
223	3	Flour	whole wheat	Flour,whole wheat,wheat	\N	\N	\N	\N	3	6	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	8	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
224	3	Frosting or icing	\N	Frosting,icing,frost,ice	\N	\N	\N	\N	10	12	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	3	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
225	3	Gelatin	flavored	Gelatin,flavor,flavored	\N	\N	\N	\N	10	12	Months	\N	3	4	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
226	3	Gelatin	unflavored	Gelatin,unflavor,unflavored	\N	\N	\N	\N	3	3	Years	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
227	3	Oils	olive or vegetable	Oils,olive,vegetable,oil	\N	\N	\N	\N	6	12	Months	\N	3	5	Months	\N	\N	\N	\N	\N	\N	\N	\N	4	4	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
228	3	Nut oils	\N	Nut oils,nut,oils,oil	\N	\N	\N	\N	6	12	Months	\N	3	8	Months	\N	\N	\N	\N	\N	\N	\N	\N	6	8	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
229	3	Vegetable oil sprays	\N	Vegetable oil sprays,sprays,oil,vegetable,vegetable oil	\N	\N	\N	\N	2	2	Years	\N	1	1	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
230	3	Shortening	solid	Shortening,solid	\N	\N	\N	\N	1	2	Years	\N	6	12	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
231	3	Tamarind paste	\N	Tamarind paste,paste,tamarind	\N	\N	\N	\N	6	12	Months	\N	6	6	Months	\N	\N	\N	\N	\N	\N	\N	\N	2	3	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
232	3	Chili powder	\N	Chili powder,powder,chili	\N	\N	\N	\N	2	2	Years	\N	2	2	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
233	3	Seasoning blends	\N	Seasoning blends,blends,seasoning,blend	\N	\N	\N	\N	1	2	Years	\N	1	2	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
234	3	Flavored or herb mixes	\N	Flavored,herb mixes,herb,flavor,mixes,mix	\N	\N	\N	\N	6	6	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
235	3	Garlic	chopped, commercial jars	Garlic,chopped,jars,commercial jars,jar	\N	\N	\N	\N	8	12	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
236	3	Herbs	dried	Herbs,dried,herb	\N	\N	\N	\N	1	2	Years	\N	1	2	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
237	3	Spice/spices	whole	Spice,spices,whole	\N	\N	\N	\N	3	4	Years	\N	3	4	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
238	3	Spice/spices	ground	Spice,spices,ground	\N	\N	\N	\N	2	3	Years	\N	2	3	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
239	3	Sugar	brown	Sugar,brown	\N	\N	Indefinitely	Sugar never spoils, but for best quality use within 2 years of opening.	\N	\N	\N	\N	18	24	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
240	3	Sugar	granulated	Sugar,granulated	\N	\N	Indefinitely	Sugar never spoils, but for best quality use within 2 years of opening.	\N	\N	\N	\N	18	24	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
291	19	Lettuce	leaf, spinach	Lettuce,leaf,spinach	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	7	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
241	3	Sugar	confectioners	Sugar,confectioners,confectioner	\N	\N	Indefinitely	Sugar never spoils, but for best quality use within 2 years of opening.	\N	\N	\N	\N	18	24	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
242	3	Sugar substitutes	\N	Sugar substitutes,sugar,substitutes,substitute	\N	\N	\N	\N	2	2	Years	\N	\N	\N	Indefinitely	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
243	3	Tapiocas	\N	Tapiocas,Tapioca	\N	\N	\N	\N	12	12	Months	\N	12	12	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
245	4	Tube cans	of biscuits, rolls, pizza dough, etc.	Tube cans,biscuits,biscuit,rolls,roll,pizza,pizza dough,dough,tube can,can,tube	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Package use-by date	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
246	4	Ready-to-bake pie crust	\N	Ready to bake pie crust,pie,crust,bake,ready	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Package use-by date	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2	Months	\N
247	4	Cookie dough	\N	Cookie dough,cookie,dough	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Package use-by date	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2	Months	\N
248	18	Apples	\N	Apples,apple	\N	\N	\N	\N	3	3	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	4	6	Weeks	\N	\N	\N	\N	\N	\N	\N	8	8	Months	Freezing guidance applies to cooked product.	\N	\N	\N	\N
249	18	Apricots	\N	Apricots,Apricot	\N	\N	When Ripe	Ripe is when this item is tender, fully developed and ready to eat.	\N	\N	\N	\N	\N	\N	\N	2	5	Days	Timeline for refrigerator applies to ripe fruit.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
250	18	Avocados	\N	Avocados,Avocado	\N	\N	When Ripe	Ripe is when this item is tender, fully developed and ready to eat.	\N	\N	\N	\N	\N	\N	\N	3	4	Days	Timeline for refrigerator applies to ripe fruit.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
251	18	Bananas	\N	Bananas,banana	\N	\N	When Ripe	Ripe is when this item is tender, fully developed and ready to eat.	\N	\N	\N	\N	\N	\N	\N	3	3	Days	Timeline for refrigerator applies to ripe fruit; skin will blacken.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	3	Months	\N	\N	\N	\N	\N
252	18	Berries	cherries, goose berries, lychee	Berries,berry,cherries,cherry,goose berries,goose berry,lychee,gooseberries	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	7	Days	\N	\N	\N	\N	\N	\N	\N	12	12	Months	\N	\N	\N	\N	\N
253	18	Berries	blackberries, boysenberries, currant	Berries,berry,blackberries,blackberry,boysenberries,boysenberry,currant	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	6	Days	\N	\N	\N	\N	\N	\N	\N	12	12	Months	\N	\N	\N	\N	\N
254	18	Blueberries	\N	Blueberries,blueberry,berries,berry	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Weeks	\N	\N	\N	\N	\N	\N	\N	8	12	Months	\N	\N	\N	\N	\N
255	18	Cherimoya	\N	Cherimoya	\N	\N	When Ripe	Ripe is when this item is tender, fully developed and ready to eat.	\N	\N	\N	\N	\N	\N	\N	4	4	Days	Timeline for refrigerator applies to ripe fruit.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	12	Months	\N	\N	\N	\N	\N
256	18	Citrus fruit	lemon, lime, orange, grapefruit, tangerines, clementines	Citrus fruit,fruit,citrus,lemon,lime,orange,grape,grapefruit,tangerines,tangerine,clementines,clementine	\N	\N	\N	\N	10	10	Days	\N	\N	\N	\N	\N	\N	\N	\N	10	21	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
257	18	Coconut	shredded	Coconut,shredded	\N	\N	\N	Applies to unopened coconut.	1	1	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8	8	Months	\N	\N	\N	1	1	Years	\N	\N	\N	\N	\N
258	18	Coconuts	fresh	Coconuts,Coconut,fresh	\N	\N	\N	\N	1	1	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	2	3	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
259	18	Cranberries	\N	Cranberries,cranberry	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2	Months	\N	\N	\N	\N	\N	\N	\N	12	12	Months	\N	\N	\N	\N	\N
260	18	Dates	\N	Dates	\N	\N	\N	\N	2	2	Months	\N	\N	\N	\N	\N	\N	\N	\N	12	12	Months	\N	\N	\N	\N	\N	\N	\N	1	2	Years	\N	\N	\N	\N	\N
261	18	Grapes	\N	Grapes,grape	\N	\N	\N	\N	1	1	Days	\N	\N	\N	\N	\N	\N	\N	\N	1	1	Weeks	\N	\N	\N	\N	\N	\N	\N	1	1	Months	Freezing guidance applies to whole grapes.	\N	\N	\N	\N
262	18	Guava	\N	Guava	\N	\N	When Ripe	Ripe is when this item is tender, fully developed and ready to eat. Note, these spoil quickly.	\N	\N	\N	\N	\N	\N	\N	2	4	Days	Timeline for refrigerator applies to ripe fruit.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
263	18	Kiwi fruit	\N	Kiwi fruit,kiwi,fruit	\N	\N	When Ripe	Ripe is when this item is tender, fully developed and ready to eat.	\N	\N	\N	\N	\N	\N	\N	3	6	Days	Timeline for refrigerator applies to ripe fruit.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
264	18	Melons	\N	Melons,melon	\N	\N	When Ripe	Until Ripe, then 7 days. Ripe is when this item is tender, fully developed and ready to eat.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2	Weeks	\N	2	4	Days	\N	\N	\N	1	1	Months	Freezing guidance applies to balled melon.	\N	\N	\N	\N
265	18	Papaya, mango, feijoa, passionfruit, casaha melon	\N	Papaya,mango,feijoa,passionfruit,casaha melon,melon,fruit,passion	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	1	1	Weeks	\N	\N	\N	\N	\N	\N	\N	6	8	Months	\N	\N	\N	\N	\N
266	18	Peaches, nectarines, plums, pears, sapote	\N	Peaches,nectarines,plums,pears,sapote,peach,nectarine,plum,pear	\N	\N	When Ripe	Until Ripe, then 1-2 days. Ripe is when this item is tender, fully developed and ready to eat.	\N	\N	\N	\N	\N	\N	\N	3	5	Days	Timeline for refrigerator applies to ripe fruit.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2	Months	Freezing guidance applies to product when sliced, with lemon juice and sugar.	\N	\N	\N	\N
267	18	Pineapple	\N	Pineapple	\N	\N	When Ripe	Until Ripe, then 1-2 days. Ripe is when this item is tender, fully developed and ready to eat.	\N	\N	\N	\N	\N	\N	\N	5	7	Days	Timeline for refrigerator applies to ripe fruit.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	12	Months	\N	\N	\N	\N	\N
268	18	Plantains	\N	Plantains,plantain	\N	\N	When Ripe	Until Ripe, then 1-2 days. Ripe is when this item is tender, fully developed and ready to eat.	\N	\N	\N	\N	\N	\N	\N	3	5	Days	Timeline for refrigerator applies to ripe fruit.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	12	Months	\N	\N	\N	\N	\N
269	18	Pomegranate	\N	Pomegranate	\N	\N	\N	\N	2	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	1	3	Months	\N	\N	\N	\N	\N	\N	\N	10	12	Months	\N	\N	\N	\N	\N
270	19	Artichokes, whole	\N	Artichokes,artichoke,whole	\N	\N	\N	\N	1	2	Days	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
271	19	Asparagus	\N	Asparagus	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5	5	Months	\N
272	19	Bamboo shoots	\N	Bamboo shoots,bamboo,shoots,shoot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2	Weeks	\N	5	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
273	19	Beans and peas	green, fava, lima, soybean, wax, snow, sugar snap	Beans,peas,green,fava,lima,soybean,wax,snow,sugar snap,sugar,pea,soya	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8	8	Months	\N
274	19	Beets	\N	Beets	\N	\N	\N	\N	1	1	Days	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	8	Months	\N
275	19	Bok choy	\N	Bok choy	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	3	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	12	Months	\N
276	19	Broccoli and broccoli raab (rapini)	\N	Broccoli,broccoli raab,rapini,raab	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	12	Months	\N
277	19	Brussels sprouts	\N	Brussels sprouts,brussels,sprouts,sprout,brussel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	12	Months	\N
278	19	Cabbage	\N	Cabbage	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	12	Months	\N
279	19	Carrots, parsnips	\N	Carrots,parsnips,carrot,parsnip	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	3	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	12	Months	\N
280	19	Cauliflower	\N	Cauliflower	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	12	Months	\N
281	19	Celery	\N	Celery	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	12	Months	\N
282	19	Corn on the cob	\N	Corn,cob	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8	8	Months	\N
283	19	Cucumbers	\N	Cucumbers,cucumber	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	6	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
284	19	Eggplant	\N	Eggplant,egg	\N	\N	\N	\N	1	1	Days	\N	\N	\N	\N	\N	\N	\N	\N	4	7	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	8	Months	\N
285	19	Garlic	\N	Garlic	\N	\N	\N	Store unbroken bulbs in pantry.	1	1	Months	\N	\N	\N	\N	\N	\N	\N	Store individual cloves in refrigerator.	3	14	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	Months	\N
286	19	Ginger root	\N	Ginger root,ginger,root	\N	\N	\N	\N	2	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	2	3	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	6	Months	\N
287	19	Greens	\N	Greens,green	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	4	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	12	Months	\N
288	19	Herbs	\N	Herbs,herb	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	10	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Months	\N
289	19	Leeks	\N	Leeks,leek	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	12	Months	\N
290	19	Lettuce	iceberg, romaine	Lettuce,iceberg,romaine	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
292	19	Mushrooms	\N	Mushroom,mushrooms	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	7	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	12	Months	\N
293	19	Okra	\N	Okra	\N	\N	\N	Highly perishable when stored in the pantry.	1	1	Days	\N	\N	\N	\N	\N	\N	\N	\N	2	3	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	12	Months	\N
294	19	Onions	yellow, white, red, etc.	Onions,yellow,white,red,onion	\N	\N	\N	\N	1	1	Months	\N	\N	\N	\N	\N	\N	\N	\N	2	2	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	12	Months	\N
295	19	Onions	spring or green	Onions,spring,green,onion	\N	\N	\N	\N	1	1	Months	\N	\N	\N	\N	\N	\N	\N	\N	1	1	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	12	Months	\N
296	19	Peppers	\N	Peppers,pepper	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	14	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	8	Months	\N
297	19	Potatoes	\N	Potatoes,potato	\N	\N	\N	This is the recommended storage method for whole potatoes.	1	2	Months	\N	\N	\N	\N	\N	\N	\N	The United States Potato Board notes refrigeration can cause potatoes to darken during cooking and to develop an unpleasantly sweet taste.	1	2	Weeks	\N	\N	\N	\N	\N	\N	\N	10	12	Months	Freezer timeline applies to cooked and mashed potatoes.	\N	\N	\N	\N
298	19	Pumpkins	\N	Pumpkins,pumpkin	\N	\N	\N	\N	2	3	Months	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
299	19	Radishes	\N	Radishes,radish	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	14	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
300	19	Rhubarb	\N	Rhubarb	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	7	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
301	19	Rutabagas	\N	Rutabagas	\N	\N	\N	\N	1	1	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	2	3	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8	10	Months	\N
302	19	Squash	summer and zucchini	Squash,summer,zucchini	\N	\N	\N	\N	1	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	4	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	12	Months	\N
303	19	Squash	winter	Squash,winter	\N	\N	\N	\N	2	6	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	1	3	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	12	Months	\N
304	19	Tamarind	\N	Tamarind	\N	\N	\N	\N	1	3	Weeks	\N	\N	\N	\N	\N	\N	\N	Refrigeration guidelines apply to just the pulp.	6	6	Months	\N	\N	\N	\N	\N	\N	\N	1	1	Years	Freezing guidelines apply to just the pulp.	\N	\N	\N	\N
305	19	Taro	\N	Taro	\N	\N	\N	\N	7	7	Days	\N	\N	\N	\N	\N	\N	\N	Refrigeration not recommended.	2	3	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
306	19	Tomatoes	\N	Tomatoes,tomato	\N	\N	When Ripe	Until Ripe, then 7 days. Ripe is when this item is tender, fully developed and ready to eat. Refrigeration may affect flavor; USDA recommends pantry storage.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2	Months	\N
307	19	Turnips	\N	Turnips,turnip	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8	10	Months	\N
308	19	Yuca/cassava	\N	Yuca,cassava	\N	\N	\N	\N	7	7	Days	\N	\N	\N	\N	\N	\N	\N	\N	3	3	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Months	\N
309	8	Dough	commercial (bread or cookie)	Dough,commercial,bread,cookie	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	Recommendation is for storage after cooking.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12	12	Months	Keep frozen. For safety, cook as directed.
310	8	Egg substitutes	\N	Egg substitutes,egg,substitute,Egg substitute	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	Recommendation is for storage after cooking.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12	12	Months	Keep frozen. For safety, cook as directed.
311	8	Fish	breaded	Fish,breaded,bread	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Not Recommended	Not recommended to refrigerate after cooking due to decreased quality.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	18	18	Months	Keep frozen. For safety, cook as directed.
312	8	Fish	raw but headed and gutted	Fish,raw,headed,gutted	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	Recommendation is for storage after cooking.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	6	Months	Keep frozen. For safety, cook as directed.
313	8	Frozen potato products	fries, hashbrowns, tater tots	Frozen potato products,fries,hashbrowns,tater tots,potato products,products,product,frozen potato,hashbrown,tater tot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Not Recommended	Not recommended to refrigerate after cooking due to decreased quality.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12	12	Months	Keep frozen. For safety, cook as directed.
314	8	Frozen pretzels	\N	Frozen pretzels,frozen,pretzels,pretzel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	Recommendation is for storage after cooking.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	9	Months	Keep frozen. For safety, cook as directed.
315	8	Fruits	such as berries, melons	Fruits,berries,melons,berry,melon	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Thawing in the refrigerator is not recommended.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	18	Months	\N
317	8	Ice cream	\N	Ice cream,ice,cream	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	6	Months	\N
318	8	Ice pops	\N	Ice pops,ice,pops,pop	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	9	Months	\N
319	8	Juice concentrates	\N	Juice concentrates,juice,concentrate	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2	Years	\N
320	8	Lobster tails	\N	Lobster tails,tail,lobster,Lobster tail	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	Recommendation is for storage after cooking.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8	8	Months	Keep frozen. For safety, cook as directed.
321	8	Pancakes, waffles	\N	Pancakes,waffles,pancake	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Not Recommended	Not recommended to refrigerate after cooking due to decreased quality.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	3	Months	Keep frozen. For safety, cook as directed.
322	8	Sausages	uncooked	Sausages,Sausage,uncooked,cooked	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	Recommendation is for storage after cooking.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Months	Keep frozen. For safety, cook as directed.
323	8	Sausages	precooked	Sausages,Sausage,precooked,cooked	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	Recommendation is for storage after cooking.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Months	Keep frozen. For safety, cook as directed.
324	8	Sherbet, sorbet	\N	Sherbet,sorbet	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Not Recommended	Not recommended to refrigerate after cooking due to decreased quality.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	9	Months	\N
325	8	Shrimp, shellfish	\N	Shrimp,shellfish,fish	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	Recommendation is for storage after cooking.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12	18	Months	Keep frozen. For safety, cook as directed.
326	8	Soy crumbles and hot dogs	\N	Soy crumbles,hot dogs,hot dog,soy,soy crumble	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	Recommendation is for storage after cooking.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Months	Keep frozen. For safety, cook as directed.
327	8	Soy meat substitutes	\N	Soy meat substitutes,soy,meat,soy meat,meat substitutes,substitutes,substitute	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	Recommendation is for storage after cooking.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12	18	Months	Keep frozen. For safety, cook as directed.
328	8	Tempeh	\N	Tempeh	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	Recommendation is for storage after cooking.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	6	Months	Keep frozen. For safety, cook as directed.
330	8	Frozen entrees	prepared meals	TV dinners,entrees,breakfast,dinners,dinner,entry,TV	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Not Recommended	Not recommended to refrigerate after cooking due to decreased quality.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12	12	Months	Keep frozen. For safety, cook as directed.
331	8	Vegetables	\N	Vegetables,vegetable	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	Recommendation is for storage after cooking.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	18	Months	Keep frozen. For safety, cook as directed.
332	9	Fresh pasta	\N	Fresh pasta,pasta	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2	Months	\N	\N	\N	\N	\N
333	9	Beans	dried	Beans,dried	\N	\N	\N	\N	1	2	Years	\N	1	1	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
334	9	Lentils	dried	Lentils,dried	\N	\N	\N	\N	1	1	Years	\N	1	1	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
335	9	Pasta	dry, without eggs	Pasta,dry,eggs,egg,without egg,without eggs	\N	\N	\N	\N	2	2	Years	\N	1	1	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
336	9	Dry egg noodles	\N	Dry egg noodles,egg noodles,egg,noodles,noodle,dry	\N	\N	\N	\N	2	2	Years	\N	1	2	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
337	9	Peas	dried split	Peas,Pea,dried split,split	\N	\N	\N	\N	1	1	Years	\N	1	1	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
338	9	Rice	white or wild	Rice,white,wild	\N	\N	\N	\N	2	2	Years	\N	1	1	Years	\N	\N	\N	\N	\N	\N	\N	\N	6	6	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
339	9	Rice	brown	Rice,brown	\N	\N	\N	\N	1	1	Years	\N	1	1	Years	\N	\N	\N	\N	\N	\N	\N	\N	6	6	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
376	23	Chocolate syrup	\N	Chocolate syrup,Chocolate,syrup	\N	\N	\N	\N	2	2	Years	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N	\N	\N	\N	6	6	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
377	23	Crackers	\N	Crackers,cracker	\N	\N	\N	\N	8	8	Months	\N	1	1	Months	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Months	\N	\N	\N	3	4	Months	\N	\N	\N	\N	\N
340	6	Barbecue sauce	bottled	Barbecue sauce,sauce,bottled,Barbecue	\N	\N	\N	Refrigeration ensures that commercial sauces and condiments stay fresh for a longer period of time. Shelf-stable commercial barbecue sauce is safe when stored at room temperature after opening. Quality, not safety, is the reason the labels on these products suggest that they be refrigerated after opening.	1	1	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	4	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
341	6	Chutney	\N	Chutney	\N	\N	\N	\N	1	1	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
342	6	Cream sauces, milk solids	\N	Cream sauces,milk solids,sauce,solids,cream,sauces,milk,solid	\N	\N	\N	\N	6	12	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
343	6	Dry gravy mixes	\N	Dry gravy mixes,gravy,mixes,mix,dry	\N	\N	\N	\N	2	2	Years	\N	\N	\N	\N	1	2	Days	Refrigeration time applies to prepared product.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
344	6	Gravy	jars and cans	Gravy,jars,cans,jar,can	\N	\N	\N	\N	2	5	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
345	6	Honey	\N	Honey	\N	\N	\N	\N	2	2	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
346	6	Horseradish	in jar	Horseradish,jar	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12	12	Months	\N	3	4	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
347	6	Jams, jellies, and preserves	\N	Jams,jellies,preserves,jam,jelly,preserve	\N	\N	\N	\N	6	18	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	12	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
348	6	Ketchup, cocktail, or chili sauce	\N	Ketchup,cocktail,chili sauce,sauce,chili	\N	\N	\N	Refrigeration ensures that commercial sauces and condiments stay fresh for a longer period of time. Shelf-stable commercial ketchup, cocktail sauce, and chili sauce are safe when stored at room temperature after opening. Quality, not safety, is the reason the labels on these products suggest that they be refrigerated after opening.	1	1	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	6	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
349	6	Marinades	\N	Marinades,marinade	\N	\N	\N	\N	1	1	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	6	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
350	6	Mayonnaise	commercial	Mayonnaise,commercial	\N	\N	\N	Refrigeration ensures that commercial sauces and condiments stay fresh for a longer period of time. Shelf-stable commercial mayonnaise is safe when stored at room temperature after opening.  Quality, not safety, is the reason the labels on these products suggest that they be refrigerated after opening.	3	6	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
351	6	Mustard	\N	Mustard	\N	\N	\N	Refrigeration ensures that commercial sauces and condiments stay fresh for a longer period of time. Shelf-stable commercial mustard is safe when stored at room temperature after opening. Quality, not safety, is the reason the labels on these products suggest that they be refrigerated after opening.	1	2	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
352	6	Olives	black and green	Olives,black,green,olive	\N	\N	\N	\N	12	18	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
353	6	Pickles	\N	Pickles,pickle	\N	\N	\N	\N	1	1	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	3	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
354	6	Pesto	jarred	Pesto,jarred,jar	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	6	Months	\N	3	3	Days	\N	\N	\N	1	1	Months	\N	\N	\N	\N	\N
356	6	Salad dressings	commercial, bottled	Salad dressings,dressings,dressing,commercial,bottled,bottle,salad	\N	\N	\N	Refrigeration ensures that commercial sauces and condiments stay fresh for a longer period of time. Shelf-stable commercial salad dressing is safe when stored at room temperature after opening. Quality, not safety, is the reason the labels on these products suggest that they be refrigerated after opening.	10	12	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	3	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
357	6	Salsa	picante and taco sauces	Salsa,picante,taco sauces,taco,sauces,sauce	\N	\N	\N	Refrigeration ensures that commercial sauces and condiments stay fresh for a longer period of time. Shelf-stable commercial salsa is safe when stored at room temperature after opening. Quality, not safety, is the reason the labels on these products suggest that they be refrigerated after opening.	1	1	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
358	6	Sauce mixes	nondairy (spaghetti, taco, etc.)	Sauce mixes,sauce,mixes,mix,nondairy,dairy,spaghetti,taco	\N	\N	\N	\N	2	2	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
359	6	Spaghetti sauce	in jars	Spaghetti sauce,sauce,in jars,jars,jar,spaghetti	\N	\N	\N	\N	18	18	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	4	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
360	6	Soy sauce or teriyaki sauce	\N	Soy sauce,teriyaki sauce,sauce,soy,teriyaki	\N	\N	\N	Refrigeration ensures that commercial sauces and condiments stay fresh for a longer period of time. Shelf-stable commercial soy sauce and teriyaki sauce are safe when stored at room temperature after opening. Quality, not safety, is the reason the labels on these products suggest that they be refrigerated after opening.	3	3	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
361	6	Vinegar	\N	Vinegar	\N	\N	\N	\N	2	2	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
362	6	Worcestershire sauce	\N	Worcestershire sauce,Worcestershire,sauce	\N	\N	\N	Refrigeration ensures that commercial sauces and condiments stay fresh for a longer period of time. Shelf-stable commercial worcestershire sauce is safe when stored at room temperature after opening. Quality, not safety, is the reason the labels on these products suggest that they be refrigerated after opening.	1	1	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
363	1	Jars or pouches	\N	Jars,pouches,jar,pouch	\N	\N	\N	Should be discarded after use-by date.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	3	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
364	1	Fruit	\N	Fruit	\N	\N	\N	Should be discarded after use-by date.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	3	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
365	1	Vegetables	\N	Vegetables,vegetable	\N	\N	\N	Should be discarded after use-by date.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
366	1	Dinners	\N	Dinners,dinner	\N	\N	\N	Should be discarded after use-by date.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
367	1	Cereal, dry mixes	\N	Cereal,dry mixes,mixes,mix,dry	\N	\N	\N	Should be discarded after use-by date.	\N	\N	\N	\N	1	1	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
368	1	Formula	prepared	Formula,prepared,prepare	\N	\N	\N	Should be discarded after use-by date.	\N	\N	\N	\N	1	1	Hours	\N	\N	\N	\N	\N	\N	\N	\N	1	1	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
369	1	Liquid concentrate or ready-to-feed formula	\N	Liquid concentrate,ready to feed formula,concentrate,liquid,formula,feed,ready to feed,feed formula	\N	\N	\N	Should be discarded after use-by date.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
370	23	Applesauce	commercial	Applesauce,Apple,sauce,commercial	\N	\N	\N	\N	12	18	Months	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N	\N	\N	\N	7	10	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
371	23	Bacon bits	imitation	Bacon bits,bits,imitation,bacon,bit	\N	\N	\N	\N	1	1	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Package use-by date	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
372	23	Canned goods	low acid (such as meat, poultry, fish, gravy, stew, soups, beans, carrots, corn, pasta, peas, potatoes, spinach)	Canned goods,canned,can,goods,low acid,low,meat,poultry,fish,gravy,stew,soups,soup,beans,bean,carrots,carrot,corn,pasta,peas,pea,potatoes,potato,spinach	\N	\N	\N	Canned items will be safe to eat well past the ‘use-by’ or ‘best by’ date as long as the can shows no dents, rust, or swelling.	2	5	Years	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
373	23	Canned goods	high acid (such as juices, fruit, pickles, sauerkraut, tomato soup, and foods in vinegar-based sauce)	Canned goods,canned,can,goods,high acid,high,juices,juice,fruit,fruits,pickles,pickle,sauerkraut,tomato soup,soup,tomato,foods in vinegar based sauce,sauce,foods,food,vinegar based,vinegar	\N	\N	\N	Canned items will be safe to eat well past the ‘use-by’ or ‘best by’ date as long as the can shows no dents, rust, or swelling.	12	18	Months	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N	\N	\N	\N	5	7	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
374	23	Cereal	ready-to-eat	Cereal,ready,eat	\N	\N	\N	\N	6	12	Months	\N	2	3	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
375	23	Cereal	cook before eating (oatmeal, etc.)	Cereal,cook before eating,oatmeal,oats,oat,meal	\N	\N	\N	\N	12	12	Months	\N	6	12	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
378	23	Graham cracker/animal cracker	\N	Graham cracker,animal cracker,Graham,cracker,animal	\N	\N	\N	\N	6	9	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
379	23	Fruits, dried	raisins, apricots, mangoes, cranberries, etc.	Fruits,fruit,dried,raisins,raisin,apricots,apricot,mangoes,mangoe,cranberries,cranberry	\N	\N	\N	\N	6	6	Months	\N	1	1	Months	\N	\N	\N	\N	\N	\N	\N	\N	6	6	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
380	23	Gummy (fruit) snacks	\N	fruit snack,gummy,fruit,snacks,snack,gummy snacks,fruit snacks,gummy snack	\N	\N	\N	\N	6	9	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
381	23	Marshmallows	\N	Marshmallows,Marshmallow	\N	\N	\N	\N	1	1	Years	\N	1	1	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
382	23	Marshmallow crème	\N	Marshmallow crème,Marshmallow,crème	\N	\N	\N	\N	2	5	Months	\N	1	1	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
383	23	Milk	canned evaporated or condensed	Milk,can,canned,evaporated,condensed,evaporate,condense	\N	\N	\N	\N	12	12	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
384	23	Molasses	\N	Molasses	\N	\N	\N	\N	1	2	Years	\N	6	6	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
385	23	Mushrooms	dried	Mushrooms,Mushroom,dried	\N	\N	\N	\N	1	2	Years	\N	3	3	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
386	23	Nuts	jars or cans	Nuts,nut,jar,jars,cans,can	\N	\N	\N	\N	1	1	Years	\N	2	9	Months	\N	\N	\N	\N	\N	\N	\N	\N	4	6	Months	\N	\N	\N	6	12	Months	\N	\N	\N	\N	\N
387	23	Peanut butter	commercial	Peanut butter,butter,commercial,peanut	\N	\N	\N	\N	6	24	Months	\N	2	3	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
388	23	Pectin	\N	Pectin	\N	\N	Package use-by date	\N	\N	\N	\N	\N	1	1	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
389	23	Popcorn	dry kernels in jar	Popcorn,dry kernels in jar,jar,dry kernels,kernels,in jar,kernel,chips,chip	\N	\N	\N	\N	2	2	Years	\N	1	1	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
390	23	Popcorn	commercially popped in bags	Popcorn,commercially,popped in bags,bags,bag,in bags	\N	\N	\N	\N	2	3	Months	\N	1	2	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
391	23	Popcorn	microwave packets	Popcorn,microwave packets,packets,microwave,packet	\N	\N	\N	After opening time applies to prepared product.	6	12	Months	\N	1	2	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
392	23	Potato chips	\N	Potato chips,potato,chips,chip,potatoes	\N	\N	Package use-by date	\N	2	2	Months	\N	1	2	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
393	23	Potatoes	instant	Potatoes,Potato,instant	\N	\N	\N	\N	10	15	Months	\N	6	12	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
394	23	Pretzels	\N	Pretzels,Pretzel	\N	\N	\N	\N	4	9	Months	\N	3	3	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
395	23	Pudding mixes	\N	Pudding mixes,Pudding,mixes,mix	\N	\N	\N	\N	1	1	Years	\N	3	4	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
396	23	Soup mixes	dry bouillon	Soup mixes,mixes,mix,soup,dry bouillon,bouillon	\N	\N	\N	\N	1	1	Years	\N	1	1	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
397	23	Sun dried tomatoes	jar	Sun dried tomatoes,dried tomatoes,sun,sun dried,dried,tomatoes,tomato	\N	\N	\N	\N	1	1	Years	\N	3	6	Months	\N	\N	\N	\N	\N	\N	\N	\N	3	6	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
398	23	Syrup	\N	Syrup	\N	\N	\N	\N	1	1	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	6	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
399	23	Toaster pastries	\N	Toaster pastries,pastry,Toaster,pastries	\N	\N	\N	\N	6	12	Months	\N	1	2	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
400	5	Coffee	whole beans	Coffee,whole beans,beans,whole,bean	\N	\N	\N	\N	3	5	Months	\N	3	5	Months	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
401	5	Coffee	home ground, non-vacuum	Coffee,home ground,non vacuum,ground,home,vacuum	\N	\N	\N	\N	3	5	Months	\N	3	5	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Years	\N	\N	\N	\N	\N
402	5	Coffee	instant	Coffee,instant	\N	\N	\N	\N	1	1	Years	\N	2	3	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
403	5	Diet powder mixes and drink mixes	\N	Diet powder mixes,drink mixes,mixes,drink,powder mixes,diet powder,mix	\N	\N	\N	\N	18	24	Months	\N	1	3	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
404	5	Fruit Juice in cartons, fruit drinks, punch	\N	Fruit Juice in cartons,fruit drinks,punch,fruit,fruit juice,juice in cartons,cartons,carton,drinks,drink	\N	\N	\N	\N	3	3	Weeks	\N	7	12	Days	\N	\N	\N	\N	\N	\N	\N	\N	8	12	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
405	5	Juice, boxes	\N	Juice, boxes,box	\N	\N	Package use-by date	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8	12	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
406	5	Nectar	papaya, mango, guava, or guavabana	Nectar,papaya,mango,guava,guavabana,mangoes	\N	\N	\N	\N	12	18	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
407	5	Soda	carbonated cola drinks, mixers, diet sodas; bottles or cans	Soda,carbonated cola drinks,mixers,diet sodas,bottles,cans,cola drinks,drinks,drink,cola,carbonated,carbonated cola,mixer,diet,sodas,bottle,can	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	3	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
408	5	Soy or rice beverage	\N	Soy,rice beverage,rice,beverage	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	10	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
410	5	Tea	bags	Tea,bags,bag	\N	\N	\N	\N	18	36	Months	\N	6	12	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
411	5	Tea	instant	Tea,instant	\N	\N	\N	\N	2	3	Years	\N	6	12	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
412	5	Tea	loose	Tea,loose	\N	\N	\N	\N	2	2	Years	\N	6	12	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Matcha tea is the only tea that can be frozen after opening.	\N	\N	\N	\N
413	5	Water	commercially bottled	Water,commercially bottled,bottled,commercially,bottle,commercial	\N	\N	Indefinitely	Water will store indefinitely, though the taste may be impacted by storage conditions, including sunlight, items stored around it and the containers being used to store it.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
414	18	Kumquats	\N	Kumquats	\N	\N	When Ripe	Ripe is when this item is tender, fully developed and ready to eat.	\N	\N	\N	\N	\N	\N	\N	3	3	Weeks	Timeline for refrigerator applies to ripe fruit.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
415	19	Bagged greens	leaf, spinach, lettuce, etc.	Bagged greens,leaf,spinach,lettuce,bagged,greens,green	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	Unopened product will last 3 - 5 days after date on bag; after opening it will last 2 days.	\N	\N	\N	\N	2	2	Days	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
416	6	Tahini	\N	Tahini	\N	\N	\N	\N	1	1	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	3	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
190	25	Egg salad	\N	Egg salad,egg,salad	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
191	25	Potato salad	\N	Potato salad,potato,salad	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
417	25	Seafood salads	(tuna salad, shrimp salad, salmon salad, mixed seafood salad, etc.)	Seafood salads,tuna salad, shrimp salad, salmon salad, mixed seafood salad,seafood,salads,salad,tuna,shrimp,salmon,mixed,mixed seafood,seafood salad,	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
418	25	Chicken salad	\N	Chicken salad,chicken,salad	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
419	25	Ham salad	\N	Ham salad,ham,salad	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
420	25	Pasta salad	\N	Pasta salad,pasta,salad	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
421	7	Soy milk	\N	Soy milk,soy,milk	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Package use-by date	Keep refrigerated.	\N	\N	\N	\N	7	10	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
422	19	Yams/sweet potatoes	\N	Yams,sweet potatoes,potatoes,potato,yam	\N	\N	\N	\N	2	3	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
423	19	Kale	\N	Kale	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8	12	Months	\N
425	9	Quinoa	uncooked	Quinoa,cooked,uncooked,cook	\N	\N	\N	\N	2	3	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
426	9	Quinoa	cooked	Quinoa,cook,cooked	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	7	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	12	Months	\N	\N	\N	\N	\N
427	7	Almond milk	\N	Almond milk,milk,almond	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Package use-by date	Keep refrigerated.	\N	\N	\N	\N	7	10	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
428	7	Rice milk	\N	Rice milk,rice,milk	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Package use-by date	Keep refrigerated.	\N	\N	\N	\N	7	10	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
429	7	Coconut milk	\N	Coconut milk,coconut,milk	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Package use-by date	Keep refrigerated.	\N	\N	\N	\N	7	10	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
430	7	Coffee creamer	powdered	Coffee creamer,creamer,cream,coffee,powdered,powder	\N	\N	\N	Store in a dry, cool environment	2	2	Years	\N	2	3	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
431	14	Turkey bacon	\N	Turkey bacon,turkey,bacon	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2	Weeks	Unopened.	7	7	Days	Or until best-by date.	\N	\N	\N	\N	\N	\N	2	4	Months	\N
432	23	Fruit cocktail	canned 	Fruit cocktail,cocktail,fruit,canned,can	\N	18	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
433	6	Black bean sauce	\N	Black bean sauce,sauce,bean,black,black bean,bean sauce	\N	\N	\N	\N	18	24	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	6	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
434	6	Oyster sauce	\N	Oyster sauce,oyster,sauce	\N	\N	\N	\N	18	24	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	6	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
435	6	Hoisin sauce	\N	Hoisin sauce,sauce,Hoisin	\N	\N	\N	\N	18	24	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	6	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
436	12	Pork roll	\N	Pork roll,Pork,roll	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Package use-by date	Keep refrigerated.	\N	\N	\N	\N	7	7	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
437	23	Almonds 	shell	Almonds,Almond,shell	\N	\N	\N	\N	6	6	Months	\N	\N	\N	\N	\N	\N	\N	\N	16	16	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	20	Months	\N
438	23	Almonds 	no shell	Almonds,Almond,no shell,shell	\N	\N	\N	\N	4	4	Months	\N	\N	\N	\N	\N	\N	\N	\N	8	8	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	10	Months	\N
439	23	Cashews	no shell	Cashews,Cashew,no shell,shell	\N	\N	\N	\N	2	4	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	6	6	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12	12	Months	\N
440	23	Macadamias	no shell	Macadamias,Macadamia,no shell,shell	\N	\N	\N	\N	2	4	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	12	12	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	24	24	Months	\N
441	23	Peanuts	shell	Peanuts,Peanut,shell,nut	\N	\N	\N	\N	4	4	Months	\N	\N	\N	\N	\N	\N	\N	\N	12	12	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	24	24	Months	\N
442	23	Peanuts	no shell	Peanuts,Peanut,no shell,shell,nut	\N	\N	\N	\N	4	4	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	12	12	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	24	24	Months	\N
443	23	Pecans	shell	Pecans,Pecan,shell	\N	\N	\N	\N	2	4	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	12	12	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	24	24	Months	\N
444	23	Pecans	no shell	Pecans,Pecan,no shell,shell	\N	\N	\N	\N	2	4	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	9	9	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	24	24	Months	\N
445	23	Pistachios	shell or no shell	Pistachios,shell,no shell,Pistachio,pista	\N	\N	\N	\N	3	3	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	12	12	Months	Refrigeration of this item provides no benefit.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	24	24	Months	Freezing of this item provides no benefit.
446	23	Walnuts	shell or no shell	Walnuts,shell,no shell,walnut	\N	\N	\N	\N	2	4	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	9	12	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	24	24	Months	\N
447	5	Lime juice	\N	Lime juice,lime,juice	\N	\N	\N	\N	12	18	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
448	5	Lemon juice	\N	Lemon juice,lemon,juice	\N	\N	\N	\N	12	18	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
449	2	Bagel	fresh baked	Bagel,fresh baked,baked	1	2	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Refrigeration not recommended - bagel will quickly dry out and become stale.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	3	Months	\N	\N	\N	\N	\N
450	2	Bagel 	commercially frozen	Bagel,commercially frozen,frozen	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	3	Months	\N	\N	\N	\N	\N
451	2	Muffin	homemade - including bran, blueberry, banana, corn, chocolate chip	Muffin,homemade including bran,homemade,bran,blueberry,banana,corn,chocolate chip,including bran,chocolate,chip	3	7	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Refrigeration not recommended - muffin will quickly dry out and become stale.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	3	Months	\N	\N	\N	\N	\N
452	2	Muffin	commercially packaged	Muffin,commercially packaged,packaged	3	7	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Refrigeration not recommended - muffin will quickly dry out and become stale.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	3	Months	\N	\N	\N	\N	\N
453	2	Muffin	mix, dry, commercially packaged	Muffin,mix,dry,commercially packaged,packaged,commercially,commercial	9	9	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
454	23	Coconut oil	\N	Coconut oil,coconut,oil	3	3	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Refrigeration not recommended - makes it difficult to use.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Freezing not recommended - makes it difficult to use.	\N	\N	\N	\N
455	5	Orange juice	commercially packaged carton	Orange juice,commercially packaged carton,orange,juice,commercially,packaged,carton,packaged carton,commercially packaged,commercial	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Good for 1 week after date on package.	\N	\N	\N	\N	7	10	Days	\N	\N	\N	\N	\N	\N	\N	8	12	Months	\N
456	5	Orange juice	commercially frozen concentrate	Orange juice,commercially frozen concentrate,orange,juice,commercially,frozen,concentrate,commercially frozen,frozen concentrate	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	After prepared for drinking, good for up to 1 week.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12	12	Months	\N
457	5	Orange juice	freshly squeezed	Orange juice,orange,juice,freshly squeezed,squeezed,freshly,fresh,sqeeze	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	3	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	3	Weeks	\N	\N	\N	\N	\N
458	23	Roasted red peppers	jar	Roasted red peppers,roasted,red,peppers,jar,Roasted red,red peppers,pepper	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	6	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
459	3	Whole wheat flour	\N	Whole wheat flour,Whole,wheat,flour,wheat flour,whole wheat	12	12	Months	\N	\N	\N	\N	\N	\N	\N	\N	2	2	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2	Years	\N	\N	\N	\N	\N
460	9	Whole wheat bread	homemade	Whole wheat bread,Whole,wheat,bread,homemade,whole wheat,wheat bread	3	5	Days	May have shorter shelf life due to lack of preservatives.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Refrigeration not recommended - bread will quickly dry out and become stale.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	3	Months	\N	\N	\N	\N	\N
461	9	Whole wheat bread	commercially baked & pre-sliced	Whole wheat flour,Whole,wheat,flour,wheat flour,whole wheat,commercially baked,pre sliced,sliced,slice,baked,commercially,commercial	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Refrigeration not recommended - bread will quickly dry out and become stale.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	3	Months	\N	\N	\N	\N	\N
462	5	Red wine	\N	Red wine,red,wine	3	5	Years	Dark, away from direct heat or sunlight.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	3	Days	Depending on conditions.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
463	5	White wine	\N	White wine,white,wine	1	2	Years	Dark, away from direct heat or sunlight.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	3	Days	Depending on conditions.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
464	23	Dry stuffing mix	commercially packaged	Dry stuffing mix,Dry stuffing,stuffing mix,Dry,stuffing,mix,commercially packaged,packaged,commercially,commercial,pack	9	12	Months	Do not refrigerate.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
465	7	Powdered milk	\N	Powdered milk,Powdered,milk,powder	3	5	Years	3 - 5 year timetable based on cool temperatures, dark storage. May spoil as quickly as 3 months in hot temperatures.	\N	\N	\N	\N	3	3	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
466	23	Almond butter	\N	Almond butter,Almond,butter	1	1	Years	When stored in the pantry, almond butter may become hard and the natural oil may separate and float to the top; this is perfectly normal. To reincorporate the natural almond oils into the almond butter, simply mix it manually or with a hand mixer.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
467	23	Cashew butter	\N	Cashew butter,Cashew,butter	3	3	Months	Does not need to be refrigerated.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
468	23	Salt	table, plain, or iodized	Salt,table,plain,iodized	\N	\N	Indefinitely	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
469	23	Black pepper	ground, dried, commercially bottled or purchased in bulk	Black pepper,black,pepper,ground,dried,commercially bottled,commercially,bottled,bottle,commercial,purchased in bulk,bulk,purchased,purchase	\N	\N	\N	\N	2	2	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
470	23	Black pepper	cracked, dried, commercially bottled or purchased in bulk	Black pepper,black,pepper,crack,cracked,dried,commercially bottled,commercially,bottled,bottle,commercial,purchased in bulk,bulk,purchased,purchase	\N	\N	\N	\N	2	3	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
471	23	Cajun seasoning blend 	ground, dried, commercially bottled or purchased in bulk	Cajun seasoning blend,Cajun,seasoning,blend,Cajun seasoning,seasoning blend,ground,dried,commercially bottled,commercially,bottled,bottle,commercial,purchased in bulk,bulk,purchased,purchase	\N	\N	\N	\N	1	2	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
518	25	Canadian bacon	whole	Canadian bacon,bacon,whole	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2	Months	\N	\N	\N	\N	\N
472	23	Cinnamon	ground, dried, commercially bottled or purchased in bulk	Cinnamon,ground,dried,commercially bottled,commercially,bottled,bottle,commercial,purchased in bulk,bulk,purchased,purchase	\N	\N	\N	\N	3	4	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
473	23	Cumin	ground, dried, commercially bottled or purchased in bulk, opened or unopened	Cumin,ground,dried,commercially bottled,commercially,bottled,bottle,commercial,purchased in bulk,bulk,purchased,purchase,opened,unopened,open,unopen	\N	\N	\N	\N	3	4	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
474	23	Garlic powder	dried, commercially bottled or purchased in bulk	Garlic powder,garlic,powder,dried,commercially bottled,commercially,bottled,bottle,commercial,purchased in bulk,bulk,purchased,purchase	\N	\N	\N	\N	3	4	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
475	23	Onion powder 	dried, commercially bottled or purchased in bulk	Onion powder,onion,powder,dried,commercially bottled,commercially,bottled,bottle,commercial,purchased in bulk,bulk,purchased,purchase	\N	\N	\N	\N	3	4	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
476	23	Nutmeg	ground, dried, commercially bottled or purchased in bulk	Nutmeg,ground,dried,commercially bottled,commercially,bottled,bottle,commercial,purchased in bulk,bulk,purchased,purchase	\N	\N	\N	\N	3	4	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
477	7	Nacho cheese 	store bought	Nacho cheese,nacho,cheese,store bought,store	\N	\N	\N	\N	2	2	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2	Weeks	\N	\N	\N	\N	\N	\N	Freezing not recommended - may negatively impact the texture.	3	3	Months	\N
478	18	Star fruit	\N	Star fruit,fruit,fruits	1	1	Weeks	Or until ripe. Ripe is when this item is tender, fully developed and ready to eat.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Weeks	\N	\N	\N	\N	\N	\N	\N	10	12	Months	\N	\N	\N	\N	\N
479	18	Prickly pear 	\N	Prickly pear,pear,pickle	2	5	Days	Or until ripe. Ripe is when this item is tender, fully developed and ready to eat.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Weeks	\N	\N	\N	\N	\N	\N	\N	10	12	Months	\N	\N	\N	\N	\N
480	18	Pitaya/dragon fruit	\N	Pitaya,dragon fruit,fruit,fruits	2	5	Days	Or until ripe. Ripe is when this item is tender, fully developed and ready to eat.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	3	Weeks	\N	\N	\N	\N	\N	\N	\N	10	12	Months	\N	\N	\N	\N	\N
481	18	Strawberries	\N	Strawberries,strawberry	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	3	Days	\N	\N	\N	\N	\N	\N	\N	8	12	Months	\N	\N	\N	\N	\N
482	18	Raspberries	\N	Raspberries,raspberry	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	3	Days	\N	\N	\N	\N	\N	\N	\N	8	12	Months	\N	\N	\N	\N	\N
483	18	Cherries	\N	Cherries,cherry	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	3	Days	\N	\N	\N	\N	\N	\N	\N	8	12	Months	\N	\N	\N	\N	\N
484	6	Broth	homemade	Broth,homemade	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	3	Months	\N	\N	\N	\N	\N
485	6	Beef broth/stock/consommé 	commercially produced	Beef broth, beef stock,beef consommé,consommé,commercially produced	\N	\N	Package use-by date	Bouillon cubes will keep their best quality 1 year. The reconstituted broth lasts 3-4 days in the refrigerator.	\N	\N	\N	\N	\N	\N	\N	7	7	Days	\N	\N	\N	\N	\N	3	4	Days	\N	\N	\N	2	3	Months	\N	\N	\N	\N	\N
486	6	Chicken broth/stock/consommé 	commercially produced	Chicken broth,chicken stock,consommé,commercially produced	\N	\N	Package use-by date	Bouillon cubes will keep their best quality 1 year. The reconstituted broth lasts 3-4 days in the refrigerator.	\N	\N	\N	\N	\N	\N	\N	7	7	Days	\N	\N	\N	\N	\N	3	4	Days	\N	\N	\N	2	3	Months	\N	\N	\N	\N	\N
487	6	Vegetable stock/broth 	commercially produced	Vegetable stock,Vegetable broth,broth,commercial vegetable stock,commercial vegetable broth,vegetable	\N	\N	Package use-by date	Bouillon cubes will keep their best quality 1 year. The reconstituted broth lasts 3-4 days in the refrigerator.	\N	\N	\N	\N	\N	\N	\N	7	7	Days	\N	\N	\N	\N	\N	3	4	Days	\N	\N	\N	2	3	Months	\N	\N	\N	\N	\N
488	23	Peanut butter	commercially produced, containing hydrogenated fat or other stabilizers	Peanut butter,butter,commercial peanut butter, hydrogenated fat,fat,stabilizers,stabilizer	\N	\N	\N	\N	6	9	Months	\N	2	3	Months	\N	\N	\N	\N	12	12	Months	\N	3	4	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
489	23	Peanut butter	natural	Peanut butter,butter,natural	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12	12	Months	Or package use-by date, whichever comes first.	3	4	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
490	7	Ricotta	\N	Ricotta	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2	Weeks	\N	1	1	Weeks	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
491	19	Baby carrots	\N	Baby carrots, carrot,baby carrot	\N	\N	\N	below 75 °F	4	4	Days	\N	\N	\N	\N	\N	\N	\N	\N	4	4	Weeks	\N	\N	\N	\N	\N	\N	\N	3	3	Months	Blanch before freezing.	\N	\N	\N	\N
492	19	Jicama	fresh	Jicama,fresh	\N	\N	\N	\N	4	4	Months	1-2 weeks if inappropriately handled.	\N	\N	\N	\N	\N	\N	\N	2	3	Weeks	Free from moisture; chilling injury causes decay, discoloration or loss of texture may occur.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
493	19	Kimchi	\N	Kimchi	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	12	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
494	19	Kohlrabi	\N	Kohlrabi	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	Weeks	\N	\N	\N	\N	\N	\N	\N	8	12	Months	\N	\N	\N	\N	\N
495	18	Watermelon	\N	Watermelon	\N	\N	\N	\N	1	2	Days	Or until ripe.	\N	\N	\N	\N	\N	\N	\N	3	4	Days	\N	\N	\N	\N	\N	\N	\N	12	12	Months	\N	\N	\N	\N	\N
496	18	Cantaloupe	\N	Cantaloupe	\N	\N	\N	\N	2	4	Days	Or until ripe.	\N	\N	\N	\N	\N	\N	\N	5	15	Days	\N	\N	\N	\N	\N	\N	\N	12	12	Months	\N	\N	\N	\N	\N
497	18	Honeydew	\N	Honeydew	\N	\N	\N	\N	2	7	Days	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	\N	\N	\N	\N	\N	\N	\N	12	12	Months	\N	\N	\N	\N	\N
498	9	Peanuts 	boiled, shelled	Peanuts,boiled, shelled,peanut	\N	\N	\N	\N	3	3	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	7	Days	\N	\N	\N	\N	\N	Indefinitely	\N	\N	\N	\N	\N
499	9	Refried beans	\N	Refried beans,refried bean	\N	\N	\N	\N	3	3	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	3	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
500	6	Relish	\N	Relish	\N	\N	\N	\N	30	30	Months	\N	\N	\N	\N	\N	\N	\N	\N	9	9	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Freezing not recommended.	\N	\N	\N	\N
501	23	Tomato paste	\N	Tomato paste	\N	\N	\N	\N	27	27	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5	5	Days	\N	\N	\N	2	3	Months	\N	\N	\N	\N	\N
502	23	Tapenade	\N	Tapenade	\N	\N	\N	\N	9	9	Months	\N	\N	\N	\N	\N	\N	\N	\N	9	9	Months	Not necessary, but flavor will enhance.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
503	23	Flaxseed	whole seed	Flaxseed,whole seed,seed	\N	\N	\N	\N	2	2	Years	\N	\N	\N	\N	\N	\N	\N	Not necessary.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Nnot necessary.	\N	\N	\N	\N
504	23	Flaxseed	ground	Flaxseed,ground	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12	12	Months	\N	\N	\N	\N	\N	\N	\N	12	12	Months	\N	\N	\N	\N	\N
505	19	Lemongrass	\N	Lemongrass	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	9	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	6	Months	\N
506	19	Cilantro	\N	Cilantro	1	2	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	2	3	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Freeze damage will appear.	\N	\N	\N	\N
507	19	Mint	\N	Mint	1	2	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	2	3	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Freeze damage will appear.	\N	\N	\N	\N
508	19	Basil	dried	Basil,dried	12	12	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
509	19	Basil	fresh	Basil,fresh	5	5	Days	Keep stems in water.	\N	\N	\N	\N	\N	\N	\N	10	10	Days	Will start to discolor.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
510	19	Oregano	\N	Oregano	1	2	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	2	3	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Freeze damage will appear.	\N	\N	\N	\N
511	19	Rosemary	\N	Rosemary	1	2	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	2	3	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Freeze damage will appear.	\N	\N	\N	\N
512	19	Chives	\N	Chives	1	2	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	2	3	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Freeze damage will appear.	\N	\N	\N	\N
513	19	Thyme	\N	Thyme	1	2	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	2	3	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
514	25	Turkey 	pre-packaged, luncheon/deli meat	Turkey,pre-packaged,luncheon/deli meat,packaged,luncheon,deli	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2	Weeks	\N	3	5	Days	\N	\N	\N	\N	\N	\N	Freezing not recommended. 	1	2	Months	\N
515	25	Ham	pre-packaged, luncheon/deli meat	Ham,pre-packaged,luncheon/deli meat,packaged,luncheon,deli	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2	Weeks	\N	3	5	Days	\N	\N	\N	\N	\N	\N	Freezing not recommended. 	1	2	Months	\N
516	25	Salami 	pre-packaged, luncheon/deli meat	Salami,pre-packaged,luncheon meat,deli meat,packaged,luncheon/deli,pre	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2	Weeks	\N	3	5	Days	\N	\N	\N	\N	\N	\N	Freezing not recommended. 	1	2	Months	\N
517	25	Chicken	pre-packaged, luncheon/deli meat	Chicken,pre-packaged,luncheon meat,deli meat,packaged	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2	Weeks	\N	3	5	Days	\N	\N	\N	\N	\N	\N	Freezing not recommended. 	1	2	Months	\N
519	25	Canadian bacon	sliced	Canadian bacon,bacon,sliced	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	10	Days	\N	80	80	Days	\N	\N	\N	\N	\N	\N	\N	12	12	Months	\N	\N	\N	\N	\N
520	23	Canola oil	\N	Canola oil,canola	\N	\N	\N	\N	1	1	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
521	23	Almond oil	\N	Almond oil,almond	\N	\N	\N	\N	1	1	Years	\N	\N	\N	\N	\N	\N	\N	\N	2	2	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
522	23	Sunflower oil	\N	Sunflower oil,oil,sunflower	\N	\N	\N	\N	1	1	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
523	23	Grapeseed oil	\N	Grapeseed oil,grapeseed,oil	\N	\N	\N	\N	1	1	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
524	6	Duck fat	\N	Duck fat,duck	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	30	30	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
525	6	Bacon grease	\N	Bacon grease,bacon,grease	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	6	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12	12	Months	\N	\N	\N	\N	\N
526	6	Frying oil	re-used	Frying oil,re-used oil,oil	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	9	Months	\N	\N	\N	\N	\N
527	3	Almond extract	\N	Almond extract	2	2	Years	\N	\N	\N	\N	\N	12	12	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
528	3	Cinnamon extract	\N	Cinnamon extract	2	2	Years	\N	\N	\N	\N	\N	12	12	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
529	3	Lemon extract	\N	Lemon extract,lemon	2	2	Years	\N	\N	\N	\N	\N	12	12	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
530	3	Pure vanilla extract	\N	vanilla,vanila extract	2	2	Years	\N	\N	\N	\N	\N	12	12	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
531	3	Butter flavor	\N	Butter flavor,butter	2	2	Years	\N	\N	\N	\N	\N	12	12	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
532	3	Coconut flavor	\N	Coconut flavor,coconut	2	2	Years	\N	\N	\N	\N	\N	12	12	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
533	23	"Genuine" Maple syrup	unopened, glass	Genuine Maple syrup,syrup,unopened, glass	4	4	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Indefinitely	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
534	23	"Genuine" Maple syrup	unopened, plastic	Genuine Maple syrup,syrup,unopened, plastic	2	2	Years	\N	\N	\N	\N	\N	\N	\N	\N	18	24	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
536	5	Lemon juice	fresh squeezed	Lemon juice,juice,fresh squeezed,squeezed,juices	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	6	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12	12	Months	\N	\N	\N	\N	\N
537	5	Apple juice	fresh squeezed	Apple juice,juice,fresh squeezed,squeezed,juices,apple	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	6	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12	12	Months	\N	\N	\N	\N	\N
538	5	Carrot juice	fresh squeezed	Carrot juice,juice,fresh squeezed,squeezed,juices	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	6	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12	12	Months	\N	\N	\N	\N	\N
539	5	Hard liquors	\N	Hard liquors,liquor	\N	\N	Indefinitely	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
540	5	Cream liquors	unopened	Cream liquors,liquors,unopened,liquor	6	8	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
541	5	Coffee	commercial ground, non-vacuum	Coffee,commercial ground, non-vacuum	\N	\N	\N	\N	2	2	Years	\N	2	2	Weeks	\N	\N	\N	Critical to be stored in an airtight container.	\N	\N	\N	\N	1	1	Months	\N	\N	\N	6	12	Months	Do not return to freezer once taken out.	\N	\N	\N	\N
542	2	Macaroons	french	Macaroons,Macaroon,french	1	2	Days	Store in refrigerator if not eaten right away.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	3	Months	\N	\N	\N	\N	\N
543	7	Milk	lactose-free	Milk,lactose,lactose-free	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	Weeks	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
544	7	String Cheese	\N	String Cheese,cheese	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5	5	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
545	7	Vegan Cheddar Cheese	\N	Vegan Cheddar Cheese,cheese,cheddar	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	4	Months	\N	3	7	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
546	7	Quark	fresh cheese	Quark,fresh cheese,cheese	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	10	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
547	19	Zucchini	fresh, whole	Zucchini,fresh, whole	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	10	Months	\N	\N	\N	\N	\N
548	19	Hot peppers	\N	Hot peppers,pepper	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	Weeks	Fresh whole peppers will last longer if kept dry. 	\N	\N	\N	\N	\N	\N	9	9	Months	Peppers lose their crispness when frozen and thawed.	\N	\N	\N	\N
549	19	Bean sprouts	\N	Bean sprouts,bean,sprouts	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5	10	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
550	19	Swiss chard	\N	Swiss chard,chard	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Weeks	Keep them in a plastic bag to retain moisture.  	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
551	4	Puff pastry	\N	Puff pastry,pastry,pastries,puff	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12	12	Months	\N	\N	\N	\N	\N
552	4	Biscuits	refrigerated	Biscuits,Biscuits,refrigerated	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Package use-by date	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
553	9	Tortillas	corn	Tortillas,corn	\N	\N	\N	\N	25	45	Days	\N	\N	\N	\N	\N	\N	\N	\N	60	90	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
554	4	Pie crust	refrigerated	Pie crust,crust,refrigerated,pie	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Package use-by date	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2	Months	\N	\N	\N	\N	\N
555	23	Granola	\N	Granola	6	9	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
556	23	Pork rinds	\N	Pork rinds,pork,rinds	4	4	Months	From date of manufacturer.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
557	6	Apple cider vinegar	\N	Apple cider vinegar,Apple cider, vinegar,cider,apple	\N	\N	Indefinitely	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
558	5	Nutrition supplement drinks	canned	Nutrition supplement drinks,drinks,canned,supplement,Boost,Ensure	\N	\N	\N	\N	2	5	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
559	6	Hot sauce	\N	Hot sauce,sauce	6	6	Months	Will stay fresher longer if refrigerated.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
560	6	Thai red curry paste	\N	Thai red curry paste,red curry paste,curry paste,paste,curry	\N	\N	\N	\N	2	2	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
561	3	Yeast	packaged	Yeast,packaged	\N	\N	\N	\N	2	2	Years	Store in cool, dry place. Must be refrigerated or frozen once opened.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	4	Months	\N	\N	\N	6	6	Months	\N	\N	\N	\N	\N
562	18	Applesauce	homemade	Applesauce,homemade	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	3	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8	12	Months	\N	\N	\N	\N	\N
563	12	Pate	meat 	Pate,meat	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	7	Days	Left over pâtés should be wrapped in plastic film.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
564	14	Pate	poultry	Pate,poultry	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	7	Days	Left over pâtés should be wrapped in plastic film.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
565	6	Cranberry sauce	canned	Cranberry sauce,sauce,canned	\N	\N	\N	\N	2	2	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Weeks	\N	\N	\N	\N	\N	\N	It is not recommend freezing cranberry sauce, as after thawing, it may become too watery.	\N	\N	\N	\N
566	6	Cranberry sauce	homemade	Cranberry sauce,sauce,homemade	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	10	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	It is not recommend freezing cranberry sauce, as after thawing, it may become too watery.	\N	\N	\N	\N
567	5	Vegetable juice	shelf-stable	Vegetable juice,stable,shelf,shelf-stable	\N	\N	\N	\N	18	18	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
568	5	Vegetable juice	commercial, sold refrigerated	Vegetable juice,commercial,refrigerated,vegetable	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	Months	\N	\N	\N	Package use-by date	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
569	5	Vegetable juice	homemade	Vegetable juice,juices,homemade,vegetable	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
570	19	Marinated vegetables	in oil	Marinated vegetables,vegetables,oil,vegetable	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
571	8	Pizza	frozen	Pizza,frozen	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	Recommendation is for storage after cooking.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12	12	Months	Keep frozen. For safety, cook as directed.	\N	\N	\N	\N
572	25	Salsa	fresh	Salsa,fresh	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	7	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
573	23	Chia seeds	\N	Chia seeds,chia,seed,seeds	18	18	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
574	2	Bread	homemade	Bread,Breads,homemade	3	5	Days	May have shorter shelf life due to lack of preservatives.	\N	\N	\N	\N	\N	\N	\N	2	3	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
575	9	Amaranth	whole grain	Amaranth,whole grain,grain	4	4	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8	8	Months	\N	\N	\N	\N	\N
576	3	Amaranth	flour, meal	Amaranth,flour,meal	2	2	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	4	Months	\N	\N	\N	\N	\N
577	9	Barley	whole grain	Barley,whole grain,grain	6	6	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12	12	Months	\N	\N	\N	\N	\N
578	3	Barley	flour, meal	Barley,flour, meal	3	3	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	6	Months	\N	\N	\N	\N	\N
579	9	Buckwheat	whole grain	Buckwheat,whole grain,grain	2	2	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	4	Months	\N	\N	\N	\N	\N
580	3	Buckwheat	flour, meal	Buckwheat,flour, meal,meal	1	1	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2	Months	\N	\N	\N	\N	\N
581	9	Farro	whole grain	Farro,whole grain,grain	6	6	Months	Benefits from being stored in airtight containers and out of direct light.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12	12	Months	\N	\N	\N	\N	\N
582	3	Farro	flour, meal	Farro,flour, meal	3	3	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	6	Months	\N	\N	\N	\N	\N
583	9	Millet	whole grain	Millet,whole grain,grain	2	2	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	4	Months	\N	\N	\N	\N	\N
584	3	Millet	flour, meal	Millet,flour, meal	1	1	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2	Months	\N	\N	\N	\N	\N
585	9	Oats	whole grain	Oat,Oats,whole grain,grain	4	4	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8	8	Months	\N	\N	\N	\N	\N
586	3	Oats	flour, meal	Oats,Oat,flour, meal	2	2	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	4	Months	\N	\N	\N	\N	\N
587	9	Rye	whole grain	Rye,whole grain,grain	6	6	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12	12	Months	\N	\N	\N	\N	\N
588	3	Rye	flour, meal	Rye,flour, meal	3	3	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	6	Months	\N	\N	\N	\N	\N
589	9	Sorghum	whole grain	Sorghum,whole grain,grain	4	4	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8	8	Months	\N	\N	\N	\N	\N
590	3	Sorghum	flour, meal	Sorghum,flour, meal	2	2	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	4	Months	\N	\N	\N	\N	\N
591	9	Spelt	whole grain	Spelt,whole grain,grain	6	6	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12	12	Months	\N	\N	\N	\N	\N
592	3	Spelt	flour, meal	Spelt,flour, meal	3	3	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	6	Months	\N	\N	\N	\N	\N
593	9	Teff	whole grain	Teff,whole grain,grain	4	4	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8	8	Months	\N	\N	\N	\N	\N
594	3	Teff	flour, meal	Teff,flour, meal	2	2	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	4	Months	\N	\N	\N	\N	\N
595	10	Rabbit	whole, fresh	Rabbit,whole, fresh	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	9	Months	\N	\N	\N	\N	\N
596	19	Spaghetti squash	whole	Spaghetti squash,squash,whole	2	2	Months	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Weeks	Storage temperatures below 50 degrees (as in a refrigerator) will cause the squash to spoil more rapidly.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
597	19	Spaghetti squash	cut	Spaghetti squash,squash,cut	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
598	3	Garam masala	\N	Garam masala	1	1	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
599	6	Tomato sauce	spaghetti, pizza	Tomato sauce,sauce,spaghetti, pizza	\N	\N	Package use-by date	Refrigerating unopened jars will NOT lengthen shelf life.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
600	19	Cherry tomatoes	\N	Cherry, tomatoes,tomato	10	10	Days	\N	\N	\N	\N	\N	\N	\N	\N	5	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
601	23	Coconut cream	canned	coconut cream,coconut,cream,canned,can	\N	\N	\N	\N	2	5	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	4	Days	\N	\N	\N	3	3	Months	\N	\N	\N	\N	\N
602	23	Coconut milk	canned	coconut milk,coconut,milk,canned,can	\N	\N	\N	\N	2	5	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	4	Days	\N	\N	\N	3	3	Months	\N	\N	\N	\N	\N
603	25	Coleslaw	homemade, prepared	coleslaw,homemade,homemade coleslaw,prepared,prepared coleslaw	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
604	23	Pumpkin seeds	raw, no shell	pumpkin,pumpkin seed,pumpkin seeds,seed,seeds	6	6	Months	\N	\N	\N	\N	\N	\N	\N	\N	6	6	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
605	23	Pumpkin seeds	raw, in-shell	pumpkin,pumpkin seed,pumpkin seeds,seed,seeds	6	6	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
606	23	Pumpkin seeds	roasted, no-shell	pumpkin,pumpkin seed,pumpkin seeds,seed,seeds	6	6	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Refrigeration not necessary for unsalted pumpkin seeds.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
607	23	Pumpkin seeds	roasted, in-shell	pumpkin,pumpkin seed,pumpkin seeds,seed,seeds	6	6	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
608	23	Sunflower seeds	raw, unsalted, no shell	sunflower,sunflower seed,sunflower seeds,seed,seeds	12	12	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
609	23	Sunflower seeds	roasted, no shell	sunflower,sunflower seed,sunflower seeds,seed,seeds,kernal,shell	\N	\N	\N	\N	12	12	Months	The (roasted) seeds will become rancid if stored at room temperature for long periods of time.	3	4	Months	\N	\N	\N	\N	\N	\N	\N	\N	7	8	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
610	23	Sunflower seeds	roasted, salted, in shell	sunflower,sunflower seed,sunflower seeds,seed,seeds	\N	\N	\N	\N	\N	\N	Package use-by date	The (roasted) seeds will become rancid if stored at room temperature for long periods of time.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
611	19	Parsley	fresh	parsley	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	3	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Months	\N	\N	\N	\N	\N
612	23	Sesame oil	\N	sesame oil,sesame,oil	\N	\N	\N	\N	2	2	Years	\N	6	6	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
613	23	Sesame seeds	\N	sesame seeds,sesame,seeds,seed	5	5	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
614	23	Capers	in jar	capers,caper,jar capers,in jar,jar	\N	\N	Package use-by date	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
615	23	Chocolate hazlenut spread	\N	hazelnut spread, spread, hazelnut, chocolate spread, chocolate,Nutella,cocoa,cocoa spread	\N	\N	Package use-by date	For best quality, do not refrigerate or microwave.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
616	23	Roasted nuts (peanuts, cashews, almonds)	\N	roasted nuts,roasted,nuts,roasted peanuts,roasted almonds,roasted cashews,almonds,cashews,peanuts	\N	\N	\N	\N	\N	\N	Package use-by date	\N	1	2	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	4	4	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
617	23	Tuna	packet	tuna packet,tuna,packet,retort,retort packaging	\N	\N	\N	\N	18	18	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
618	23	Tuna	canned	canned tuna,tuna,canned	3	3	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
619	23	Seafood	canned	canned seafood,seafood,canned	1	1	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
620	7	Pimento cheese	packaged	pimento cheese,pimento,cheese	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Package use-by date	\N	4	4	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
621	10	Bison	whole	bison whole,bison,whole	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	9	Months	\N	\N	\N	\N	\N
622	10	Bison	ground	ground bison,bison,ground	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Months	\N	\N	\N	\N	\N
623	6	Salad dressing	creamy	creamy salad dressing,salad,dressing,salad dressing,creamy	\N	\N	\N	\N	6	6	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Weeks	\N	\N	\N	\N	\N	\N	Freezing not recommended. 	\N	\N	\N	\N
624	6	Salad dressing	vinaigrette,homemade	salad dressing,vinaigrette,salad,dressing,homemade	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	3	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
625	6	Salad dressing	vinaigrette	salad dressing,vinaigrette,salad,dressing	\N	\N	\N	\N	6	6	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	4	Weeks	\N	\N	\N	\N	\N	\N	Freezing not recommended. 	\N	\N	\N	\N
626	6	Salad dressing	dry,packaged	salad dressing,salad,dressing,dry,packaged,package,powdered,powder	\N	\N	Package use-by date	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	4	Weeks	\N	\N	\N	\N	\N	\N	Freezing not recommended. 	\N	\N	\N	\N
627	23	Grits	boxed	boxed grits,grits,boxed,box	\N	\N	\N	\N	12	12	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
628	7	Cheese Curds	fresh, unaged	cheese curd,cheese,curd,curds,cheese curds	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	4	Months	\N	\N	\N	\N	\N
629	25	Vegetable soup	homemade	vegetable soup,vegetable,soup	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	3	Months	\N	\N	\N	\N	\N
630	10	Chorizo	fresh	fresh chorizo,chorizo	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Months	\N	\N	\N	\N	\N
631	12	Chorizo	smoked and processed, uncooked	smoked chorizo,chorizo,processed chorizo,smoked,processed,uncooked,uncooked processed chorizo,uncooked smoked chorizo	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Months	\N	\N	\N	\N	\N
632	12	Chorizo	smoked and processed, cooked	smoked chorizo,chorizo,processed chorizo,smoked,processed,cooked,cooked processed chorizo,cooked smoked chorizo	1	1	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	Months	\N	\N	\N	6	6	Months	\N	\N	\N	\N	\N
633	23	Beets	pickled	pickled beets,beets,pickled	1	1	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Refrigerate after opening.	\N	\N	\N	\N	1	2	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
634	4	Cinnamon rolls	unbaked, tube	cinnamon rolls,cinnamon roll,cinnamon,roll,rolls	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Package use-by date	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
635	3	Cinnamon rolls	baked	cinnamon rolls,cinnamon roll,cinnamon,roll,rolls	1	3	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	3	Months	\N	\N	\N	\N	\N
636	6	Cooking wine	\N	cooking wine,wine,cooking	\N	\N	Package use-by date	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Package use-by date	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
637	9	Bulgur	\N	bulgur	6	12	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
638	10	Bratwurst	fresh	fresh brautwurst,brautwurst,fresh	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	3	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	3	Months	\N	\N	\N	\N	\N
639	12	Bratwurst	smoked and processed	smoked brautwurst,processed brautwurst,bratwurst,smoked,processed	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5	7	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	3	Months	\N	\N	\N	\N	\N
640	19	Edamame	fresh	edamame,fresh,fresh edamame,soybeans,soybean	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
641	8	Edamame	frozen	edamame,frozen,frozen edamame,soybean,soybeans	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	Weeks	\N	\N	\N	\N	2	2	Years	\N
642	23	Edamame	salted, dry roasted, out of pod	edamame,soybean,soybeans,salted,roasted,dry roasted	12	12	Months	\N	\N	\N	\N	\N	\N	\N	\N	6	6	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
643	23	Breadcrumbs	commercial	breadcrumbs,breadcrumb	6	6	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
644	23	Milk 	shelf-stable	shelf stable milk,milk,shelf,stable,UHT,ultrapasteurized,aseptic packaging	\N	\N	\N	\N	6	12	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5	7	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
645	25	Salsa	homemade, fresh	homemade salsa,homemade,salsa	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5	7	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12	12	Months	\N	\N	\N	\N	\N
646	6	Salsa	homemade, canned	homemade salsa,homemade,salsa	9	12	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
647	6	Tomato Sauce	homemade, canned	homemade tomato sauce,homemade sauce,homemade spaghetti sauce,spaghetti sauce,tomato sauce,homemade	9	12	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
648	6	Barbecue Sauce	homemade, canned	homemade barbecue sauce,homemade sauce,homemade BBQ sauce,BBQ sauce,barbecue sauce	9	12	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
649	7	Ghee	\N	ghee,clarified butter,clarified,butter	6	8	Months	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
650	23	Corn syrup	\N	corn syrup,corn,syrup	3	3	Years	Keep tightly covered; refrigerate to extend storage life.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
651	23	Nutrition supplement drinks	bottled	Nutrition supplement drinks,drinks,bottled,supplement	\N	\N	Package use-by date	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
652	23	Instant breakfast drinks	bottled	instant breakfast drinks,instant,breakfast,drinks,instant breakfast,instant drink,carnation,bottled instant breakfast drink,bottled instant breakfast,bottled breakfast	6	6	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
653	23	Pine nuts	\N	pine nuts,pine nut,pine,nut,nuts	2	3	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	3	3	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	9	Months	Store in a plastic bag within an airtight container. 	\N	\N	\N	\N
654	3	Coconut flour	\N	coconut flour,coconut,flour	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	12	Months	Store in an airtight container.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	12	Months	\N	\N	\N	\N	\N
655	23	Pecans	chopped	chopped pecans,pecan,pecans,chopped	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12	12	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2	Years	\N	\N	\N	\N	\N
656	23	Polenta	shelf-stable	polenta,shelf stable,shelf stable polenta	\N	\N	Package use-by date	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5	7	Days	\N	\N	\N	\N	\N	Not Recommended	\N	\N	\N	\N	\N
657	8	Polenta	frozen	polenta,frozen,frozen polenta	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5	5	Days	12	12	Months	\N	\N	\N	\N	\N
658	23	Cereal or granola bars	\N	bars,bar,granola bars,granola bar,granola,cereal bars,cereal bar,nutrition bars,nutrition bar,energy bars,energy bar,health bars,health bar,fruit bars,fruit bar,snack bars,snack barsnack,,nut bars,nut bar,seed bars,seed bar,crunchy bars,crunchy bar,breakfast,breakfast bar,breakfast bars	6	12	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
659	23	Milk 	ultra-pasteurized	ultra pasteurized milk,milk,pasteurized,ultra	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	3	Months	\N	\N	\N	\N	\N	7	10	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
660	5	Coconut water	\N	coconut water,coconut,water	\N	\N	\N	\N	12	12	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
661	19	Celery root	\N	celeriac,celery root,celery	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
662	5	Apple cider	fresh	apple cider,apple,cider	2	3	Days	\N	\N	\N	\N	\N	\N	\N	\N	2	3	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Indefinitely	\N	\N	\N	\N	\N
663	5	Yuzu juice	\N	yuzu juice,yuzu,juice	\N	\N	\N	\N	4	6	Months	\N	\N	\N	\N	\N	\N	\N	\N	9	12	Months	\N	3	4	Months	\N	\N	\N	1	2	Years	\N	\N	\N	\N	\N
664	5	Yuzu	fruit, fresh	yuzu,yuzu fruit	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5	7	Days	Store fresh yuzu wrapped in plastic in your refrigerator.  	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Indefinitely	For long term storage of leftovers, freeze the juice and zest.	\N	\N	\N	\N
665	12	Pastrami	\N	pastrami	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	40	40	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
666	8	Kugel	commercial	kugel,commercial,commercial kugel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	Years	\N	\N	\N	\N	\N
667	25	Kugel	homemade	kugel,homemade,homemade kugel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	Months	\N	\N	\N	\N	\N
668	23	Avocado Oil	\N	avodaco oil,avocado,oil	\N	\N	\N	\N	2	2	Years	\N	6	6	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
669	6	Balsamic vinegar	\N	balsamic vinegar,balsamic,vinegar	\N	\N	\N	\N	3	5	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	18	18	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
670	6	Aioli	homemade	garlic aioli,aioli,garlic,mayonnaise,mayo,garlic mayo,garlic mayonnaise,mayo	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
671	6	Salad dressing	homemade	homemade salad dressing,homemade,salad dressing,salad,dressing	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
672	23	Base	beef, vegetable	beef base,vegetable base,base,beef,vegetable	\N	\N	Package use-by date	Refrigerate after opening.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
673	6	Anchovies	canned	anchovies,anchovy,canned anchovies	5	5	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	\N	\N	\N	2	2	Months	Remove from can before freezing.	\N	\N	\N	\N
674	19	Radicchio	\N	radicchio	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	3	Weeks	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
675	12	Prosciutto	\N	prosciutto	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	3	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	Months	\N	\N	\N	\N	\N
676	12	Ham 	uncured, fresh, cooked	ham,uncured,fresh,cooked,uncured ham,fully cooked,fully cooked uncured ham	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Months	\N	\N	\N	\N	\N
677	10	Ham 	uncured, fresh, uncooked	ham,uncured,fresh,uncooked,uncured ham,uncured ham uncooked	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	5	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	6	Months	\N	\N	\N	\N	\N
678	19	Arugula	\N	arugula,greens,salad greens,salad	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	7	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
679	9	Mung bean	sprouts	sprouted mung beans,sprouted mung bean,sprout,mung beans,mung bean,mung,bean,mungbean,sprouts	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	6	Weeks	Never refrigerate wet sprouts. Transfer to a plastic bag or use a glass or plastic container. 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
680	9	Mung bean	dry, food-grade bags	mung beans,mung bean,mung,bean,dry mung beans,dry,bag,bagged mung beans	1	1	Years	Keep the beans in an airtight container as it’s imperative that they remain dry.	\N	\N	\N	\N	\N	\N	\N	1	1	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	Years	\N	\N	\N	\N	\N
681	9	Mung bean	dry, vacuum-sealed	mung beans,mung bean,mung,bean,dry mung beans,dry,vacuum sealed,vacuum sealed mung beans	8	10	Years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
682	23	Croutons	\N	croutons,crouton,bread	5	6	Months	\N	\N	\N	\N	\N	\N	\N	\N	5	6	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11	12	Months	\N	\N	\N	\N	\N
683	12	Bacon	uncured	uncured bacon,nitrite-free bacon,natural bacon,uncured,nitrite-free,nitrite,natural,bacon	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	7	Days	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	4	Weeks	\N	\N	\N	\N	\N
684	23	Mustard	dried, ground	mustard,dried mustard,ground mustard,dried ground mustard	6	6	Months	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2	Years	\N	\N	\N	\N	\N
\.


--
-- Data for Name: version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY version (id, data_version_number, current_version, modified_date, fsis_approved_flag, approved_date, notes) FROM stdin;
1	108	\N	15-Jan-15	t	16-Jan	\N
2	109	\N	28-Jan-15	\N	\N	- Remove bracket from "fermented milk", the name_subtitle of product id 25\n- Remove bracket from “TSP”, the name_subtitle of product id 171 and 172\n- Remove product id 244 due to empty record\n-- Remove bracket from “green, fava, lima, soybean, wax”, the name_subtitle of product id 273
3	110	\N	23-Feb-15	\N	\N	Long list of Chris's feedback
4	111	\N	3-Mar-15	\N	\N	Updated values in timing_per in cooking method tab -- highlighted in yellow
5	112	\N	9-Mar-15	\N	\N	Update storage timing for fresh pasta, shelf stable milk, and pork cubes, and cooking tip for ground beef. Also capitalized first letter of subtitle.  
6	113	\N	10-Mar-15	\N	\N	updated pantry timeline for shelf stable bacon
7	114	\N	8-Apr-15	\N	\N	Updates correcting discrepencies in refrigerator and freezer time of multiple items.
8	115	\N	28-May-15	\N	\N	"In Product tab, added columns for: 1. “if in the pantry from date of purchase” 2. ""if refrigerated from date of purchase"" 3. ""if frozen from date of purchase"". See columns L - P, Z - AD and AR - AV. These columns currently have values that probably needed to be replaced.\n\nRefrigerate metric now allows Package use-by date value\n\nChanged Ripe to When Ripe\n\n
9	116	\N	\N	\N	\N	\N
10	117	\N	1-Aug-15	\N	\N	\N
11	118	\N	24-Aug-15	\N	\N	\N
12	119	\N	17-Dec-15	\N	\N	\N
13	120	\N	6-Jan-16	\N	\N	Added Catfish to 'fatty fish' item.
14	121	\N	25-May-16	\N	\N	\N
15	122	\N	26-Aug-16	\N	\N	Adding items requested by users.
16	123	\N	21-Nov-16	\N	\N	Grammar and typographic corrections.
17	124	\N	31-Jan-17	\N	\N	Added several food and beverages.
18	125	\N	23-Jun-17	\N	\N	Added several food and beverages.
19	126	\N	3-Oct-17	\N	\N	Added keywords
20	127	\N	6-Dec-17	\N	\N	Fixed items that were not compatible with the update. 
21	128	Yes	6-Sep-18	\N	\N	Added several food and beverages.
\.


--
-- Name: authentication_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('authentication_id_seq', 10, true);


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('category_id_seq', 1, false);


--
-- Name: cooking_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cooking_methods_id_seq', 1, false);


--
-- Name: cooking_tips_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cooking_tips_id_seq', 1, false);


--
-- Name: data_dictionary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('data_dictionary_id_seq', 62, true);


--
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('product_id_seq', 1, false);


--
-- Name: version_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('version_id_seq', 21, true);


--
-- Name: authentication authentication_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY authentication
    ADD CONSTRAINT authentication_pkey PRIMARY KEY (id);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: cooking_methods cooking_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cooking_methods
    ADD CONSTRAINT cooking_methods_pkey PRIMARY KEY (id);


--
-- Name: cooking_tips cooking_tips_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cooking_tips
    ADD CONSTRAINT cooking_tips_pkey PRIMARY KEY (id);


--
-- Name: data_dictionary data_dictionary_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY data_dictionary
    ADD CONSTRAINT data_dictionary_pkey PRIMARY KEY (id);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- Name: version version_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY version
    ADD CONSTRAINT version_pkey PRIMARY KEY (id);


--
-- Name: xpkauthentication; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX xpkauthentication ON authentication USING btree (token);


--
-- Name: xpkcategory; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX xpkcategory ON category USING btree (id);


--
-- Name: xpkcooking_methods; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX xpkcooking_methods ON cooking_methods USING btree (id);


--
-- Name: xpkcooking_tips; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX xpkcooking_tips ON cooking_tips USING btree (id);


--
-- Name: xpkdata_dictionary; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX xpkdata_dictionary ON data_dictionary USING btree (id);


--
-- Name: xpkproduct; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX xpkproduct ON product USING btree (id);


--
-- Name: xpkversion; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX xpkversion ON version USING btree (id);


--
-- PostgreSQL database dump complete
--

