--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- Name: dglabs; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE dglabs WITH TEMPLATE = template0 ENCODING = 'UTF8';


ALTER DATABASE dglabs OWNER TO postgres;

\connect dglabs

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- Name: flms; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA flms;


ALTER SCHEMA flms OWNER TO postgres;

SET search_path = flms, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: categories; Type: TABLE; Schema: flms; Owner: flms; Tablespace: 
--

CREATE TABLE categories (
    id integer NOT NULL,
    name character varying(255),
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    thumbnail_file_name character varying(255),
    thumbnail_content_type character varying(255),
    thumbnail_file_size integer,
    thumbnail_updated_at timestamp without time zone
);


ALTER TABLE flms.categories OWNER TO flms;

--
-- Name: categories_events; Type: TABLE; Schema: flms; Owner: flms; Tablespace: 
--

CREATE TABLE categories_events (
    category_id integer,
    event_id integer
);


ALTER TABLE flms.categories_events OWNER TO flms;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: flms; Owner: flms
--

CREATE SEQUENCE categories_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE flms.categories_id_seq OWNER TO flms;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: flms; Owner: flms
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: flms; Owner: flms
--

SELECT pg_catalog.setval('categories_id_seq', 7, true);


--
-- Name: events; Type: TABLE; Schema: flms; Owner: flms; Tablespace: 
--

CREATE TABLE events (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    latitude double precision,
    longitude double precision,
    event_date timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    news_link character varying(255),
    glide_number character varying(255),
    event_label character varying(255),
    aoi_size integer,
    active_start_date timestamp without time zone,
    active_end_date timestamp without time zone,
    firstwatch_link character varying(255),
    icon_id integer,
    available_in_r3 boolean DEFAULT false,
    available_in_commercial boolean DEFAULT true
);


ALTER TABLE flms.events OWNER TO flms;

--
-- Name: events_id_seq; Type: SEQUENCE; Schema: flms; Owner: flms
--

CREATE SEQUENCE events_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE flms.events_id_seq OWNER TO flms;

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: flms; Owner: flms
--

ALTER SEQUENCE events_id_seq OWNED BY events.id;


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: flms; Owner: flms
--

SELECT pg_catalog.setval('events_id_seq', 497, true);


--
-- Name: icons; Type: TABLE; Schema: flms; Owner: flms; Tablespace: 
--

CREATE TABLE icons (
    id integer NOT NULL,
    name character varying(255),
    thumbnail_file_name character varying(255),
    thumbnail_content_type character varying(255),
    thumbnail_file_size integer,
    thumbnail_updated_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE flms.icons OWNER TO flms;

--
-- Name: icons_id_seq; Type: SEQUENCE; Schema: flms; Owner: flms
--

CREATE SEQUENCE icons_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE flms.icons_id_seq OWNER TO flms;

--
-- Name: icons_id_seq; Type: SEQUENCE OWNED BY; Schema: flms; Owner: flms
--

ALTER SEQUENCE icons_id_seq OWNED BY icons.id;


--
-- Name: icons_id_seq; Type: SEQUENCE SET; Schema: flms; Owner: flms
--

SELECT pg_catalog.setval('icons_id_seq', 20, true);


--
-- Name: point_of_interests; Type: TABLE; Schema: flms; Owner: flms; Tablespace: 
--

CREATE TABLE point_of_interests (
    id integer NOT NULL,
    event_id integer,
    name character varying(255),
    description text,
    latitude double precision,
    longitude double precision,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE flms.point_of_interests OWNER TO flms;

--
-- Name: point_of_interests_id_seq; Type: SEQUENCE; Schema: flms; Owner: flms
--

CREATE SEQUENCE point_of_interests_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE flms.point_of_interests_id_seq OWNER TO flms;

--
-- Name: point_of_interests_id_seq; Type: SEQUENCE OWNED BY; Schema: flms; Owner: flms
--

ALTER SEQUENCE point_of_interests_id_seq OWNED BY point_of_interests.id;


--
-- Name: point_of_interests_id_seq; Type: SEQUENCE SET; Schema: flms; Owner: flms
--

SELECT pg_catalog.setval('point_of_interests_id_seq', 405, true);


--
-- Name: schema_migrations; Type: TABLE; Schema: flms; Owner: flms; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE flms.schema_migrations OWNER TO flms;

--
-- Name: subscribers; Type: TABLE; Schema: flms; Owner: flms; Tablespace: 
--

CREATE TABLE subscribers (
    id integer NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    email character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE flms.subscribers OWNER TO flms;

--
-- Name: subscribers_id_seq; Type: SEQUENCE; Schema: flms; Owner: flms
--

CREATE SEQUENCE subscribers_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE flms.subscribers_id_seq OWNER TO flms;

--
-- Name: subscribers_id_seq; Type: SEQUENCE OWNED BY; Schema: flms; Owner: flms
--

ALTER SEQUENCE subscribers_id_seq OWNED BY subscribers.id;


--
-- Name: subscribers_id_seq; Type: SEQUENCE SET; Schema: flms; Owner: flms
--

SELECT pg_catalog.setval('subscribers_id_seq', 18, true);


--
-- Name: users; Type: TABLE; Schema: flms; Owner: flms; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(128) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE flms.users OWNER TO flms;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: flms; Owner: flms
--

CREATE SEQUENCE users_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE flms.users_id_seq OWNER TO flms;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: flms; Owner: flms
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: flms; Owner: flms
--

SELECT pg_catalog.setval('users_id_seq', 4, true);


--
-- Name: id; Type: DEFAULT; Schema: flms; Owner: flms
--

ALTER TABLE categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: flms; Owner: flms
--

ALTER TABLE events ALTER COLUMN id SET DEFAULT nextval('events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: flms; Owner: flms
--

ALTER TABLE icons ALTER COLUMN id SET DEFAULT nextval('icons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: flms; Owner: flms
--

ALTER TABLE point_of_interests ALTER COLUMN id SET DEFAULT nextval('point_of_interests_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: flms; Owner: flms
--

ALTER TABLE subscribers ALTER COLUMN id SET DEFAULT nextval('subscribers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: flms; Owner: flms
--

ALTER TABLE users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: flms; Owner: flms
--

COPY categories (id, name, description, created_at, updated_at, thumbnail_file_name, thumbnail_content_type, thumbnail_file_size, thumbnail_updated_at) FROM stdin;
3	Natural Disaster	DigitalGlobe is monitoring natural disasters worldwide.	2011-05-18 23:51:25.408123	2011-11-11 23:43:37.661647	cat_natural_dis.png	image/png	2078	2011-11-11 23:43:37.503989
5	Political Instability	DigitalGlobe is monitoring political situations around the world.	2011-05-19 19:59:58.680969	2011-11-11 23:43:46.713276	cat_political.png	image/png	1887	2011-11-11 23:43:46.543137
4	Man-Made Crisis	DigitalGlobe is monitoring man-made crisis around the globe.	2011-05-18 23:52:37.937693	2011-11-11 23:43:57.096281	cat_manmade.png	image/png	2378	2011-11-11 23:43:56.940833
6	Human Interest	DigitalGlobe is monitoring human interests world-wide.	2011-05-24 20:27:36.11378	2012-01-12 18:47:44.25179	cat_human_in.png	image/png	1130	2012-01-12 18:47:44.039569
\.


--
-- Data for Name: categories_events; Type: TABLE DATA; Schema: flms; Owner: flms
--

COPY categories_events (category_id, event_id) FROM stdin;
3	243
3	236
4	251
3	252
3	256
3	257
5	0
3	1
3	2
5	3
3	4
3	5
5	6
5	7
3	8
3	9
3	10
3	11
3	12
4	13
3	14
3	15
3	16
3	17
3	18
3	19
3	20
3	21
3	22
4	23
3	24
3	25
3	26
3	27
3	28
3	29
3	30
3	31
3	32
3	33
3	34
3	35
3	36
3	37
3	38
3	39
3	40
5	41
4	259
3	263
6	44
3	276
5	277
6	50
6	51
3	52
3	53
3	54
5	55
5	56
5	57
5	58
5	59
5	60
5	61
5	62
5	63
5	64
5	65
5	66
5	67
5	68
5	69
5	70
5	71
5	72
5	73
5	74
5	75
5	76
5	77
5	78
5	79
5	80
5	81
3	82
5	83
5	84
5	85
3	86
3	87
3	88
3	89
3	90
3	91
3	92
3	93
3	94
3	95
3	96
3	97
3	98
3	99
3	100
3	101
3	102
3	103
3	104
3	105
3	106
3	107
3	108
3	109
3	110
3	111
3	112
3	113
3	114
3	115
3	116
3	117
3	118
3	119
3	120
3	121
3	122
5	123
5	124
5	125
5	126
3	127
3	128
3	129
3	130
3	131
3	132
3	133
3	134
3	135
3	136
3	137
5	138
3	139
3	140
3	141
3	142
3	143
3	144
3	145
3	146
3	147
3	148
5	149
5	150
5	151
5	152
5	153
5	154
5	155
3	156
5	157
5	158
5	159
5	160
5	161
5	162
3	163
3	164
3	165
3	166
3	167
3	168
3	169
3	170
3	171
3	172
3	173
3	174
3	175
3	176
3	177
3	178
3	179
3	180
3	181
3	182
3	183
3	184
3	185
3	186
3	187
3	188
3	189
6	190
5	191
5	192
5	193
5	194
5	195
5	196
5	197
5	198
5	199
5	200
3	201
3	202
3	203
3	204
3	205
3	206
3	208
3	209
3	210
3	211
3	212
3	213
3	214
3	215
3	216
3	217
3	218
3	219
3	220
3	221
3	222
3	223
3	235
5	225
5	224
5	226
3	227
3	228
3	229
3	230
3	231
3	232
3	233
3	241
3	242
3	239
3	240
5	244
3	253
3	246
6	249
5	250
6	254
3	255
5	258
3	260
5	261
3	262
5	264
5	265
4	266
3	267
4	268
3	269
3	270
3	275
3	278
6	279
6	280
3	281
5	282
5	284
3	285
3	287
3	286
4	288
4	289
5	290
3	291
3	292
3	293
3	294
3	295
3	296
3	297
4	298
3	299
4	300
3	301
5	302
3	303
3	304
3	305
6	306
3	307
3	308
3	309
5	310
6	311
3	312
3	313
3	318
5	315
6	316
3	317
3	319
3	320
4	321
3	327
6	326
5	328
5	329
5	330
3	331
6	332
3	333
3	341
5	342
3	343
3	344
3	345
3	346
3	347
3	348
3	350
6	351
3	352
6	353
6	354
3	355
3	356
3	358
6	357
3	359
3	360
3	361
3	362
3	363
3	364
3	365
3	366
3	367
4	368
3	373
3	370
3	371
6	372
3	374
3	375
3	376
3	377
3	378
3	379
3	380
3	381
5	382
5	383
3	387
3	385
3	388
4	389
3	390
3	391
3	392
3	393
3	394
3	395
5	397
5	398
5	399
5	400
3	401
4	402
3	407
3	405
3	408
4	409
3	410
3	411
3	412
3	413
3	414
3	415
3	416
3	417
5	420
4	419
3	421
3	422
5	423
3	425
3	432
3	431
3	433
3	429
3	434
5	437
5	436
3	441
5	439
5	440
3	442
3	443
3	444
3	445
3	446
4	447
4	448
3	449
4	450
3	451
3	452
3	453
3	454
3	455
3	456
4	466
3	458
3	459
3	460
3	461
3	462
3	463
4	464
3	465
5	467
3	468
3	469
3	470
3	471
3	472
3	473
3	474
4	475
3	476
5	477
3	478
3	479
3	480
3	481
3	482
3	483
5	484
3	495
3	486
3	487
3	488
5	489
4	490
4	491
3	492
3	493
3	494
3	496
3	497
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: flms; Owner: flms
--

COPY events (id, name, description, latitude, longitude, event_date, created_at, updated_at, news_link, glide_number, event_label, aoi_size, active_start_date, active_end_date, firstwatch_link, icon_id, available_in_r3, available_in_commercial) FROM stdin;
423	Civil Unrest in Egypt	The U.S. embassy in Cairo closed to the public Tuesday amid civil unrest across Egypt. Some 51 people have died in the violence since Friday, and at least 128 people were injured in overnight clashes that continued into Tuesday morning.	30.065000000000001	31.266999999999999	2013-01-30 16:05:00	2013-01-30 16:23:14.699751	2013-01-30 16:23:14.699751	http://www.upi.com/Top_News/World-News/2013/01/29/Egyptians-defy-Morsi-curfew-death-toll-59/UPI-37741359444600/		Yellow	16	2013-01-30 16:05:00	2013-02-09 16:05:00		19	f	t
3	Sudan Referendum	Political	4.8494999999999999	31.5822	2010-12-24 12:00:00	2011-05-24 12:00:00	2011-06-07 19:54:42.903765	\N	\N	\N	\N	\N	\N	\N	1	f	t
4	Mt Carmel Fire Israel	Fire	32.747	35.0364	2010-12-02 12:00:00	2011-05-24 12:00:00	2011-06-07 19:54:55.981925	\N	\N	\N	\N	\N	\N	\N	1	f	t
5	Venezuela Flooding	Flood	10.4819	-66.852999999999994	2010-12-01 12:00:00	2011-05-24 12:00:00	2011-06-07 19:55:13.381357	\N	\N	\N	\N	\N	\N	\N	1	f	t
6	North Korea Tensions	Political	37.661299999999997	125.70099999999999	2010-11-26 12:00:00	2011-05-24 12:00:00	2011-06-07 19:55:30.489885	\N	\N	\N	\N	\N	\N	\N	1	f	t
7	Myanmar Election Violence	Political	16.6905	98.516000000000005	2010-11-08 12:00:00	2011-05-24 12:00:00	2011-06-07 19:55:45.816007	\N	\N	\N	\N	\N	\N	\N	1	f	t
8	Hurricane Tomas	Hurricane	18.561	-72.334999999999994	2010-11-05 12:00:00	2011-05-24 12:00:00	2011-06-07 19:56:00.172343	\N	\N	\N	\N	\N	\N	\N	1	f	t
9	Mt. Merapi	Volcano	-7.5415999999999999	110.4442	2010-10-26 12:00:00	2011-05-24 12:00:00	2011-06-07 19:56:14.935181	\N	\N	\N	\N	\N	\N	\N	1	f	t
11	Cyclone Giri	Cyclone	19.707000000000001	93.724000000000004	2010-10-26 12:00:00	2011-05-24 12:00:00	2011-06-07 19:56:37.754431	\N	\N	\N	\N	\N	\N	\N	1	f	t
12	Cotonou Benin - flooding	Flood	6.3920000000000003	2.4295	2010-10-26 12:00:00	2011-05-24 12:00:00	2011-06-07 19:56:51.617074	\N	\N	\N	\N	\N	\N	\N	1	f	t
10	Sumatra Tsunami	Tsunami	-0.99350000000000005	100.381	2010-10-26 12:00:00	2011-05-24 12:00:00	2011-06-07 19:57:06.060459	\N	\N	\N	\N	\N	\N	\N	1	f	t
13	Hungary Toxic Sludge	Environmental	47.089100000000002	17.4953	2010-10-05 12:00:00	2011-05-24 12:00:00	2011-06-07 19:57:34.527426	\N	\N	\N	\N	\N	\N	\N	1	f	t
14	Mexico Landslide	Landslide	17.099399999999999	-96.059700000000007	2010-09-28 12:00:00	2011-05-24 12:00:00	2011-06-07 19:59:30.949581	\N	\N	\N	\N	\N	\N	\N	1	f	t
15	Minnesota Flooding	Flood	44.310699999999997	-93.962000000000003	2010-09-27 12:00:00	2011-05-24 12:00:00	2011-06-07 20:00:20.50793	\N	\N	\N	\N	\N	\N	\N	1	f	t
16	Wisconsin Flooding	Flood	43.536000000000001	-89.456999999999994	2010-09-27 12:00:00	2011-05-24 12:00:00	2011-06-07 20:00:37.038493	\N	\N	\N	\N	\N	\N	\N	1	f	t
17	Bihar India Flooding	Flood	26.372	84.631	2010-09-20 12:00:00	2011-05-24 12:00:00	2011-06-07 20:00:50.662596	\N	\N	\N	\N	\N	\N	\N	1	f	t
18	Machine Gun Fire	Fire	40.449800000000003	-112.0536	2010-09-20 12:00:00	2011-05-24 12:00:00	2011-06-07 20:01:02.980468	\N	\N	\N	\N	\N	\N	\N	1	f	t
19	Hurricane Karl	Hurricane	19.125900000000001	-96.1511	2010-09-17 12:00:00	2011-05-24 12:00:00	2011-06-07 20:01:23.829833	\N	\N	\N	\N	\N	\N	\N	1	f	t
20	Canyon Fire	Fire	35.560099999999998	-118.57299999999999	2010-09-16 12:00:00	2011-05-24 12:00:00	2011-06-07 20:01:37.767002	\N	\N	\N	\N	\N	\N	\N	1	f	t
21	Nigeria Flooding	Flood	13.4496	5.6509999999999998	2010-09-14 12:00:00	2011-05-24 12:00:00	2011-06-07 20:01:53.748902	\N	\N	\N	\N	\N	\N	\N	1	f	t
22	Reservoir Road Fire	Fire	40.378	-105.264	2010-09-13 12:00:00	2011-05-24 12:00:00	2011-06-07 20:02:07.962758	\N	\N	\N	\N	\N	\N	\N	1	f	t
23	San Bruno Explosion	Explosion	37.622999999999998	-122.4414	2010-09-10 12:00:00	2011-05-24 12:00:00	2011-06-07 20:02:22.698843	\N	\N	\N	\N	\N	\N	\N	1	f	t
24	Four Mile Fire	Fire	40.053699999999999	-105.41330000000001	2010-09-07 12:00:00	2011-05-24 12:00:00	2011-06-07 20:02:39.735971	\N	\N	\N	\N	\N	\N	\N	1	f	t
25	New Zealand Earthquake	Earthquake	-43.530999999999999	172.63499999999999	2010-09-07 12:00:00	2011-05-24 12:00:00	2011-06-07 20:02:53.025201	\N	\N	\N	\N	\N	\N	\N	1	f	t
26	California Post Fire	Fire	34.847999999999999	-118.877	2010-08-25 12:00:00	2011-05-24 12:00:00	2011-06-07 20:03:09.163821	\N	\N	\N	\N	\N	\N	\N	1	f	t
27	Sichuan China Debris Flow	Landslide	31.061599999999999	103.4854	2010-08-16 12:00:00	2011-05-24 12:00:00	2011-06-07 20:03:22.306762	\N	\N	\N	\N	\N	\N	\N	1	f	t
28	Iowa Flooding	Flood	41.533200000000001	-93.474999999999994	2010-08-12 12:00:00	2011-05-24 12:00:00	2011-06-07 20:03:34.125113	\N	\N	\N	\N	\N	\N	\N	1	f	t
29	China Landslide	Landslide	33.786999999999999	104.371	2010-08-09 12:00:00	2011-05-24 12:00:00	2011-06-07 20:03:45.705209	\N	\N	\N	\N	\N	\N	\N	1	f	t
30	India Flooding	Flood	34.133299999999998	77.507000000000005	2010-08-09 12:00:00	2011-05-24 12:00:00	2011-06-07 20:04:00.469708	\N	\N	\N	\N	\N	\N	\N	1	f	t
31	Czech Flooding	Flood	50.880699999999997	14.5199	2010-08-09 12:00:00	2011-05-24 12:00:00	2011-06-07 20:04:13.270246	\N	\N	\N	\N	\N	\N	\N	1	f	t
32	Burkina Faso Flooding	Flood	12.973000000000001	-0.14050000000000001	2010-08-02 12:00:00	2011-05-24 12:00:00	2011-06-07 20:04:31.082213	\N	\N	\N	\N	\N	\N	\N	1	f	t
33	Pakistan Flooding	Flood	28.0915	69.121200000000002	2010-07-30 12:00:00	2011-05-24 12:00:00	2011-06-07 20:04:43.550906	\N	\N	\N	\N	\N	\N	\N	1	f	t
34	California Fires	Fire	35.805999999999997	-118.411	2010-07-28 12:00:00	2011-05-24 12:00:00	2011-06-07 20:04:55.026461	\N	\N	\N	\N	\N	\N	\N	1	f	t
35	Jiunjian Flooding	Flood	29.707000000000001	115.873	2010-07-20 12:00:00	2011-05-24 12:00:00	2011-06-07 20:05:06.38753	\N	\N	\N	\N	\N	\N	\N	1	f	t
36	Hurricane Alex	Hurricane	25.6707	-100.36360000000001	2010-07-01 12:00:00	2011-05-24 12:00:00	2011-06-07 20:05:18.167956	\N	\N	\N	\N	\N	\N	\N	1	f	t
37	Canada Flooding	Flood	49.933500000000002	-109.485	2010-06-22 12:00:00	2011-05-24 12:00:00	2011-06-07 20:05:29.140929	\N	\N	\N	\N	\N	\N	\N	1	f	t
39	Myanmar Flooding	Flood	19.259	93.718000000000004	2010-06-17 12:00:00	2011-05-24 12:00:00	2011-06-07 20:05:41.658562	\N	\N	\N	\N	\N	\N	\N	1	f	t
38	China Flooding	Flood	22.201000000000001	113.10599999999999	2010-06-21 12:00:00	2011-05-24 12:00:00	2011-06-07 20:05:53.752425	\N	\N	\N	\N	\N	\N	\N	1	f	t
40	OK and AR Flooding	Flood	35.585000000000001	-97.481700000000004	2010-06-15 12:00:00	2011-05-24 12:00:00	2011-06-07 20:06:05.14522	\N	\N	\N	\N	\N	\N	\N	1	f	t
41	Osh Ethnic Violence	Political	40.517000000000003	72.805000000000007	2010-06-14 12:00:00	2011-05-24 12:00:00	2011-06-07 20:06:21.646184	\N	\N	\N	\N	\N	\N	\N	1	f	t
44	World Cup 2010 -  Nelson Mandela Bay	Sports	-33.936999999999998	25.599	2010-06-11 12:00:00	2011-05-24 12:00:00	2011-06-07 20:06:42.786859	\N	\N	\N	\N	\N	\N	\N	1	f	t
52	Cyclone Phet	Cyclone	23.613	58.592199999999998	2010-06-04 12:00:00	2011-05-24 12:00:00	2011-06-07 20:07:27.324088	\N	\N	\N	\N	\N	\N	\N	1	f	t
183	Southern Storms - Tuscaloosa	On April 27th, the city of Tuscaloosa, Alabama was struck by an EF-4 level tornado with winds reported up to 190 mph. Leaving a scar nearly 6 miles long, 5,000 homes were were destroyed or severely damaged and 43 people lost their lives.	33.193232999999999	-87.537120999999999	2011-04-28 12:00:00	2011-05-24 12:00:00	2011-06-07 22:20:23.214681	\N	\N	\N	\N	\N	\N	\N	1	f	t
225	Yemen Unrest - Presidential Palace	Political Unrest in Yemen	15.314399999999999	44.215200000000003	2011-06-03 19:45:00	2011-06-03 19:49:19.781384	2011-06-08 06:47:37.393806	\N	\N	\N	\N	\N	\N	\N	1	f	t
206	Joplin, MO	An EF-5 multiple-vortex tornado struck the town of Joplin, Missouri the evening of May 22nd. One of the deadliest tornadoes in U.S. history, at least 141 people were killed with an estimated 2,000 buildings destroyed. 	37.060949000000001	-94.530506000000003	2011-05-23 12:00:00	2011-05-24 12:00:00	2011-06-08 15:14:39.825782	\N	\N	\N	\N	\N	\N	\N	1	f	t
241	South Korea landslides - Chuncheon	Torrential rainfall has triggered flooding and a landslide in Chuncheon killing 16 people according to the National Emergency Management Agency.	37.881500000000003	127.735	2011-07-29 17:49:00	2011-07-29 17:55:09.415237	2011-07-29 17:55:09.415237	http://www.ibtimes.com/articles/189022/20110729/seoul-torrential-rain-torrential-rain-in-south-korea-killing-41-people-natural-disaster-floods-in-so.htm	\N	\N	\N	\N	\N	\N	1	f	t
227	Wallow Fire - Arizona	According to InciWeb, the Wallow Fire is burning actively in eastern Arizona near the communities of Nutrioso and Alpine. Size is estimated at 233,522 acres.	33.903100000000002	-109.31229999999999	2011-06-06 22:03:00	2011-06-06 22:07:40.930901	2011-06-08 22:11:05.556882	\N	\N	\N	\N	\N	\N	\N	1	f	t
242	South Korea landslides- Seoul	In Seoul, the heaviest rains in a century have led to flooding and landslides. At least 67 people are dead or missing.	37.500999999999998	127.069	2011-07-29 17:56:00	2011-07-29 18:00:05.949187	2011-07-29 18:00:05.949187	http://www.ibtimes.com/articles/189022/20110729/seoul-torrential-rain-torrential-rain-in-south-korea-killing-41-people-natural-disaster-floods-in-so.htm	\N	\N	\N	\N	\N	\N	1	f	t
458	Ardent Sentry (AS-13) Exercise	A major yearly exercise focused on Defense Support of Civil Authorities during May 2013.	28.030847000000001	-82.653424999999999	2013-05-16 15:10:00	2013-05-22 14:13:12.625654	2013-05-22 14:13:12.625654			Yellow	5	2013-05-16 14:10:00	2013-06-15 14:10:00		8	t	f
425	Flood in Seychelles	Parts of the Seychelles have declared a state of emergency after severe weather hit the country.  No casualties have been reported, but flooding, landslides and rock falls have hit the main island of Mahe. 	-4.7273509999999996	55.520570999999997	2013-02-01 16:30:00	2013-02-01 16:38:25.398234	2013-02-01 16:38:25.398234	http://www.aljazeera.com/weather/2013/01/201312993838165255.html		Yellow	16	2013-02-01 16:30:00	2013-02-11 16:30:00		6	f	t
367	Flooding in Senegal	Six people drowned or were killed by falling structures over the weekend, after a torrential rain lashed Senegal, causing houses to crumble and neighborhoods to flood under the rushing water.	14.794	-17.327000000000002	2012-08-27 17:30:00	2012-08-27 17:31:47.783475	2012-09-11 20:14:31.292405	http://www.washingtonpost.com/world/africa/6-dead-in-weekend-flooding-in-senegals-capital-says-minister-of-the-interior/2012/08/27/13a4f736-f055-11e1-b74c-84ed55e0300b_story.html		Yellow	16	2012-08-27 17:30:00	2012-09-06 17:30:00		6	f	t
216	Massachusetts Tornados - Sturbridge	Tornado	42.108199999999997	-72.078900000000004	2011-06-02 00:00:00	2011-06-03 16:43:10.787266	2011-06-03 16:43:10.787266	\N	\N	\N	\N	\N	\N	\N	1	f	t
481	Chisana River Fire, AK	The Chisana River Fire has burned over 34,000 acres of forest 29 miles southeast of Northway. The blaze was most likely started by lightening strike.	62.424498999999997	-141.48817	2013-06-25 19:30:00	2013-06-25 19:38:11.072827	2013-06-25 19:38:11.072827	http://www.alaskadispatch.com/article/20130622/fires-burn-across-alaska-outside-firefighters-called-assist		Yellow	16	2013-06-25 19:30:00	2013-07-06 19:30:00		5	f	t
230	Jiangxi Flooding - Huanggang	Flooding has displaced thousands of people.	30.428000000000001	114.879	2011-06-12 15:45:00	2011-06-12 15:46:17.810356	2011-06-12 15:46:17.810356	\N	\N	\N	\N	\N	\N	\N	1	f	t
229	Jiangxi Flooding - Xiangyang	Flooding has displaced thousands of people.	27.806000000000001	114.426	2011-06-12 15:41:00	2011-06-12 15:45:01.3853	2011-06-12 15:46:40.444434	\N	\N	\N	\N	\N	\N	\N	1	f	t
231	Jiangxi Flooding - Xianning	Flooding has displaced thousands of people.	29.849	114.1404	2011-06-12 15:46:00	2011-06-12 15:48:17.833641	2011-06-12 15:48:17.833641	\N	\N	\N	\N	\N	\N	\N	1	f	t
232	Jiangxi Flooding - Xiushui	Flooding has displaced thousands of people.	29.013000000000002	114.548	2011-06-12 15:48:00	2011-06-12 15:49:42.690104	2011-06-12 15:49:42.690104	\N	\N	\N	\N	\N	\N	\N	1	f	t
362	Tropical Cyclone Tembin	Tembin, the 14th storm of the Pacific typhoon season, is packing winds of 119 kph, with gusts of up to 155 kph, and has a radius of 150 km, the bureau said. \n\n	22.981152999999999	120.211557	2012-08-20 21:02:00	2012-08-20 21:03:38.179722	2012-08-20 21:03:38.179722	http://www.chinapost.com.tw/taiwan/national/national-news/2012/08/21/351635/Typhoon-Tembin.htm		Yellow	16	2012-08-20 21:02:00	2012-09-05 21:02:00		8	f	t
233	Souris-Missouri River Flooding - Offutt	Collection AOIs are defined for Minot ND, Sioux City IA, Offut and Fort Calhoun, NE.	41.118899999999996	-95.908799999999999	2011-06-29 11:15:00	2011-06-29 17:15:37.909463	2011-07-06 19:08:04.159354	\N	\N	\N	\N	\N	\N	\N	1	f	t
361	Tropical Cyclone Kai-Tak	At least 27 people have been killed during a typhoon which swept across northern provinces of Vietnam over the weekend, officials have said.	21.012440999999999	105.881309	2012-08-20 20:14:00	2012-08-20 20:16:41.076589	2012-09-24 22:38:30.077784	http://www.bbc.co.uk/news/world-asia-19312295		Yellow	16	2012-08-20 20:14:00	2012-09-05 20:14:00		8	f	t
378	Tropical Storm Leslie Over Bermuda	The National Hurricane Center reports Leslie was located about 660km south-southeast of Bermuda with maximum sustained winds of 110kph. Before downgrading to tropical storm status, Leslie spent two days as a Category 1 hurricane over the Atlantic.	32.294642000000003	-64.781527999999994	2012-09-07 19:46:00	2012-09-07 19:54:17.200624	2012-09-07 19:55:12.748599	http://www.huffingtonpost.com/2012/09/07/hurricane-leslie-bermuda_n_1864892.html		Yellow	16	2012-09-07 19:46:00	2012-10-17 19:46:00		8	f	t
393	Wildfires in Central Washington	More than 2,000 firefighters have contained about 30% of fires that cover 42,508 acres near Wenatchee.  The Table Mountain Fire near Cle Elum, meanwhile, is at 30,484 acres and 10% contained, with a high potential for further growth.	47.322000000000003	-120.512	2012-09-25 17:33:00	2012-09-25 17:38:23.749668	2012-09-25 17:38:23.749668	http://www.yakima-herald.com/stories/2012/09/25/progress-continues-against-central-washington-wildfires		Yellow	25	2012-09-25 17:33:00	2012-10-05 17:33:00		5	f	t
394	Wildfires in Northern Idaho	Several wildfires continue to burn in Northern Idaho.  The McGuire Fire Complex, Wesley Fire and Sheep Fire are currently burning in and around the Nez Perce and Payette National Forest. 	45.624000000000002	-115.5	2012-09-25 17:43:00	2012-09-25 18:19:41.783251	2012-09-25 18:20:16.470803	http://inciweb.org/incident/3219/		Yellow	16	2012-09-25 17:43:00	2012-10-05 17:43:00		5	f	t
51	World Cup 2010 -  Soccer City	Sports	-26.234000000000002	27.981999999999999	2010-06-11 12:00:00	2011-05-24 12:00:00	2012-01-16 16:57:09.75527			Yellow	10	2012-01-16 16:56:00	2012-02-15 16:56:00		1	f	t
363	Ponderosa Fire, California	Firefighters were starting to gain the upper hand Tuesday on a fire that has burned almost 20,000 acres in Northern California, with the blaze 35% contained.\n\n	40.436737999999998	-121.773933	2012-08-21 15:28:00	2012-08-21 15:29:34.158828	2012-08-21 15:29:34.158828	http://latimesblogs.latimes.com/lanow/2012/08/ponderosa-fire-shasta-county-tehama-county-evacuations-manton-shingletown-viola.html		Yellow	16	2012-08-21 15:28:00	2012-08-31 15:28:00		5	f	t
395	Shockey Wildfire, California	The Shockey Fire has burned roughly 3,000 acres near the Shockey Truck Trail and the Campo Indian Reservation and is moving east, according to Cal Fire officials. One person has died and 30 homes have been burned.	32.6477	-116.36799999999999	2012-09-25 18:35:00	2012-09-25 18:40:56.542045	2012-09-25 18:40:56.542045	http://www.nbcsandiego.com/news/local/Shockey-Deadly-Brush-Fire-San-Diego-Campo-Cal-Fire-171148671.html		Yellow	13	2012-09-25 18:35:00	2012-10-05 18:35:00		5	f	t
321	Plane Crash in Nigeria	A passenger plane with about 150 people on board has crashed into buildings in a densely populated district of Nigeria's main city of Lagos.\n\n	6.6710000000000003	3.3130000000000002	2012-06-04 16:44:00	2012-06-04 16:56:16.218538	2012-07-31 18:44:17.325149	http://www.bbc.co.uk/news/world-africa-18316130		Orange	16	2012-06-04 16:44:00	2012-06-13 16:44:00		20	f	t
364	Fires in California	According to data provided by the U.S. Forest Service, wildfires had burned 276,252 acres across the state as of last week, excluding the large Rush fire on the Nevada border.\n	40.567999999999998	-120.10599999999999	2012-08-22 15:17:00	2012-08-22 15:18:40.345102	2012-08-22 15:18:40.345102	http://www.modbee.com/2012/08/21/2338950/dry-winter-helped-fuel-states.html		Orange	25	2012-08-22 15:17:00	2012-09-01 15:17:00		5	f	t
397	Pipeline Explosion	An explosion hit a pipeline just west of the city of Homs on February 15, 2012.	34.710999999999999	36.680999999999997	2012-10-10 14:08:00	2012-10-10 14:36:53.92409	2012-10-10 14:36:53.92409	http://www.bbc.co.uk/news/world-middle-east-17038164		Red	16	2012-10-10 14:08:00	2012-11-09 14:08:00		19	f	t
298	Explosion in Brazzaville, Congo	Huge explosions at an arms depot, which killed at least 146 people in Congo's capital, Brazzaville, were caused by a short-circuit that led to a fire, government officials say.\n\n	-4.2430000000000003	15.294	2012-03-05 17:10:00	2012-03-05 17:13:45.13309	2012-09-10 20:29:52.430794	http://www.bbc.co.uk/news/world-africa-17254551	AC-2012-000035-COG	Orange	16	2012-03-05 17:10:00	2012-03-15 17:10:00		15	f	t
482	Lime Hills Fire, AK	The Lime Hills Fire has burned over 160,000 acres just 10 miles northwest of Lime Village. The fire started on May 31 by lightning strike.	61.522874000000002	-155.438838	2013-06-25 19:40:00	2013-06-25 19:45:20.923953	2013-06-25 19:45:20.923953	http://www.youralaskalink.com/news/Wildfire-got-to-Within--a-Half-Mile-of-Lime-Village-212767891.html		Yellow	16	2013-06-25 19:40:00	2013-07-06 19:40:00		5	f	t
437	Bomb Blast in Kano, Nigeria	A suicide car bomb attack at a bus stop in the Nigerian city of Kano has killed at least 22 people, police say. No group has admitted responsibility, but Islamist Boko Haram militants have previously attacked Kano.	12.018017	8.5412850000000002	2013-03-20 22:01:00	2013-03-20 22:06:48.325997	2013-03-20 22:07:19.086495	http://www.bbc.co.uk/news/world-africa-21845402		Yellow	16	2013-03-20 22:01:00	2013-03-21 22:01:00		19	f	t
459	Moore, OK 	A massive tornado tore through the Oklahoma City area, killing at least 24 people, setting buildings on fire, leveling neighborhoods, and destroying an elementary school.	35.330599999999997	-97.483531999999997	2013-05-20 15:00:00	2013-05-22 14:22:33.77397	2013-06-03 19:27:10.905762			Orange	16	2013-05-20 00:00:00	2013-06-19 23:59:00		13	t	t
352	Tropical Cyclone Saola-12	From 28/07/2012 to 30/07/2012, a Hurricane/Typhoon > 74 mph (maximum wind speed of 194 km/h) SAOLA-12 was active in NWPacific. 	26.926815000000001	120.21317500000001	2012-07-30 15:26:00	2012-07-30 15:30:19.109297	2012-07-31 17:45:19.091218	http://www.chinapost.com.tw/taiwan/national/national-news/2012/07/30/349268/Bureau-warns.htm		Yellow	16	2012-07-30 15:26:00	2012-08-09 15:26:00		8	f	t
365	Flood in Russia	At least four people have been killed overnight in flash floods in Russia's Black Sea region, officials said Wednesday.\n\n	44.299264999999998	38.879607	2012-08-22 19:06:00	2012-08-22 19:08:00.218318	2012-09-24 21:55:06.635351	http://www.huffingtonpost.com/2012/08/22/russia-floods-black-sea-region_n_1821289.html		Yellow	16	2012-08-22 19:06:00	2012-09-01 19:06:00		6	f	t
398	Artillery pounds Homs	Artillery positioned outside of Homs began shelling the neighborhood of Baba Amr in February.	34.606400000000001	36.752000000000002	2012-10-10 14:37:00	2012-10-10 14:44:46.892462	2012-10-10 14:44:46.892462	http://www.businessweek.com/news/2012-02-06/syrian-forces-shell-cities-to-end-revolt-after-russian-veto.html		Red	16	2012-10-10 14:37:00	2012-11-09 14:37:00		19	f	t
399	Homs sees worst shelling in months	Aircraft and artillery continue to pound the Homs neighborhood of Al Khaldiyah.	34.744999999999997	36.720999999999997	2012-10-10 14:46:00	2012-10-10 14:49:44.349075	2012-10-10 14:49:44.349075	http://www.bbc.co.uk/news/world-middle-east-19845165		Red	16	2012-10-10 14:46:00	2012-11-09 14:46:00		19	f	t
400	Shelling of Jouret al-Shayah	Many clinics in the Homs neighborhood of Jouret al-Shayah were targeted and destroyed in late June/early July.	34.735999999999997	36.709000000000003	2012-10-10 14:56:00	2012-10-10 14:59:36.930764	2012-10-10 14:59:36.930764	http://blogs.aljazeera.com/topic/syria/residents-jouret-al-shayyah-neighbourhood-homs-are-enduring-shelling-government-forces		Red	16	2012-10-10 14:56:00	2012-11-09 14:56:00		19	f	t
380	Wildfires in Northern Idaho	The Mustang Complex fire which was started by a lightning strike on the weekend of July 28-29 is currently only 16% contained and over 261,000 acres have been affected. Meanwhile, the Sheep Fire is almost 14,000 acres and is 10% contained.	45.436	-114.488	2012-09-10 21:17:00	2012-09-10 21:34:34.657556	2012-09-10 21:34:34.657556	http://www.kmvt.com/news/local/169195696.html		Yellow	16	2012-09-10 21:17:00	2012-09-20 21:17:00		5	f	t
346	Floods in Russia	The death toll from this weekend’s catastrophic flash floods in southern Russia has climbed to at least 171 people, and authorities warn that figure is likely to increase.	44.935105999999998	38.006252000000003	2012-07-09 16:42:00	2012-07-09 16:45:29.469185	2012-09-24 23:31:54.078626	http://abcnews.go.com/blogs/headlines/2012/07/russia-floods-terrifying-wall-of-water-kills-at-least-144/		Yellow	16	2012-07-09 16:42:00	2012-07-19 16:42:00		6	f	t
366	Tropical Cyclone ISAAC	Tropical Storm Isaac strengthened on Friday as it took aim at flood-prone Haiti, but it was not expected to become a hurricane until it barreled into the Gulf of Mexico early next week.	29.858000000000001	-89.914000000000001	2012-08-24 20:45:00	2012-08-24 20:53:36.122488	2012-09-11 19:40:46.866149	http://www.reuters.com/article/2012/08/24/us-storm-isaac-idUSBRE87L0PH20120824		Yellow	16	2012-08-24 20:45:00	2012-09-03 20:45:00		8	f	t
347	Heavy Rain in Japan	Heavy rain triggered flash floods and mudslides in southern Japan on Thursday, causing at least 15 deaths and leaving 11 more people missing.\n\n	32.811731999999999	130.72134	2012-07-13 17:36:00	2012-07-13 17:43:05.280258	2012-07-31 17:53:54.788997	http://www.washingtonpost.com/world/asia_pacific/heavy-rain-causes-flooding-landslides-in-southern-japan-that-kill-9-leave-18-missing/2012/07/12/gJQAT1COfW_story.html		Yellow	16	2012-07-13 17:36:00	2012-07-28 17:36:00		10	f	t
401	Floods in Northern India	Three waves of devastating floods in India's northern state of Assam have left nearly 4.89 million displaced.  Flooding began in June this year and continued through September. 27 districts had been affected.	26.146083999999998	91.735511000000002	2012-10-15 18:55:00	2012-10-15 19:06:17.573016	2012-10-15 19:06:59.628169	http://europe.chinadaily.com.cn/world/2012-10/15/content_15818364.htm		Yellow	16	2012-10-15 18:55:00	2012-10-30 18:55:00		6	f	t
344	Floods in India	Almost one million people have been forced to leave their homes by floods in India as torrential rains lash the north-eastern state of Assam, officials say.	26.192643	91.022243000000003	2012-06-29 17:09:00	2012-06-29 17:13:09.71737	2012-07-31 17:54:54.241919	http://www.bbc.co.uk/news/world-asia-india-18639529		Orange	16	2012-06-29 17:09:00	2012-07-29 17:09:00		6	f	t
382	Attack on US Consulate, Benghazi	Gunmen attacked U.S. consulate offices in Libya's eastern city of Benghazi on Tuesday, and fought with security forces in protest against a U.S. film they say is blasphemous, a security official said.	32.061506999999999	20.080639999999999	2012-09-12 17:46:00	2012-09-12 18:01:27.8996	2012-09-24 21:04:25.092453	http://www.cnn.com/2012/09/11/world/meast/egpyt-us-embassy-protests/index.html		Yellow	16	2012-09-12 17:46:00	2012-09-22 17:46:00		15	f	t
217	Massachusetts Tornados - Wilbraham	Tornado	42.123600000000003	-72.430999999999997	2011-06-02 00:00:00	2011-06-03 16:44:00.23763	2011-06-03 16:44:00.23763	\N	\N	\N	\N	\N	\N	\N	1	f	t
351	London 2012 Summer Olympics	The 2012 Summer Olympic Games, officially the Games of the XXX Olympiad, also known informally as London 2012, is scheduled to take place in London, United Kingdom, from 27 July until 12 August 2012.	51.538688	-0.016437	2012-07-27 16:23:00	2012-07-27 16:28:25.630048	2012-07-31 17:45:56.832775	http://www.bbc.co.uk/news/uk-19008471		Yellow	16	2012-07-27 16:23:00	2012-08-26 16:23:00		18	f	t
350	Wildfire in Spain	Four people, three French nationals and one from Spain, have been killed in forest fires raging in the Spanish region of northern Catalonia. \n\n	42.338000000000001	2.887	2012-07-25 18:12:00	2012-07-25 18:13:41.932057	2012-07-31 17:49:59.188294	http://www.euronews.com/2012/07/23/four-killed-in-catalonia-fires-near-spain-france-border/		Yellow	16	2012-07-25 18:12:00	2012-08-04 18:12:00		5	f	t
348	Tropical Cyclone Vicente-12	Vicente, this year's eighth typhoon, made landfall near the city of Taishan in Guangdong province early Tuesday, bringing gales and rainstorms to Guangdong and Guangxi.\n\n	22.244854	112.78899199999999	2012-07-25 15:44:00	2012-07-25 15:51:33.721257	2012-07-31 17:53:32.344442	http://news.xinhuanet.com/english/china/2012-07/25/c_131738793.htm		Yellow	16	2012-07-25 15:44:00	2012-08-04 15:44:00		8	f	t
342	Demonstrations in Cairo, Egypt	One demonstrator was killed and 62 injured during massive demonstrations on Sunday in Cairo’s Tahrir Square in celebration of the announcement of Mohamed Morsy as Egypt’s new president, the Ministry of Health said Monday.	30.044471999999999	31.235710999999998	2012-06-25 17:59:00	2012-06-25 18:03:14.954194	2012-07-31 18:00:38.482704	http://www.egyptindependent.com/news/one-dead-62-injured-tahrir-sunday		Yellow	16	2012-06-25 17:59:00	2012-07-25 17:59:00		15	f	t
333	Poco Fire, Arizona	The Poco Fire burning in the Tonto National Forest six miles northeast of Young, Arizona, is now 15% contained and has burned a total of 1,500 acres.\n\n	34.177405999999998	-110.874109	2012-06-18 16:55:00	2012-06-18 17:24:45.472199	2012-07-31 18:01:30.234739	http://www.wmicentral.com/news/latest_news/poco-fire-contained-burning-acres-near-young-arizona/article_5bccadb0-b6ad-11e1-979e-0019bb2963f4.html		Yellow	16	2012-06-18 16:55:00	2012-06-29 16:55:00		5	f	t
332	U.S. Open Golf Championship	The United States Open Championship, known as the U.S. Open, is the annual open golf tournament of the United States. It is the second of four major championships in golf, and is on the official schedule of both the PGA Tour and the European Tour.	37.708660000000002	-122.494597	2012-06-15 22:24:00	2012-06-15 22:40:45.306644	2012-07-31 18:04:19.647005	http://www.sfgate.com/cgi-bin/article.cgi?f=/g/a/2012/06/15/bloomberg_articlesM5O1RU6VDKHZ01-M5OG3.DTL		Yellow	16	2012-06-15 22:24:00	2012-06-25 22:24:00		18	f	t
331	Floods in Taiwan	Torrential rain brought floods to counties in numerous parts of the country, forcing thousands of people to evacuate their homes.\n\n	25.050146999999999	121.49711600000001	2012-06-13 18:51:00	2012-06-13 18:54:52.790841	2012-07-31 18:04:42.166727	http://www.bbc.co.uk/news/world-asia-18425274		Yellow	16	2012-06-13 18:51:00	2012-06-24 18:51:00		6	f	t
330	Refugee Crisis in Afgooye, Somalia	The UN refugee agency said on Tuesday some 14,000 Somalis have been displaced from Afgooye, about 30km northwest of Mogadishu, as a result of military activity in the area which started a week ago.\n	2.141	45.119	2012-06-12 19:53:00	2012-06-12 19:56:30.834912	2012-07-31 18:05:32.808387	http://www.coastweek.com/3522_somalia_05.htm		Orange	16	2012-06-12 19:53:00	2012-07-12 19:53:00		15	f	t
329	Refugee Crisis in Rayhanli, Turkey	Nearly 400 Syrians poured into Turkey in the last 24 hours seeking refuge amid a recent surge in violence in the strife-torn country, a Turkish official said Saturday.	36.241278999999999	36.618353999999997	2012-06-12 19:45:00	2012-06-12 19:53:09.668838	2012-07-31 18:06:08.954216	http://www.nowlebanon.com/NewsArchiveDetails.aspx?ID=404321		Yellow	16	2012-06-12 19:45:00	2012-06-22 19:45:00		15	f	t
328	Reported Massacre in Qubair, Syria	Activists said pro-government militia men and security forces killed at least 78 people, including children, in Syria's central province of Hama on Wednesday.\n\n	35.204000000000001	36.555	2012-06-12 19:36:00	2012-06-12 19:45:18.652498	2012-07-31 18:06:55.855377	http://www.huffingtonpost.com/2012/06/06/hama-massacre-qubair-syria_n_1575600.html		Orange	16	2012-06-12 19:36:00	2012-07-22 19:36:00		15	f	t
327	High Park Fire, Colorado	At least 18 structures have been burned in the fast-moving High Park Fire, which has consumed about 14,000 acres, forced hundreds of people to evacuate their homes and spewed plumes of smoke so thick they hide the Rocky Mountains. 	40.629725999999998	-105.376986	2012-06-10 21:25:00	2012-06-10 21:31:15.816982	2012-07-31 18:41:38.779106	http://www.denverpost.com/breakingnews/ci_20826343/high-park-fire-may-be-14-000-acres-colorado		Yellow	16	2012-06-10 21:25:00	2012-06-21 21:25:00		5	f	t
326	EURO 2012	The 2012 UEFA European Football Championship, will be the 14th European Championship for national football teams organized by UEFA. The final tournament is being hosted by Poland and Ukraine between 8 June and 1 July 2012.	52.239443999999999	21.045556000000001	2012-06-08 15:10:00	2012-06-08 15:15:02.514362	2012-07-31 18:43:34.69162	http://edition.cnn.com/2012/06/07/sport/football/football-euro-2012-poland-ukraine/index.html		Yellow	16	2012-06-08 15:10:00	2012-07-08 15:10:00		18	f	t
320	Wildfire in New Mexico	Two lightning-sparked blazes that merged in a mountainous southwestern New Mexico forest are close to becoming the largest wildfire in state history, fire officials said Tuesday.\n\n	33.335118000000001	-108.612556	2012-05-30 15:13:00	2012-05-30 15:26:32.390263	2012-07-31 18:45:11.087728	http://www.cbsnews.com/8301-505245_162-57443477/wildfire-close-to-being-new-mexicos-largest-ever/		Orange	16	2012-05-30 15:13:00	2012-06-09 15:13:00		5	f	t
319	Joplin, MO - 1 yr Anniversary	An EF-5 multiple-vortex tornado struck the town of Joplin, Missouri the evening of May 22nd. One of the deadliest tornadoes in U.S. history, at least 141 people were killed with an estimated 2,000 buildings destroyed.	37.060949000000001	-94.530506000000003	2012-05-22 18:37:00	2012-05-22 18:42:51.161313	2012-07-31 18:45:40.999404			Yellow	16	2012-05-22 18:37:00	2012-05-23 18:37:00		13	f	t
318	Volcanic Eruption in Guatemala	On Saturday, Fuego Volcano began erupting lava and ash prompting alerts and flight restrictions in the nation's capital of Guatemala	14.475904999999999	-90.882683	2012-05-22 15:00:00	2012-05-22 15:14:51.879831	2012-07-31 18:45:58.586764	http://www.reuters.com/article/2012/05/19/guatemala-volcano-idUSL1E8GJ20420120519		Yellow	16	2012-05-22 15:00:00	2012-06-06 15:00:00		16	f	t
315	Terrorist Attack in Sanaa, Yemen	More than 90 people have been killed in a suicide bomb attack at a military parade rehearsal in Yemen's capital, Sanaa, defence ministry officials say.\n\n	15.321999999999999	44.204000000000001	2012-05-21 16:13:00	2012-05-21 16:14:58.570495	2012-07-31 18:48:57.495898	http://www.bbc.co.uk/news/world-middle-east-18142695		Orange	16	2012-05-21 16:13:00	2012-05-31 16:13:00		15	f	t
288	Concordia Cruise Wreck	Italian rescuers have found five more bodies inside the stricken cruise ship Concordia, raising the confirmed death toll to 11.\n\n	42.365670999999999	10.921246999999999	2012-01-17 18:02:00	2012-01-17 18:08:33.065815	2012-07-31 19:06:20.719252	http://www.bbc.co.uk/news/world-europe-16598232		Yellow	16	2012-01-17 18:02:00	2012-01-27 18:02:00		11	f	t
313	Wildfires in Arizona and Colorado	Wildfires in Arizona and Colorado spread on Tuesday as firefighters faced problems with rugged terrain and, in some areas, wind.\n	34.230400000000003	-110.78355000000001	2012-05-17 15:55:00	2012-05-17 16:27:26.614505	2012-07-31 18:49:15.791104	http://www.latimes.com/news/nation/nationnow/la-na-nn-west-wildfires-20120515,0,6846924.story		Yellow	16	2012-05-17 15:55:00	2012-05-27 15:55:00		5	f	t
312	Flood in Gansu Province, China	At least 49 people were killed and 23 others were missing as of Saturday after hail and torrential rain hit Northwest China's Gansu province on Thursday.	34.462516000000001	104.069688	2012-05-14 14:19:00	2012-05-14 14:53:02.311826	2012-07-31 18:49:47.702128	http://www.chinadaily.com.cn/china/2012-05/14/content_15280579.htm		Yellow	16	2012-05-14 14:19:00	2012-05-29 14:19:00		6	f	t
311	Formula One - Spanish GP	McLaren's Jenson Button beat Red Bull's Sebastian Vettel to set the fastest time in Friday practice at the Spanish Grand Prix. \n\n	41.569481000000003	2.2577759999999998	2012-05-11 14:28:00	2012-05-11 14:37:39.293174	2012-07-31 18:50:08.515244	http://www.bbc.co.uk/sport/0/formula1/18034090		Yellow	16	2012-05-11 14:28:00	2012-05-20 14:28:00		18	f	t
310	Terrorist Attack in Damascus, Syria	A terrorist attack with twin suicide car-bomb attacks have killed at least 55 people and wounded 372 in Damascus, Syrian officials say. \n\n	33.491401000000003	36.321005	2012-05-10 20:03:00	2012-05-10 20:17:34.265259	2012-07-31 18:50:32.958978	http://www.bbc.co.uk/news/world-middle-east-18015935		Yellow	16	2012-05-10 20:03:00	2012-05-20 20:03:00		15	f	t
309	Floods in Paraguay	Heavy rain, which began in March, has caused the Pilcomayo river in Paraguay to overflow; resulting in flooding throughout the country. An estimated 13,000 families have been isolated due to the floods.	-21.698664000000001	-57.884129999999999	2012-05-01 17:05:00	2012-05-01 17:10:55.481318	2012-07-31 18:51:06.508442	http://blogs.scientificamerican.com/guest-blog/2012/04/10/a-river-rams-through-it-argentinas-rio-nuevo-portends-problems-to-come-in-south-america/	FL-2012-000056-PRY 	Yellow	16	2012-05-01 17:05:00	2012-05-16 17:05:00		6	f	t
308	Tornado in Kansas	A tornado hit Wichita on Saturday night as a series of storms tore through central Kansas.\n	37.608316000000002	-97.296723999999998	2012-04-16 19:28:00	2012-04-16 19:32:39.662698	2012-07-31 18:51:25.905859	http://www.latimes.com/news/nation/nationnow/la-na-nn-tornado-wichita-20120414,0,2750332.story		Yellow	16	2012-04-16 19:28:00	2012-04-26 19:28:00		13	f	t
307	Earthquake in Indonesia	A massive earthquake struck off the coast of the Indonesian island of Sumatra Wednesday afternoon, triggering a tsunami watch for the Indian Ocean, which was later canceled.\n\n	5.5499999999999998	95.316666999999995	2012-04-11 14:33:00	2012-04-11 14:41:20.911718	2012-07-31 18:53:20.292051	http://www.cnn.com/2012/04/11/world/asia/indonesia-earthquake/index.html?hpt=hp_t1		Yellow	16	2012-04-11 14:33:00	2012-05-21 14:33:00		4	f	t
306	North Korean Launch	North Korea plans to launch a satellite using a carrier rocket in April, the country's official news agency said Friday, a move that would violate U.N. Security Council demands.\n\n	39.660074000000002	124.70522	2012-04-04 21:24:00	2012-04-04 21:30:17.617674	2012-07-31 18:53:55.682227	http://news.blogs.cnn.com/2012/03/16/north-korea-says-it-plans-satellite-launch-in-april/?iref=allsearch		Orange	16	2012-04-04 21:24:00	2012-04-15 21:24:00		18	f	t
305	Tornado in Texas	Rescuers plan to search the Dallas area again Wednesday for anyone trapped after violent tornadoes flattened homes, sucked up tractor-trailers and sent debris swirling in the air.	32.623626000000002	-96.775452999999999	2012-04-04 15:15:00	2012-04-04 15:20:32.417264	2012-07-31 18:54:13.844535	http://www.cnn.com/2012/04/04/us/texas-weather/index.html?hpt=hp_t1		Yellow	16	2012-04-04 15:15:00	2012-04-14 15:15:00		13	f	t
304	Flood in Fiji	Severe flooding in the Pacific island nation of Fiji has killed four people and left 800 people seeking shelter in evacuation centers, a government official said Monday.\n\n	-17.756043999999999	177.44361900000001	2012-04-02 15:18:00	2012-04-02 15:21:52.817567	2012-07-31 18:54:33.220094	http://www.cnn.com/2012/04/02/world/asia/fiji-floods/index.html?iref=allsearch	TC-2012-000044-FJI	Yellow	16	2012-04-02 15:18:00	2012-04-17 15:18:00		6	f	t
303	Lower North Fork Fire, Colorado	Authorities have sent out a pre-evacuation notice to 6,500 homes after a spot fire flared up one mile northwest of Waterton Canyon.\n	39.445300000000003	-105.21559999999999	2012-03-27 20:22:00	2012-03-27 20:29:40.178268	2012-07-31 18:54:53.182534	http://www.denverpost.com/breakingnews/ci_20264330/colorado-wildfire-no-containment-lower-north-fork-fire		Yellow	16	2012-03-27 20:22:00	2012-04-06 20:22:00		5	f	t
302	Coup in Mali	Renegade soldiers in Mali declared Thursday that they have seized power in the West African nation and dissolved public institutions because of the government's handling of an insurgency. \n\n	12.660605	-8.0067160000000008	2012-03-24 21:49:00	2012-03-24 21:55:06.233298	2012-07-31 18:55:39.059543	http://www.cnn.com/2012/03/22/world/africa/mali-coup/index.html		Orange	16	2012-03-24 21:49:00	2012-04-03 21:49:00		15	f	t
301	Earthquake in Mexico	A strong earthquake rattled residents in Mexican resort towns and the nation's capital Tuesday, but there were no immediate reports of serious damage or injuries.\n\n	16.662054000000001	-98.188119	2012-03-20 19:58:00	2012-03-20 21:06:26.957415	2012-07-31 18:56:45.0074	http://www.cnn.com/2012/03/20/world/americas/mexico-earthquake/index.html?hpt=hp_t1		Yellow	16	2012-03-20 19:58:00	2012-03-30 19:58:00		4	f	t
300	Explosions in Damascus, Syria	Deadly explosions rocked parts of Damascus on Saturday with some of the targets being Syrian government facilities, witnesses and state television reported.\n\n	33.512596000000002	36.289945000000003	2012-03-19 19:58:00	2012-03-19 20:00:09.365154	2012-07-31 18:57:17.881976	http://articles.cnn.com/2012-03-17/middleeast/world_meast_syria-unrest_1_state-tv-reports-raqqa-hama?_s=PM:MIDDLEEAST		Yellow	16	2012-03-19 19:58:00	2012-04-03 19:58:00		15	f	t
299	Heavy Floods in Ecuador 	A state of emergency was declared Thursday for five Ecuadorian provinces where floods triggered by winter rains have left 20 people dead and 2,823 displaced.\n\n	-1.8852739999999999	-79.620924000000002	2012-03-09 20:35:00	2012-03-09 20:43:14.269805	2012-07-31 18:57:42.942871	http://news.xinhuanet.com/english/world/2012-03/09/c_131456844.htm		Yellow	16	2012-03-09 20:35:00	2012-03-19 20:35:00		6	f	t
297	US Midsection Tornadoes	A swarm of tornadoes tore through the U.S. midsection on Friday, splintering homes, damaging a prison, overturning trucks and killing at least four people in the hard-hit state of Indiana, officials said.\n\n	37.724257999999999	-88.537064000000001	2012-03-02 23:36:00	2012-03-03 00:02:11.222387	2012-07-31 18:58:31.010052	http://www.reuters.com/article/2012/03/02/us-usa-tornadoes-idUSTRE81S2AD20120302		Orange	16	2012-03-02 23:36:00	2012-04-02 23:36:00		13	f	t
383	Senkaku/Diaoyu Islands Dispute	Two Chinese-government vessels reached waters near the disputed Senkaku islands as Beijing continued directing angry rhetoric at Tokyo, a day after Japan announced plans to purchase three of the islands from private owners.	25.686292999999999	123.49603500000001	2012-09-12 18:19:00	2012-09-12 18:23:11.060027	2012-09-27 21:53:55.918755	http://online.wsj.com/article/SB10000872396390444100404577644563527295118.html		Yellow	16	2012-09-12 18:19:00	2012-10-27 18:19:00		19	f	t
381	Yakima Complex Fire, WA	Lightning strikes have sparked more than 100 wildfires in eastern Washington since Sunday.  The Yakima Complex Fire, which includes portions of Yakima and Kittitas Counties, consists of many small fires burning on local, state and federal land. 	47.427961000000003	-120.406278	2012-09-12 17:39:00	2012-09-12 17:43:55.888379	2012-09-28 18:38:55.57119	http://www.masoncountydailynews.com/news/news-page/38931-wa-wildfire-update-noon-911		Yellow	16	2012-09-12 17:39:00	2012-09-22 17:39:00		5	f	t
181	Midwest Floods - Tell City	Flood	37.926000000000002	-86.748999999999995	2011-05-04 12:00:00	2011-05-24 12:00:00	2011-06-02 15:12:44.608945	\N	\N	\N	\N	\N	\N	\N	1	f	t
295	Flood in El Tarf, Algeria	 The death toll from floods in El Tarf, last Wednesday, rose to three killed. On Friday, the body of a 26-year-old man was swept away, the Civil Defense said.\n\n	36.767147999999999	8.3153629999999996	2012-02-28 18:38:00	2012-02-28 18:50:04.074169	2012-07-31 18:59:08.803189	http://www.aps.dz/Floods-in-El-Tarf-Three-killed.html		Yellow	16	2012-02-28 18:38:00	2012-03-09 18:38:00		6	f	t
292	Flood in Mozambique	Mozambique struggled with the destruction of a portion of its main national highway, cut-off communications and a reported death toll of 18, according to the nation's National Institute for Natural Disasters.	-25.966667000000001	32.583333000000003	2012-02-06 19:52:00	2012-02-06 19:59:18.274062	2012-07-31 19:00:07.278998	http://www.cnn.com/2012/01/24/world/africa/mozambique-severe-flooding/index.html	FL-2011-000013-MOZ	Yellow	16	2012-02-06 19:52:00	2012-03-01 19:52:00		6	f	t
291	Philippines Earthquake 	At least 15 people have died after a 6.7 magnitude quake struck the central Philippines, according to government officials. \n\n	10.0312	123.17459100000001	2012-02-06 18:46:00	2012-02-06 18:50:06.39752	2012-07-31 19:00:30.262729	http://www.bbc.co.uk/news/world-asia-16901385	EQ-2012-000018-PHL	Yellow	16	2012-02-06 18:46:00	2012-02-21 18:46:00		4	f	t
290	One-Year Anniversary of Tahrir Square Protests in Cairo, Egypt  	Thousands of Egyptians are holding a rally in Cairo's Tahrir Square marking the first anniversary of the uprising which toppled President Hosni Mubarak.\n\n	30.044422000000001	31.235696000000001	2012-01-25 18:58:00	2012-01-25 19:01:01.991891	2012-07-31 19:01:02.214166	http://www.bbc.co.uk/news/world-middle-east-16711302		Yellow	16	2012-01-25 18:58:00	2012-02-04 18:58:00		7	f	t
289	Boko Haram Bombing in Kano, Nigeria	Co-ordinated attacks by Islamist militants in the northern Nigerian city of Kano on Friday killed at least 160 people.\n	11.997999999999999	8.5224189999999993	2012-01-23 16:20:00	2012-01-23 17:32:31.420657	2012-07-31 19:04:20.545978	http://www.bbc.co.uk/news/world-africa-16672310#story_continues_1		Orange	16	2012-01-23 16:20:00	2012-01-24 16:20:00		15	f	t
284	Syria Protests	The Syrian authorities have responded to widespread anti-government protests with overwhelming military force. The protests pose the greatest challenge to four decades of Assad family rule in the country.\n\n	34.724102000000002	36.710836999999998	2011-12-06 17:47:00	2011-12-06 17:57:25.611551	2012-07-31 19:07:54.09268	http://www.bbc.co.uk/news/world-middle-east-16044458		Yellow	16	2011-12-06 17:47:00	2012-01-05 17:47:00		9	f	t
282	Protests in Cairo, Egypt	Clashes have again erupted in the Egyptian capital as security forces continue their efforts to clear Cairo's Tahrir Square of protesters. At least 20 people are reported to have died since the violence began on Saturday with hundreds more injured.	30.058056000000001	31.228888999999999	2011-11-21 17:33:00	2011-11-21 17:35:46.169433	2012-07-31 19:08:21.123776	http://www.bbc.co.uk/news/world-middle-east-15814035		Yellow	16	2011-11-21 17:33:00	2011-12-01 17:33:00		9	f	t
281	Fire in Reno, Nevada	Thousands of northern Nevadans fled their homes as a massive and sudden wildfire raged out of control on Friday, consuming Sierra Nevada foothills and spreading down to the valley floor. \n\n	39.478009	-119.86948700000001	2011-11-18 21:47:00	2011-11-18 21:54:09.352978	2012-07-31 19:08:43.007984	http://www.msnbc.msn.com/id/45354176/ns/weather/	WF-2011-000175-USA	Orange	16	2011-11-18 21:47:00	2011-11-29 21:47:00		5	f	t
280	Dubai Airshow 2011	Aircraft orders over $47 billion have been booked at the Dubai Airport Expo, the largest event of its kind in the Middle East. More than 1,000 companies from 50 countries have converged on Dubai's International Airport this week for the exhibition. 	25.251999999999999	55.366500000000002	2011-11-16 17:28:00	2011-11-16 17:44:31.433819	2012-07-31 19:09:20.684451	http://www.bbc.co.uk/news/business-15164597		Yellow	16	2011-11-16 17:28:00	2011-12-18 17:28:00		2	f	t
286	Flooding in Brazil	Heavy rains have caused flooding and landslides in the states of Minas Gerais and Rio de Janeiro.	-21.757037	-41.237327999999998	2012-01-09 20:52:00	2012-01-09 21:22:04.757904	2012-09-17 16:15:53.1639	http://www.bbc.co.uk/news/world-latin-america-16420098	FL-2012-000003-BRA	Yellow	16	2012-01-09 20:52:00	2012-02-01 20:52:00		6	f	t
317	Earthquake in Italy	Thousands of people left homeless by a powerful earthquake in northern Italy have spent the night in shelters as aftershocks continue to hit the region. \n\n	45.011099999999999	11.275	2012-05-21 18:56:00	2012-05-21 19:05:27.700346	2012-09-12 22:11:26.737929	http://www.bbc.co.uk/news/world-europe-18140543	EQ-2012-000080-ITA	Yellow	16	2012-05-21 18:56:00	2012-05-31 18:56:00		4	f	t
279	The Hajj	An estimated 2.5 million people will make the annual Islamic pilgrimage to Mecca, Saudi Arabia. It is a religious duty for every Muslim who is able to make the pilgrimage once in their life.	21.422999999999998	39.826000000000001	2011-11-02 22:20:00	2011-11-02 22:31:45.455637	2012-09-11 18:15:46.856333	http://www.google.com/hostednews/afp/article/ALeqM5gsre6tLJAkMFwePRNSAlszY2aqIQ?docId=CNG.b8acfbc8dffcbd340e12dc8e0f2b4923.691		Yellow	16	2011-11-10 23:32:00	2011-12-10 23:32:00		18	f	t
316	Champions League Final - Munich, Germany	Chelsea stunned Bayern Munich in a dramatic penalty shoot-out at the Allianz Arena to win the Champions League for the first time. 	48.218918000000002	11.624522000000001	2012-05-21 16:19:00	2012-05-21 16:24:21.940325	2012-12-03 19:06:56.239119	http://www.bbc.co.uk/sport/0/football/18044385		Yellow	16	2012-05-21 16:19:00	2012-05-31 16:19:00		18	f	t
371	Tropical Cyclone Bolaven	Typhoon Bolaven killed at least eight people as it lashed the Korean peninsula with strong winds and heavy rain, capsizing fishing boats and grounding aircraft.	37.562655999999997	126.975356	2012-08-28 19:54:00	2012-08-28 19:57:50.815988	2012-08-28 19:57:50.815988	http://blogs.wsj.com/korearealtime/2012/08/28/typhoon-bolaven-hits-korean-peninsula/		Yellow	25	2012-08-28 19:54:00	2012-09-27 19:54:00		8	f	t
278	Peru Earthquake	On October 28th a 6.9 magnitude earthquake struck Ica Province in Peru. The provincial capital was most affected with more than 100 buildings destroyed. 	-14.0642	-75.744399999999999	2011-10-31 20:41:00	2011-10-31 20:47:35.125324	2012-07-31 22:14:31.763922	http://global.christianpost.com/news/peru-earthquake-2011-earthquake-destroys-134-homes-damages-18th-century-cathedral-59825/		Yellow	16	2012-07-31 22:14:00	2012-08-30 22:14:00		4	f	t
277	Kenyan Incursion into Somlia	Kenyan troops have moved into Somalia in an attempt to contain violence along its border. Recent kidnappings of aid workers and tourists have been linked to al-Shabaab, reportedly operating from the town of Afmadow.	0.51300000000000001	42.074019999999997	2011-10-28 18:02:00	2011-10-28 18:08:49.161614	2012-07-31 22:15:13.706883	http://www.bbc.co.uk/news/world-africa-15349597		Yellow	16	2012-07-31 22:14:00	2012-08-30 22:14:00		19	f	t
415	Tropical Cyclone Evan	Tropical Cyclone Evan passed over Samoa, Wallis, and Futuna between December 13th and 16th 2012. Most of the damage caused was to infrastructure, roads, and crops.  Relief efforts are underway.	-13.292	-176.203	2012-12-17 16:51:00	2012-12-17 16:57:43.628576	2012-12-17 17:08:17.873828	http://www.disasterscharter.org/web/charter/home		Yellow	16	2012-12-17 16:51:00	2013-01-06 16:51:00		8	f	t
276	Hudson Volcano	The Chilean government has issued a red alert for residents living within 40km of Cerro Hudson. It last erupted in 1991 causing millions of dollars in damage.	-45.899799999999999	-72.970100000000002	2011-10-28 17:21:00	2011-10-28 18:02:41.028395	2012-07-31 22:15:44.773007	http://www.foxnews.com/world/2011/10/28/ash-cloud-rises-above-restive-chilean-volcano/		Yellow	16	2012-07-31 22:15:00	2012-08-30 22:15:00		16	f	t
275	Turkey Earthquake	 At least 230 are dead and 1300 are injured after earthquake after a 7.2- magnitude earthquake devastated parts of eastern Turkey.	38.510832999999998	43.375158999999996	2011-10-24 16:16:00	2011-10-24 16:21:29.760217	2012-07-31 22:16:14.262777	http://www.cnn.com/2011/10/24/world/europe/turkey-quake/		Orange	16	2012-07-31 22:16:00	2012-08-30 22:16:00		4	f	t
269	Flood in Bangkok	Thailand's capital was braced for unprecedented flooding Wednesday, amid the monsoon rains that have overwhelmed much of the country 	13.752222	100.493889	2011-10-12 17:59:00	2011-10-12 18:00:40.970469	2012-07-31 22:17:14.192861	http://www.cnn.com/2011/10/12/world/asia/thailand-floods/index.html?iref=storysearch		Orange	16	2012-07-31 22:17:00	2012-08-30 22:17:00		6	f	t
268	Rena Oil Spill, New Zealand	Officials say 350 tonnes of oil may have leaked from the 775ft (236m) Rena, which ran aground on the Astrolabe Reef off the port of Tauranga on Wednesday.\n\n	-37.540619	176.42920000000001	2011-10-11 21:43:00	2011-10-11 22:08:05.703445	2012-07-31 22:17:44.192425	http://www.bbc.co.uk/news/world-asia-pacific-15251319		Yellow	16	2012-01-12 20:55:00	2012-02-11 20:55:00		20	f	t
267	Flood in el-Bayadh, Algeria	Torrential rains have caused flooding in el-Bayadh, Algeria. At least a dozen people have been killed and hundreds of homes have been destroyed.	33.683	1.0202	2011-10-06 16:09:00	2011-10-06 16:12:16.322868	2012-07-31 22:18:08.08102	http://www.washingtonpost.com/world/africa/algeria-floods-kill-10-2-missing-hundreds-of-homes-affected/2011/10/02/gIQAaBPzFL_story.html		Yellow	16	2012-07-31 22:17:00	2012-08-30 22:17:00		6	f	t
266	Chemical Plant Fire - Texas	A fire at a Magnablend chemical plant on Monday Oct. 3rd, forced the evacuation of nearby schools and residences. The plant was destroyed, but there were no casualties. 	32.4221	-96.855199999999996	2011-10-06 15:36:00	2011-10-06 15:45:50.531357	2012-07-31 22:18:26.863522	http://www.star-telegram.com/2011/10/04/3419995/electrical-spark-may-have-touched.html		Yellow	16	2012-07-31 22:18:00	2012-08-30 22:18:00		20	f	t
370	Flooding in Niger	At least 44 people have been killed and thousands more made homeless after heavy floods caused the Niger River to overflow earlier this week, flooding parts of the capital Niamey and other areas	13.516176	2.1048740000000001	2012-08-28 19:19:00	2012-08-28 19:20:36.299249	2012-08-28 19:20:36.299249	http://www.iol.co.za/news/africa/niger-floods-claim-44-lives-1.1369484		Yellow	16	2012-08-28 19:19:00	2012-09-07 19:19:00		6	f	t
265	Suicide Car Bomb in Mogadishu	A huge suicide attack near government buildings in the Somali capital, Mogadishu, kills at least 70 people and injures many more, local officials say.\n	2.0316160000000001	45.310685999999997	2011-10-04 18:20:00	2011-10-04 18:28:50.600921	2012-07-31 22:19:11.324409	http://www.bbc.co.uk/news/world-africa-15166107		Yellow	16	2012-07-31 22:18:00	2012-08-30 22:18:00		15	f	t
264	Ethnic Clash in North Kosovo	Several people have been injured in a clash between ethnic Serbs and Nato peacekeepers in the north of Kosovo.	42.880972	20.867189	2011-10-04 18:16:00	2011-10-04 18:19:44.082968	2012-07-31 22:19:39.549335	http://www.bbc.co.uk/news/world-europe-15082675		Yellow	16	2012-07-31 22:19:00	2012-08-30 22:19:00		15	f	t
263	Typhoon Nesat	Powerful typhoon Nesat made landfall in the Philippines, causing severe floods in Manila. The death toll rose to 18 with 35 still missing after heavy rain and powerful winds triggered storm surges.	14.583333	120.966667	2011-09-28 17:53:00	2011-09-28 18:00:13.100227	2012-07-31 22:20:43.916553	http://www.bbc.co.uk/news/world-asia-pacific-15086050		Yellow	16	2012-07-31 22:20:00	2012-08-30 22:20:00		8	f	t
262	Pakistan Flooding	For the second year in a row, Sindh province has been devastated by monsoonal flooding. An estimated 8 million people are affected.	25.893000000000001	68.524000000000001	2011-09-22 18:14:00	2011-09-22 18:18:49.577259	2012-07-31 22:23:54.752392	http://www.bbc.co.uk/news/world-south-asia-15015765		Yellow	16	2012-07-31 22:23:00	2012-08-30 22:23:00		6	f	t
270	Flood in Cambodia	Flooding in Cambodia has killed over 200 people since early September. Thousands of people have evacuated as the increasing flood situation has caused massive damage.\n	11.512	104.919	2011-10-12 22:08:00	2011-10-12 22:11:24.24741	2012-09-11 18:34:37.250548	http://www.bbc.co.uk/news/world-asia-pacific-15246653		Yellow	16	2012-07-31 22:16:00	2012-08-30 22:16:00		6	f	t
261	Yemen Protests	Dozens of protesters have been killed in the last few days. Reports out of Sana'a suggest that governments forces are shooting and shelling protest camps. Violence has erupted around the country.	15.364800000000001	44.189300000000003	2011-09-20 17:08:00	2011-09-20 17:16:15.232066	2012-07-31 22:24:32.725794	http://www.latimes.com/news/nationworld/world/la-fg-yemen-protests-20110920,0,4139282.story		Yellow	16	2012-07-31 22:24:00	2012-08-30 22:24:00		15	f	t
260	Indian State of Sikkim Earthquake	At least 11 people -- six in India and five in Nepal -- died when a magnitude-6.9 earthquake struck the northern Indian state of Sikkim near the border between the two nations Sunday night	26.957404	88.559205000000006	2011-09-19 22:58:00	2011-09-18 23:05:37.832772	2012-07-31 22:24:53.706189	http://www.cnn.com/2011/WORLD/asiapcf/09/18/india.earthquake/		Yellow	16	2012-07-31 22:24:00	2012-08-30 22:24:00		4	f	t
259	Nairobi Pipeline Explosion	At least 75 people have been killed and more than a 100 injured in the slums surrounding the Lunga Lunga industrial area following a gas pipeline explosion.	-1.304	36.872	2011-09-12 16:50:00	2011-09-12 16:57:34.371862	2012-07-31 22:25:15.193988	http://www.bbc.co.uk/news/world-africa-14879401		Yellow	16	2012-07-31 22:25:00	2012-08-30 22:25:00		20	f	t
258	Transition in Libya	The National Transitional Council has been negotiating with Gaddafi loyalists for their peaceful surrender. 	32.875999999999998	13.186999999999999	2011-09-08 20:44:00	2011-09-08 22:11:29.574833	2012-07-31 22:25:43.772757	http://www.bbc.co.uk/news/world-africa-14841901		Yellow	16	2012-07-31 22:25:00	2012-08-30 22:25:00		15	f	t
256	Texas Fires	More than 1,000 homes have been destroyed by recent fires in Texas and thousands have been evacuated. An estimated 85 fires are now burning.	30.27	-97.759	2011-09-06 16:59:00	2011-09-06 17:03:12.735069	2012-07-31 22:26:08.995674	http://latimesblogs.latimes.com/nationnow/2011/09/texas-wildfires-more-than-1000-homes-lost.html		Yellow	16	2012-07-31 22:25:00	2012-08-30 22:25:00		5	f	t
257	Typhoon Talas	At least 50 people are missing and 37 people have been killed by the storm, which made landfall on Shikoku Island, triggering floods and landslides throughout Japan. Talas is currently the most destructive Typhoon since 2004.	34.032176	135.74432400000001	2011-09-03 01:00:00	2011-09-06 18:49:25.468644	2012-07-31 22:26:26.084589	http://www.bbc.co.uk/news/world-asia-pacific-14783904		Yellow	16	2012-07-31 22:26:00	2012-08-30 22:26:00		8	f	t
439	Seleka Rebels Seize Capital Bangui, Central African Republic  	Rebel forces arrived on the outskirts of Bangui on Saturday.  13 South African soldiers were killed defending the capital. Following the takeover, the African Union has suspended CAR and imposed sanctions on Seleka's leaders.	4.3940000000000001	18.544	2013-03-25 15:49:00	2013-03-25 16:06:29.141174	2013-03-25 16:11:16.532999	http://www.bbc.co.uk/news/world-africa-21923624		Yellow	16	2013-03-25 15:49:00	2013-04-05 15:49:00		19	f	t
416	Tropical Cyclone Evan over Fiji	Tropical Cyclone Evan hit Fiji on December 17th 2012 as a Category 4 cyclone.  Evan is the largest cyclone to hit Fiji in 20 yrs.  Currently no casualties have been reported.  	-17.619	177.45089999999999	2012-12-18 16:28:00	2012-12-18 16:39:35.553955	2012-12-18 16:39:35.553955	http://www.bbc.co.uk/news/world-asia-20765061		Yellow	13	2012-12-18 16:28:00	2013-01-07 16:28:00		8	f	t
405	Hurricane Sandy storm damage, Haiti	Hurricane Sandy tore through the Caribbean between 26-28 October, leaving a reported 51 dead in Haiti and another 15 missing. The country's housing and terrain are particularly vulnerable to flooding.	18.538077999999999	-72.301320000000004	2012-10-31 18:58:00	2012-10-31 19:00:23.18695	2012-12-18 17:42:53.484285	http://www.disasterscharter.org/web/charter/activation_details?p_r_p_1415474252_assetId=ACT-418	TC-2012-000180-HTI	Orange	16	2012-10-29 18:58:00	2012-11-08 18:58:00		8	f	t
255	Flooding in Nigeria	Over a hundred people have been killed and at least 1,500 people are displaced by torrential rain in the Oyo state capital of Ibadan. Water overflowing a dam washed away settlements.	7.3945999999999996	3.9182999999999999	2011-09-01 16:22:00	2011-09-01 16:28:44.393237	2012-07-31 22:26:44.640631	http://www.bbc.co.uk/news/world-africa-14735726		Yellow	16	2012-07-31 22:26:00	2012-08-30 22:26:00		6	f	t
254	Burning Man	The 25th annual Burning Man Festival kicked off on Monday in the Black Rock desert 100 miles north of Reno. This year's theme is "Rites of Passage."	40.773400000000002	-119.2191	2011-08-30 14:59:00	2011-08-30 15:03:50.648491	2012-07-31 22:27:08.846456	http://www.cbsnews.com/8301-31749_162-20099174-10391698.html		Yellow	16	2012-07-31 22:26:00	2012-08-30 22:26:00		18	f	t
253	Uganda Landslide	Dozens have been killed and dozens are still missing in Bulambuli after a landslide following torrential rains.	1.4333	34.311	2011-08-30 14:39:00	2011-08-30 14:48:47.092792	2012-07-31 22:27:25.404203	http://www.bbc.co.uk/news/world-14707826		Yellow	16	2012-07-31 22:27:00	2012-08-30 22:27:00		17	f	t
250	Fall of Tripoli	Rebels have entered Tripoli and are fighting Gaddafi loyalists for control of the Libyan capital.	32.878999999999998	13.185499999999999	2011-08-22 17:17:00	2011-08-22 17:19:51.506731	2012-07-31 22:28:38.478217	http://www.bbc.co.uk/news/world-africa-14611549		Orange	16	2012-07-31 22:28:00	2012-08-30 22:28:00		15	f	t
249	MAKS-2011 Air Show	Over 200 military and civilian aircraft will be on display at the MAKS Air Show, including the Airbus A380, Boeing's 787 Dreamliner, and of particular note, the public unveiling of Sukhoi's T-50, Russia's next-generation stealth fighter.	55.566800000000001	38.140099999999997	2011-08-18 20:57:00	2011-08-18 21:00:09.402531	2012-07-31 22:28:59.617774	http://english.ruvr.ru/2011/08/16/54699802.html		Yellow	16	2012-07-31 22:28:00	2012-08-30 22:28:00		18	f	t
246	Horn of Africa Famine	The worst drought in over 60 years has created a famine in the Horn of Africa. Millions of people have been impacted and hundreds of thousands have been displaced. 	2.3380000000000001	42.990499999999997	2011-08-16 21:18:00	2011-08-16 21:25:49.308846	2012-07-31 22:29:30.038326	http://www.voanews.com/english/news/africa/decapua-somalia-dadaab-update-10aug11-127453423.html		Yellow	16	2012-07-31 22:29:00	2012-08-30 22:29:00		17	f	t
244	Syrian Protests	Syrian security forces continue operations to crush protesters throughout the country. An estimated 1,400 people have been killed since March.	33.518000000000001	36.313000000000002	2011-08-09 18:07:00	2011-08-09 18:12:42.178972	2012-07-31 22:29:46.944546	http://www.bbc.co.uk/news/world-middle-east-14179188		Orange	16	2012-07-31 22:29:00	2012-08-30 22:29:00		15	f	t
372	Burning Man 2012	San Francisco cleared out considerably over the weekend as tens of thousands of artists, dreamers, hippies, techies, corporate professionals, newcomers and veteran Burners made a mass exodus to Nevada for the annual festival.	40.782919999999997	-119.209052	2012-08-28 21:14:00	2012-08-28 21:18:41.970523	2012-08-28 21:18:41.970523	http://www.huffingtonpost.com/2012/08/27/burning-man-2012_n_1834494.html		Yellow	10	2012-08-28 21:14:00	2012-09-07 21:14:00		18	f	t
385	Vulcan del Fuego Eruption	Authorities ordered the evacuation of more than 33,000 people in 17 communities following the eruption of Vulcan del Fuego.  Thick clouds of ash reduced visibility to less than 10 feet in the area of sugar cane fields surrounding the volcano.  	14.482778	-90.882778000000002	2012-09-14 15:41:00	2012-09-14 16:11:19.23228	2012-09-14 16:11:19.23228	http://www.france24.com/en/20120914-guatemalan-volcano-prompts-tens-thousands-evacuate-volcan-fuego-antigua		Orange	16	2012-09-14 15:41:00	2012-09-29 15:41:00		16	f	t
354	Wacken Open Air 2012	At least 75,000 heavy metal fans from 35 different countries descended on the tiny northern German town of Wacken, for the world famous Wacken Open Air Festival which will see more than 130 bands on seven stages.	54.031140999999998	9.359064	2012-08-03 16:21:00	2012-08-03 16:25:54.876353	2012-08-03 16:25:54.876353	http://www.thelocal.de/society/20120803-44135.html		Yellow	16	2012-08-03 16:21:00	2012-08-13 16:21:00		18	f	t
343	Floods in Canada	More than 340 people have been ordered out of their homes in the community of Sicamous in the British Columbia Interior after heavy rains sent water and mud flowing through the streets.	50.884	-118.919	2012-06-25 19:36:00	2012-06-25 19:38:54.235368	2012-09-17 15:36:16.089017	http://www.ctv.ca/CTVNews/Canada/20120624/BC-flooding-evacuation-120624/		Yellow	16	2012-06-25 19:36:00	2012-07-10 19:36:00		6	f	t
296	Flood and Ocean Storm in Madagascar	Torrential rain has flooded large parts of Madagascar following the passing of Tropical Cyclone Irina on 01 March 2012.\n	-21.743907	43.363999999999997	2012-03-02 18:50:00	2012-03-02 19:22:57.486217	2012-09-17 15:52:43.225118	http://www.trust.org/alertnet/news/tropical-storm-irina-struck-madagascar-at-about-0000-gmt-on-2-march		Yellow	16	2012-03-02 18:50:00	2012-03-12 18:50:00		6	f	t
294	Flood in Peru	On Friday, intensive rain caused collapses in bridges over the Ilave River, in Peru, and the resulting flooding caused damage to houses, along with several deaths and crop loss. The waters left many isolated.\n\n	-16.084343000000001	-69.647051000000005	2012-02-21 22:21:00	2012-02-21 22:34:56.908392	2012-09-17 15:57:05.049146	http://www.peruviantimes.com/25/floods-damage-crops-roads-and-housing-in-andean-highlands/11040/		Yellow	16	2012-02-21 22:21:00	2012-03-07 22:21:00		6	f	t
407	Earthquake in Guatemala	Thirty-nine people have been killed and many more are missing after a 7.4-magnitude quake hit off the Guatemala's Pacific coast, the nation's president has said.	14.301	-91.906999999999996	2012-11-07 23:45:00	2012-11-07 23:48:09.778762	2012-11-13 19:33:39.999118	http://www.bbc.co.uk/news/world-latin-america-20243894	EQ-2012-000188-GTM	Yellow	16	2012-11-07 23:45:00	2012-11-17 23:45:00		4	f	t
417	Tasmania Fire	Bushfires have burned about 29,000 hectares in southeast Tasmania. High heat and strong winds persist and scores are coming to grips with the destruction. In Dunalley, 65 homes and an elementary school were destroyed.	-42.887714000000003	147.81121400000001	2013-01-07 19:48:00	2013-01-07 19:57:12.567255	2013-01-07 19:57:12.567255	http://www.cnn.com/2013/01/06/world/asia/australia-wildfire/index.html		Yellow	16	2013-01-07 19:48:00	2013-01-17 19:48:00		5	f	t
355	Noble Fire, Oklahoma	The Noble fire in Cleveland County, south of Oklahoma City, affected about 7,800 acres and had destroyed 25 structures -- including homes and outbuildings -- as of Saturday, officials said.	35.150371999999997	-97.250977000000006	2012-08-06 16:08:00	2012-08-06 16:23:54.481234	2012-08-06 16:23:54.481234	http://articles.cnn.com/2012-08-04/us/us_oklahoma-wildfires_1_high-temperatures-and-winds-fire-conditions-big-fire		Yellow	10	2012-08-06 16:08:00	2012-08-16 16:08:00		5	f	t
374	Wildfires in California	Fires have yet to relinquish their grip on northern California forests. The Fort Complex Fire began with a lightning strike on August 5 and now a month later over 23,000 acres have been affected and the fire is 30% contained.	41.029299999999999	-122.0577	2012-09-05 17:55:00	2012-09-05 18:01:59.587509	2012-09-05 18:01:59.587509	http://www.nasa.gov/mission_pages/fires/main/usa/20120904-california.html		Yellow	25	2012-09-05 17:55:00	2012-09-15 17:55:00		5	f	t
390	Mount Soputan Eruption	One of Indonesia's most active volcanos has erupted, shooting ash and smoke nearly 1½ kilometers (1 mile) into the sky.	1.1080000000000001	124.73	2012-09-18 16:56:00	2012-09-18 17:01:42.51293	2012-09-18 17:01:57.609183	http://www.huffingtonpost.com/2012/09/18/mount-soputan-volcano-erupts-indonesia_n_1893269.html		Yellow	16	2012-09-18 16:56:00	2012-10-03 16:56:00		16	f	t
356	Volcanic Eruption in New Zealand	Scientists in New Zealand are monitoring Mount Tongariro carefully after the volcano erupted last night for the first time in 115 years.\n\n	-39.133333	175.64166700000001	2012-08-07 15:20:00	2012-08-07 15:22:29.357951	2012-08-07 15:22:29.357951	http://www.abc.net.au/news/2012-08-07/an-major-disruptions-after-nz-volcano-tongariro-erupts/4181502		Yellow	10	2012-08-07 15:20:00	2012-09-06 15:20:00		16	f	t
375	Pine Creek Fire, Montana	The Pine Creek Fire has burned approximately 8,000 acres south of Livingston and over 400 people remain on the scene to work the fire.\n\n	45.505800000000001	-110.517	2012-09-05 18:05:00	2012-09-05 18:08:49.17136	2012-09-05 18:08:49.17136	http://www.ktvq.com/news/pine-creek-fire-update/		Yellow	13	2012-09-05 18:05:00	2012-09-15 18:05:00		5	f	t
387	Tropical Cyclone Sanba	A powerful typhoon lashed North and South Korea with strong wind and heavy rain Monday, killing at least one person, leaving dozens of others homeless and cutting power to many homes and businesses in the South.	35.164774999999999	129.12158500000001	2012-09-17 18:12:00	2012-09-17 18:34:32.180086	2012-09-18 17:16:16.426784	http://www.huffingtonpost.com/2012/09/17/typhoon-sanba-2012-batter_n_1890091.html		Yellow	16	2012-09-17 18:12:00	2012-09-27 18:12:00		8	f	t
357	Sziget Festival 2012	Placebo, LMFAO, The Killers and over 150 groups from Hungary, Europe and further afield will grace the stages at Budapest’s 20th Sziget Festival on Aug. 6-13, one of Europe’s most popular music events.	47.554287000000002	19.055185000000002	2012-08-07 21:09:00	2012-08-07 21:21:38.618176	2012-08-07 21:25:13.860922	http://www.hurriyetdailynews.com/budapests-famed-sziget-fest-begins.aspx?pageID=238&nID=27116&NewsCatID=383		Yellow	16	2012-08-07 21:09:00	2012-08-17 21:09:00		18	f	t
391	Flooding in Pakistan	Torrential rain, which began on September 5th, has caused flash floods in Pakistan leaving an estimated one million people homeless. Over 100 people have been reported killed in the floods, and many homes and properties have been inundated.	28.333333	68.396666999999994	2012-09-18 17:06:00	2012-09-18 17:53:43.225098	2012-09-27 21:35:30.264486	http://www.bbc.co.uk/news/world-asia-19545784		Yellow	16	2012-09-18 17:06:00	2012-10-03 17:06:00		6	f	t
409	Explosion in Indiana	Authorities from various Indianapolis, Indiana and federal agencies scoured the rubble Sunday searching for clues to just what caused a massive and deadly explosion late Saturday night on the Far-Southside of the city.	39.645200000000003	-86.098100000000002	2012-11-12 22:13:00	2012-11-12 22:15:46.85001	2012-11-12 22:15:46.85001	http://www.usatoday.com/story/news/nation/2012/11/11/indianapolis-explosion-homes-fire/1697195/		Yellow	5	2012-11-12 22:13:00	2012-11-22 22:13:00		20	f	t
389	Fires in Ecuador	22 fire fighters were wounded in Ecuador after an arson attack on Tuesday. The worst affected provinces are Pichincha, El Oro and Azuay. Eight provinces were issued with an Orange alert. No victims have been reported.	-0.28555799999999998	-78.627520000000004	2012-09-17 18:43:00	2012-09-17 18:53:22.186852	2012-09-17 19:16:18.921467	http://www.plenglish.com/index.php?option=com_content&task=view&id=543626&Itemid=1		Yellow	16	2012-09-17 18:43:00	2012-09-27 18:43:00		20	f	t
388	Floods and Landslides in India	On Friday, a series of cloudbursts struck the Himalayan state of Uttarkhand, triggering flash floods and landslides. At least 45 people have been killed and 35 others are missing whilst several more are injured.	30.467745000000001	79.101382000000001	2012-09-17 18:35:00	2012-09-17 18:41:14.418236	2012-11-13 19:35:23.758129	http://www.bbc.co.uk/news/world-asia-india-19596181	FF-2012-000166-IND	Yellow	16	2012-09-17 18:35:00	2012-09-27 18:35:00		6	f	t
243	Japan Flooding - Sanjo and Tadami	Record rainfall in the eastern Niigata/western Fukushima prefectures have led to the advised evacuation of nearly 300,000 people.	37.469999999999999	139.21899999999999	2011-08-01 17:09:00	2011-08-01 17:13:39.641997	2012-07-31 19:05:22.011817	http://www.google.com/hostednews/afp/article/ALeqM5ijZ08b6_UaTV0m3ISlYZShE3sDuQ?docId=CNG.b802f980032bd7c04d75f200f787b575.341		Yellow	16	2012-07-31 19:04:00	2012-08-30 19:04:00		6	f	t
252	Hurricane Irene	Currently rated a Category 2, Hurricane Irene may become a Cat 3 by the time it makes landfall near North Carolina's Outer Banks Saturday morning, drenching the East Coast as far north as Boston.	34.710599999999999	-76.618799999999993	2011-08-26 18:30:00	2011-08-26 18:36:58.419866	2012-07-31 22:27:41.17399	http://www.nhc.noaa.gov/#IRENE		Orange	16	2012-07-31 22:27:00	2012-08-30 22:27:00		8	f	t
251	UN Nigeria HQ Bombing	A car bomb hit the UN's headquarters in Abuja, Nigeria. At least 18 people have died. The Boko Haram have claimed responsibility.	9.0355000000000008	7.4645999999999999	2011-08-26 17:09:00	2011-08-26 17:13:01.271105	2012-07-31 22:28:09.413849	http://www.bbc.co.uk/news/world-africa-14677957		Yellow	16	2012-07-31 22:27:00	2012-08-30 22:27:00		20	f	t
358	Floods in the Philippines 	On Tuesday, torrential rains flooded the Philippines capital, Manila. Nine people were found dead buried under a landslide in Quezon City.	14.644075000000001	121.046808	2012-08-08 15:50:00	2012-08-08 16:00:29.294146	2012-08-08 16:00:29.294146	http://www.bbc.co.uk/news/world-asia-19178288	FL-2012-000130-PHL 	Yellow	25	2012-08-08 15:50:00	2012-08-23 15:50:00		6	f	t
341	Waldo Canyon Fire, Colorado	The Waldo Canyon fire, which officials here called "very aggressive," spread in three directions and displaced about 11,000 people from their homes as fires continued to burn statewide Sunday.	38.912095999999998	-104.87418700000001	2012-06-25 15:13:00	2012-06-25 15:17:38.51575	2012-09-20 21:05:27.923253	http://www.denverpost.com/breakingnews/ci_20929068/waldo-canyon-fire-evacuation-manitou-springs		Yellow	16	2012-06-25 15:13:00	2012-07-10 15:13:00		5	f	t
58	Egypt - Suez Protests	Political	29.962	32.539999999999999	2011-01-28 12:00:00	2011-05-24 12:00:00	2011-06-07 19:24:05.486097	\N	\N	\N	\N	\N	\N	\N	1	f	t
1	Brazil Flooding	Flood	-22.283000000000001	-42.533000000000001	2011-01-13 12:00:00	2011-05-24 12:00:00	2011-06-07 19:54:06.469509	\N	\N	\N	\N	\N	\N	\N	1	f	t
411	Flooding in Italy	Two days of heavy rains followed by strong winds have left parts of central and northern Italy submerged.  Rising water levels have caused power cuts and transport disruptions as well as forcing some to flee their homes.	42.763545000000001	11.112342999999999	2012-11-14 20:34:00	2012-11-14 20:45:54.501501	2012-11-14 20:45:54.501501	http://www.bbc.co.uk/news/world-europe-20318043		Yellow	16	2012-11-14 20:34:00	2012-11-24 20:34:00		6	f	t
376	Floods in Northern Cameroon	Extreme floods have devastated Northern regions of Cameroon. Nearly 20 people have died and thousands more are left homeless. Continuous rainfall and release of the Ladgo Dam caused the Benoe River to burst its banks, flooding residential areas.	9.0607579999999999	13.688663999999999	2012-09-07 17:02:00	2012-09-07 19:22:09.039539	2012-09-07 19:22:09.039539	http://www.un-spider.org/about-us/news/en/6173/2012-09-07t161900/international-charter-activated-floods-cameroon		Yellow	16	2012-09-07 17:02:00	2012-10-17 17:02:00		6	f	t
359	Earthquake in Iran	Relief operations are under way in Iran after two strong earthquakes in the north-west left at least 250 people dead and more than 2,000 injured.\n\n	38.256999999999998	46.914000000000001	2012-08-13 14:07:00	2012-08-13 14:11:50.103601	2012-09-12 23:04:02.124839	http://www.bbc.co.uk/news/world-middle-east-19231118		Orange	16	2012-08-13 14:07:00	2012-08-28 14:07:00		4	f	t
392	Floods in South Sudan	Floods which began in June have been affecting the Upper Nile state in South Sudan. The flooding in Sudan has displaced over three thousand people, and at least 15 people have been reported killed.	10.016	33.545999999999999	2012-09-24 17:42:00	2012-09-24 17:48:41.422422	2012-09-24 20:35:43.249701	http://www.trust.org/alertnet/news/sudanese-refugees-risk-disease-in-crowded-flooded-camps		Yellow	16	2012-09-24 17:42:00	2012-10-04 17:42:00		6	f	t
235	Souris-Missouri River Flooding - Sioux City	Collection AOIs are defined for Minot ND, Sioux City IA, Offutt and Fort Calhoun, NE.	42.485999999999997	-96.405000000000001	2011-06-29 19:17:00	2011-07-06 19:17:55.45407	2011-07-27 16:29:40.422943	http://www.cnn.com	\N	\N	\N	\N	\N	\N	1	f	t
236	Souris-Missouri River Flooding - Minot	Collection AOIs are defined for Minot ND, Sioux City IA, Offut and Fort Calhoun, NE.	48.231999999999999	-101.29600000000001	2011-06-29 19:18:00	2011-07-06 19:18:51.431487	2011-07-06 19:18:51.431487	\N	\N	\N	\N	\N	\N	\N	1	f	t
50	World Cup 2010 -  Royal Bafokeng	Sports	-25.577999999999999	27.160699999999999	2010-06-11 12:00:00	2011-05-24 12:00:00	2012-01-16 17:02:52.532638			Yellow	10	2012-01-16 17:02:00	2012-02-15 17:02:00		1	f	t
204	Spain - Lorca	Earthquake	37.670999999999999	-1.698	2011-05-11 12:00:00	2011-05-24 12:00:00	2011-06-02 15:06:45.004675	\N	\N	\N	\N	\N	\N	\N	1	f	t
205	Slave Lake Canada	Fire	55.2806	-114.7705	2011-05-17 12:00:00	2011-05-24 12:00:00	2011-06-02 15:09:33.674385	\N	\N	\N	\N	\N	\N	\N	1	f	t
184	Southern Storms - Birmingham	Tornado	33.520899999999997	-86.802000000000007	2011-04-28 12:00:00	2011-05-24 12:00:00	2011-06-02 15:10:08.640009	\N	\N	\N	\N	\N	\N	\N	1	f	t
201	Midwest Floods - Norco	Flood	30.027999999999999	-90.390000000000001	2011-05-04 12:00:00	2011-05-24 12:00:00	2011-06-02 15:10:49.310364	\N	\N	\N	\N	\N	\N	\N	1	f	t
177	Midwest Floods - Smithland	Flood	37.276000000000003	-88.469999999999999	2011-05-04 12:00:00	2011-05-24 12:00:00	2011-06-02 15:11:11.704511	\N	\N	\N	\N	\N	\N	\N	1	f	t
178	Midwest Floods - Mount Vernon	Flood	37.810000000000002	-88.007999999999996	2011-05-04 12:00:00	2011-05-24 12:00:00	2011-06-02 15:11:35.04385	\N	\N	\N	\N	\N	\N	\N	1	f	t
179	Midwest Floods - Newburgh	Flood	37.927	-87.375	2011-05-04 12:00:00	2011-05-24 12:00:00	2011-06-02 15:12:01.866512	\N	\N	\N	\N	\N	\N	\N	1	f	t
168	Midwest Floods - Cape Girardeau	Flood	37.296999999999997	-89.471000000000004	2011-05-04 12:00:00	2011-05-24 12:00:00	2011-06-02 15:12:22.111255	\N	\N	\N	\N	\N	\N	\N	1	f	t
180	Midwest Floods - Owensboro	Flood	37.793999999999997	-87.141000000000005	2011-05-04 12:00:00	2011-05-24 12:00:00	2011-06-02 15:13:07.514299	\N	\N	\N	\N	\N	\N	\N	1	f	t
175	Midwest Floods - Grand Chain	Flood	37.204000000000001	-89.039000000000001	2011-05-04 12:00:00	2011-05-24 12:00:00	2011-06-02 15:13:31.413562	\N	\N	\N	\N	\N	\N	\N	1	f	t
174	Midwest Floods - Natchez	Flood	31.544	-91.447999999999993	2011-05-04 12:00:00	2011-05-24 12:00:00	2011-06-02 15:13:57.487259	\N	\N	\N	\N	\N	\N	\N	1	f	t
173	Midwest Floods - Vicksburg	Flood	32.360999999999997	-90.944000000000003	2011-05-04 12:00:00	2011-05-24 12:00:00	2011-06-02 15:14:24.350819	\N	\N	\N	\N	\N	\N	\N	1	f	t
172	Midwest Floods - Greenville	Flood	33.415999999999997	-91.164000000000001	2011-05-04 12:00:00	2011-05-24 12:00:00	2011-06-02 15:14:48.850934	\N	\N	\N	\N	\N	\N	\N	1	f	t
171	Midwest Floods - Helena	Flood	34.514000000000003	-90.585999999999999	2011-05-04 12:00:00	2011-05-24 12:00:00	2011-06-02 15:15:16.379004	\N	\N	\N	\N	\N	\N	\N	1	f	t
176	Midwest Floods - Paducah	Flood	37.106000000000002	-88.623999999999995	2011-05-04 12:00:00	2011-05-24 12:00:00	2011-06-02 17:42:54.796122	\N	\N	\N	\N	\N	\N	\N	1	f	t
360	Fires in North Algeria	An estimated 20,000 hectares of land have been ravaged by forest fires in the north of Algeria since June. These are a result of hotter than average summer heat waves that have been reported to reach as high as 50 degrees Celsius. 	36.314678000000001	2.3082630000000002	2012-08-16 20:06:00	2012-08-16 20:19:50.876113	2012-08-16 20:19:50.876113	http://www.news24.com/Africa/News/Wildfire-ravages-20-000ha-in-Algeria-20120814		Orange	16	2012-08-16 20:06:00	2012-08-31 20:06:00		5	f	t
377	Earthquakes in Southern China	Two quakes measuring 5.7 and 5.6 on the Richter scale hit a border area near Yiliang county in Yunnan and Weining county in Guizhou province.  An estimated 100,000 people have been evacuated and approximately 20,000 houses were destroyed.	27.579861999999999	103.990059	2012-09-07 19:30:00	2012-09-07 19:36:24.035573	2012-09-07 19:36:24.035573	http://news.xinhuanet.com/english/china/2012-09/07/c_131835270.htm		Orange	16	2012-09-07 19:30:00	2012-10-17 19:30:00		4	f	t
208	Massachusetts Tornados - Springfield	Tornado	42.100999999999999	-72.589799999999997	2011-06-02 00:00:00	2011-06-03 16:35:57.063492	2011-06-03 16:35:57.063492	\N	\N	\N	\N	\N	\N	\N	1	f	t
209	Massachusetts Tornados- West Springfield	Tornado	42.106999999999999	-72.620599999999996	2011-06-02 00:00:00	2011-06-03 16:37:16.78758	2011-06-03 16:37:16.78758	\N	\N	\N	\N	\N	\N	\N	1	f	t
210	Massachusetts Tornados - Monson	Tornado	42.104300000000002	-72.317999999999998	2011-06-02 00:00:00	2011-06-03 16:38:06.235664	2011-06-03 16:38:06.235664	\N	\N	\N	\N	\N	\N	\N	1	f	t
211	Massachusetts Tornados - Westfield	Tornado	42.124400000000001	-72.749499999999998	2011-06-02 00:00:00	2011-06-03 16:39:04.620723	2011-06-03 16:39:04.620723	\N	\N	\N	\N	\N	\N	\N	1	f	t
212	Massachusetts Tornados - Agawam	Tornado	42.069200000000002	-72.615200000000002	2011-06-02 00:00:00	2011-06-03 16:39:59.404998	2011-06-03 16:39:59.404998	\N	\N	\N	\N	\N	\N	\N	1	f	t
213	Massachusetts Tornados - Charlton	Tornado	42.134999999999998	-71.970399999999998	2011-06-02 00:00:00	2011-06-03 16:40:45.748193	2011-06-03 16:40:45.748193	\N	\N	\N	\N	\N	\N	\N	1	f	t
214	Massachusetts Tornados - Oxford	Tornado	42.116300000000003	-71.864999999999995	2011-06-02 00:00:00	2011-06-03 16:41:33.693875	2011-06-03 16:41:33.693875	\N	\N	\N	\N	\N	\N	\N	1	f	t
215	Massachusetts Tornados - Palmer	Tornado	42.158200000000001	-72.328599999999994	2011-06-02 00:00:00	2011-06-03 16:42:22.933857	2011-06-03 16:42:22.933857	\N	\N	\N	\N	\N	\N	\N	1	f	t
220	Upper Midwest Flooding - Towner	Flood	48.347999999999999	-100.41549999999999	2011-06-03 00:00:00	2011-06-03 16:47:44.541144	2011-06-03 16:47:44.541144	\N	\N	\N	\N	\N	\N	\N	1	f	t
221	Upper Midwest Flooding - Ashton	Flood	44.997	-98.480999999999995	2011-06-03 00:00:00	2011-06-03 16:48:22.986351	2011-06-03 16:48:22.986351	\N	\N	\N	\N	\N	\N	\N	1	f	t
222	Upper Midwest Flooding - Huron	Flood	44.354999999999997	-98.195999999999998	2011-06-02 00:00:00	2011-06-03 16:49:02.743887	2011-06-03 16:49:02.743887	\N	\N	\N	\N	\N	\N	\N	1	f	t
223	Upper Midwest Flooding - Pierre	Flood	44.366999999999997	-100.349	2011-06-03 00:00:00	2011-06-03 16:49:44.593447	2011-06-03 16:49:44.593447	\N	\N	\N	\N	\N	\N	\N	1	f	t
224	Yemen Unrest - Sanaa University	Protests	15.3653	44.189700000000002	2011-06-03 19:34:00	2011-06-03 19:44:52.743407	2011-06-03 19:50:20.619249	\N	\N	\N	\N	\N	\N	\N	1	f	t
226	Syria Unrest - Ar Rastan	Political Unrest - Armored personal carriers.	34.943800000000003	36.744599999999998	2011-06-03 19:54:00	2011-06-03 19:55:49.612129	2011-06-06 16:36:37.769186	\N	\N	\N	\N	\N	\N	\N	1	f	t
483	Flooding in High River, Canada	In High River, a community of about 13,000 south of Calgary, streets that were filled with water are now covered in mud, in some places a meter deep. Despite everyone in the town being ordered to evacuate their homes, 300 residents refused to leave.	51.054358999999998	-114.068721	2013-06-26 20:26:00	2013-06-26 20:35:17.126269	2013-07-01 19:33:02.634655	http://www.ctvnews.ca/canada/we-don-t-have-a-flood-we-have-a-disaster-says-high-river-mayor-1.1340502		Yellow	16	2013-06-26 20:26:00	2013-07-07 20:26:00		6	f	t
419	Grounded Shell Oil Rig	The oil rig "Kulluk" ran aground on Monday after drifting in stormy weather as it was being towed.  The rig is grounded on the south-east side of Sitkalidak Island, and does not appear to be leaking at present.	57.311999999999998	-153.03	2013-01-15 22:55:00	2013-01-15 22:58:19.122985	2013-01-15 22:58:19.122985	http://www.bbc.co.uk/news/world-us-canada-20887995		Yellow	16	2013-01-15 22:55:00	2013-01-26 22:55:00		20	f	t
402	Pemex Gas Pipe Explosion	The blaze in the town of Zapotlanejo was caused by a digger striking the pipeline late on Thursday, and has not yet been brought under control.  The accident injured two firefighters and an employee of the state-owned energy company Pemex.	20.542503	-103.025926	2012-10-19 16:33:00	2012-10-19 16:46:11.96794	2012-10-19 18:03:19.089365	http://www.reuters.com/article/2012/10/19/mexico-pemex-idUSL1E8LJ2GF20121019		Yellow	16	2012-10-19 16:33:00	2012-10-29 16:33:00		20	f	t
218	Upper Midwest Flooding - Williston	Flood	48.1145	-103.715	2011-06-03 00:00:00	2011-06-03 16:46:14.667295	2011-06-03 16:46:14.667295	\N	\N	\N	\N	\N	\N	\N	1	f	t
219	Upper Midwest Flooding - Minot	Flood	48.234000000000002	-101.29900000000001	2011-06-03 00:00:00	2011-06-03 16:47:01.419636	2011-06-03 16:47:01.419636	\N	\N	\N	\N	\N	\N	\N	1	f	t
228	Pueyhue Volcano Complex	Eruptions in the Puyehue-Cordon-Caulle volcano range have disrupted air traffic in Chile and Argentina. According to reports, an estimated 4,000 people have left the area.	-40.582999999999998	-72.111999999999995	2011-06-07 14:53:00	2011-06-07 16:25:11.145615	2011-06-07 16:25:11.145615	\N	\N	\N	\N	\N	\N	\N	1	f	t
170	Midwest Floods - Osceola	Flood	35.631	-89.923000000000002	2011-05-04 12:00:00	2011-05-24 12:00:00	2011-06-07 16:58:41.786123	\N	\N	\N	\N	\N	\N	\N	1	f	t
203	Midwest Flood - Moganza	Flood	30.741	-90.100999999999999	2011-05-04 12:00:00	2011-05-24 12:00:00	2011-06-07 16:59:01.048186	\N	\N	\N	\N	\N	\N	\N	1	f	t
166	Midwest Floods - Memphis TN	Flood	35.151000000000003	-90.049000000000007	2011-05-04 12:00:00	2011-05-24 12:00:00	2011-06-07 16:59:31.503242	\N	\N	\N	\N	\N	\N	\N	1	f	t
167	Midwest Floods - Cairo	Flood	36.795999999999999	-89.331999999999994	2011-05-04 12:00:00	2011-05-24 12:00:00	2011-06-07 16:59:47.56927	\N	\N	\N	\N	\N	\N	\N	1	f	t
202	Midwest Flood - Baton Rouge	Flood	30.440999999999999	-91.197000000000003	2011-05-04 12:00:00	2011-05-24 12:00:00	2011-06-07 17:00:11.896418	\N	\N	\N	\N	\N	\N	\N	1	f	t
169	Midwest Floods - Dyersburg	Flood	36.195999999999998	-89.628	2011-05-04 12:00:00	2011-05-24 12:00:00	2011-06-07 17:00:42.156504	\N	\N	\N	\N	\N	\N	\N	1	f	t
189	Southern Storms - Oxford	Tornado	34.360900000000001	-89.529300000000006	2011-04-28 12:00:00	2011-05-24 12:00:00	2011-06-07 17:01:00.496708	\N	\N	\N	\N	\N	\N	\N	1	f	t
188	Southern Storms - Crystal Springs	Tornado	32.050899999999999	-90.378	2011-04-28 12:00:00	2011-05-24 12:00:00	2011-06-07 17:01:18.209962	\N	\N	\N	\N	\N	\N	\N	1	f	t
185	Southern Storms - Glade Spring	Tornado	36.779499999999999	-81.775199999999998	2011-04-28 12:00:00	2011-05-24 12:00:00	2011-06-07 17:02:08.794518	\N	\N	\N	\N	\N	\N	\N	1	f	t
190	Osama Compound	Human Interest	34.168999999999997	73.242000000000004	2011-05-02 12:00:00	2011-05-24 12:00:00	2011-06-07 17:02:46.482345	\N	\N	\N	\N	\N	\N	\N	1	f	t
159	Syria - Aleppo	Political	36.210000000000001	37.160800000000002	2011-04-25 12:00:00	2011-05-24 12:00:00	2011-06-07 17:06:15.035421	\N	\N	\N	\N	\N	\N	\N	1	f	t
161	Syria - Baniyas	Political	35.179000000000002	35.948999999999998	2011-04-25 12:00:00	2011-05-24 12:00:00	2011-06-07 17:06:54.68985	\N	\N	\N	\N	\N	\N	\N	1	f	t
158	Syria - Homs	Political	34.725000000000001	36.722999999999999	2011-04-25 12:00:00	2011-05-24 12:00:00	2011-06-07 17:07:10.161807	\N	\N	\N	\N	\N	\N	\N	1	f	t
157	Syria - Daraa	Political	32.619999999999997	36.106000000000002	2011-04-25 12:00:00	2011-05-24 12:00:00	2011-06-07 17:07:29.440645	\N	\N	\N	\N	\N	\N	\N	1	f	t
160	Syria - Damascus	Political	33.512	36.2913	2011-04-25 12:00:00	2011-05-24 12:00:00	2011-06-07 17:07:49.238363	\N	\N	\N	\N	\N	\N	\N	1	f	t
156	Mossy Rock Ranch Texas	Fire	32.776000000000003	-98.531999999999996	2011-04-20 12:00:00	2011-05-24 12:00:00	2011-06-07 17:08:08.389839	\N	\N	\N	\N	\N	\N	\N	1	f	t
147	NC - Askewville	Tornado	36.143000000000001	-76.893000000000001	2011-04-18 12:00:00	2011-05-24 12:00:00	2011-06-07 17:08:54.10709	\N	\N	\N	\N	\N	\N	\N	1	f	t
144	NC - Sanford	Tornado	35.466999999999999	-79.155000000000001	2011-04-18 12:00:00	2011-05-24 12:00:00	2011-06-07 17:09:14.309961	\N	\N	\N	\N	\N	\N	\N	1	f	t
148	NC - Fayetteville	Tornado	35.052	-78.876999999999995	2011-04-18 12:00:00	2011-05-24 12:00:00	2011-06-07 17:09:43.179547	\N	\N	\N	\N	\N	\N	\N	1	f	t
155	Nigeria - Sokoto	Political	13.031000000000001	5.2309000000000001	2011-04-18 12:00:00	2011-05-24 12:00:00	2011-06-07 17:11:52.389162	\N	\N	\N	\N	\N	\N	\N	1	f	t
152	Nigeria - Gombe	Political	10.282	11.1746	2011-04-18 12:00:00	2011-05-24 12:00:00	2011-06-07 17:12:06.600104	\N	\N	\N	\N	\N	\N	\N	1	f	t
143	NC - Raleigh	Tornado	35.753999999999998	-78.700999999999993	2011-04-18 12:00:00	2011-05-24 12:00:00	2011-06-07 17:12:24.046119	\N	\N	\N	\N	\N	\N	\N	1	f	t
149	Nigeria - Kano	Political	11.991	8.5250000000000004	2011-04-18 12:00:00	2011-05-24 12:00:00	2011-06-07 17:12:37.034668	\N	\N	\N	\N	\N	\N	\N	1	f	t
151	Nigeria - Jos	Political	9.9239999999999995	8.8928999999999991	2011-04-18 12:00:00	2011-05-24 12:00:00	2011-06-07 17:12:51.265063	\N	\N	\N	\N	\N	\N	\N	1	f	t
154	Nigeria - Katsina	Political	12.984999999999999	7.6230000000000002	2011-04-18 12:00:00	2011-05-24 12:00:00	2011-06-07 17:13:03.917924	\N	\N	\N	\N	\N	\N	\N	1	f	t
150	Nigeria - Kaduna	Political	10.541	7.4249999999999998	2011-04-18 12:00:00	2011-05-24 12:00:00	2011-06-07 17:13:17.338152	\N	\N	\N	\N	\N	\N	\N	1	f	t
153	Nigeria - Adamawa	Political	9.2850000000000001	12.442	2011-04-18 12:00:00	2011-05-24 12:00:00	2011-06-07 17:15:26.3651	\N	\N	\N	\N	\N	\N	\N	1	f	t
145	NC - Colerain	Tornado	36.201000000000001	-76.766999999999996	2011-04-18 12:00:00	2011-05-24 12:00:00	2011-06-07 17:15:42.274847	\N	\N	\N	\N	\N	\N	\N	1	f	t
197	Libya - Hun	Political	29.110900000000001	15.962999999999999	2011-04-13 12:00:00	2011-05-24 12:00:00	2011-06-07 17:15:58.344238	\N	\N	\N	\N	\N	\N	\N	1	f	t
192	Libya - Yafran	Political	32.062100000000001	12.526	2011-04-13 12:00:00	2011-05-24 12:00:00	2011-06-07 17:16:10.364025	\N	\N	\N	\N	\N	\N	\N	1	f	t
191	Libya - Misurata	Political	32.372999999999998	15.093299999999999	2011-04-13 12:00:00	2011-05-24 12:00:00	2011-06-07 17:16:21.722744	\N	\N	\N	\N	\N	\N	\N	1	f	t
142	Coahuila Mexico	Fire	28.876999999999999	-102.19199999999999	2011-04-13 12:00:00	2011-05-24 12:00:00	2011-06-07 17:16:47.144786	\N	\N	\N	\N	\N	\N	\N	1	f	t
193	Libya - Bani Walid	Political	31.738	13.955	2011-04-13 12:00:00	2011-05-24 12:00:00	2011-06-07 17:16:59.16257	\N	\N	\N	\N	\N	\N	\N	1	f	t
194	Libya - Eastern Border	Political	31.577500000000001	25.073899999999998	2011-04-13 12:00:00	2011-05-24 12:00:00	2011-06-07 17:17:13.550643	\N	\N	\N	\N	\N	\N	\N	1	f	t
195	Libya - El Bayda	Political	32.762999999999998	21.740600000000001	2011-04-13 12:00:00	2011-05-24 12:00:00	2011-06-07 17:18:16.335127	\N	\N	\N	\N	\N	\N	\N	1	f	t
199	Libya - Tamanhint	Political	27.216000000000001	14.632	2011-04-13 12:00:00	2011-05-24 12:00:00	2011-06-07 17:18:29.75398	\N	\N	\N	\N	\N	\N	\N	1	f	t
196	Libya - Garyan	Political	32.167200000000001	13.016400000000001	2011-04-13 12:00:00	2011-05-24 12:00:00	2011-06-07 17:18:41.885333	\N	\N	\N	\N	\N	\N	\N	1	f	t
200	Libya - Waddan	Political	29.140000000000001	16.1602	2011-04-13 12:00:00	2011-05-24 12:00:00	2011-06-07 17:18:54.537051	\N	\N	\N	\N	\N	\N	\N	1	f	t
198	Libya - Sawknah	Political	29.066800000000001	15.7843	2011-04-13 12:00:00	2011-05-24 12:00:00	2011-06-07 17:19:10.281706	\N	\N	\N	\N	\N	\N	\N	1	f	t
141	Mapleton IA	Tornado	42.162999999999997	-95.789000000000001	2011-04-11 12:00:00	2011-05-24 12:00:00	2011-06-07 17:19:23.086273	\N	\N	\N	\N	\N	\N	\N	1	f	t
140	Fort Davis TX	Fire	30.576000000000001	-103.874	2011-04-11 12:00:00	2011-05-24 12:00:00	2011-06-07 17:19:40.492711	\N	\N	\N	\N	\N	\N	\N	1	f	t
139	Crystal Fire	Fire	40.557000000000002	-105.304	2011-04-06 12:00:00	2011-05-24 12:00:00	2011-06-07 17:20:23.521394	\N	\N	\N	\N	\N	\N	\N	1	f	t
122	Owambo, Namibia	Flood	-17.859000000000002	15.779	2011-04-04 12:00:00	2011-05-24 12:00:00	2011-06-07 17:20:44.212559	\N	\N	\N	\N	\N	\N	\N	1	f	t
420	In Amenas Hostage Crisis	Heavily armed gunmen attacked the In Amenas gas field complex in Algeria. Militants took Algerian and foreign workers hostage in the living area and the main gas facility of the Tiguentourine complex.	27.925806999999999	9.1127880000000001	2013-01-18 23:03:00	2013-01-18 23:13:51.207694	2013-01-18 23:17:14.81827	http://www.bbc.co.uk/news/world-africa-21085590		Yellow	16	2013-01-18 23:03:00	2013-01-28 23:03:00		19	f	t
368	Oil Refinery Fire, Venezuela	Venezuelan firefighters struggled to contain the last fire at the South American country’s largest oil refinery after a second flare-up at a fuel storage tank. \n\n	11.741916	-70.184398000000002	2012-08-28 17:03:00	2012-08-28 17:08:44.450684	2012-08-28 17:08:44.450684	http://www.businessweek.com/news/2012-08-27/venezuelan-refinery-fire-spreads-and-delays-production-restart		Orange	5	2012-08-28 17:03:00	2012-09-07 17:03:00		20	f	t
353	Formula One - Hungarian GP	McLaren's Lewis Hamilton took his second victory of the season as he beat Lotus driver Kimi Raikkonen in the Hungarian Grand Prix. \n\n	47.580637000000003	19.249592	2012-07-30 16:09:00	2012-07-30 16:13:35.193887	2012-07-31 17:39:16.428262	http://www.bbc.co.uk/sport/0/formula1/19037485		Yellow	16	2012-07-30 16:09:00	2012-08-09 16:09:00		18	f	t
440	Sectarian Violence in Meiktila, Myanmar	Three days of rioting and arson attacks have swept through the streets\r\nof Meiktila. Security forces, which during decades of military rule\r\nbrutally suppressed any signs of unrest, seemed unable or unwilling to\r\nstop the rioting.	20.884229000000001	95.863984000000002	2013-03-27 16:55:00	2013-03-27 17:03:40.490422	2013-03-27 17:03:40.490422	http://www.nytimes.com/2013/03/23/world/asia/toll-rises-as-sectarian-violence-in-myanmar-spreads.html?hp		Yellow	10	2013-03-22 16:55:00	2013-04-01 16:55:00		15	f	t
287	Christmas Island - Vessel breaks in two	Rough weather on Christmas Island has broken the MV Tycoon in two.	-10.425800000000001	105.67100000000001	2012-01-12 17:27:00	2012-01-12 17:33:21.333403	2012-07-31 19:06:58.551822	http://gcaptain.com/grounded-vessel-christmas-island/?37137		Yellow	16	2012-01-12 17:27:00	2012-02-11 17:27:00		11	f	t
129	Red and James Rivers - Grand Forks	Flood	47.899000000000001	-97.030299999999997	2011-03-28 12:00:00	2011-05-24 12:00:00	2011-06-07 17:21:12.305123	\N	\N	\N	\N	\N	\N	\N	1	f	t
460	Copahue Volcano in Argentina and Chile 	The seismic activity of Copahue volcano has prompted Chilean and Argentinian authorities to issue a red alert and evacuate 3,000 people from the South American border. Some 460 families are expected to be affected by the evacuations.	-37.850000000000001	-71.166667000000004	2013-05-28 16:35:00	2013-05-28 16:40:57.548023	2013-05-28 16:40:57.548023	http://www.bbc.co.uk/news/world-latin-america-22684322		Yellow	16	2013-05-28 16:35:00	2013-06-07 16:35:00		16	f	t
135	Red and James Rivers - Huron	Flood	44.302999999999997	-98.185000000000002	2011-03-28 12:00:00	2011-05-24 12:00:00	2011-06-07 17:21:38.24187	\N	\N	\N	\N	\N	\N	\N	1	f	t
130	Red and James Rivers - Fargo	Flood	46.847999999999999	-96.831000000000003	2011-03-28 12:00:00	2011-05-24 12:00:00	2011-06-07 17:22:03.01979	\N	\N	\N	\N	\N	\N	\N	1	f	t
131	Red and James Rivers - Watertown	Flood	44.902999999999999	-97.099000000000004	2011-03-28 12:00:00	2011-05-24 12:00:00	2011-06-07 17:22:52.35176	\N	\N	\N	\N	\N	\N	\N	1	f	t
133	Red and James Rivers - Dell Rapids	Flood	43.814	-96.695999999999998	2011-03-28 12:00:00	2011-05-24 12:00:00	2011-06-07 17:23:16.128544	\N	\N	\N	\N	\N	\N	\N	1	f	t
182	Southern Storms - Smithville	Tornado	34.069899999999997	-88.391000000000005	2011-04-28 12:00:00	2011-05-24 12:00:00	2011-06-07 17:03:11.623315	\N	\N	\N	\N	\N	\N	\N	1	f	t
187	Southern Storms - Leoma	Tornado	35.141500000000001	-87.344800000000006	2011-04-28 12:00:00	2011-05-24 12:00:00	2011-06-07 17:03:30.048603	\N	\N	\N	\N	\N	\N	\N	1	f	t
186	Southern Storms - Ringgold	Tornado	34.916600000000003	-85.110900000000001	2011-04-28 12:00:00	2011-05-24 12:00:00	2011-06-07 17:03:50.417498	\N	\N	\N	\N	\N	\N	\N	1	f	t
165	Midwest Floods - Poplar Bluff AR	Flood	36.375100000000003	-90.397999999999996	2011-04-26 12:00:00	2011-05-24 12:00:00	2011-06-07 17:04:04.925586	\N	\N	\N	\N	\N	\N	\N	1	f	t
164	Midwest Storms - Vilonia AR	Tornado	35.082999999999998	-92.207999999999998	2011-04-26 12:00:00	2011-05-24 12:00:00	2011-06-07 17:04:20.559903	\N	\N	\N	\N	\N	\N	\N	1	f	t
163	Midwest Storms - St. Louis MO	Tornado	38.75	-90.411000000000001	2011-04-26 12:00:00	2011-05-24 12:00:00	2011-06-07 17:05:44.395575	\N	\N	\N	\N	\N	\N	\N	1	f	t
162	Syria - Ar Rastan	Political	34.923000000000002	36.734000000000002	2011-04-25 12:00:00	2011-05-24 12:00:00	2011-06-07 17:06:38.015618	\N	\N	\N	\N	\N	\N	\N	1	f	t
239	California fire - Lion	The Lion fire in the Sequoia National Forest has grown to 11,411 acres.	36.316000000000003	-118.544	2011-07-27 16:25:00	2011-07-27 16:30:18.995665	2011-07-29 17:55:37.094618	http://www.turnto23.com/news/28671677/detail.html	\N	\N	\N	\N	\N	\N	1	f	t
240	California fire - Eagle	The Eagle fire, 85km ENE of San Diego on the Los Coyotes Indian Reservation has grown to 13,700 and is now 45% contained.	33.313000000000002	-116.48	2011-07-27 16:30:00	2011-07-27 16:33:00.283592	2011-07-29 17:55:52.830192	http://www.fox5sandiego.com/news/kswb-eagle-fire-latest,0,7044550.story	\N	\N	\N	\N	\N	\N	1	f	t
137	Red and James Rivers - Menno	Flood	43.167999999999999	-97.617999999999995	2011-03-28 12:00:00	2011-05-24 12:00:00	2011-06-07 17:23:29.038041	\N	\N	\N	\N	\N	\N	\N	1	f	t
136	Red and James Rivers - Mitchell	Flood	43.753999999999998	-97.983999999999995	2011-03-28 12:00:00	2011-05-24 12:00:00	2011-06-07 17:23:46.577611	\N	\N	\N	\N	\N	\N	\N	1	f	t
132	Red and James Rivers - Brookings	Flood	44.304000000000002	-96.849000000000004	2011-03-28 12:00:00	2011-05-24 12:00:00	2011-06-07 17:25:47.668581	\N	\N	\N	\N	\N	\N	\N	1	f	t
134	Red and James Rivers - Redfield	Flood	44.957999999999998	-98.483000000000004	2011-03-28 12:00:00	2011-05-24 12:00:00	2011-06-07 17:26:11.037264	\N	\N	\N	\N	\N	\N	\N	1	f	t
128	Shan State Myanmar	Earthquake	20.704999999999998	99.947000000000003	2011-03-24 12:00:00	2011-05-24 12:00:00	2011-06-07 17:26:23.627275	\N	\N	\N	\N	\N	\N	\N	1	f	t
82	Christchurch Earthquake	Earthquake	-43.529000000000003	172.661	2011-03-22 12:00:00	2011-05-24 12:00:00	2011-06-07 17:26:40.425139	\N	\N	\N	\N	\N	\N	\N	1	f	t
127	Indian Gulch Fire	Fire	39.755000000000003	-105.267	2011-03-23 12:00:00	2011-05-24 12:00:00	2011-06-07 17:26:53.539015	\N	\N	\N	\N	\N	\N	\N	1	f	t
123	Yemen - Sanaa	Political	15.375	44.206000000000003	2011-03-18 12:00:00	2011-05-24 12:00:00	2011-06-07 17:27:26.177487	\N	\N	\N	\N	\N	\N	\N	1	f	t
124	Yemen - Taiz	Political	13.569000000000001	44.012999999999998	2011-03-18 12:00:00	2011-05-24 12:00:00	2011-06-07 17:27:39.432076	\N	\N	\N	\N	\N	\N	\N	1	f	t
126	Yemen - Al Mukalla	Political	14.565	49.153300000000002	2011-03-18 12:00:00	2011-05-24 12:00:00	2011-06-07 17:27:50.232524	\N	\N	\N	\N	\N	\N	\N	1	f	t
125	Yemen - Aden	Political	12.818	45.006	2011-03-18 12:00:00	2011-05-24 12:00:00	2011-06-07 17:28:05.890756	\N	\N	\N	\N	\N	\N	\N	1	f	t
94	California - Santa Cruz	Tsunami	36.960799999999999	-122.0205	2011-03-14 12:00:00	2011-05-24 12:00:00	2011-06-07 17:28:19.757519	\N	\N	\N	\N	\N	\N	\N	1	f	t
93	California - Crescent City	Tsunami	41.756	-124.20099999999999	2011-03-14 12:00:00	2011-05-24 12:00:00	2011-06-07 17:28:39.334387	\N	\N	\N	\N	\N	\N	\N	1	f	t
117	Japan - Ichihara	Earthquake	35.497	140.0489	2011-03-11 12:00:00	2011-05-24 12:00:00	2011-06-07 17:29:37.234209	\N	\N	\N	\N	\N	\N	\N	1	f	t
118	Japan - Chiba	Earthquake	35.613199999999999	140.1046	2011-03-11 12:00:00	2011-05-24 12:00:00	2011-06-07 17:29:57.984368	\N	\N	\N	\N	\N	\N	\N	1	f	t
119	Japan - Edogawa	Earthquake	35.707099999999997	139.86799999999999	2011-03-11 12:00:00	2011-05-24 12:00:00	2011-06-07 17:30:31.326816	\N	\N	\N	\N	\N	\N	\N	1	f	t
120	Japan - Tokyo	Earthquake	35.692	139.702	2011-03-11 12:00:00	2011-05-24 12:00:00	2011-06-07 17:30:49.8136	\N	\N	\N	\N	\N	\N	\N	1	f	t
121	Japan - Tokyo Haneda Intl	Earthquake	35.557000000000002	139.767	2011-03-11 12:00:00	2011-05-24 12:00:00	2011-06-07 17:31:12.854366	\N	\N	\N	\N	\N	\N	\N	1	f	t
87	Hawaii - Haleiwa	Tsunami	21.576000000000001	-158.1198	2011-03-11 12:00:00	2011-05-24 12:00:00	2011-06-07 17:31:30.337672	\N	\N	\N	\N	\N	\N	\N	1	f	t
113	Japan - Tokai	Earthquake	36.4666	140.607	2011-03-11 12:00:00	2011-05-24 12:00:00	2011-06-07 17:32:52.375727	\N	\N	\N	\N	\N	\N	\N	1	f	t
114	Japan - Kamisu	Earthquake	35.9206	140.67699999999999	2011-03-11 12:00:00	2011-05-24 12:00:00	2011-06-07 17:33:31.277234	\N	\N	\N	\N	\N	\N	\N	1	f	t
116	Japan - Tagajo	Earthquake	38.292999999999999	141.00399999999999	2011-03-11 12:00:00	2011-05-24 12:00:00	2011-06-07 17:35:12.991286	\N	\N	\N	\N	\N	\N	\N	1	f	t
429	Solomon Islands, Earthquake and Tsunami	A powerful earthquake off the Solomon Islands generated a tsunami up to 1.5 metres (5ft) high that damaged dozens of homes and left several people missing, presumed dead.	-10.724579	165.798509	2013-02-07 21:22:00	2013-02-07 21:27:15.73324	2013-02-11 20:01:22.43657	http://www.guardian.co.uk/world/2013/feb/06/solomon-islands-earthquake-triggers-tsunami	TS-2013-000015-SLB	Yellow	16	2013-02-07 21:22:00	2013-02-17 21:22:00		14	f	t
441	Flooding in Yemen	Flooding in Yemen has led to 19 reported deaths, said the Yemeni Meteorology Center on Sunday. The Yemeni meteorology center warned of more heavy rains to come, especially in mountainous regions including Sana'a, Amran, Mahweet, Dhamar and Raima.	15.351582000000001	44.207318999999998	2013-04-02 21:19:00	2013-04-02 21:29:09.042382	2013-05-13 19:46:06.313001	http://www.yementimes.com/en/1664/news/2174/Flooding-continues-death-toll-rises.htm		Yellow	16	2013-04-02 21:19:00	2013-05-01 21:19:00		6	f	t
461	Powerhouse Fire in Santa Clarita, CA	The Powerhouse fire in Santa Clarita that has destroyed six homes and burned nearly 30,000 acres. Close to 2,200 firefighters were mobilized to battle the wildfire.	34.651000000000003	-118.48399999999999	2013-06-03 15:43:00	2013-06-03 15:48:44.675089	2013-06-03 15:48:44.675089	http://www.latimes.com/local/lanow/la-me-ln-powerhouse-monday-update-20130603,0,6012197.story		Yellow	16	2013-06-03 15:43:00	2013-06-13 15:43:00		5	f	t
464	Slaughterhouse Fire in Dehui City, China	The death toll from a fire at a poultry slaughterhouse in northeast China's Jilin Province has risen to 119 as of Monday afternoon, the rescue commanding center said.	44.148955000000001	125.43591499999999	2013-06-03 17:45:00	2013-06-03 17:53:38.085503	2013-06-03 17:53:38.085503	http://english.cntv.cn/20130603/104858.shtml		Yellow	16	2013-06-03 17:45:00	2013-06-13 17:45:00		20	f	t
484	Egypt Protests	Huge protests across Egypt calling for the resignation of President Mohammed Morsi have taken place through the night, with some outbreaks of violence.	30.044477000000001	31.235735999999999	2013-07-01 15:12:00	2013-07-01 15:15:32.117375	2013-07-01 15:15:32.117375	http://www.bbc.co.uk/news/world-middle-east-23115821		Yellow	16	2013-07-01 15:12:00	2013-07-31 15:12:00		9	f	t
442	Severe Flooding in Buenos Aires, Argentina	More than 50 people have died after one of the heaviest storms recorded caused flash floods in Buenos Aires and La Plata. Thousands have been evacuated from their homes and dozens are still stranded, local media report.	-34.603811	-58.381599000000001	2013-04-04 15:52:00	2013-04-04 16:09:25.547926	2013-04-04 16:15:10.511142	http://www.bbc.co.uk/news/world-latin-america-22023196		Yellow	16	2013-04-04 15:52:00	2013-05-04 15:52:00		6	f	t
486	Flooding in Argentina	Heavy rains have resulted in flooding along the Parana and Iguazu Rivers in the littoral region of Argentina. Hundreds of people have evacuated their homes so far and it is expected that thousands more will need to be evacuated.	-27.485184	-58.875	2013-07-01 16:48:00	2013-07-01 16:54:40.217619	2013-07-01 16:54:40.217619	http://www.disasterscharter.org/web/charter/activation_details?p_r_p_1415474252_assetId=ACT-440		Yellow	16	2013-07-01 16:48:00	2013-07-31 16:48:00		6	f	t
443	Red River Flooding in Upper Midwest, USA	A potential for exceeding moderate and major river flood levels exists for the Red River of the North, which forms the state line between eastern North Dakota and northwest Minnesota for spring 2013.	46.875492000000001	-96.790644999999998	2013-04-04 22:28:00	2013-04-04 22:34:46.975643	2013-04-04 22:34:46.975643	http://minnesota.publicradio.org/display/web/2013/04/03/news/fargo-sandbags-red-river-flooding		Yellow	16	2013-04-04 22:28:00	2013-05-04 22:28:00		6	t	t
463	Tornadoes Strike Oklahoma City	At least nine people have died after a series of tornadoes slammed through the Oklahoma City area Friday, with at least 100 people injured, while heavy flooding hampers recovery efforts.	35.398000000000003	-97.596000000000004	2013-06-03 15:54:00	2013-06-03 15:55:20.122929	2013-06-03 15:55:20.122929	http://www.foxnews.com/weather/2013/06/01/unstable-air-mass-prompts-tornado-watch-in-central-northeast-oklahoma/		Yellow	16	2013-06-03 15:54:00	2013-06-13 15:54:00		13	f	t
462	Tornado Strikes El Reno, OK	Funnels of various sizes touched the ground Friday evening near El Reno, 25 miles west of downtown Oklahoma City. Radar indicated the storm was going through a mostly rural area south of Interstate 40.	35.522199999999998	-97.954999999999998	2013-06-03 15:49:00	2013-06-03 15:53:14.847438	2013-06-03 16:01:22.756174	http://www.huffingtonpost.com/2013/05/31/el-reno-oklahoma-tornado-2013-video_n_3369172.html		Yellow	16	2013-06-03 15:49:00	2013-06-13 15:49:00		13	f	t
444	Earthquake in Iran	A 6.3 magnitude earthquake has killed at least 37 people and injured 850 in south-west Iran, officials say.	28.454000000000001	51.494	2013-04-09 16:49:00	2013-04-09 16:52:40.183911	2013-04-09 16:52:40.183911	http://www.bbc.co.uk/news/world-middle-east-22077834		Yellow	50	2013-04-09 16:49:00	2013-05-09 16:49:00		4	f	t
431	Chelyabinsk Meteor Strike, Russia	A meteor crashing in Russia's Ural mountains has injured at least 950\r\npeople, as the shock-wave blew out windows and rocked buildings.\r\n	55.160600000000002	61.426000000000002	2013-02-15 16:37:00	2013-02-19 16:40:37.800393	2013-02-20 23:30:22.730108	http://www.bbc.co.uk/news/world-europe-21468116		Yellow	16	2013-02-15 16:37:00	2013-03-30 16:37:00		17	f	t
465	Severe Flooding in Central Europe	Homes have been destroyed and at least seven people killed in devastating floods across central Europe. Water levels have risen to record levels in Germany, Austria, and the Czech Republic. 	48.574593999999998	13.463964000000001	2013-06-03 17:56:00	2013-06-03 17:59:18.774705	2013-06-03 17:59:18.774705	http://www.huffingtonpost.co.uk/2013/06/03/flooding-czech-prague-austria-germany_n_3378936.html?utm_hp_ref=uk		Yellow	16	2013-06-03 17:56:00	2013-06-13 17:56:00		6	f	t
487	Yarnell, AZ Fire	The fast-moving  Yarnell Wildfire (Yavapai County, AZ)  is now more than quadruple in size, as crews battle triple-digit heat and erratic winds in an effort to contain the blaze. 	34.259999999999998	-112.78	2013-06-29 00:00:00	2013-07-02 14:33:07.501285	2013-07-03 01:05:54.77186	http://www.nytimes.com/2013/07/01/us/firefighters-killed-in-yarnell-arizona-wildfire.html?hp&_r=0		Yellow	16	2013-06-29 00:00:00	2013-07-29 23:59:00		5	t	t
488	Stuart Creek 2 Fire, AK	The Stuart Creek 2 Fire east of Fairbanks has grown to at least 10,000 acres, and ash from the blaze is falling on neighborhoods along Chena Hot Springs Road. The fire started two weeks ago and was relatively quiet until Sunday night.	64.770200000000003	-146.7595	2013-07-02 19:49:00	2013-07-02 19:57:31.925226	2013-07-02 19:57:31.925226	http://www.newsminer.com/news/local_news/stuart-creek-wildfire-on-eielson-grows-ash-falls-on-two/article_f8362f98-e2c9-11e2-bf9c-0019bb30f31a.html		Yellow	16	2013-07-02 19:49:00	2013-07-12 19:49:00		5	f	t
445	Tornadoes in Arkansas and Missouri	Tornadoes spread mayhem in parts of Missouri and Arkansas, and now it's time for the Southeast to brace itself for possible severe weather.\r\n	35.698999999999998	-92.516999999999996	2013-04-11 16:31:00	2013-04-11 16:38:21.42449	2013-04-11 16:40:07.887316	http://www.cnn.com/2013/04/11/us/storms/index.html?hpt=hp_t2		Yellow	16	2013-04-11 16:31:00	2013-05-21 16:31:00		13	f	t
466	Building Collapse in Philadelphia 	Rescue crews were searching for people possibly trapped in a thrift store after a building collapsed onto it in the Center City section of Philadelphia on Wednesday, according to reports from the scene. \r\n	39.953699999999998	-75.176400000000001	2013-06-05 17:08:00	2013-06-05 17:08:14.110657	2013-06-05 17:14:15.254361	http://www.cnn.com/2013/06/05/us/pennsylvania-philadelphia-building-collapse/index.html		Yellow	16	2013-06-05 17:08:00	2013-06-15 17:08:00		20	f	t
432	Cyclone Haruna, Madagascar	Tropical Cyclone Haruna made landfall on the south-west coast of Madagascar. Government officials have reported over 17,000 people have been affected by the storm, with 13 reported deaths, and 1,500 houses destroyed or flooded.	-23.373313	43.678041	2013-02-25 17:19:00	2013-02-25 17:35:35.802358	2013-02-28 16:27:38.144766	http://www.irinnews.org/Report/97542/Tropical-Cyclone-Haruna-hits-southwestern-Madagascar	TC-2013-000022-MDG	Orange	16	2013-02-25 17:19:00	2013-03-07 17:19:00		8	f	t
433	Tropical Cyclone Rusty, Australia	Major flooding is expected as Tropical Cyclone Rusty moves inland from Western Australia's Pilbara coast and puts new towns on red alert. People in adjacent inland areas, including Marble Bar, were warned to go to shelter immediately.	-20.317048	118.592069	2013-02-27 18:38:00	2013-02-27 19:13:22.890187	2013-02-27 19:13:22.890187	http://www.news.com.au/breaking-news/national/rusty-rolls-inland-prompting-flood-fears/story-e6frfku9-1226587293521		Orange	16	2013-02-27 18:38:00	2013-03-09 18:38:00		8	f	t
446	Earthquake in South Eastern Iran	A powerful earthquake has hit the border regions between Iran and Pakistan. The USGS measured the earthquake at magnitude 7.8, located 50 miles east-south-east of the town of Khash. It is the biggest earthquake in Iran for 40 years.	28.225290999999999	61.208160999999997	2013-04-16 15:02:00	2013-04-16 15:17:29.640285	2013-04-16 15:17:29.640285	http://www.guardian.co.uk/world/2013/apr/16/earthquake-hits-iran-pakistan-border		Orange	16	2013-04-16 15:02:00	2013-04-26 15:02:00		4	f	t
467	Protests in Turkey	Demonstrators have been rallying in Istanbul, Ankara and other cities for a week, with many calling for the three-term prime minister to quit.\r\n\r\n	41.037165999999999	28.985453	2013-06-06 15:00:00	2013-06-06 15:03:45.453332	2013-06-06 15:03:45.453332	http://www.bbc.co.uk/news/world-europe-22793198		Yellow	16	2013-06-06 15:00:00	2013-07-21 15:00:00		9	f	t
489	Civil Unrest in Xinjiang	China tightens security ahead of deadly riot anniversary.	43.826999999999998	87.597999999999999	2013-07-03 17:10:00	2013-07-03 17:16:44.142514	2013-07-03 17:16:44.142514	http://www.voanews.com/content/china-tightens-security-in-xinjiang-ahead-of-anniversary/1693463.html		Yellow	16	2013-07-04 17:10:00	2013-07-14 17:10:00		15	f	t
447	Boston Marathon Bombing	Two powerful bombs exploded near the finish line of the Boston Marathon on Monday afternoon, killing three people, including an 8-year-old child, and injuring over 100 people.	42.349499999999999	-71.079499999999996	2013-04-16 18:41:00	2013-04-16 18:49:15.010967	2013-04-16 18:52:04.585933	http://www.nytimes.com/2013/04/16/us/explosions-reported-at-site-of-boston-marathon.html?src=ISMR_AP_LO_MST_FB		Orange	16	2013-04-16 18:41:00	2013-05-16 18:41:00		20	f	t
373	Flooding in Nigeria	Flooding in two areas of northern Nigeria has killed at least 11 people and displaced hundreds, officials and residents said Friday, the latest casualties in the country's rainy season.\n	9.2848550000000003	12.460324999999999	2012-08-29 15:16:00	2012-08-29 15:22:56.056568	2012-08-29 15:22:56.056568	http://allafrica.com/stories/201208280169.html		Yellow	16	2012-08-29 15:16:00	2012-09-08 15:16:00		6	f	t
490	Plane crash in San Francisco	A Boeing 777 crashed at San Francisco's airport while attempting to land on July 6.	37.613	-122.364	2013-07-08 18:06:00	2013-07-08 18:14:15.436798	2013-07-08 18:16:14.942503	http://www.bbc.co.uk/news/world-us-canada-23222048		Yellow	16	2013-07-08 18:06:00	2013-07-18 18:06:00		20	f	t
491	Train blast in Canada	A runaway train carrying crude oil derailed and exploded in Lac-Megantic, Quebec.	45.576912	-70.884307000000007	2013-07-08 18:15:00	2013-07-08 18:17:46.067028	2013-07-09 14:54:27.710611	http://www.bbc.co.uk/news/world-us-canada-23231470		Yellow	16	2013-07-08 18:15:00	2013-07-18 18:15:00		20	f	t
112	Japan - Onagawa	Tsunami	38.401000000000003	141.5	2011-03-11 12:00:00	2011-05-24 12:00:00	2011-06-07 17:35:46.329026	\N	\N	\N	\N	\N	\N	\N	1	f	t
106	Japan - Natori-City	Tsunami	38.170900000000003	140.89099999999999	2011-03-11 12:00:00	2011-05-24 12:00:00	2011-06-07 17:36:06.676927	\N	\N	\N	\N	\N	\N	\N	1	f	t
434	Earthquake in Yunnan Province, China	A shallow 5.5-magnitude earthquake hit southwest China on Sunday, causing 700 homes to collapse and leaving 30 people injured, state media said.	25.917999999999999	99.724999999999994	2013-03-04 19:35:00	2013-03-04 19:44:16.59584	2013-03-04 19:44:16.59584	http://www.bangkokpost.com/breakingnews/338623/china-quake-flattens-hundreds-of-homes		Yellow	25	2013-03-04 19:35:00	2013-03-15 19:35:00		4	f	t
492	Stuart Creek fire near North Pole, AK	The Stuart Creek fire east of North Pole, AK has grown to nearly 65,000 acres.	64.763000000000005	-146.726	2013-07-08 18:19:00	2013-07-08 18:19:56.738398	2013-07-08 18:19:56.738398	http://www.inciweb.org/incident/article/3468/19053/		Yellow	16	2013-07-08 18:19:00	2013-07-18 18:20:00		5	f	t
448	Explosion in West Texas	A massive explosion at a fertilizer plant in the town of West Texas has left up to 15 people dead and more than 150 people injured. The blast registered as a 2.1 earthquake according to federal seismologists.	31.816011	-97.087941999999998	2013-04-18 15:57:00	2013-04-18 16:04:13.125799	2013-04-18 16:06:06.373816	http://online.wsj.com/article/SB10001424127887324493704578429943017835664.html		Yellow	16	2013-04-18 15:57:00	2013-04-28 15:57:00		20	f	t
468	Royal Gorge Fire, CO	The Royal Gorge Fire near Canon City has burned 3,800 acres and at least three structures. There are about 150 firefighters working on the fire that started Tuesday.	38.454712000000001	-105.311809	2013-06-12 15:23:00	2013-06-12 15:23:08.369787	2013-06-12 15:27:20.171633	http://www.thedenverchannel.com/news/local-news/royal-gorge-fire-burns-3-buildings-3800-acres-mandatory-evacuations-in-effect		Yellow	16	2013-06-12 15:23:00	2013-06-22 15:23:00		5	f	t
494	Chariot fire east of San Diego	A 2,500 acre brush fire is prompting evacuations near the town of Julian, east of San Diego, CA.	32.930999999999997	-116.446	2013-07-08 18:26:00	2013-07-08 18:26:32.39258	2013-07-08 18:26:32.39258	http://www.utsandiego.com/news/2013/jul/08/fire-julian-mount-laguna-evacuation/		Yellow	16	2013-07-08 18:26:00	2013-07-18 18:26:00		5	f	t
449	Earthquake in China	A powerful earthquake has killed at least 160 people and injured at least 5,700 in China's rural south-west, officials say.\r\n	30.276948999999998	102.954387	2013-04-22 14:36:00	2013-04-22 14:36:33.625584	2013-04-22 14:36:33.625584	http://www.bbc.co.uk/news/world-22228225		Orange	50	2013-04-22 14:36:00	2013-05-22 14:36:00		4	f	t
493	Carpenter fire near Las Vegas	A 15,000 acre wildfire is burning west of Las Vegas in Kyle Canyon near the Mt. Charleston ski area.	36.218000000000004	-115.634	2013-07-08 18:20:00	2013-07-08 18:25:57.831288	2013-07-08 18:25:57.831288	http://www.mynews3.com/content/news/story/FEMA-Carpenter-1-Fire-Las-Vegas/NTcD9ijpvkuuc4IJZUejOQ.cspx		Yellow	16	2013-07-08 18:20:00	2013-07-18 18:20:00		5	f	t
469	Blackforest Fire, CO	The Black Forest Fire continues to burn additional homes and land north of Colorado Springs. The fire has burned more than 8,000 acres, and at least 60 homes have been destroyed. 	39.017643999999997	-104.700413	2013-06-12 15:32:00	2013-06-12 15:38:15.006022	2013-06-12 21:44:08.303107	http://www.thedenverchannel.com/news/local-news/black-forest-fire-burns-40-60-homes-6426-people-evacuated-7500-and-8000-acres-burned		Yellow	16	2013-06-12 15:32:00	2013-06-22 15:32:00		5	f	t
146	NC - Micro	Tornado	35.563000000000002	-78.203999999999994	2011-04-18 12:00:00	2011-05-24 12:00:00	2011-06-07 17:08:29.23546	\N	\N	\N	\N	\N	\N	\N	1	f	t
450	Building Collapse in Dhaka, Bangladesh	At least 87 people have been killed and many others trapped after an eight-storey building housing garment factories collapsed outside the capital, Dhaka.	23.846170000000001	90.257819999999995	2013-04-25 15:16:00	2013-04-25 15:22:55.381524	2013-04-25 15:22:55.381524	http://www.bbc.co.uk/news/world-asia-22275597		Yellow	16	2013-04-25 15:16:00	2013-05-05 15:16:00		20	f	t
470	Jaroso Fire, NM	Jaroso fire started Monday by lightning strike. Approximately 100 firefighters and support personnel are assigned to the fire but more resources are en route.	35.914000000000001	-105.714	2013-06-13 16:15:00	2013-06-13 16:23:08.194524	2013-06-13 16:23:08.194524	http://www.newschannel10.com/story/22581770/fire-management-team-assigned-to-nms-jaroso-fire		Yellow	25	2013-06-13 16:15:00	2013-06-28 16:15:00		5	f	t
495	Fire in Bragança, Portugal	A wildfire burning in northeast Portugal near the Spanish border has caused damages in the "millions of euros" to local agriculture.	41.177	-6.7949999999999999	2013-07-12 15:28:00	2013-07-12 15:30:32.520069	2013-07-12 15:30:32.520069	http://theportugalnews.com/news/braganca-fire-biggest-ever-losses-in-millions/28876		Yellow	16	2013-07-12 15:28:00	2013-07-13 15:28:00		5	f	t
496	Flood in Sichuan, China	The worst floods in 50 years in a region of China trigger a landslide that buries up to 40 people and destroys homes and bridges.	30.929409	103.619227	2013-07-12 15:52:00	2013-07-12 16:03:22.271088	2013-07-12 16:03:22.271088	http://news.sky.com/story/1113911/china-floods-up-to-40-buried-in-landslide		Yellow	16	2013-07-12 15:52:00	2013-08-11 15:52:00		6	f	t
471	Silver Fire, NM	Forest officials report that the Silver fire has consumed 21,400 acres near the Kingston and Royal John Mine area. The fire is burning low, a situation that could change if the wind picks up or if dry brush ignites sending flames into trees.	32.862000000000002	-107.789	2013-06-14 19:49:00	2013-06-14 19:58:33.737494	2013-06-14 20:00:20.328399	http://www.ktsm.com/news/silver-fire-jumps-21400-acres		Yellow	16	2013-06-14 19:49:00	2013-06-24 19:49:00		5	f	t
451	Canada-Red River Flooding	A potential for exceeding moderate and major river flood levels exists for the Red River of the North.	48.972158999999998	-97.236618000000007	2013-05-02 20:03:00	2013-05-02 20:14:35.839554	2013-05-02 20:29:05.7054			Yellow	16	2013-05-02 20:03:00	2013-06-05 20:03:00		6	t	t
497	Floods in Assam, India	The flood situation in Assam on Monday showed some signs of improvement though 59 villages in three districts still reeled under water affecting nearly 30,000 people. \r\n\r\n	27.480511	94.549508000000003	2013-07-15 15:58:00	2013-07-15 16:02:40.378114	2013-07-15 16:02:40.378114	http://timesofindia.indiatimes.com/india/Assam-flood-situation-improves-59-villages-still-under-water/articleshow/21087867.cms		Yellow	50	2013-07-15 15:58:00	2013-08-15 15:58:00		6	f	t
64	Libya - Ras Ajdir	Political	33.145000000000003	11.558999999999999	2011-02-21 12:00:00	2011-05-24 12:00:00	2011-06-07 19:17:40.031805	\N	\N	\N	\N	\N	\N	\N	1	f	t
452	Springs Fire in Ventura County, CA	Hundreds of firefighters struggled to protect houses from the blaze, which damaged 15 homes and was about 10% contained late Thursday. 	34.189414999999997	-118.98087700000001	2013-05-03 15:30:00	2013-05-03 15:49:22.290211	2013-05-03 15:49:22.290211	http://www.latimes.com/news/local/la-me-fires-20130503,0,572309.story		Yellow	16	2013-05-03 15:30:00	2013-05-13 15:30:00		5	f	t
453	Summit Fire in Banning, CA	About 400 firefighters from multiple agencies were assigned to battle the the 3,000-acre Summit Fire burning in Banning, California.	33.950251000000002	-116.86879500000001	2013-05-03 16:01:00	2013-05-03 16:07:02.9255	2013-05-03 16:07:02.9255	http://ktla.com/2013/05/03/wind-driven-brush-fire-burning-in-banning/#axzz2SFHSLJOz		Yellow	16	2013-05-03 16:01:00	2013-05-13 16:01:00		5	f	t
454	Panther Fire in Tehama County, CA	The 6,864 acre Panther Fire is now 60% contained in Tehama County. The fire started the morning of May 1 in a rugged area of the Deer Creek Canyon north of Butte Meadows and Highway 32.	40.201000000000001	-121.711	2013-05-07 19:22:00	2013-05-07 19:28:37.237731	2013-05-07 19:28:37.237731	http://www.plumasnews.com/index.php?option=com_content&view=article&id=10970:firefighters-gain-the-upper-hand-on-the-panther-fire&catid=69:-headline-news&Itemid=6		Yellow	16	2013-05-07 19:22:00	2013-05-17 19:22:00		5	f	t
472	Doce Fire, NM	The Doce Fire has burned over 7,000 acres near Prescott and was zero percent contain on Wednesday morning.  The fire started about 11:30am Tuesday and was human caused.	34.631	-112.568	2013-06-19 15:18:00	2013-06-19 15:20:22.5563	2013-06-19 15:20:22.5563	http://www.azcentral.com/news/arizona/articles/20130618prescott-wildfire-abrk.html		Yellow	16	2013-06-19 15:18:00	2013-06-29 15:18:00		5	f	t
473	Carstens Fire, CA	Carstens Fire has burned over 1,600 acres in Mariposa County. Firefighters say the fire is exhibiting extreme behavior including fire whirls and strong adverse winds.	37.545000000000002	-119.875	2013-06-19 15:24:00	2013-06-19 15:28:21.636116	2013-06-19 15:28:21.636116	http://abclocal.go.com/kfsn/story?section=news/local&id=9143091		Yellow	16	2013-06-19 15:24:00	2013-06-29 15:24:00		5	f	t
474	Flooding in Uttarakhand, India	Heavy rainfall, due to an unusually strong monsoon season, has caused flooding in northern India. 130 people have been reported killed, and hundreds more have been displaced.	30.725999999999999	78.438999999999993	2013-06-19 15:30:00	2013-06-19 15:37:48.989753	2013-06-19 15:37:48.989753	http://www.disasterscharter.org/web/charter/activation_details?p_r_p_1415474252_assetId=ACT-439		Yellow	16	2013-06-19 15:30:00	2013-06-29 15:30:00		6	f	t
475	Ammo Depot Explosion, Russia	A series of explosions at an ammunition depot in Russia's central Samara region forced the evacuation of 6,500 people. An estimated 6,000 artillery shells are stored at the site, located about 700 miles from Moscow.	52.933999999999997	49.731999999999999	2013-06-19 16:32:00	2013-06-19 16:38:45.896393	2013-06-19 16:38:45.896393	http://news.xinhuanet.com/english/world/2013-06/19/c_132468665.htm		Yellow	16	2013-06-19 16:32:00	2013-06-29 16:32:00		20	f	t
53	Guatemala Flooding and Volcano	Flood	14.5901	-90.536000000000001	2010-06-01 12:00:00	2011-05-24 12:00:00	2011-06-07 20:07:14.311725	\N	\N	\N	\N	\N	\N	\N	1	f	t
476	Flooding in Calgary, Canada	As many as 100,000 people have had to flee their homes in western Canada amid heavy flooding. Torrential rain and floodwaters have washed away roads and bridges and caused landslides in southern parts of the province of Alberta.	51.045324999999998	-114.05810099999999	2013-06-21 15:16:00	2013-06-21 15:35:52.154424	2013-06-21 15:36:55.330552	http://www.bbc.co.uk/news/world-us-canada-23000926		Yellow	16	2013-06-21 15:16:00	2013-07-02 15:16:00		6	f	t
477	Widespread Protests in Brazil	More than a million people are reported to have taken part in demonstrations on Thursday in about 100 cities. Protests began more than a week ago directed at corruption and the cost of next year's World Cup.	-23.550031000000001	-46.637653	2013-06-21 16:04:00	2013-06-21 16:22:50.981938	2013-06-21 16:22:50.981938	http://www.bbc.co.uk/news/world-latin-america-23001366		Yellow	16	2013-06-21 16:04:00	2013-07-02 16:04:00		9	f	t
455	Tropical Cyclone Mahasen-13 Approaches Burma	Tropical cyclone Mahasen is expected to hit west Burma’s Arakan State, according to a warning by the US military, raising concerns of a possible humanitarian disaster for thousands of displaced people living in makeshift camps and flood-prone areas.	19.408802000000001	93.536073999999999	2013-05-10 21:34:00	2013-05-10 21:47:05.93055	2013-05-14 14:40:08.403758	http://reliefweb.int/report/myanmar/cyclone-approaches-west-burma-raising-alarm-idps		Yellow	16	2013-05-10 21:34:00	2013-05-30 21:34:00		8	f	t
107	Japan - Arahama	Tsunami	38.224699999999999	140.98070000000001	2011-03-11 12:00:00	2011-05-24 12:00:00	2011-06-07 17:36:44.827489	\N	\N	\N	\N	\N	\N	\N	1	f	t
111	Japan - Fukushima-Daini	Tsunami	37.316699999999997	141.02500000000001	2011-03-11 12:00:00	2011-05-24 12:00:00	2011-06-07 17:37:05.696974	\N	\N	\N	\N	\N	\N	\N	1	f	t
108	Japan - Soma-City	Earthquake	37.799399999999999	140.9237	2011-03-11 12:00:00	2011-05-24 12:00:00	2011-06-07 17:37:42.701479	\N	\N	\N	\N	\N	\N	\N	1	f	t
109	Japan - Minami-Soma-City	Tsunami	37.642000000000003	140.95599999999999	2011-03-11 12:00:00	2011-05-24 12:00:00	2011-06-07 17:38:09.212537	\N	\N	\N	\N	\N	\N	\N	1	f	t
110	Japan - Fukushima-Daiichi	Tsunami	37.420499999999997	141.03270000000001	2011-03-11 12:00:00	2011-05-24 12:00:00	2011-06-07 17:39:04.741637	\N	\N	\N	\N	\N	\N	\N	1	f	t
92	Hawaii - Nawiliwili	Tsunami	21.972999999999999	-159.35300000000001	2011-03-11 12:00:00	2011-05-24 12:00:00	2011-06-07 17:39:21.817472	\N	\N	\N	\N	\N	\N	\N	1	f	t
91	Hawaii - Lihue	Tsunami	22.020499999999998	-159.36699999999999	2011-03-11 12:00:00	2011-05-24 12:00:00	2011-06-07 17:39:35.9725	\N	\N	\N	\N	\N	\N	\N	1	f	t
456	Tornadoes Hit Texas	Multiple tornadoes swept through north Texas on Wednesday May 15th, 2013. At least six people were killed after a twister touched down southeast of Granbury, Texas, a suburb of Fort Worth.	32.430999999999997	-97.718999999999994	2013-05-16 15:25:00	2013-05-16 15:29:52.736702	2013-05-16 15:29:52.736702	http://www.huffingtonpost.com/2013/05/15/texas-tornadoes_n_3283172.html		Yellow	16	2013-05-16 15:25:00	2013-05-26 15:25:00		13	f	t
478	West Fork Fire, CO	The West Fork Complex, a combination of two wildfires, the West Fork and Windy Pass fires, burning in steep, rugged terrain is bearing down on South Fork, a Rio Grande County town of about 400 people.	37.660687000000003	-106.64309299999999	2013-06-21 20:29:00	2013-06-21 20:33:29.950463	2013-06-21 20:33:29.950463	http://www.denverpost.com/breakingnews/ci_23510002/town-south-fork-ordered-evacuate-because-wildfire		Yellow	16	2013-06-21 20:29:00	2013-07-02 20:29:00		5	f	t
88	Hawaii - Honolulu	Tsunami	21.294	-157.93090000000001	2011-03-11 12:00:00	2011-05-24 12:00:00	2011-06-07 17:41:33.473053	\N	\N	\N	\N	\N	\N	\N	1	f	t
480	Lime Gulch Fire, CO	New mapping shows the Lime Gulch Fire in Jefferson County has burned 498 acres. It is just five percent contained. Officials said Friday that they have five engine crews ready to handle structure protection, if needed.	39.416978	-105.229488	2013-06-21 20:42:00	2013-06-21 20:44:48.792542	2013-06-21 20:43:15.146318	http://www.thedenverchannel.com/news/local-news/lime-gulch-fire-600-acres-5-percent-contained-evacs-still-in-place		Yellow	16	2013-06-21 20:42:00	2013-07-02 20:42:00		5	f	t
86	Hawaii - Kahului	Tsunami	20.905999999999999	-156.47040000000001	2011-03-11 12:00:00	2011-05-24 12:00:00	2011-06-07 17:41:55.508679	\N	\N	\N	\N	\N	\N	\N	1	f	t
97	Japan - Tanohata-Cho	Earthquake	39.926000000000002	141.898	2011-03-11 12:00:00	2011-05-24 12:00:00	2011-06-07 18:41:34.024301	\N	\N	\N	\N	\N	\N	\N	1	f	t
104	Japan - Ofunato-City	Tsunami	39.0837	141.7106	2011-03-11 12:00:00	2011-05-24 12:00:00	2011-06-07 18:43:10.514344	\N	\N	\N	\N	\N	\N	\N	1	f	t
96	Japan - Noda-Mural	Earthquake	40.110300000000002	141.81720000000001	2011-03-11 12:00:00	2011-05-24 12:00:00	2011-06-07 18:43:48.713161	\N	\N	\N	\N	\N	\N	\N	1	f	t
95	Japan - Hachinohe-City	Tsunami	40.5122	141.489	2011-03-11 12:00:00	2011-05-24 12:00:00	2011-06-07 18:44:27.487184	\N	\N	\N	\N	\N	\N	\N	1	f	t
102	Japan - Kamaishi-City	Tsunami	39.261000000000003	141.88980000000001	2011-03-11 12:00:00	2011-05-24 12:00:00	2011-06-07 18:44:59.160367	\N	\N	\N	\N	\N	\N	\N	1	f	t
101	Japan - Otsuchi-Cho	Tsunami	39.360999999999997	141.90700000000001	2011-03-11 12:00:00	2011-05-24 12:00:00	2011-06-07 18:46:13.743285	\N	\N	\N	\N	\N	\N	\N	1	f	t
100	Japan - Yamada-Cho	Tsunami	39.460999999999999	141.953	2011-03-11 12:00:00	2011-05-24 12:00:00	2011-06-07 18:46:42.271122	\N	\N	\N	\N	\N	\N	\N	1	f	t
105	Japan - Minami-Sanriku-Cho	Tsunami	38.679000000000002	141.44669999999999	2011-03-11 12:00:00	2011-05-24 12:00:00	2011-06-07 18:57:57.945199	\N	\N	\N	\N	\N	\N	\N	1	f	t
103	Japan - Rikuzen-Takada-City	Tsunami	39.014499999999998	141.62950000000001	2011-03-11 12:00:00	2011-05-24 12:00:00	2011-06-07 19:09:19.160626	\N	\N	\N	\N	\N	\N	\N	1	f	t
83	Ivory Coast - Abidjan	Political	5.3202999999999996	-4.0149999999999997	2011-03-08 12:00:00	2011-05-24 12:00:00	2011-06-07 19:10:26.253009	\N	\N	\N	\N	\N	\N	\N	1	f	t
85	Ivory Coast - Port Bouet	Political	5.2590000000000003	-3.9249999999999998	2011-03-11 12:00:00	2011-05-24 12:00:00	2011-06-07 19:10:54.842647	\N	\N	\N	\N	\N	\N	\N	1	f	t
84	Ivory Coast - Abobo	Political	5.4200999999999997	-4.0190000000000001	2011-03-08 12:00:00	2011-05-24 12:00:00	2011-06-07 19:11:11.820338	\N	\N	\N	\N	\N	\N	\N	1	f	t
89	Hawaii - Kawaihae	Tsunami	21.283000000000001	-157.71100000000001	2011-03-11 12:00:00	2011-05-24 12:00:00	2011-06-07 19:11:31.886415	\N	\N	\N	\N	\N	\N	\N	1	f	t
138	Abidjan Ivory Coast	Political	5.319	-4.0220000000000002	2011-03-08 12:00:00	2011-05-24 12:00:00	2011-06-07 19:11:55.223285	\N	\N	\N	\N	\N	\N	\N	1	f	t
90	Hawaii - Waianae	Tsunami	21.442799999999998	-158.1842	2011-03-11 12:00:00	2011-05-24 12:00:00	2011-06-07 19:12:51.521949	\N	\N	\N	\N	\N	\N	\N	1	f	t
76	Libya - Benina Intl	Political	32.097999999999999	20.270199999999999	2011-02-21 12:00:00	2011-05-24 12:00:00	2011-06-07 19:13:46.000613	\N	\N	\N	\N	\N	\N	\N	1	f	t
77	Libya - Albayda	Political	32.761000000000003	21.762	2011-02-21 12:00:00	2011-05-24 12:00:00	2011-06-07 19:13:58.827911	\N	\N	\N	\N	\N	\N	\N	1	f	t
69	Libya - Bin Jawwad	Political	30.805	18.077999999999999	2011-02-21 12:00:00	2011-05-24 12:00:00	2011-06-07 19:14:12.979308	\N	\N	\N	\N	\N	\N	\N	1	f	t
98	Japan - Iwaizumi-Cho	Earthquake	39.844999999999999	141.96100000000001	2011-03-11 12:00:00	2011-05-24 12:00:00	2011-06-07 19:15:03.329079	\N	\N	\N	\N	\N	\N	\N	1	f	t
99	Japan - Miyako-City	Tsunami	39.640300000000003	141.95400000000001	2011-03-11 12:00:00	2011-05-24 12:00:00	2011-06-07 19:15:36.689339	\N	\N	\N	\N	\N	\N	\N	1	f	t
115	Japan - Sendai	Tsunami	38.267000000000003	140.869	2011-03-11 12:00:00	2011-05-24 12:00:00	2011-06-07 19:16:21.100185	\N	\N	\N	\N	\N	\N	\N	1	f	t
70	Libya - As Sidr	Political	30.620999999999999	18.308	2011-02-21 12:00:00	2011-05-24 12:00:00	2011-06-07 19:16:47.397908	\N	\N	\N	\N	\N	\N	\N	1	f	t
71	Libya - Ras Lanuf	Political	30.481999999999999	18.562000000000001	2011-02-21 12:00:00	2011-05-24 12:00:00	2011-06-07 19:17:04.052833	\N	\N	\N	\N	\N	\N	\N	1	f	t
65	Libya - Zawiya	Political	32.762999999999998	12.734999999999999	2011-02-21 12:00:00	2011-05-24 12:00:00	2011-06-07 19:17:21.075262	\N	\N	\N	\N	\N	\N	\N	1	f	t
67	Libya - Tripoli Intl	Political	32.664999999999999	13.153	2011-02-21 12:00:00	2011-05-24 12:00:00	2011-06-07 19:17:58.435212	\N	\N	\N	\N	\N	\N	\N	1	f	t
66	Libya - Tripoli	Political	32.875999999999998	13.186999999999999	2011-02-21 12:00:00	2011-05-24 12:00:00	2011-06-07 19:18:15.223663	\N	\N	\N	\N	\N	\N	\N	1	f	t
72	Libya - Marsa Brega	Political	30.402000000000001	19.594999999999999	2011-02-21 12:00:00	2011-05-24 12:00:00	2011-06-07 19:18:30.077288	\N	\N	\N	\N	\N	\N	\N	1	f	t
73	Libya - Ajdabiya	Political	30.751999999999999	20.220099999999999	2011-02-21 12:00:00	2011-05-24 12:00:00	2011-06-07 19:18:45.202905	\N	\N	\N	\N	\N	\N	\N	1	f	t
62	Bahrain Protests - Manama	Political	26.231000000000002	50.561	2011-02-18 12:00:00	2011-05-24 12:00:00	2011-06-07 19:19:06.79823	\N	\N	\N	\N	\N	\N	\N	1	f	t
75	Libya - Benghazi	Political	32.100999999999999	20.103999999999999	2011-02-21 12:00:00	2011-05-24 12:00:00	2011-06-07 19:19:25.794683	\N	\N	\N	\N	\N	\N	\N	1	f	t
74	Libya - Zuetina	Political	30.952999999999999	20.120999999999999	2011-02-21 12:00:00	2011-05-24 12:00:00	2011-06-07 19:19:44.978684	\N	\N	\N	\N	\N	\N	\N	1	f	t
63	Bahrain Protests - Sakhir	Political	26.040099999999999	50.515999999999998	2011-02-18 12:00:00	2011-05-24 12:00:00	2011-06-07 19:20:00.387535	\N	\N	\N	\N	\N	\N	\N	1	f	t
79	Libya - Bardiyah	Political	31.7606	25.082999999999998	2011-02-21 12:00:00	2011-05-24 12:00:00	2011-06-07 19:20:26.065476	\N	\N	\N	\N	\N	\N	\N	1	f	t
78	Libya - Tubruq	Political	32.076999999999998	23.939	2011-02-21 12:00:00	2011-05-24 12:00:00	2011-06-07 19:20:45.142331	\N	\N	\N	\N	\N	\N	\N	1	f	t
81	Libya - Ghat	Political	24.956	10.183	2011-02-21 12:00:00	2011-05-24 12:00:00	2011-06-07 19:21:58.619393	\N	\N	\N	\N	\N	\N	\N	1	f	t
68	Libya - Sirte	Political	31.197500000000002	16.584	2011-02-21 12:00:00	2011-05-24 12:00:00	2011-06-07 19:22:40.846093	\N	\N	\N	\N	\N	\N	\N	1	f	t
80	Libya - Sabhah	Political	27.033000000000001	14.433	2011-02-21 12:00:00	2011-05-24 12:00:00	2011-06-07 19:23:08.338958	\N	\N	\N	\N	\N	\N	\N	1	f	t
61	Preah Vihear Temple	Political	14.401	104.672	2011-02-09 12:00:00	2011-05-24 12:00:00	2011-06-07 19:23:50.97986	\N	\N	\N	\N	\N	\N	\N	1	f	t
60	Egypt - Ismailya Protests	Political	30.59	32.264000000000003	2011-01-28 12:00:00	2011-05-24 12:00:00	2011-06-07 19:24:19.011656	\N	\N	\N	\N	\N	\N	\N	1	f	t
55	Egypt -Tarhir Square Cairo Protests	Political	30.039999999999999	31.222000000000001	2011-01-28 12:00:00	2011-05-24 12:00:00	2011-06-07 19:24:56.105261	\N	\N	\N	\N	\N	\N	\N	1	f	t
59	Egypt - Port Said Protests	Political	31.259	32.283999999999999	2011-01-28 12:00:00	2011-05-24 12:00:00	2011-06-07 19:25:52.400757	\N	\N	\N	\N	\N	\N	\N	1	f	t
56	Egypt - Cairo International 	Political	30.088000000000001	31.283000000000001	2011-01-28 12:00:00	2011-05-24 12:00:00	2011-06-07 19:26:14.339786	\N	\N	\N	\N	\N	\N	\N	1	f	t
57	Egypt - Alexandria Protests	Political	31.149000000000001	29.856000000000002	2011-01-28 12:00:00	2011-05-24 12:00:00	2011-06-07 19:27:10.339763	\N	\N	\N	\N	\N	\N	\N	1	f	t
54	Dalbandin Earthquake	Earthquake	28.867999999999999	64.405000000000001	2011-01-18 12:00:00	2011-05-24 12:00:00	2011-06-07 19:31:00.552318	\N	\N	\N	\N	\N	\N	\N	1	f	t
0	Tunisia Political Unrest	Political	36.802999999999997	10.156499999999999	2011-01-14 12:00:00	2011-05-24 12:00:00	2011-06-07 19:43:27.749655	\N	\N	\N	\N	\N	\N	\N	1	f	t
2	Queensland Flooding	Flood	-27.445	153.09999999999999	2011-01-04 12:00:00	2011-05-24 12:00:00	2011-06-07 19:54:22.433712	\N	\N	\N	\N	\N	\N	\N	1	f	t
410	Earthquake in Myanmar	A strong earthquake collapsed a bridge and damaged ancient Buddhist pagodas in northern Myanmar, and piecemeal reports from the underdeveloped mining region said mines collapsed and as many as 12 people were feared dead.	21.969875999999999	96.070017000000007	2012-11-12 22:21:00	2012-11-12 22:23:11.87293	2012-11-26 16:46:25.043524	http://www.huffingtonpost.com/huff-wires/20121112/as-myanmar-earthquake/	EQ-2012-000190-MMR	Yellow	16	2012-11-12 22:21:00	2012-11-22 22:21:00		4	f	t
412	Floods in England	Over 800 residences across England and Wales have been inundated as a barrage of rain and winds have pounded Britain.  The Prime Minister has vowed to assist communities in southwestern England and the Midlands, which are recuperating from floods.	51.016213999999998	-3.1054740000000001	2012-11-30 18:28:00	2012-11-30 18:57:57.22468	2012-11-30 19:15:58.657444	http://www.bbc.co.uk/news/uk-20488645		Orange	16	2012-11-30 18:28:00	2012-12-15 18:28:00		6	f	t
413	Tropical Cyclone Bopha	Tropical Cyclone Bopha gained strength Monday, becoming a super typhoon with sustained winds greater than 150 mph (240 kph) -- the equivalent of a Category 5 hurricane in the Atlantic Ocean.	7.4729999999999999	134.58099999999999	2012-12-03 17:58:00	2012-12-03 18:16:24.900826	2012-12-03 18:33:00.129992	http://www.cnn.com/2012/12/03/world/asia/philippines-typhoon/index.html	TC-2012-000197-FSM	Yellow	16	2012-12-03 17:58:00	2012-12-13 17:58:00		8	f	t
345	Ash Creek Fire, Montana	Weather conditions are shaping up to test firefighters Tuesday in southeast Montana as they continue to battle the Ash Creek Fire. The lightning-sparked wildfire has now burned an estimated 186,000 acres, and is about 55% contained as of Tuesday.	45.660082000000003	-106.227386	2012-07-03 21:25:00	2012-07-03 21:27:36.626046	2012-12-03 19:05:10.144996	http://www.kxlh.com/news/ash-creek-fire-in-se-montana-now-at-186k-acres/		Yellow	16	2012-07-03 21:25:00	2012-07-14 21:25:00		5	f	t
379	Wildfires in California	Nine major fires are currently burning across California.  Scott's Fire has burned  4,618 acres and threatens 300 homes.  1,300 firefighters simultaneously battle the Sixteen Complex fire.	39.144300000000001	-123.051	2012-09-10 20:53:00	2012-09-10 21:09:18.174348	2012-12-03 19:09:42.910502	http://www.thereporter.com/ci_21506732/red-flag-warning-issued-crews-continue-california-wildfire		Yellow	16	2012-09-10 20:53:00	2012-10-20 20:53:00		5	f	t
293	Cyclone Giovanna	A tropical cyclone has hit the island of Madagascar, with winds of up to 194km (120mph) ripping up trees and electricity pylons.	-18.941452999999999	47.516747000000002	2012-02-14 18:05:00	2012-02-14 18:09:13.216066	2012-12-03 19:14:26.019724	http://www.bbc.co.uk/news/world-africa-17025328	TC-2012-000020-MDG	Orange	16	2012-02-14 18:05:00	2012-02-24 18:05:00		8	f	t
285	Floods, Landslides in Philippines	Coastal communities were devastated early on Saturday in flash floods triggered by a tropical storm.\r\nMore than 650 people were killed and another 800 people are still missing.	8.2166669999999993	124.233333	2011-12-19 16:21:00	2011-12-19 16:46:42.559707	2012-12-03 19:16:45.295258	http://www.bbc.co.uk/news/world-asia-16239691	TC-2011-000189-PHL 	Orange	16	2011-12-19 16:21:00	2012-01-18 16:21:00		6	f	t
421	Floods in Mozambique	Mozambique has started to evacuate some 55,000 people after heavy rains caused sea levels to rise to dangerous levels in parts of the country, officials say. The worst affected areas are in the southern Gaza province.	-24.535039000000001	32.997582999999999	2013-01-22 16:22:00	2013-01-22 16:28:14.637252	2013-01-24 16:58:15.527964	http://www.bbc.co.uk/news/world-africa-21147928	FL-2013-000008-MOZ	Orange	16	2013-01-22 16:22:00	2013-02-07 16:22:00		6	f	t
408	Hurricane Sandy, East Coast USA	Shelters opened and tens of thousands of people were ordered to evacuate coastal areas as people across the Northeast prepare for Hurricane Sandy, which threatens 50 million people along the most heavily populated corridor in the nation.	39.957692000000002	-74.068342999999999	2012-10-28 16:10:00	2012-11-09 18:49:28.835785	2012-12-12 18:47:33.753515	http://www.weather.com/news/weather-hurricanes/hurricane-sandy-winter-storm-20121025		Red	16	2012-10-28 16:10:00	2012-11-28 18:47:00		8	t	t
414	Earthquake in Iran	A 5.5 magnitude earthquake hit Iran's Zohan district at 8:38 on Wednesday evening. Five villages were destroyed and at least 11 others damaged, according to Iran's crisis management organisation.	33.358913000000001	59.705872999999997	2012-12-06 17:32:00	2012-12-06 18:07:13.830223	2012-12-13 23:26:43.999507	http://news.sky.com/story/1021681/iran-earthquake-six-dead-as-buildings-flattened		Yellow	16	2012-12-06 17:32:00	2012-12-17 17:32:00		4	f	t
422	Queensland Flooding	Rain brought by Tropical Cyclone Oswald has caused major flooding in Queensland, Australia. Rescuers are trying to reach hundreds of people stranded in the city of Bundaberg and more than 200,000 people are without power across the state. 	-24.867153999999999	152.35548900000001	2013-01-28 17:32:00	2013-01-28 17:42:17.319306	2013-01-28 17:45:38.125267	http://www.bbc.co.uk/news/world-asia-21226178		Yellow	16	2013-01-28 17:32:00	2013-02-27 17:32:00		6	f	t
479	East Peak Fire, CO	The East Peak Fire has burned an estimated 9,100 acres. Around 26 people have been evacuated from the area.	37.429628999999998	-104.895886	2013-06-21 20:36:00	2013-06-21 20:37:55.761105	2013-06-21 20:37:55.761105	http://www.thedenverchannel.com/news/local-news/east-peak-fire-rapidly-grows-to-10000-acres-in-huerfano-county-8-or-9-buildings-destroyed		Yellow	16	2013-06-21 20:36:00	2013-07-02 20:36:00		5	f	t
436	Hugo Chavez State Funeral	Hugo Chavez, who led Venezuela for 14 years, died on Tuesday, March 5th aged 58 after a long battle with cancer. After the funeral, Mr Chavez's body will be taken to a military museum to lie in state for another seven days.	10.458651	-66.907381999999998	2013-03-12 17:36:00	2013-03-14 17:40:58.243285	2013-03-14 17:40:58.243285			Yellow	10	2013-03-12 17:36:00	2013-03-22 17:36:00		19	f	t
\.


--
-- Data for Name: icons; Type: TABLE DATA; Schema: flms; Owner: flms
--

COPY icons (id, name, thumbnail_file_name, thumbnail_content_type, thumbnail_file_size, thumbnail_updated_at, created_at, updated_at) FROM stdin;
1	Default	firstlook_generic_300px.png	image/png	5717	2012-07-30 22:20:06.092118	2012-07-30 22:20:07.496894	2012-07-30 22:20:07.496894
2	Airshow	firstlook_aircraft_300px.png	image/png	9467	2012-07-30 22:25:43.380976	2012-07-30 22:25:43.615804	2012-07-30 22:25:43.615804
3	Drought	firstlook_drought_300px.png	image/png	10460	2012-07-30 22:26:01.845324	2012-07-30 22:26:02.074543	2012-07-30 22:26:02.074543
4	Earthquake	firstlook_earthquake_300px.png	image/png	22750	2012-07-30 22:26:22.812012	2012-07-30 22:26:23.160271	2012-07-30 22:26:23.160271
5	Fire	firstlook_fire_300px.png	image/png	13037	2012-07-30 22:26:34.480075	2012-07-30 22:26:34.701864	2012-07-30 22:26:34.701864
6	Flood	firstlook_flood_300px.png	image/png	16835	2012-07-30 22:26:46.009919	2012-07-30 22:26:46.23084	2012-07-30 22:26:46.23084
7	Political Gathering	firstlook_gathering_300px.png	image/png	5685	2012-07-30 22:27:11.655237	2012-07-30 22:27:11.875388	2012-07-30 22:27:11.875388
8	Hurricane	firstlook_hurricane_300px.png	image/png	22377	2012-07-30 22:27:30.468552	2012-07-30 22:27:31.185385	2012-07-30 22:27:31.185385
9	Protest	firstlook_protest_300px.png	image/png	23700	2012-07-30 22:27:45.669321	2012-07-30 22:27:45.912051	2012-07-30 22:27:45.912051
10	Rain	firstlook_rain_300px.png	image/png	30892	2012-07-30 22:28:06.30667	2012-07-30 22:28:06.545759	2012-07-30 22:28:06.545759
11	Ship Wreck	firstlook_shipwreck_300px.png	image/png	7355	2012-07-30 22:28:20.31194	2012-07-30 22:28:20.540307	2012-07-30 22:28:20.540307
12	Snow	firstlook_snow_300px.png	image/png	22220	2012-07-30 22:28:30.692735	2012-07-30 22:28:30.920659	2012-07-30 22:28:30.920659
13	Tornado	firstlook_tornado_300px.png	image/png	23987	2012-07-30 22:28:45.002069	2012-07-30 22:28:46.110126	2012-07-30 22:28:46.110126
14	Tsunami	firstlook_tsunami_300px.png	image/png	23113	2012-07-30 22:29:01.72148	2012-07-30 22:29:01.952417	2012-07-30 22:29:01.952417
15	Political Unrest	firstlook_unrest_300px.png	image/png	26245	2012-07-30 22:29:23.218537	2012-07-30 22:29:23.45134	2012-07-30 22:29:23.45134
16	Volcanic Eruption	firstlook_volcanic_300px.png	image/png	25746	2012-07-30 22:29:42.528826	2012-07-30 22:29:42.768605	2012-07-30 22:29:42.768605
17	Natural Disaster (Default)	cat_natural_dis.png	image/png	2078	2012-07-31 17:26:45.839918	2012-07-31 17:26:46.084714	2012-07-31 17:26:46.084714
18	Human Interest (Default)	cat_human_in.png	image/png	1130	2012-07-31 17:27:08.139012	2012-07-31 17:27:08.338404	2012-07-31 17:27:08.338404
19	Political Instability (Default)	cat_political.png	image/png	1887	2012-07-31 17:27:54.344415	2012-07-31 17:27:54.554265	2012-07-31 17:27:54.554265
20	Man-Made Crisis (Default)	cat_manmade.png	image/png	2378	2012-07-31 17:28:21.373477	2012-07-31 17:28:21.591485	2012-07-31 17:28:21.591485
\.


--
-- Data for Name: point_of_interests; Type: TABLE DATA; Schema: flms; Owner: flms
--

COPY point_of_interests (id, event_id, name, description, latitude, longitude, created_at, updated_at) FROM stdin;
3	244	Homs	Corridor between Homs and Ar Rastan	34.812899999999999	36.722200000000001	2011-08-09 18:14:59.057262	2011-08-09 18:14:59.057262
4	244	Hamah	Hamah and surrounding area	35.198399999999999	36.739199999999997	2011-08-09 18:15:43.333381	2011-08-09 18:15:43.333381
5	244	Deraa	Deraa/Daraa: flashpoint of March protests	32.622999999999998	36.104500000000002	2011-08-09 18:16:53.949059	2011-08-09 18:16:53.949059
6	244	Damascus	Protests in the suburbs	33.512	36.314100000000003	2011-08-09 18:17:52.337501	2011-08-09 18:17:52.337501
7	244	Jisr Ash-Shighur	Brutal crackdown in June	35.814	36.319000000000003	2011-08-09 18:18:37.062617	2011-08-09 18:18:37.062617
8	244	Deir ez-Zor	Reports of 200 tanks entering the town	35.340400000000002	40.158999999999999	2011-08-09 18:21:20.305134	2011-08-09 18:21:20.305134
9	244	Latakia	Protesters in the port city of Latakia came under attack from gun boats and tanks. An estimated 20 people have been killed.	35.521000000000001	35.792000000000002	2011-08-15 20:19:43.829113	2011-08-15 20:19:43.829113
10	246	Bokolmanyo	Bokolmanyo is a refugee camp in Ethiopia. Designed to hold 20,000 people, it is now estimated to hold twice that number	4.5410000000000004	41.543999999999997	2011-08-16 21:29:38.634461	2011-08-16 21:29:38.634461
11	246	Kobe	The Kobe refugee camp in Ethiopia houses many of the estimated 120,000 Somali refugees in search of aid.	4.4880000000000004	41.744999999999997	2011-08-16 21:32:18.61659	2011-08-16 21:32:18.61659
12	246	Melkadida	Melkadida is a refugee camp in Ethiopia. The UNHCR estimates that 2,000 refugees arrive daily to camps in Ethiopia and Kenya.	4.5270000000000001	41.703000000000003	2011-08-16 21:34:15.685331	2011-08-16 21:34:15.685331
13	246	Dolo	Dolo, just across the border from Somalia in eastern Ethiopia, is part of the Dolo Ado refugee complex. A fourth camp is under construction and would house up 40,000 refugees.	4.1769999999999996	42.0535	2011-08-16 21:37:21.955145	2011-08-16 21:37:21.955145
14	246	Dadaab	Dadaab in Kenya is the UNHCR's base serving the refugee camps of Hagadera, Ifo and Dagahaley. Originally built to house an estimated 90,000 people, it now holds over 400,000.	0.095049999999999996	40.334099999999999	2011-08-16 21:40:41.074541	2011-08-16 21:40:41.074541
15	246	Mogadishu	As the capital of Somalia, hundreds of thousands of refugees are making their way to Mogadishu despite the uncertain political situation. Al-Shabaab has reportedly withdrawn from much of the city, which will hopefully improve the distribution of aid.	2.0442	45.338000000000001	2011-08-16 21:44:02.807947	2011-08-16 21:44:02.807947
16	246	Afgooye	A short distance from Mogadishu, Afgooye has become a second refugee capital within Somalia.	2.1059999999999999	45.195	2011-08-16 21:46:23.54091	2011-08-16 21:46:23.54091
17	246	Juba Valley	Once a "bread basket" of Somalia, the Juba Valley has always been badly hit by the famine.	0.061800000000000001	42.701999999999998	2011-08-16 21:49:21.371165	2011-08-16 21:49:21.371165
18	246	Kismayo	A port city in southern Somalia, Kismayo has a port and airport that could be used in the distribution of aid. However, Somalia's second city is controlled by Al-Shabaab.	-0.37009999999999998	42.502000000000002	2011-08-16 21:51:33.67188	2011-08-16 21:51:33.67188
19	246	Wajid	Wajid, Somalia has be badly hit by the famine. Al_Shabaab was rumored to be both bringing aid and preventing the population from leaving.	3.823	43.244999999999997	2011-08-16 21:56:00.324569	2011-08-16 21:56:00.324569
20	246	Wajir	Wajid, Kenya has been badly impacted by the famine. The World Bank believes the population is particularly vulnerable due to skyrocketing food prices.	1.734	40.093000000000004	2011-08-16 21:59:45.060529	2011-08-16 21:59:45.060529
21	256	Hodde Fire	The Hodde Fire in Pflugerville is now more than 200 acres and only "minimally contained," according to officials.	30.457000000000001	-97.555000000000007	2011-09-06 17:16:10.773206	2011-09-06 17:16:10.773206
204	388	Rudraprayag	Affect Area	30.285492999999999	78.980885000000001	2012-09-17 19:05:47.6861	2012-09-17 19:05:47.6861
23	256	Union Chapel Fire	The Union Chapel Fire west of Bastrop has charred as estimated 750 acres.	30.132999999999999	-97.457999999999998	2011-09-06 17:21:27.914465	2011-09-06 17:21:27.914465
24	256	Bastrop County Complex	The Bastrop County Complex of fires is now close to 30,000 acres in size and is only miles away from the city limits.	30.154	-97.222999999999999	2011-09-06 17:23:43.522615	2011-09-06 17:23:43.522615
26	256	Lutherhill Fire	The Lutherhill Fire has burned 2,000 acres and forced the evacuation of Ruttersville.\n	30.003	-96.837000000000003	2011-09-06 17:29:41.257535	2011-09-06 17:29:41.257535
197	366	New Orleans Flooding	Flooded areas	29.867999999999999	-89.954999999999998	2012-09-11 19:22:39.358533	2012-09-11 19:38:34.013622
28	256	101 Ranch Fire	In Possum Kingdom the 101 Ranch fire is now 85% contained after destroying 39 homes.	32.779000000000003	-98.441999999999993	2011-09-06 17:35:05.971297	2011-09-06 17:35:05.971297
212	394	The McGuire Fire Complex	5% contained with 41,702 acres burned	45.624000000000002	-115.5	2012-09-25 18:21:43.615346	2012-09-25 18:21:43.615346
30	256	Picket Run Fire	South of Bowie, the Picket Run Fire has burned over 1,100 acres but is now 90% contained.	33.456000000000003	-97.849999999999994	2011-09-06 17:40:45.080018	2011-09-06 17:40:45.080018
31	256	Naylor Fire	Near Sherman, the Naylor Fire has burned 1,000 acres and has threatened residential areas.	33.679000000000002	-96.710999999999999	2011-09-06 17:46:51.642344	2011-09-06 17:46:51.642344
32	258	Tripoli	The Libyan capital saw fierce fighting in recent weeks as opposition fighters rooted out Gaddafi loyalists, forcing the Gaddafi family to flee.	32.872	13.1731	2011-09-09 17:08:51.420856	2011-09-09 17:08:51.420856
33	258	Sirte	The birthplace of Gaddafi and a loyalist stronghold. There are reports of Scud missiles being fired from the Ghurdabiyah airbase south of town.	31.186	16.588999999999999	2011-09-09 17:13:39.594122	2011-09-09 17:13:39.594122
34	258	Bani Walid	A stronghold of tribal support for Gaddafi, opposition fighters have the city surrounded and are negotiating a peaceful surrender.	31.7502	14.025700000000001	2011-09-09 17:16:56.837689	2011-09-09 17:16:56.837689
35	258	As Sidr	Site of a key oil facility on the Libyan coast.	30.608000000000001	18.282	2011-09-09 17:18:30.026388	2011-09-09 17:18:30.026388
36	258	Ras Lanuf	Site of key oil infrastructure including an export terminal. 	30.478999999999999	18.570599999999999	2011-09-09 17:24:53.858821	2011-09-09 17:24:53.858821
37	258	Marsa al Brega	Site of key oil infrastructure including an export terminal.	30.4099	19.609400000000001	2011-09-09 17:26:53.884463	2011-09-09 17:26:53.884463
38	258	Sabha	A stronghold of Gaddafi support, Sabha is home to a weapons strorage area that was destroyed by NATO air strikes. As part of the Great Man-Made River pipeline Sabha supplies water to Tripoli.	27.062999999999999	14.4552	2011-09-09 17:30:19.833923	2011-09-09 17:30:19.833923
39	258	Waddan	Home to numerous weapon storage areas, a stockpile of mustard gas is reportedly stored near Waddan. NATO has carried out many air strikes in the vicinity in recent weeks.	29.2256	16.248999999999999	2011-09-09 17:32:36.166941	2011-09-09 17:32:36.166941
40	258	Zawiya	West of Tripoli on the Libyan Coast, Zawiya is home to a key oil refinery.	32.787999999999997	12.702999999999999	2011-09-09 17:33:56.766372	2011-09-09 17:33:56.766372
213	394	Wesley Fire	32% contained with 15,233 acres burned	45.127000000000002	-116.494	2012-09-25 18:22:45.232827	2012-09-25 18:22:45.232827
42	258	Misrata	A major port city on the Libyan coast east of Tripoli, Misrata was under siege for months before opposition fighters were able to secure the city.	32.363999999999997	15.218	2011-09-09 17:41:09.417512	2011-09-09 17:41:09.417512
214	394	Sheep Fire	40% contained with 47,228 acres burned.	45.569000000000003	-116.20699999999999	2012-09-25 18:23:28.252109	2012-09-25 18:23:28.252109
205	388	Kimana	Affected Area: Landslides	30.467745000000001	79.101382000000001	2012-09-17 19:06:22.678892	2012-09-27 22:47:45.360035
249	410	Mandalay	affected area	22.004574999999999	96.112848	2012-11-12 22:24:13.608472	2012-12-13 23:58:02.320729
43	258	Tarhunah	Tarhunah is reportedly home to an underground WMD facility.	32.472000000000001	13.429	2011-09-09 17:42:32.457316	2011-09-09 17:42:32.457316
44	261	Sana'a	University students began protesting in Yemen's capital in the Spring where they have been living in makeshift camps in the streets. Dozens have been killed in the past few days as government authorities crackdown on the protest movement.	15.3649	44.189300000000003	2011-09-20 18:26:29.296211	2011-09-20 18:26:29.296211
45	261	Ta'izz	Ta'izz is Yemen's 3rd largest city and has been the scene of violent protests.	13.5771	44.012900000000002	2011-09-20 18:29:02.715794	2011-09-20 18:29:02.715794
46	261	Aden	Home to Yemen's strategic port, Aden has seen anti-government protests in recent days along with the bombings of some government buildings.	12.7987	45.036099999999998	2011-09-20 18:41:22.644479	2011-09-20 18:41:22.644479
47	261	Zinjibar	Government forces have been struggling to contain militancy in the Zinjibar area.	13.1302	45.378999999999998	2011-09-20 18:44:44.448934	2011-09-20 18:44:44.448934
48	261	Dhamar	Dhamar has been home to mass demonstrations in recent days despite renewed efforts by the government to crackdown on protesters.	14.545999999999999	44.401000000000003	2011-09-20 18:47:35.697823	2011-09-20 18:47:35.697823
49	261	Al Hudaydah	On the western coast of Yemen, Al Hudaydah has been the seen of clashes between pro- and anti-government demonstrators.	14.8055	42.950299999999999	2011-09-20 18:51:39.310289	2011-09-20 18:51:39.310289
50	261	Al Mukalla	Reports suggest that Al-Qaeda in the Arabian Peninsula (AQAP) has been active in the area of Al Mukalla. Dozens of militants escaped from a prison there last week.	14.552	49.127000000000002	2011-09-20 19:35:21.584547	2011-09-20 19:35:21.584547
51	261	Marib	The governor of the Marib province escaped assassination last week amid growing protests and violence. Tribesmen in the area are reportedly attacking power lines at the 400-kilvolt power plant, causing black outs in Sana'a. 	15.463699999999999	45.327199999999998	2011-09-20 19:43:27.927946	2011-09-20 19:43:27.927946
52	261	Saada	Saada has been the scene of violent protests against the government. Tribesmen in the area are reported to be arming themselves for an assault on government forces.	16.9405	43.764000000000003	2011-09-20 19:47:52.586317	2011-09-20 19:47:52.586317
53	268	Rena	Location of the cargo vessel: Rena	-37.540619	176.42920000000001	2011-10-11 22:12:17.448894	2011-10-11 22:12:17.448894
54	268	Mount Maunganui Shore	Reports of washed up oil clumps	-37.631583999999997	176.179225	2011-10-11 22:15:43.372434	2011-10-11 22:15:43.372434
55	268	Motiti Island	Reports of oiled penguins washed up on shore	-37.625058000000003	176.41204099999999	2011-10-11 22:23:33.150541	2011-10-11 22:23:33.150541
56	268	Papamoa Beach	Expected area affected by oil	-37.695732	176.286047	2011-10-11 22:31:02.801935	2011-10-11 22:31:02.801935
57	270	Battambang	High risk flooding area	13.104893000000001	103.19458	2011-10-12 22:14:12.230568	2011-10-12 22:14:12.230568
58	270	Tonle Sap River	High risk flooding area	11.816948999999999	104.80407700000001	2011-10-12 22:15:02.275133	2011-10-12 22:15:02.275133
59	270	Mekong River	High risk flooding area	11.786030999999999	105.015564	2011-10-12 22:15:39.270436	2011-10-12 22:15:39.270436
60	270	Phnom Penh	High risk flooding area, Capital City	11.568835	104.90570099999999	2011-10-12 22:16:30.025413	2011-10-12 22:16:30.025413
61	270	Cambodia-Vietnam Border	High risk flooding area	10.909167	105.08182499999999	2011-10-12 22:16:58.469468	2011-10-12 22:16:58.469468
62	275	Van 	City with significant damage from the earthquake	38.510800000000003	43.375100000000003	2011-10-27 23:40:17.943624	2011-10-27 23:40:17.943624
63	275	Ercis	City with significant damage from the earthquake.	39.074399999999997	43.328200000000002	2011-10-27 23:41:17.300575	2011-10-27 23:41:17.300575
64	277	Beles Quooqaani	Reported position of Kenyan forces preparing to attack al-Shabaab militants in Afmadow.	0.31900000000000001	41.744999999999997	2011-10-31 18:09:30.34018	2011-10-31 18:09:30.34018
65	277	Jilib	12 people were reportedly killed when Kenyan jets bombed an al-Shabaab base in the Somali town of Jilib on October 30th. An IDP camp was hit as well, according to local elders.	0.49199999999999999	42.778199999999998	2011-10-31 18:13:12.30535	2011-10-31 18:13:12.30535
66	284	Daraa	City with frequent demonstrations	32.625261999999999	36.106675000000003	2011-12-06 17:59:25.871725	2011-12-06 17:59:25.871725
67	284	Hama	City with frequent demonstrations\n	35.137300000000003	36.753838000000002	2011-12-06 17:59:55.022429	2011-12-06 17:59:55.022429
83	296	Belo Tsiribihina	Affected area	-19.643073000000001	44.575138000000003	2012-03-02 19:24:34.019948	2012-03-12 19:05:42.784961
69	284	Latakia	City with frequent demonstrations\n	35.535631000000002	35.807200999999999	2011-12-06 18:00:58.696816	2011-12-06 18:00:58.696816
70	285	Iligan 	City heavily impaced by floods and landslides	8.2166669999999993	124.233333	2011-12-19 16:49:46.172209	2011-12-19 16:49:46.172209
71	285	Cagayan de Oro	City heavily impaced by floods and landslides	8.4570270000000001	124.632189	2011-12-19 16:50:42.150583	2011-12-19 16:50:42.150583
72	286	Brazil flooding - Campos	66 towns and cities in the state of Minas Gerais have been hit with flooding and landslides. Campos de Goytacazes is among the worst hit due to the rupture of a local dam.	-21.754000000000001	-41.323999999999998	2012-01-09 21:24:32.999831	2012-01-09 21:24:32.999831
73	286	Brazil flooding - Belo Horizonte	Heavy rains have led to flooding and landslides in the city of Belo Horizonte.	-19.919	-43.939	2012-01-09 21:26:01.910825	2012-01-09 21:26:01.910825
74	293	Toamasina	Heavily impacted area	-18.149999999999999	49.416666999999997	2012-02-14 18:11:20.630465	2012-02-14 18:11:20.630465
309	432	Sakaraka	Affected Area	-22.914021999999999	44.531579000000001	2013-02-25 17:40:05.340714	2013-02-25 17:40:05.340714
76	293	Vatomandry 	Heavily impacted area.	-19.330583000000001	48.977051000000003	2012-02-14 18:13:49.741722	2012-02-14 18:13:49.741722
77	293	Brickaville 	Heavily impacted area	-18.819216999999998	49.063910999999997	2012-02-14 18:14:59.257401	2012-02-14 18:14:59.257401
68	284	Homs	City with frequent demonstrations\n	34.704434999999997	36.678435999999998	2011-12-06 18:00:26.577499	2012-02-15 17:14:12.613172
79	294	Puno	Flooded areas	-15.838169000000001	-70.022391999999996	2012-02-21 22:36:52.85873	2012-02-21 22:36:52.85873
80	294	Juliaca	Flooded areas	-15.471549	-70.129165999999998	2012-02-21 22:38:46.477129	2012-02-21 22:38:46.477129
81	294	Cuzco	Flooded areas	-13.526183	-71.964568999999997	2012-02-21 22:39:46.933054	2012-02-21 22:39:46.933054
78	294	Ilave District	Flooded areas	-16.059176000000001	-69.656238999999999	2012-02-21 22:35:59.2333	2012-02-28 20:33:53.261612
104	312	Chabu town - Minxian	Significantly affected area	34.462516000000001	104.069688	2012-05-14 14:54:53.208854	2012-05-14 14:54:53.208854
206	389	Quito	Affected Area	-0.28555799999999998	-78.627520000000004	2012-09-17 19:13:44.747004	2012-09-17 19:13:44.747004
207	389	Chilla Canton	Affected Area	-3.4970050000000001	-79.589198999999994	2012-09-17 19:14:26.580873	2012-09-17 19:14:26.580873
87	297	Harveyville	area affected	38.790284999999997	-95.962142999999998	2012-03-03 00:03:21.605067	2012-03-03 00:03:21.605067
88	297	Harrisburg	affected area	39.141776999999998	-92.462997000000001	2012-03-03 00:05:04.157631	2012-03-03 00:05:04.157631
89	297	Branson	affected area	36.646385000000002	-93.223456999999996	2012-03-03 00:05:50.850401	2012-03-03 00:05:50.850401
90	297	Lebanon	affected area	37.681783000000003	-92.663669999999996	2012-03-03 00:06:41.097259	2012-03-03 00:06:41.097259
91	297	Athens-Huntsville	affected area	34.772075999999998	-86.827697999999998	2012-03-03 00:07:34.650914	2012-03-03 00:07:34.650914
92	297	Henryville-Jeffersonville	affected area	38.457889999999999	-85.766143999999997	2012-03-03 00:08:57.261687	2012-03-03 00:08:57.261687
93	297	St. Paul	affected area	39.428668999999999	-85.629416000000006	2012-03-03 00:10:20.966667	2012-03-03 00:10:20.966667
82	296	Maintirano	Affected area	-18.070574000000001	44.018818000000003	2012-03-02 19:23:58.341707	2012-03-09 17:33:32.152014
84	296	Morondava	affected area	-20.329919	44.25235	2012-03-02 19:25:08.553069	2012-03-09 17:37:19.280987
85	296	Morombe	affected area	-21.743907	43.363999999999997	2012-03-02 19:25:48.606947	2012-03-09 17:39:03.469296
86	296	Toliara	affected area	-23.370149999999999	43.676169000000002	2012-03-02 19:26:27.791712	2012-03-09 17:47:45.548626
94	299	Babahoyo	flooded area	-1.8852739999999999	-79.620924000000002	2012-03-09 20:44:21.96364	2012-03-09 20:44:21.96364
95	299	Balao	flooded area	-2.903953	-79.705466999999999	2012-03-09 20:45:09.875573	2012-03-09 20:45:09.875573
96	299	Machala	flooded area	-3.261863	-79.958838999999998	2012-03-09 20:45:41.662903	2012-03-09 20:45:41.662903
97	301	Pinotepa Nacional	area with signficant damage	16.344355	-98.058385999999999	2012-03-22 23:21:01.233483	2012-03-22 23:21:01.233483
98	309	Puerto Casedo	affected area	-22.286873	-57.942753000000003	2012-05-01 17:13:47.652279	2012-05-01 17:13:47.652279
99	309	Pinasco	affected area	-22.646135999999998	-57.840828999999999	2012-05-01 17:14:15.144808	2012-05-01 17:14:15.144808
100	309	Teniente Esteban Martinez	affected area	-24.082906000000001	-59.804248999999999	2012-05-01 17:14:42.13837	2012-05-01 17:14:42.13837
101	309	Villa Choferes del Chaco	affected area	-22.471399000000002	-60.054273999999999	2012-05-01 17:15:10.713808	2012-05-01 17:15:10.713808
102	309	Tte. Manuel Irala Fernandez-Cruce Pioneros	affected area	-22.617972000000002	-59.796610000000001	2012-05-01 17:15:40.474213	2012-05-01 17:15:40.474213
103	309	Cacique Sapo	affected area	-23.578620000000001	-60.580844999999997	2012-05-01 17:16:13.375419	2012-05-01 17:16:13.375419
107	313	Hewlett Fire, CO	affected area	40.687800000000003	-105.3104	2012-05-17 17:28:28.646444	2012-05-17 17:28:28.646444
108	313	Gladiator Fire, AZ	affected area	34.227400000000003	-112.3202	2012-05-17 17:29:54.905826	2012-05-17 17:29:54.905826
109	313	Sunflower Fire, AZ	affected area	33.951126000000002	-111.489592	2012-05-17 17:32:42.146846	2012-05-17 17:32:42.146846
110	313	Bull Flat Fire, AZ	affected area	34.230499999999999	-110.78355000000001	2012-05-17 17:33:52.240475	2012-05-17 17:33:52.240475
111	252	Killington, VT	severely affected area	43.664470000000001	-72.793521999999996	2012-05-22 15:04:20.849554	2012-05-22 15:04:20.849554
262	411	Fonteblanda	Flooding near Fonteblanda	42.576472000000003	11.155842	2012-12-14 17:00:42.498625	2012-12-14 17:00:42.498625
113	269	Don Muang International Airport	flooded area	13.91399	100.603437	2012-06-05 16:02:57.826347	2012-06-05 16:02:57.826347
114	269	Rojana Industrial Estate	flooded area	14.335328000000001	100.639315	2012-06-05 16:14:51.348818	2012-06-05 16:14:51.348818
115	326	Poznań	Venue for EURO 2012	52.397678999999997	16.858134	2012-06-08 15:17:45.928306	2012-06-08 15:17:45.928306
116	326	Warsaw	Venue for EURO 2012	52.239443999999999	21.045556000000001	2012-06-08 15:18:32.749006	2012-06-08 15:18:32.749006
117	326	Gdańsk	Venue for EURO 2012	54.391111000000002	18.640556	2012-06-08 15:19:09.163354	2012-06-08 15:19:09.163354
118	326	Wrocław	Venue for EURO 2012	51.141111000000002	16.943332999999999	2012-06-08 15:19:42.704702	2012-06-08 15:19:42.704702
119	326	Kiev	Venue for EURO 2012	50.433140000000002	30.520599000000001	2012-06-08 15:20:16.239997	2012-06-08 15:20:16.239997
120	326	Donetsk	Venue for EURO 2012	48.021075000000003	37.810178000000001	2012-06-08 15:20:50.317066	2012-06-08 15:20:50.317066
121	326	Kharkiv	Venue for EURO 2012	49.980742999999997	36.261792	2012-06-08 15:21:36.881001	2012-06-08 15:21:36.881001
122	326	Lviv	Venue for EURO 2012	49.775638000000001	24.027871999999999	2012-06-08 15:22:04.174716	2012-06-08 15:22:04.174716
123	331	Taipei	affected area	25.050146999999999	121.49711600000001	2012-06-13 18:56:31.682894	2012-06-13 18:56:31.682894
124	331	Taoyuan Airport	affected area	25.080002	121.233101	2012-06-13 18:57:17.173545	2012-06-13 18:57:17.173545
125	331	Lishan	affected area	24.261362999999999	121.24683400000001	2012-06-13 18:58:34.280237	2012-06-13 18:58:34.280237
126	331	Lushan	affected area	24.028592	121.15585299999999	2012-06-13 18:59:22.009224	2012-06-13 18:59:22.009224
127	331	Taoyuan-Namasia, Kaohsiung	affected area	23.233025999999999	120.781138	2012-06-13 19:02:12.50088	2012-06-13 19:02:12.50088
129	343	Shuswap Lake	flooded area	50.949235000000002	-119.26225700000001	2012-06-25 19:39:27.062086	2012-06-25 19:39:27.062086
238	407	Quetzaltenango	Affected area	14.852	-91.524000000000001	2012-11-07 23:50:19.559395	2012-11-07 23:50:19.559395
131	344	Barpeta - Nagarbera	flooded area	26.192643	91.022243000000003	2012-06-29 17:15:01.172672	2012-06-29 17:15:01.172672
132	344	Guwahati	Capital of Assam	26.146937000000001	91.784479000000005	2012-06-29 17:16:04.184024	2012-06-29 17:16:04.184024
133	344	Pabitora Wildlife Sanctuary	flooded area	26.229336	92.136734000000004	2012-06-29 17:17:40.723561	2012-06-29 17:17:40.723561
134	344	Majuli Island	flooded area	26.929617	94.017583999999999	2012-06-29 17:18:50.001769	2012-06-29 17:18:50.001769
135	344	Kaziranga National Park	flooded area	26.693722000000001	93.541518999999994	2012-06-29 17:19:50.71686	2012-06-29 17:19:50.71686
136	344	Tezpur	flooded area	26.682044000000001	92.795199999999994	2012-06-29 18:08:53.54411	2012-06-29 18:08:53.54411
137	348	Taishan	affected area	22.244854	112.78899199999999	2012-07-25 15:54:22.977725	2012-07-25 15:54:22.977725
138	348	Hong Kong	affected area	22.303142999999999	114.1883	2012-07-25 15:58:15.254421	2012-07-25 15:58:15.254421
139	348	Nanning	affected area	22.817326999999999	108.30940200000001	2012-07-25 16:00:15.152277	2012-07-25 16:00:15.152277
265	415	Futuna Island	Affected Area	-14.297000000000001	-178.09700000000001	2012-12-17 16:59:01.905181	2012-12-17 16:59:01.905181
141	351	Hockey Centre	Hockey	51.5471	-0.013919000000000001	2012-07-27 16:45:31.979526	2012-07-27 16:45:31.979526
273	415	Samoa, Mulivai	Damaged Structures and Storm Debris	-14.005005000000001	-171.80167299999999	2012-12-20 17:50:14.450664	2012-12-20 17:50:14.450664
266	415	Samoa, Si'umu	Extensive Storm Damage and Debris	-14.011520000000001	-171.77961300000001	2012-12-17 16:59:49.690208	2012-12-20 16:21:12.897335
274	415	Samoa, Tafitoala	Demolished structures and storm damage	-14.007934000000001	-171.81398999999999	2012-12-20 17:54:55.882433	2012-12-20 17:54:55.882433
276	416	Nacokaiko	Flooded farmlands South East of Nacokaiko	-17.980689000000002	178.43393900000001	2012-12-20 18:52:35.028972	2012-12-20 18:52:35.028972
284	415	Landslide in Apia	Massive landslide in Samoa capital, Apia, near Lelata.	-13.843582	-171.75672299999999	2013-01-11 16:31:38.020645	2013-01-11 16:31:38.020645
280	417	Boomer Bay	Burned structures	-42.872007000000004	147.82787099999999	2013-01-07 20:07:35.632603	2013-01-08 17:14:40.552221
148	351	Royal Artillery Barracks	Shooting	51.484591000000002	0.060031000000000001	2012-07-27 16:49:46.486469	2012-07-27 16:49:46.486469
149	351	Horse Guards Parade	Volleyball (Beach)	51.505177000000003	-0.127805	2012-07-27 16:51:02.248911	2012-07-27 16:51:02.248911
150	351	Hyde Park	Triathlon	51.509436999999998	-0.167043	2012-07-27 16:51:54.029578	2012-07-27 16:51:54.029578
151	351	Lords Cricket Ground	Archery	51.530594000000001	-0.17255499999999999	2012-07-27 16:56:29.230422	2012-07-27 16:56:29.230422
152	351	Regents Park	Cycling (Road)	51.532812999999997	-0.15615200000000001	2012-07-27 16:57:00.790328	2012-07-27 16:57:00.790328
153	351	Wembley Park	Football	51.555655000000002	-0.28186800000000001	2012-07-27 16:59:08.05597	2012-07-27 16:59:08.05597
154	351	Wimbledon	Tennis	51.434072	-0.212612	2012-07-27 16:59:33.129541	2012-07-27 16:59:33.129541
297	423	Cairo	Site of protests	30.065000000000001	31.266999999999999	2013-01-30 16:22:59.649314	2013-01-30 16:22:59.649314
156	352	Sansha	affected area	26.926815000000001	120.21317500000001	2012-07-30 16:07:35.269869	2012-07-30 16:07:35.269869
157	352	Wenzhou	affected area	28.003799000000001	120.690994	2012-07-30 16:08:23.017653	2012-07-30 16:08:23.017653
158	352	Taipei	affected area	25.047035999999999	121.50535600000001	2012-07-30 16:09:25.985108	2012-07-30 16:09:25.985108
130	343	Sicamous	flooded area	50.884	-118.919	2012-06-25 19:40:20.372902	2012-09-12 21:30:11.094644
239	407	San Pedro Sacatepequez	Affected areas	14.965	-91.787999999999997	2012-11-07 23:51:16.025961	2012-11-07 23:51:16.025961
161	359	Heris	affected area	38.246943999999999	47.116413000000001	2012-08-13 14:13:54.393769	2012-08-13 14:13:54.393769
162	360	Tenes	affected area	36.523955999999998	1.347094	2012-08-16 20:20:34.839069	2012-08-16 20:20:34.839069
163	360	Miliana	affected area\n	36.314678000000001	2.3082630000000002	2012-08-16 20:20:53.632383	2012-08-16 20:20:53.632383
291	421	Inhambane	Flood affected area	-23.865341000000001	35.385916000000002	2013-01-22 16:33:28.854225	2013-01-24 16:56:49.99922
164	360	Bou Medfaa	affected area\n	36.419344000000002	2.5297420000000002	2012-08-16 20:21:11.381234	2012-08-16 20:21:11.381234
165	360	Tuvirett	affected area\n	36.399039999999999	3.8731960000000001	2012-08-16 20:21:30.799492	2012-08-16 20:21:30.799492
166	360	Azazga	affected area\n	36.758707999999999	4.4228230000000002	2012-08-16 20:21:48.336241	2012-08-16 20:21:48.336241
167	360	Souk Ahras	affected area\n	36.255853999999999	7.9416989999999998	2012-08-16 20:22:09.266025	2012-08-16 20:22:09.266025
168	361	Fangchenggang	affected area	21.729603000000001	108.359039	2012-08-20 21:07:39.413268	2012-08-20 21:07:39.413268
169	361	Beihai	affected area	21.456564	109.123544	2012-08-20 21:08:01.262092	2012-08-20 21:08:01.262092
170	361	Qinzhou	affected area	21.973614000000001	108.629723	2012-08-20 21:08:24.317166	2012-08-20 21:08:24.317166
195	380	Sheep Fire	Affected area: Near Lucile, Idaho.  Active  fires on September 13th.	45.527794999999998	-116.215846	2012-09-10 21:36:41.46038	2012-09-28 18:47:18.919892
172	362	Kaohsiung	affected area	22.648425	120.32226	2012-08-20 21:09:15.395863	2012-08-20 21:09:15.395863
173	362	Tainan	affected area	22.981152999999999	120.211557	2012-08-20 21:09:41.545187	2012-08-20 21:09:41.545187
174	362	Xiamen	affected area	24.490995000000002	118.107437	2012-08-20 21:10:11.380997	2012-08-20 21:10:11.380997
128	331	Sandimen-Meinong, Kaohsiung	affected area	22.824999999999999	120.601	2012-06-13 19:03:59.395799	2012-09-12 21:52:33.861497
105	312	Puma town	Significantly affected area	34.500999999999998	104.393	2012-05-14 14:55:51.899044	2012-09-12 22:40:58.568324
256	413	Compostela Valley	Affected area	7.5949999999999998	126.108	2012-12-06 17:20:51.962557	2012-12-06 17:20:51.962557
240	407	Coatepeque	Affected area	14.702	-91.863	2012-11-07 23:51:49.662998	2012-11-07 23:51:49.662998
179	370	Dosso	affected area	13.047025	3.2002510000000002	2012-08-28 19:22:18.905888	2012-08-28 19:22:18.905888
180	370	Agadez	affected area	16.972038000000001	7.9899440000000004	2012-08-28 19:22:38.102975	2012-08-28 19:22:38.102975
181	371	Seoul	affected area	37.562655999999997	126.975356	2012-08-28 19:58:13.368009	2012-08-28 19:58:13.368009
106	312	Lvjing town 	Significantly affected area	34.320999999999998	104.52800000000001	2012-05-14 14:57:12.480963	2012-09-12 22:46:01.088671
183	371	Changyon	affected area	38.250602000000001	125.046633	2012-08-28 19:58:52.523199	2012-08-28 19:58:52.523199
184	371	Nampho	affected area	38.701338	125.317413	2012-08-28 19:59:10.990688	2012-08-28 19:59:10.990688
185	371	Pyongyang	affected area	39.025973	125.756563	2012-08-28 19:59:34.214478	2012-08-28 19:59:34.214478
186	373	Numan	affected area	9.4766169999999992	12.037891	2012-08-29 15:23:36.387649	2012-08-29 15:23:36.387649
187	373	Jimeta	affected area	9.2848550000000003	12.460324999999999	2012-08-29 15:23:57.601812	2012-08-29 15:23:57.601812
188	373	Bilachi	affected area	9.3513669999999998	12.798785000000001	2012-08-29 15:24:28.268884	2012-08-29 15:24:28.268884
189	373	Garoua	affected area	9.2965599999999995	13.405187	2012-08-29 15:24:45.160413	2012-08-29 15:24:45.160413
190	374	Bagley Fire	Affected area	41.029299999999999	-122.0577	2012-09-05 18:03:32.026135	2012-09-05 18:03:32.026135
191	374	Fort Complex	Affect Areas	41.893999999999998	-123.2238	2012-09-05 18:04:09.997675	2012-09-05 18:04:09.997675
192	374	Williams Fire	Affected area	34.253999999999998	-117.79300000000001	2012-09-05 18:05:14.362608	2012-09-05 18:05:14.362608
25	256	Delhi Fire	East of Lockhard, The Delhi Fire is only 10% contained after scorching 1,000 acres and 6 homes.	29.815999999999999	-97.432000000000002	2011-09-06 17:26:52.528006	2012-09-07 15:23:48.711572
22	256	Spicewood Fire	The Spicewood Fire near Pedernales is now 80% contained after destroying more than 60 structures.	30.420999999999999	-98.108000000000004	2011-09-06 17:18:59.441911	2012-09-07 15:39:55.00263
27	256	Bailey Fire	In Colorado County, the Bailey Fire has burned at least 1,000 acres and has an unknown containment.	29.760000000000002	-96.472999999999999	2011-09-06 17:31:57.689872	2012-09-07 15:40:27.159111
29	256	3547 Road Fire	In Wise County, the 3547 Road Fire is now 80% contained. Some 60 homes were evacuated and 5 were destroyed.	33.109999999999999	-97.781999999999996	2011-09-06 17:37:24.248127	2012-09-07 15:41:06.509152
41	258	Was al Kabir	A reported command center of Gaddafi loyalists, Was al Kabir is located on the road to Sabha.	25.329000000000001	16.709	2011-09-09 17:38:07.230765	2012-09-07 16:14:01.544398
193	379	Scott's Fire	Affected area: Lake County, CA	39.144300000000001	-123.051	2012-09-10 21:11:53.768513	2012-09-10 21:11:53.768513
194	379	Sixteen Complex Fire	Affected area: Colusa County, CA	38.981999999999999	-122.307	2012-09-10 21:12:52.238367	2012-09-10 21:12:52.238367
241	407	Champerico	Affected area	14.301	-91.906999999999996	2012-11-07 23:52:32.872395	2012-11-07 23:52:32.872395
196	380	Mustang Complex Fire	Affected Areas: Salmon, Idaho	45.436	-114.488	2012-09-10 21:38:12.418985	2012-09-10 21:38:12.418985
182	371	Yeonpyeong	affected area	37.661000000000001	125.703	2012-08-28 19:58:32.165644	2012-09-11 19:10:06.881174
198	366	Damaged Infrastructure	Flooded storage tanks and derailed train cars visible following hurricane Isaac.	29.870000000000001	-89.947999999999993	2012-09-11 19:47:19.337741	2012-09-11 19:47:19.337741
199	366	Flooded Roads	Flooded roads 	29.629999999999999	-89.938000000000002	2012-09-11 19:54:52.302101	2012-09-11 19:54:52.302101
250	412	Taunton	Flood affected area	51.016213999999998	-3.1054740000000001	2012-11-30 18:58:37.805372	2012-12-13 22:06:50.047338
251	412	Oxford	Flooded fields	51.746288999999997	-1.280319	2012-11-30 19:00:24.818542	2012-12-13 22:17:26.728761
200	387	Naha	Impacted area	26.241244999999999	127.721335	2012-09-17 18:57:06.201041	2012-09-17 18:57:06.201041
160	359	Ahar	Affected Area: Temporary Shelters	38.468000000000004	47.066000000000003	2012-08-13 14:13:16.30206	2012-09-11 21:45:38.759309
201	387	Busan	Impacted Area	35.164774999999999	129.12158500000001	2012-09-17 18:57:42.033274	2012-09-17 18:57:42.033274
202	387	Yeosu	Impacted Area	34.767704000000002	127.660961	2012-09-17 18:58:20.72425	2012-09-17 18:58:20.72425
203	387	Wonsan	Impacted Area	39.151096000000003	127.44535399999999	2012-09-17 18:59:21.884388	2012-09-17 18:59:21.884388
208	391	Chachran Sharif	Affected Area	28.876000000000001	70.456000000000003	2012-09-18 19:17:02.403134	2012-09-18 19:17:02.403134
209	391	Jacobabad	Affected Area	28.277000000000001	68.495000000000005	2012-09-18 19:17:36.926451	2012-09-18 19:17:36.926451
210	391	Rajanpur	Affected Area	29.106000000000002	70.316000000000003	2012-09-18 19:18:04.955937	2012-09-18 19:18:04.955937
211	391	Wadpa Colony	Affected Area	28.427	69.658000000000001	2012-09-18 19:18:40.898306	2012-09-18 19:18:40.898306
159	359	Varzeghan	Affected Area: Damaged structures and temporary shelters nearby	38.429633000000003	46.726045999999997	2012-08-13 14:12:40.189135	2012-09-20 21:04:02.968351
178	370	Niamey	Affected Area: Over flowing river banks	13.508751	2.0932770000000001	2012-08-28 19:21:57.064501	2012-09-24 21:37:31.415247
171	361	Hanoi	affected area: Flooded river banks	21.012440999999999	105.881309	2012-08-20 21:08:48.591483	2012-09-24 22:36:27.402542
248	410	Shwebo	affected area	22.568476	95.690271999999993	2012-11-12 22:23:38.292759	2012-11-12 22:23:38.292759
243	408	Margate City, NJ	Evidence of Storm Surge Flooding	39.325074999999998	-74.503040999999996	2012-11-09 18:52:21.857569	2012-11-09 18:52:21.857569
244	408	Seaside Heights, Casino Pier	Damaged amusement park	39.942701	-74.068565000000007	2012-11-09 18:54:31.922408	2012-11-09 18:54:31.922408
245	408	Seaside Heights, Funtown Pier	Damaged amusement park	39.936605999999998	-74.071640000000002	2012-11-09 18:56:44.982126	2012-11-09 18:56:44.982126
246	408	Breezy Point Fire, NY	Burned houses and flooding	40.557516	-73.917996000000002	2012-11-09 18:57:49.186725	2012-11-09 18:57:49.186725
242	408	Seaside Heights Damage	Damaged homes at Seaside Heights	39.954855000000002	-74.068115000000006	2012-11-09 18:50:36.440491	2012-11-09 18:58:44.221199
247	408	Flooding Near Point Pleasant	Flooded homes on October 31st	40.180134000000002	-74.015998999999994	2012-11-09 19:05:59.823511	2012-11-09 19:05:59.823511
263	411	Albinia	Flooding north of Albinia	42.533416000000003	11.188653	2012-12-14 17:12:29.45675	2012-12-14 17:12:29.45675
288	420	Tiguentourine Gas Plant	Tiguentourine facility	27.925806999999999	9.1127880000000001	2013-01-18 23:19:24.892695	2013-01-18 23:19:24.892695
282	417	Murdunna	Burned structures near Murdunna	-42.948912	147.85074499999999	2013-01-08 17:25:07.712001	2013-01-08 17:25:07.712001
281	417	Connellys Marsh	Burned structures	-42.886803	147.71711500000001	2013-01-08 17:21:48.019416	2013-01-08 17:35:50.327931
257	413	Compostela	Storm Damage: Demolished structures and uprooted trees	7.6787660000000004	126.08527599999999	2012-12-13 21:51:19.635137	2012-12-13 21:51:19.635137
143	351	Multi Sports Arenas	Basketball, Fencing, Handball, Modern Pentathlon, Volleyball (Indoor)	51.547898000000004	-0.020424000000000001	2012-07-27 16:46:35.270374	2012-12-03 19:02:05.905269
144	351	Aquatic Centre	Diving, Modern Pentathlon, Swimming, Synchronised Swimming, Water Polo	51.540731000000001	-0.011294999999999999	2012-07-27 16:47:06.888711	2012-12-03 19:02:27.037628
146	351	Millenium Dome	Basketball, Gymnastics (Artistic), Gymnastics (Trampoline	51.502782000000003	0.0032039999999999998	2012-07-27 16:48:29.678505	2012-12-03 19:03:03.834445
147	351	Greenwich Arena	Badminton, Gymnastics	51.495607999999997	0.0088990000000000007	2012-07-27 16:49:07.999363	2012-12-03 19:03:15.134896
142	351	Velopark	Cycling (Track), Cycling (BMX)	51.553662000000003	-0.014647	2012-07-27 16:46:01.847075	2012-12-03 19:04:59.075814
112	316	Olympiapark	Venue for TUM Triathlon 2012. Venue for the public viewing of the Champions League Final\r\n\r\n	48.173870000000001	11.548669	2012-05-22 17:09:29.923491	2012-12-03 19:08:33.358654
75	293	Antananarivo	Capital city. Heavily impacted area	-18.933333000000001	47.516666999999998	2012-02-14 18:12:10.711927	2012-12-03 19:14:48.828349
269	416	Momi	Affected Area	-17.912804999999999	177.28365400000001	2012-12-18 16:43:15.596615	2012-12-20 18:40:01.855803
258	413	Northern Compostela	Extensive storm damage	7.6880220000000001	126.089755	2012-12-13 21:52:49.414819	2012-12-13 21:54:30.130787
259	413	New Bataan	Devastating flood damage	7.5480140000000002	126.132176	2012-12-13 21:59:38.993105	2012-12-13 21:59:38.993105
252	412	Tewkesbury	Flooded affected area	51.995331	-2.1504210000000001	2012-11-30 18:59:45.246787	2012-12-13 22:30:55.719294
254	412	York	Flooded affected areas	53.962291	-1.0819000000000001	2012-11-30 19:00:56.242904	2012-12-13 22:34:25.291962
255	412	Nottingham	Flooded fields	52.936311000000003	-1.1026309999999999	2012-11-30 19:02:00.843779	2012-12-13 22:46:35.46678
261	414	Homayun	Temporary Shelters	33.417754000000002	59.704923999999998	2012-12-13 23:20:44.001507	2012-12-13 23:20:44.001507
268	416	Nadi	Affected Area	-17.798999999999999	177.417	2012-12-18 16:42:30.637848	2012-12-20 18:40:36.297049
267	416	Lauwaki	Affected Area	-17.649839	177.40646699999999	2012-12-18 16:41:57.959201	2012-12-20 18:44:18.817123
312	433	Cape Lambert	Affected Area	-20.596152	117.17227200000001	2013-02-27 19:15:59.909943	2013-02-27 19:15:59.909943
275	416	Nausori	Flooded houses South West of Nausori	-18.030563000000001	178.515334	2012-12-20 18:46:07.430223	2012-12-20 18:56:55.453389
277	416	Lokia	Flooding near Lokia	-18.064184000000001	178.54945900000001	2012-12-20 18:59:10.007764	2012-12-20 18:59:10.007764
305	422	Rockhampton, Australia	Flooded area	-23.377365000000001	150.50985700000001	2013-02-07 23:17:11.179808	2013-02-07 23:17:11.179808
313	433	Karratha	Affected Area	-20.597669	116.773095	2013-02-27 19:16:33.413804	2013-02-27 19:16:33.413804
303	423	US Embassy, Cairo	Site of US embassy in Cairo	30.041702000000001	31.232747	2013-02-01 18:25:06.279226	2013-02-01 18:27:22.878637
304	423	Tahrir Square, Cairo	Cairo suffered its first fatality from the disturbances early Monday when a passerby was hit by birdshot in Tahrir Square.	30.044476	31.235655000000001	2013-02-01 18:29:49.319121	2013-02-01 18:29:49.319121
299	423	Port Said	Site of protests	31.265314	32.301856000000001	2013-01-30 16:25:35.170717	2013-02-01 21:10:27.27899
298	423	Alexandria	Site of protests	31.223927	29.942945999999999	2013-01-30 16:25:01.582203	2013-02-11 23:39:18.272949
317	440	Burned Houses in Meiktila	Muslims fled the city as a mob burned homes in central Meiktila.	20.884229000000001	95.863984000000002	2013-03-27 17:11:00.062647	2013-03-27 17:11:00.062647
319	441	Sana'a	Affected Area	15.35158	44.207318999999998	2013-04-02 21:29:02.059894	2013-04-02 21:29:02.059894
320	441	Ma'rib	Affected Area	15.46984	45.322845999999998	2013-04-02 21:30:33.207254	2013-04-02 21:30:33.207254
322	441	Dhamar	Affected Area	14.549529	44.401404999999997	2013-04-02 21:34:15.142615	2013-04-02 21:34:15.142615
324	440	Burned Village	Burned buildings outside of central Meiktila.	20.877685	95.836650000000006	2013-04-02 21:44:00.819709	2013-04-02 21:44:00.819709
325	442	Buenos Aires	Affected Area	-34.603811	-58.381599000000001	2013-04-04 16:09:00.373288	2013-04-04 16:09:00.373288
326	442	La Plata	Affected Area	-34.921422999999997	-57.954362000000003	2013-04-04 16:09:58.131502	2013-04-04 16:09:58.131502
327	443	Fargo	Affected Area	46.875492000000001	-96.790644999999998	2013-04-04 22:46:48.780225	2013-04-04 22:46:48.780225
328	443	Grand Forks	Affected Area	47.924230999999999	-97.032713999999999	2013-04-04 22:47:48.462957	2013-04-04 22:47:48.462957
331	446	Town of Khash	Impacted Area	28.225290999999999	61.208160999999997	2013-04-16 15:20:54.572119	2013-04-16 15:20:54.572119
333	446	Taftan	Impacted Area	28.984572	61.518185000000003	2013-04-16 15:51:31.546026	2013-04-16 15:51:31.546026
334	446	Saravan	Impacted Area	27.380877999999999	62.325248000000002	2013-04-16 15:52:09.608873	2013-04-16 15:52:09.608873
335	447	Boylston Street, Boston	Site of Bombing	42.349499999999999	-71.079499999999996	2013-04-16 18:54:30.676056	2013-04-16 18:54:30.676056
337	447	Marathon Finish Line	Finish line of Boston Marathon	42.349881000000003	-71.078445000000002	2013-04-16 21:28:27.657568	2013-04-16 21:28:27.657568
338	447	Second Explosion	Site of Second Explosion	42.349291999999998	-71.080817999999994	2013-04-16 21:30:59.655036	2013-04-16 21:30:59.655036
339	448	West Fertilizer Co. Facility	Site of Explosion	31.816011	-97.087941999999998	2013-04-18 16:07:58.951647	2013-04-18 16:07:58.951647
341	443	Wahpeton, ND	Wahpeton, North Dakota	46.265199000000003	-96.605849000000006	2013-05-08 17:41:18.756584	2013-05-08 17:41:18.756584
343	451	Grand Forks	affected area	47.918920999999997	-97.037058000000002	2013-05-09 18:17:00.638003	2013-05-09 18:17:00.638003
344	451	Morris	affected area	49.357686999999999	-97.352951000000004	2013-05-09 18:18:39.01485	2013-05-09 18:18:39.01485
345	451	Winnipeg	affected area	49.899754000000001	-97.137494000000004	2013-05-09 18:21:22.391969	2013-05-09 18:21:22.391969
346	451	Selkirk	affected area	50.140866000000003	-96.878310999999997	2013-05-09 18:22:23.240996	2013-05-09 18:22:23.240996
354	458	Ardent Sentry (AS-13) Exercise	A major yearly exercise focused on Defense Support of Civil Authorities during May 2013.	27.766969	-82.511381	2013-05-22 14:26:27.866631	2013-05-22 14:26:27.866631
351	456	Cleburne	Affected Area	32.296999999999997	-97.409000000000006	2013-05-16 15:31:20.764446	2013-05-16 20:57:27.31418
356	458	Ardent Sentry (AS-13) Exercise	A major yearly exercise focused on Defense Support of Civil Authorities during May 2013.	28.159738999999998	-82.406160999999997	2013-05-22 17:35:17.228747	2013-05-22 17:35:17.228747
357	458	Ardent Sentry (AS-13) Exercise	A major yearly exercise focused on Defense Support of Civil Authorities during May 2013.	27.838657999999999	-82.143117000000004	2013-05-22 17:36:25.679117	2013-05-22 17:36:25.679117
359	458	Ardent Sentry (AS-13) Exercise	A major yearly exercise focused on Defense Support of Civil Authorities during May 2013.	27.959824999999999	-81.543374999999997	2013-05-22 17:38:35.798938	2013-05-22 17:38:35.798938
364	459	Westmoor	Affected Area	35.322673999999999	-97.514283000000006	2013-05-22 21:32:10.369574	2013-05-22 21:32:10.369574
371	465	Magdeburg, Germany	Flooded Area	52.111910000000002	11.650365000000001	2013-06-11 15:28:49.451576	2013-06-18 17:14:53.447297
372	465	Litoměřice, Czech Republic	Flood Affected Area	50.524690999999997	14.136187	2013-06-11 15:30:07.68348	2013-06-11 15:30:07.68348
374	465	Prague, Czech Republic	Flood Affected Area	50.086286000000001	14.411498999999999	2013-06-11 15:43:24.011733	2013-06-11 15:43:24.011733
365	459	Impacted area #1	Moore, OK	35.332642	-97.463116999999997	2013-05-24 12:55:33.431414	2013-06-03 19:05:43.489496
367	459	Impacted area #2	Moore, OK	35.323934999999999	-97.509549000000007	2013-05-24 12:57:33.225372	2013-06-03 19:09:37.512502
140	351	Main Stadium	Opening and closing ceremonies. Athletics. Athletics (Marathon finish)	51.540509	-0.017183	2012-07-27 16:45:01.471952	2012-12-03 18:58:44.309792
264	415	Wallis Island, Tepa	Damaged Structure: Eglise du Sacre-Coeur church	-13.319312	-176.190403	2012-12-17 16:59:38.773248	2012-12-20 16:22:13.196557
145	351	ExCell Exibition Centre	Boxing, Judo, Table Tennis, Taekwondo, Weightlifting, Wrestling	51.508696	0.026981999999999999	2012-07-27 16:47:49.363742	2012-12-03 19:01:35.225523
155	351	Greenwich Park	Modern Pentathlon, Equestrian	51.477296000000003	0.00043399999999999998	2012-07-27 17:03:45.032912	2012-12-03 19:02:15.704522
175	364	Chips Fire	Burn scar	40.100000000000001	-121.206	2012-08-22 15:27:28.249183	2012-12-03 19:11:28.06604
176	364	Rush Fire	Affected Area	40.384	-120.069	2012-08-22 15:27:49.099966	2012-12-03 19:12:46.292589
177	364	Mill Fire	Affected Area	40.207000000000001	-121.636	2012-08-22 15:28:14.624964	2012-12-03 19:12:59.632964
253	412	Darlington	Flooded affected area	54.523609999999998	-1.559458	2012-11-30 19:01:40.259991	2012-12-13 22:54:49.833843
260	414	South Khorasan	Temporary shelters 	33.412623000000004	59.670164	2012-12-13 23:15:45.877729	2012-12-13 23:15:45.877729
286	419	Kulluk Oil Rig	Where the rig ran aground.	57.091500000000003	-153.1035	2013-01-15 23:01:19.578591	2013-01-15 23:01:19.578591
295	422	Brisbane	Flood affected area	-27.459230000000002	153.07620499999999	2013-01-28 17:43:42.719818	2013-01-28 17:43:42.719818
270	416	Malolo	Affect Area	-17.745839	177.182693	2012-12-18 16:42:33.596405	2012-12-20 18:35:34.3751
271	416	Tavua	Affected Area	-17.614498999999999	177.08695499999999	2012-12-18 16:45:12.110172	2012-12-20 18:38:11.405531
272	415	Wallis Island, Utufua	Damaged Structures and Debris	-13.342279	-176.19805199999999	2012-12-18 18:36:59.56887	2012-12-20 16:21:06.331998
315	436	Crowd Outside Military Academy	A crowd of mourners gathered outside the Military Academy.	10.458719	-66.906668999999994	2013-03-14 17:43:06.708268	2013-03-14 17:43:06.708268
308	432	Morombe	Flooded fields and buildings	-21.743542999999999	43.360857000000003	2013-02-25 17:37:16.878886	2013-03-04 17:23:33.505415
289	421	Chokwe	Major flooding in Chokwe	-24.535039000000001	32.997582999999999	2013-01-22 16:27:43.872449	2013-01-24 16:57:37.976452
283	417	Northern Murdunna	Active fires near Yellow Bluff Creek Forest Reserve	-42.915318999999997	147.901253	2013-01-08 17:29:56.865857	2013-01-08 17:32:21.961161
279	417	Woodvine Nature Reserve	Active fires	-42.775492999999997	147.69094699999999	2013-01-07 20:07:31.426523	2013-01-08 17:36:02.403205
278	417	Dunalley	CNN reports 65 homes and an elementary school were destroyed.	-42.887936000000003	147.81313499999999	2013-01-07 20:06:38.767162	2013-01-08 17:36:37.184291
293	421	Lionde	Severe flooding in Lionde	-24.588263000000001	33.060547	2013-01-24 17:01:03.980081	2013-01-24 17:01:03.980081
290	421	Xai Xai District	Flood farmland near Xai Xai	-25.027867000000001	33.647039999999997	2013-01-22 16:31:19.136496	2013-01-24 17:09:35.597314
294	421	Severe Flooding near Chokwe	Severe flooding near Chokwe	-24.499528999999999	33.012794	2013-01-24 17:21:33.191852	2013-01-24 17:21:33.191852
287	420	In Amenas	In Amenas town	28.045999999999999	9.5790000000000006	2013-01-18 23:20:03.981203	2013-01-24 17:36:20.551087
296	422	Bundaberg	Flood fields and houses	-24.853926999999999	152.341545	2013-01-28 17:44:11.864938	2013-01-31 19:17:24.994678
292	421	Maputo	Flood affected area	-25.939744999999998	32.613379999999999	2013-01-22 16:32:43.668831	2013-01-28 19:07:17.555682
301	423	Ismailia	Site of protests	30.583742000000001	32.266587999999999	2013-01-30 16:25:31.065624	2013-02-11 21:38:42.768251
300	423	Suez	Site of protests	29.982723	32.524737000000002	2013-01-30 16:24:54.058397	2013-02-11 23:33:02.907963
311	433	Port Hedland	Affected Area	-20.317048	118.592069	2013-02-27 19:14:11.069931	2013-02-27 19:14:11.069931
310	432	Toliara	Flooded Houses	-23.373313	43.678041	2013-02-25 17:39:55.653554	2013-02-28 16:21:47.625349
314	434	Earthquake Epicenter	Epicenter of 5.5M earthquake	25.917999999999999	99.724999999999994	2013-03-04 19:47:42.008459	2013-03-04 19:47:42.008459
316	436	Military Academy	More than two million people have already filed past Hugo Chavez body at the military academy.	10.458651	-66.907381999999998	2013-03-14 17:44:23.116147	2013-03-14 17:44:23.116147
321	441	Al Mahwit	Affect Area	15.469262000000001	43.545293000000001	2013-04-02 21:34:24.602492	2013-04-02 21:34:24.602492
318	437	Sabon Gari Bus Station	Bombing site: Burned buses and debris	12.018017	8.5412850000000002	2013-03-28 21:53:49.282313	2013-03-28 21:57:38.92208
323	441	Raydah	Affected Area	15.815934	44.041995	2013-04-02 21:36:43.577265	2013-04-02 21:36:43.577265
340	450	Collapsed Building	Site of Collapsed Building in Dhaka	23.846170000000001	90.257819999999995	2013-04-25 15:21:56.675231	2013-04-25 15:21:56.675231
330	445	Botkinburg	affected area	35.698999999999998	-92.516999999999996	2013-04-11 16:39:49.713603	2013-04-11 16:39:49.713603
332	446	Zahedan	Impacted Area	29.495699999999999	60.864710000000002	2013-04-16 15:49:08.051794	2013-04-16 15:49:08.051794
342	443	Breckenridge, MN	Breckenridge, Minnesota	46.26417	-96.587569999999999	2013-05-08 17:41:40.334655	2013-05-08 17:41:40.334655
347	455	Sittwe	affected area	20.211147	92.863388	2013-05-15 19:25:03.060531	2013-05-15 19:25:03.060531
329	445	Teson Gardens, Hazelwood	Damaged homes near Teson Gardens.	38.790711000000002	-90.375449000000003	2013-04-11 16:39:28.60169	2013-04-16 21:16:45.20152
348	455	Kyaukphyu	affected area	19.394072999999999	93.525025999999997	2013-05-15 19:25:21.85232	2013-05-15 19:25:21.85232
336	445	Teson Gardens 2, Hazelwood	Blue tarps cover damaged homes.	38.788423999999999	-90.380654000000007	2013-04-16 21:18:03.923337	2013-04-16 21:20:38.908133
349	455	Chittagong	affected area	22.325772000000001	91.845097999999993	2013-05-15 19:25:45.440558	2013-05-15 19:25:45.440558
373	465	Passau, Germany	Flood Affected Area	48.574593999999998	13.463964000000001	2013-06-11 15:33:11.575815	2013-06-11 15:33:11.575815
350	456	Granbury	Affected Area	32.423715000000001	-97.729591999999997	2013-05-16 15:32:35.028211	2013-05-20 14:44:23.431618
375	460	Copahue	Peak of Copahue	-37.856212999999997	-71.160808000000003	2013-06-11 15:48:11.233028	2013-06-11 15:48:11.233028
366	459	Impacted area #3	Moore, OK	35.318190000000001	-97.589046999999994	2013-05-24 12:58:39.141506	2013-06-03 19:12:16.637797
376	461	Lake Hughes	Burned Structures	34.673836000000001	-118.450316	2013-06-11 15:50:59.488376	2013-06-11 15:50:59.488376
355	458	Ardent Sentry (AS-13) Exercise	A major yearly exercise focused on Defense Support of Civil Authorities during May 2013.	28.159738999999998	-82.406160999999997	2013-05-22 14:27:35.799333	2013-05-22 14:27:35.799333
358	458	Ardent Sentry (AS-13) Exercise	A major yearly exercise focused on Defense Support of Civil Authorities during May 2013.	28.228131000000001	-81.819556000000006	2013-05-22 17:35:27.156548	2013-05-22 17:35:27.156548
360	458	Ardent Sentry (AS-13) Exercise	A major yearly exercise focused on Defense Support of Civil Authorities during May 2013.	28.698981	-81.517069000000006	2013-05-22 17:37:41.36479	2013-05-22 17:37:41.36479
361	458	Ardent Sentry (AS-13) Exercise	A major yearly exercise focused on Defense Support of Civil Authorities during May 2013.	28.301783	-81.138285999999994	2013-05-22 17:38:29.624188	2013-05-22 17:38:29.624188
362	458	Ardent Sentry (AS-13) Exercise	A major yearly exercise focused on Defense Support of Civil Authorities during May 2013.	28.641110999999999	-80.730566999999994	2013-05-22 17:39:14.143853	2013-05-22 17:39:14.143853
363	458	Ardent Sentry (AS-13) Exercise	A major yearly exercise focused on Defense Support of Civil Authorities during May 2013.	28.046631000000001	-80.654283000000007	2013-05-22 17:40:02.176051	2013-05-22 17:40:02.176051
377	467	Taksim Square	Crowd at Taksim Square	41.037165999999999	28.985453	2013-06-11 15:56:18.202796	2013-06-11 15:56:18.202796
370	459	Impacted area #4	Moore, OK	35.319558000000001	-97.551597999999998	2013-06-03 19:36:42.563378	2013-06-03 19:36:42.563378
380	469	Peregrine Way	Burned Structures	39.020943000000003	-104.74181400000001	2013-06-17 15:07:29.686186	2013-06-17 15:07:29.686186
379	469	Meadow Glen Ln.	Burned Structures	39.021037999999997	-104.67526599999999	2013-06-13 15:58:23.292685	2013-06-13 15:58:23.292685
378	469	Holmes Rd.	Burned Structures	39.024337000000003	-104.717285	2013-06-13 15:58:41.330626	2013-06-13 16:00:47.600208
391	486	Resistencia-Corrientes	Flood Affected Area	-27.485184	-58.875	2013-07-01 16:55:45.943968	2013-07-01 16:55:45.943968
382	474	Kedarnarth	Affected Area	30.731999999999999	79.067999999999998	2013-06-19 15:39:26.282733	2013-06-19 15:39:26.282733
383	477	Brasilia	Site of Protests	-15.785121	-47.903461999999998	2013-06-21 16:27:52.707042	2013-06-21 16:27:52.707042
384	477	Fortaleza	Site of Protests	-3.7426149999999998	-38.512233000000002	2013-06-21 16:26:35.913247	2013-06-21 16:26:35.913247
385	477	Recife	Site of Protests	-8.0599480000000003	-34.941516	2013-06-21 16:29:07.642263	2013-06-21 16:29:07.642263
386	477	Rio	Site of Protests	-22.907194	-43.185245999999999	2013-06-21 16:27:52.597432	2013-06-21 16:27:52.597432
387	477	Salvador	Site of Protests	-12.970101	-38.491861	2013-06-21 16:28:27.791351	2013-06-21 16:28:27.791351
388	477	Sao Paolo	Site of Protests	-23.550031000000001	-46.637653	2013-06-21 16:29:08.766542	2013-06-21 16:29:08.766542
381	474	Uttarkashi	Affected Area	30.725999999999999	78.438999999999993	2013-06-19 15:40:34.470207	2013-06-25 15:32:08.063956
389	474	Badrinath	Aid Distribution in Badrinath	30.751204000000001	79.497235000000003	2013-06-25 15:33:28.59752	2013-06-25 15:33:28.59752
390	474	Raiwala	High river banks	30.016622999999999	78.229113999999996	2013-06-25 15:38:29.16057	2013-06-25 15:38:29.16057
392	486	Iguazu National Park	Flood Affected Area	-25.652356999999999	-54.491	2013-07-01 16:58:19.207432	2013-07-01 16:58:19.207432
393	486	Reconquista	Flood Affected Area	-29.161497000000001	-59.623199999999997	2013-07-01 16:58:58.450815	2013-07-01 16:58:58.450815
394	486	Goya	Flood Affected Area	-29.146712000000001	-59.284100000000002	2013-07-01 16:57:45.147491	2013-07-01 16:57:45.147491
395	486	Ayolas	Flood Affected Area	-27.505571	-56.774099999999997	2013-07-01 17:00:11.621829	2013-07-01 17:00:11.621829
396	486	Posadas	Flood Affected Area	-27.361384000000001	-55.901000000000003	2013-07-01 17:00:46.293544	2013-07-01 17:00:46.293544
397	486	Santa Fe-Parana	Flood Affected Area	-31.691369999999999	-60.594999999999999	2013-07-01 16:59:37.871637	2013-07-01 16:59:37.871637
398	486	Resistencia	Flood Affected Area	-27.485184	-58.875	2013-07-01 17:00:16.035453	2013-07-01 17:00:16.035453
399	484	Tahrir Square	Site of Demonstrations	30.044476	31.235655000000001	2013-07-01 19:36:17.66316	2013-07-01 19:36:17.66316
400	484	Rabaa El Adawia Mosque	Site of Demonstrations	30.067208999999998	31.324998999999998	2013-07-01 19:38:04.051193	2013-07-01 19:38:04.051193
401	489	Hotan	China tightens security ahead of protests.	37.115900000000003	79.921000000000006	2013-07-03 17:18:53.886636	2013-07-03 17:18:53.886636
402	489	Shanshan	China tightens security ahead of protests.	42.893000000000001	90.236999999999995	2013-07-03 17:21:13.469838	2013-07-03 17:21:13.469838
403	484	Military Vehicles near Republican Guard HQ	Republican Guard military vehicles blocking road.	30.078016999999999	31.319626	2013-07-10 21:29:18.704117	2013-07-10 21:29:18.704117
405	484	University of Cairo	Protesters present outside University of Cairo	30.027605000000001	31.210946	2013-07-10 21:35:23.615057	2013-07-10 21:35:23.615057
404	484	Presidential Palace	Site of Demonstrations	30.088949	31.319482000000001	2013-07-10 21:31:17.452944	2013-07-10 21:35:55.934895
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: flms; Owner: flms
--

COPY schema_migrations (version) FROM stdin;
20110330215044
20110330222046
20110330223208
20110331193849
20110401150208
20110523210356
20110629171640
20110701193612
20111024161317
20111024161842
20111024162203
20111024210758
20111107163123
20111107164104
20111107175740
20111208212131
20120612145243
20120612151417
20120612152605
20120612154820
20120612174818
20121102175819
20130129223020
\.


--
-- Data for Name: subscribers; Type: TABLE DATA; Schema: flms; Owner: flms
--

COPY subscribers (id, first_name, last_name, email, created_at, updated_at) FROM stdin;
1	Peter 	Battaglia	pbattaglia@digitalglobe.com	2011-12-09 19:30:10.355039	2011-12-09 19:30:10.355039
2	Glenn 	Reese	greese@digitalglobe.com	2011-12-09 19:30:24.701903	2011-12-09 19:30:24.701903
3	Katya	Johnson	kjohnson@digitalglobe.com	2011-12-14 17:02:28.216089	2011-12-14 17:02:28.216089
4	Mark	Andel	mandel@digitalglobe.com	2011-12-14 17:43:39.302128	2011-12-14 17:43:39.302128
5	Andrew	Steele	asteele@digitalglobe.com	2011-12-16 22:51:41.219509	2011-12-16 22:51:41.219509
14	Anders	Olson	aolson@digitalglobe.com	2012-09-05 18:12:48.499483	2012-09-05 18:12:48.499483
17	Nate	Ricklin	nate.ricklin@digitalglobe.com	2013-05-06 15:19:11.059829	2013-05-06 15:19:11.059829
18	Collin	Donahue-Oponski	cdonahue@digitalglobe.com	2013-06-19 15:33:22.547959	2013-06-19 15:33:22.547959
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: flms; Owner: flms
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at) FROM stdin;
3	mandel@digitalglobe.com	$2a$10$euiVyCLRvZm0rBU5Tlrru.HNVhHM3ADZD/I2m/hkAZZu3P0F9pvpq	\N	\N	\N	1	2012-11-27 15:25:39.352478	2012-11-27 15:25:39.352478	10.132.17.10	10.132.17.10	2012-11-27 15:25:39.319478	2012-11-27 15:25:39.361723
2	pbattaglia@digitalglobe.com	$2a$10$nV0s1/.psFEkY8Psdt05P.ies7ksXI6g19juF9M8nkpJ3ly4OOwLK	\N	\N	\N	3	2012-12-12 16:00:49.537768	2012-11-26 21:52:35.504985	10.132.17.10	10.132.17.10	2012-11-26 21:24:25.946944	2012-12-12 16:00:49.539236
4	aolson@digitalglobe.com	$2a$10$4OgLh/xq7wwiTeAto60OJ.Wf024K5TMec.rWXk5HmcpRM0e.L9/aq	\N	\N	\N	109	2013-07-15 15:20:11.690104	2013-07-10 21:27:55.869459	10.132.17.10	10.132.17.10	2012-11-27 19:30:44.63277	2013-07-15 15:20:11.691783
1	greese@digitalglobe.com	$2a$10$TIdVx57WzHNgYBt7iFvXouIW1dNKFtD8SNkMgdlXatAo.j5mnbejm	\N	\N	\N	313	2013-07-15 15:58:55.017909	2013-07-12 15:52:48.146595	10.132.17.10	10.132.17.10	2011-05-26 15:29:01.822368	2013-07-15 15:58:55.020884
\.


--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: flms; Owner: flms; Tablespace: 
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: events_pkey; Type: CONSTRAINT; Schema: flms; Owner: flms; Tablespace: 
--

ALTER TABLE ONLY events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: icons_pkey; Type: CONSTRAINT; Schema: flms; Owner: flms; Tablespace: 
--

ALTER TABLE ONLY icons
    ADD CONSTRAINT icons_pkey PRIMARY KEY (id);


--
-- Name: point_of_interests_pkey; Type: CONSTRAINT; Schema: flms; Owner: flms; Tablespace: 
--

ALTER TABLE ONLY point_of_interests
    ADD CONSTRAINT point_of_interests_pkey PRIMARY KEY (id);


--
-- Name: subscribers_pkey; Type: CONSTRAINT; Schema: flms; Owner: flms; Tablespace: 
--

ALTER TABLE ONLY subscribers
    ADD CONSTRAINT subscribers_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: flms; Owner: flms; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: flms; Owner: flms; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: flms; Owner: flms; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: flms; Owner: flms; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: flms; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA flms FROM PUBLIC;
REVOKE ALL ON SCHEMA flms FROM postgres;
GRANT ALL ON SCHEMA flms TO postgres;
GRANT ALL ON SCHEMA flms TO flms;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

