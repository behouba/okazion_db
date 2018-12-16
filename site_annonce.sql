--
-- PostgreSQL database dump
--

-- Dumped from database version 11.1
-- Dumped by pg_dump version 11.1

-- Started on 2018-12-16 20:27:02

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3139 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 202 (class 1259 OID 16763)
-- Name: account_state; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_state (
    account_state_id smallint NOT NULL,
    description character varying(45) NOT NULL
);


ALTER TABLE public.account_state OWNER TO postgres;

--
-- TOC entry 3140 (class 0 OID 0)
-- Dependencies: 202
-- Name: TABLE account_state; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.account_state IS 'look up table for user''s account current state';


--
-- TOC entry 201 (class 1259 OID 16761)
-- Name: account_state_account_state_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_state_account_state_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_state_account_state_id_seq OWNER TO postgres;

--
-- TOC entry 3141 (class 0 OID 0)
-- Dependencies: 201
-- Name: account_state_account_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_state_account_state_id_seq OWNED BY public.account_state.account_state_id;


--
-- TOC entry 204 (class 1259 OID 16771)
-- Name: account_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_type (
    account_type_id smallint NOT NULL,
    description character varying(45) NOT NULL
);


ALTER TABLE public.account_type OWNER TO postgres;

--
-- TOC entry 3142 (class 0 OID 0)
-- Dependencies: 204
-- Name: TABLE account_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.account_type IS 'look up table for user account different type';


--
-- TOC entry 203 (class 1259 OID 16769)
-- Name: account_type_account_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_type_account_type_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_type_account_type_id_seq OWNER TO postgres;

--
-- TOC entry 3143 (class 0 OID 0)
-- Dependencies: 203
-- Name: account_type_account_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_type_account_type_id_seq OWNED BY public.account_type.account_type_id;


--
-- TOC entry 219 (class 1259 OID 16916)
-- Name: advert; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.advert (
    advert_id bigint NOT NULL,
    title character varying(50) NOT NULL,
    description text,
    advertiser_id integer NOT NULL,
    category_id integer NOT NULL,
    condition_id integer,
    city_id integer NOT NULL,
    advert_state_id integer NOT NULL,
    advert_type_id integer,
    price numeric,
    pictures_urls json,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    map_position point,
    meta_data json
);


ALTER TABLE public.advert OWNER TO postgres;

--
-- TOC entry 3144 (class 0 OID 0)
-- Dependencies: 219
-- Name: TABLE advert; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.advert IS 'adverts table';


--
-- TOC entry 3145 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN advert.pictures_urls; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.advert.pictures_urls IS 'json data to store pictures related to ads (thumbnail version, mobile and desktop version)';


--
-- TOC entry 218 (class 1259 OID 16914)
-- Name: advert_advert_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.advert_advert_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.advert_advert_id_seq OWNER TO postgres;

--
-- TOC entry 3146 (class 0 OID 0)
-- Dependencies: 218
-- Name: advert_advert_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.advert_advert_id_seq OWNED BY public.advert.advert_id;


--
-- TOC entry 217 (class 1259 OID 16902)
-- Name: advert_condition; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.advert_condition (
    condition_id smallint NOT NULL,
    name character varying(45) NOT NULL
);


ALTER TABLE public.advert_condition OWNER TO postgres;

--
-- TOC entry 3147 (class 0 OID 0)
-- Dependencies: 217
-- Name: TABLE advert_condition; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.advert_condition IS 'look up table for advert condition';


--
-- TOC entry 227 (class 1259 OID 17015)
-- Name: advert_state; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.advert_state (
    advert_state_id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.advert_state OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 17013)
-- Name: advert_state_advert_state_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.advert_state_advert_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.advert_state_advert_state_id_seq OWNER TO postgres;

--
-- TOC entry 3148 (class 0 OID 0)
-- Dependencies: 226
-- Name: advert_state_advert_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.advert_state_advert_state_id_seq OWNED BY public.advert_state.advert_state_id;


--
-- TOC entry 225 (class 1259 OID 17006)
-- Name: advert_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.advert_type (
    advert_type_id integer NOT NULL,
    name character varying(45) NOT NULL
);


ALTER TABLE public.advert_type OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 17004)
-- Name: advert_type_advert_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.advert_type_advert_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.advert_type_advert_type_id_seq OWNER TO postgres;

--
-- TOC entry 3149 (class 0 OID 0)
-- Dependencies: 224
-- Name: advert_type_advert_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.advert_type_advert_type_id_seq OWNED BY public.advert_type.advert_type_id;


--
-- TOC entry 238 (class 1259 OID 17154)
-- Name: alert; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alert (
    alert_id integer NOT NULL,
    owner_id integer NOT NULL,
    key_word character varying,
    category_id integer,
    min_price numeric,
    max_price numeric,
    advert_type_id integer,
    is_active boolean DEFAULT true NOT NULL
);


ALTER TABLE public.alert OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16743)
-- Name: auth_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_type (
    auth_type_id smallint NOT NULL,
    name character varying(45) NOT NULL
);


ALTER TABLE public.auth_type OWNER TO postgres;

--
-- TOC entry 3150 (class 0 OID 0)
-- Dependencies: 200
-- Name: TABLE auth_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.auth_type IS 'authentification type used by user';


--
-- TOC entry 199 (class 1259 OID 16741)
-- Name: auth_type_auth_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_type_auth_type_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_type_auth_type_id_seq OWNER TO postgres;

--
-- TOC entry 3151 (class 0 OID 0)
-- Dependencies: 199
-- Name: auth_type_auth_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_type_auth_type_id_seq OWNED BY public.auth_type.auth_type_id;


--
-- TOC entry 213 (class 1259 OID 16868)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    parent_id smallint,
    category_id smallint NOT NULL,
    name character varying(60) NOT NULL,
    fields character varying[]
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 3152 (class 0 OID 0)
-- Dependencies: 213
-- Name: TABLE category; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.category IS 'adverts categories';


--
-- TOC entry 212 (class 1259 OID 16866)
-- Name: category_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_category_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_category_id_seq OWNER TO postgres;

--
-- TOC entry 3153 (class 0 OID 0)
-- Dependencies: 212
-- Name: category_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_category_id_seq OWNED BY public.category.category_id;


--
-- TOC entry 209 (class 1259 OID 16800)
-- Name: chat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chat (
    chat_id bigint NOT NULL,
    advertiser_id integer NOT NULL,
    guest_id integer NOT NULL,
    chat_state_id integer
);


ALTER TABLE public.chat OWNER TO postgres;

--
-- TOC entry 3154 (class 0 OID 0)
-- Dependencies: 209
-- Name: TABLE chat; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.chat IS 'chat on advert between users table';


--
-- TOC entry 208 (class 1259 OID 16798)
-- Name: chat_chat_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chat_chat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chat_chat_id_seq OWNER TO postgres;

--
-- TOC entry 3155 (class 0 OID 0)
-- Dependencies: 208
-- Name: chat_chat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chat_chat_id_seq OWNED BY public.chat.chat_id;


--
-- TOC entry 235 (class 1259 OID 17104)
-- Name: chat_state; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chat_state (
    chat_state_id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.chat_state OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 17102)
-- Name: chat_state_chat_state_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chat_state_chat_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chat_state_chat_state_id_seq OWNER TO postgres;

--
-- TOC entry 3156 (class 0 OID 0)
-- Dependencies: 234
-- Name: chat_state_chat_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chat_state_chat_state_id_seq OWNED BY public.chat_state.chat_state_id;


--
-- TOC entry 231 (class 1259 OID 17037)
-- Name: city; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.city (
    city_id smallint NOT NULL,
    name character varying(60) NOT NULL,
    region_id integer NOT NULL
);


ALTER TABLE public.city OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 17035)
-- Name: city_city_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.city_city_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.city_city_id_seq OWNER TO postgres;

--
-- TOC entry 3157 (class 0 OID 0)
-- Dependencies: 230
-- Name: city_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.city_city_id_seq OWNED BY public.city.city_id;


--
-- TOC entry 216 (class 1259 OID 16900)
-- Name: condition_condition_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.condition_condition_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.condition_condition_id_seq OWNER TO postgres;

--
-- TOC entry 3158 (class 0 OID 0)
-- Dependencies: 216
-- Name: condition_condition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.condition_condition_id_seq OWNED BY public.advert_condition.condition_id;


--
-- TOC entry 237 (class 1259 OID 17132)
-- Name: evaluation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.evaluation (
    advertiser_id integer NOT NULL,
    guest_id integer NOT NULL,
    rating_id smallint NOT NULL,
    comment text,
    evaluation_id integer NOT NULL,
    CONSTRAINT evaluation_check CHECK ((advertiser_id <> guest_id))
);


ALTER TABLE public.evaluation OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 17118)
-- Name: favorite; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.favorite (
    user_id integer NOT NULL,
    advert_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.favorite OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16785)
-- Name: follow; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.follow (
    user_id integer NOT NULL,
    follower_id integer NOT NULL
);


ALTER TABLE public.follow OWNER TO postgres;

--
-- TOC entry 3159 (class 0 OID 0)
-- Dependencies: 207
-- Name: TABLE follow; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.follow IS 'users following relation table';


--
-- TOC entry 211 (class 1259 OID 16820)
-- Name: message; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.message (
    message_id bigint NOT NULL,
    chat_id integer NOT NULL,
    body text,
    "time" timestamp without time zone DEFAULT now() NOT NULL,
    is_read boolean DEFAULT false NOT NULL,
    user_id integer NOT NULL,
    message_type_id integer NOT NULL
);


ALTER TABLE public.message OWNER TO postgres;

--
-- TOC entry 3160 (class 0 OID 0)
-- Dependencies: 211
-- Name: TABLE message; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.message IS 'chat messages table';


--
-- TOC entry 210 (class 1259 OID 16818)
-- Name: message_message_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.message_message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.message_message_id_seq OWNER TO postgres;

--
-- TOC entry 3161 (class 0 OID 0)
-- Dependencies: 210
-- Name: message_message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.message_message_id_seq OWNED BY public.message.message_id;


--
-- TOC entry 215 (class 1259 OID 16883)
-- Name: message_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.message_type (
    message_type_id smallint NOT NULL,
    name character varying(45) NOT NULL
);


ALTER TABLE public.message_type OWNER TO postgres;

--
-- TOC entry 3162 (class 0 OID 0)
-- Dependencies: 215
-- Name: TABLE message_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.message_type IS 'message different types';


--
-- TOC entry 214 (class 1259 OID 16881)
-- Name: message_type_table_message_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.message_type_table_message_type_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.message_type_table_message_type_id_seq OWNER TO postgres;

--
-- TOC entry 3163 (class 0 OID 0)
-- Dependencies: 214
-- Name: message_type_table_message_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.message_type_table_message_type_id_seq OWNED BY public.message_type.message_type_id;


--
-- TOC entry 198 (class 1259 OID 16733)
-- Name: phone; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.phone (
    user_id integer NOT NULL,
    phone_number character varying(8) NOT NULL
);


ALTER TABLE public.phone OWNER TO postgres;

--
-- TOC entry 3164 (class 0 OID 0)
-- Dependencies: 198
-- Name: TABLE phone; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.phone IS 'user''s phones numbers table';


--
-- TOC entry 229 (class 1259 OID 17026)
-- Name: region; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.region (
    region_id smallint NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.region OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 17024)
-- Name: region_region_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.region_region_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.region_region_id_seq OWNER TO postgres;

--
-- TOC entry 3165 (class 0 OID 0)
-- Dependencies: 228
-- Name: region_region_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.region_region_id_seq OWNED BY public.region.region_id;


--
-- TOC entry 221 (class 1259 OID 16928)
-- Name: report; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.report (
    report_id integer NOT NULL,
    advert_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    report_message text NOT NULL,
    report_type_id integer,
    user_id integer,
    user_email character varying(50)
);


ALTER TABLE public.report OWNER TO postgres;

--
-- TOC entry 3166 (class 0 OID 0)
-- Dependencies: 221
-- Name: TABLE report; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.report IS 'table to store all report from user about adverts';


--
-- TOC entry 220 (class 1259 OID 16926)
-- Name: report_report_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.report_report_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.report_report_id_seq OWNER TO postgres;

--
-- TOC entry 3167 (class 0 OID 0)
-- Dependencies: 220
-- Name: report_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.report_report_id_seq OWNED BY public.report.report_id;


--
-- TOC entry 223 (class 1259 OID 16940)
-- Name: report_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.report_type (
    report_type_id smallint NOT NULL,
    title text NOT NULL
);


ALTER TABLE public.report_type OWNER TO postgres;

--
-- TOC entry 3168 (class 0 OID 0)
-- Dependencies: 223
-- Name: TABLE report_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.report_type IS 'different predefined report type with messages';


--
-- TOC entry 222 (class 1259 OID 16938)
-- Name: report_type_report_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.report_type_report_type_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.report_type_report_type_id_seq OWNER TO postgres;

--
-- TOC entry 3169 (class 0 OID 0)
-- Dependencies: 222
-- Name: report_type_report_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.report_type_report_type_id_seq OWNED BY public.report_type.report_type_id;


--
-- TOC entry 245 (class 1259 OID 17213)
-- Name: search; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.search (
    query character varying(60),
    "time" timestamp without time zone DEFAULT now() NOT NULL,
    user_id integer,
    is_success boolean NOT NULL,
    category_id integer
);


ALTER TABLE public.search OWNER TO postgres;

--
-- TOC entry 3170 (class 0 OID 0)
-- Dependencies: 245
-- Name: TABLE search; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.search IS 'table to store user''s search data';


--
-- TOC entry 206 (class 1259 OID 16779)
-- Name: session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.session (
    session_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    last_activity_time timestamp without time zone NOT NULL
);


ALTER TABLE public.session OWNER TO postgres;

--
-- TOC entry 3171 (class 0 OID 0)
-- Dependencies: 206
-- Name: TABLE session; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.session IS 'user''s connexions sessions table';


--
-- TOC entry 205 (class 1259 OID 16777)
-- Name: session_session_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.session_session_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.session_session_id_seq OWNER TO postgres;

--
-- TOC entry 3172 (class 0 OID 0)
-- Dependencies: 205
-- Name: session_session_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.session_session_id_seq OWNED BY public.session.session_id;


--
-- TOC entry 240 (class 1259 OID 17172)
-- Name: share; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.share (
    advert_id integer NOT NULL,
    guest_id integer,
    social_media_id integer NOT NULL,
    shared_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.share OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 17188)
-- Name: social_media; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.social_media (
    social_media_id integer NOT NULL,
    name character varying(45) NOT NULL
);


ALTER TABLE public.social_media OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 17186)
-- Name: social_media_social_media_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.social_media_social_media_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_media_social_media_id_seq OWNER TO postgres;

--
-- TOC entry 3173 (class 0 OID 0)
-- Dependencies: 241
-- Name: social_media_social_media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.social_media_social_media_id_seq OWNED BY public.social_media.social_media_id;


--
-- TOC entry 233 (class 1259 OID 17075)
-- Name: store; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store (
    store_id integer NOT NULL,
    brand_name character varying(50) NOT NULL,
    owner_id integer NOT NULL,
    slogan text,
    profile_picture_url text,
    background_picture_url text
);


ALTER TABLE public.store OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 17073)
-- Name: store_store_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.store_store_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_store_id_seq OWNER TO postgres;

--
-- TOC entry 3174 (class 0 OID 0)
-- Dependencies: 232
-- Name: store_store_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.store_store_id_seq OWNED BY public.store.store_id;


--
-- TOC entry 197 (class 1259 OID 16724)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    user_id integer NOT NULL,
    name character varying(45)[] NOT NULL,
    email character varying(45),
    profile_picture text,
    password text,
    auth_type_id integer NOT NULL,
    city_id integer
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16722)
-- Name: user_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_user_id_seq OWNER TO postgres;

--
-- TOC entry 3175 (class 0 OID 0)
-- Dependencies: 196
-- Name: user_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_user_id_seq OWNED BY public."user".user_id;


--
-- TOC entry 244 (class 1259 OID 17201)
-- Name: verified_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.verified_user (
    user_id integer NOT NULL,
    firstname character varying(45) NOT NULL,
    lastname character varying(45) NOT NULL,
    id_card_no character varying(60) NOT NULL,
    id_card_url text NOT NULL
);


ALTER TABLE public.verified_user OWNER TO postgres;

--
-- TOC entry 3176 (class 0 OID 0)
-- Dependencies: 244
-- Name: TABLE verified_user; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.verified_user IS 'here we store verified user''s data';


--
-- TOC entry 243 (class 1259 OID 17199)
-- Name: verified_user_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.verified_user_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.verified_user_user_id_seq OWNER TO postgres;

--
-- TOC entry 3177 (class 0 OID 0)
-- Dependencies: 243
-- Name: verified_user_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.verified_user_user_id_seq OWNED BY public.verified_user.user_id;


--
-- TOC entry 239 (class 1259 OID 17168)
-- Name: view; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.view (
    advert_id integer NOT NULL,
    guest_id integer,
    viewed_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.view OWNER TO postgres;

--
-- TOC entry 2852 (class 2604 OID 16766)
-- Name: account_state account_state_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_state ALTER COLUMN account_state_id SET DEFAULT nextval('public.account_state_account_state_id_seq'::regclass);


--
-- TOC entry 2853 (class 2604 OID 16774)
-- Name: account_type account_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_type ALTER COLUMN account_type_id SET DEFAULT nextval('public.account_type_account_type_id_seq'::regclass);


--
-- TOC entry 2864 (class 2604 OID 16919)
-- Name: advert advert_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.advert ALTER COLUMN advert_id SET DEFAULT nextval('public.advert_advert_id_seq'::regclass);


--
-- TOC entry 2863 (class 2604 OID 16905)
-- Name: advert_condition condition_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.advert_condition ALTER COLUMN condition_id SET DEFAULT nextval('public.condition_condition_id_seq'::regclass);


--
-- TOC entry 2870 (class 2604 OID 17018)
-- Name: advert_state advert_state_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.advert_state ALTER COLUMN advert_state_id SET DEFAULT nextval('public.advert_state_advert_state_id_seq'::regclass);


--
-- TOC entry 2869 (class 2604 OID 17009)
-- Name: advert_type advert_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.advert_type ALTER COLUMN advert_type_id SET DEFAULT nextval('public.advert_type_advert_type_id_seq'::regclass);


--
-- TOC entry 2851 (class 2604 OID 16746)
-- Name: auth_type auth_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_type ALTER COLUMN auth_type_id SET DEFAULT nextval('public.auth_type_auth_type_id_seq'::regclass);


--
-- TOC entry 2861 (class 2604 OID 16871)
-- Name: category category_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN category_id SET DEFAULT nextval('public.category_category_id_seq'::regclass);


--
-- TOC entry 2856 (class 2604 OID 16803)
-- Name: chat chat_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat ALTER COLUMN chat_id SET DEFAULT nextval('public.chat_chat_id_seq'::regclass);


--
-- TOC entry 2874 (class 2604 OID 17107)
-- Name: chat_state chat_state_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_state ALTER COLUMN chat_state_id SET DEFAULT nextval('public.chat_state_chat_state_id_seq'::regclass);


--
-- TOC entry 2872 (class 2604 OID 17040)
-- Name: city city_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city ALTER COLUMN city_id SET DEFAULT nextval('public.city_city_id_seq'::regclass);


--
-- TOC entry 2858 (class 2604 OID 16823)
-- Name: message message_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message ALTER COLUMN message_id SET DEFAULT nextval('public.message_message_id_seq'::regclass);


--
-- TOC entry 2862 (class 2604 OID 16886)
-- Name: message_type message_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message_type ALTER COLUMN message_type_id SET DEFAULT nextval('public.message_type_table_message_type_id_seq'::regclass);


--
-- TOC entry 2871 (class 2604 OID 17029)
-- Name: region region_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region ALTER COLUMN region_id SET DEFAULT nextval('public.region_region_id_seq'::regclass);


--
-- TOC entry 2866 (class 2604 OID 16931)
-- Name: report report_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report ALTER COLUMN report_id SET DEFAULT nextval('public.report_report_id_seq'::regclass);


--
-- TOC entry 2868 (class 2604 OID 16943)
-- Name: report_type report_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_type ALTER COLUMN report_type_id SET DEFAULT nextval('public.report_type_report_type_id_seq'::regclass);


--
-- TOC entry 2854 (class 2604 OID 16782)
-- Name: session session_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.session ALTER COLUMN session_id SET DEFAULT nextval('public.session_session_id_seq'::regclass);


--
-- TOC entry 2880 (class 2604 OID 17191)
-- Name: social_media social_media_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_media ALTER COLUMN social_media_id SET DEFAULT nextval('public.social_media_social_media_id_seq'::regclass);


--
-- TOC entry 2873 (class 2604 OID 17078)
-- Name: store store_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store ALTER COLUMN store_id SET DEFAULT nextval('public.store_store_id_seq'::regclass);


--
-- TOC entry 2850 (class 2604 OID 16727)
-- Name: user user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN user_id SET DEFAULT nextval('public.user_user_id_seq'::regclass);


--
-- TOC entry 2881 (class 2604 OID 17204)
-- Name: verified_user user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.verified_user ALTER COLUMN user_id SET DEFAULT nextval('public.verified_user_user_id_seq'::regclass);


--
-- TOC entry 3090 (class 0 OID 16763)
-- Dependencies: 202
-- Data for Name: account_state; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_state (account_state_id, description) FROM stdin;
\.


--
-- TOC entry 3092 (class 0 OID 16771)
-- Dependencies: 204
-- Data for Name: account_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_type (account_type_id, description) FROM stdin;
\.


--
-- TOC entry 3107 (class 0 OID 16916)
-- Dependencies: 219
-- Data for Name: advert; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.advert (advert_id, title, description, advertiser_id, category_id, condition_id, city_id, advert_state_id, advert_type_id, price, pictures_urls, created_at, map_position, meta_data) FROM stdin;
\.


--
-- TOC entry 3105 (class 0 OID 16902)
-- Dependencies: 217
-- Data for Name: advert_condition; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.advert_condition (condition_id, name) FROM stdin;
\.


--
-- TOC entry 3115 (class 0 OID 17015)
-- Dependencies: 227
-- Data for Name: advert_state; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.advert_state (advert_state_id, name) FROM stdin;
\.


--
-- TOC entry 3113 (class 0 OID 17006)
-- Dependencies: 225
-- Data for Name: advert_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.advert_type (advert_type_id, name) FROM stdin;
\.


--
-- TOC entry 3126 (class 0 OID 17154)
-- Dependencies: 238
-- Data for Name: alert; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alert (alert_id, owner_id, key_word, category_id, min_price, max_price, advert_type_id, is_active) FROM stdin;
\.


--
-- TOC entry 3088 (class 0 OID 16743)
-- Dependencies: 200
-- Data for Name: auth_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_type (auth_type_id, name) FROM stdin;
\.


--
-- TOC entry 3101 (class 0 OID 16868)
-- Dependencies: 213
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (parent_id, category_id, name, fields) FROM stdin;
\.


--
-- TOC entry 3097 (class 0 OID 16800)
-- Dependencies: 209
-- Data for Name: chat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chat (chat_id, advertiser_id, guest_id, chat_state_id) FROM stdin;
\.


--
-- TOC entry 3123 (class 0 OID 17104)
-- Dependencies: 235
-- Data for Name: chat_state; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chat_state (chat_state_id, name) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 17037)
-- Dependencies: 231
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.city (city_id, name, region_id) FROM stdin;
\.


--
-- TOC entry 3125 (class 0 OID 17132)
-- Dependencies: 237
-- Data for Name: evaluation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.evaluation (advertiser_id, guest_id, rating_id, comment, evaluation_id) FROM stdin;
\.


--
-- TOC entry 3124 (class 0 OID 17118)
-- Dependencies: 236
-- Data for Name: favorite; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.favorite (user_id, advert_id, created_at) FROM stdin;
\.


--
-- TOC entry 3095 (class 0 OID 16785)
-- Dependencies: 207
-- Data for Name: follow; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.follow (user_id, follower_id) FROM stdin;
\.


--
-- TOC entry 3099 (class 0 OID 16820)
-- Dependencies: 211
-- Data for Name: message; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.message (message_id, chat_id, body, "time", is_read, user_id, message_type_id) FROM stdin;
\.


--
-- TOC entry 3103 (class 0 OID 16883)
-- Dependencies: 215
-- Data for Name: message_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.message_type (message_type_id, name) FROM stdin;
\.


--
-- TOC entry 3086 (class 0 OID 16733)
-- Dependencies: 198
-- Data for Name: phone; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.phone (user_id, phone_number) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 17026)
-- Dependencies: 229
-- Data for Name: region; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.region (region_id, name) FROM stdin;
\.


--
-- TOC entry 3109 (class 0 OID 16928)
-- Dependencies: 221
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.report (report_id, advert_id, created_at, report_message, report_type_id, user_id, user_email) FROM stdin;
\.


--
-- TOC entry 3111 (class 0 OID 16940)
-- Dependencies: 223
-- Data for Name: report_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.report_type (report_type_id, title) FROM stdin;
\.


--
-- TOC entry 3133 (class 0 OID 17213)
-- Dependencies: 245
-- Data for Name: search; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.search (query, "time", user_id, is_success, category_id) FROM stdin;
\.


--
-- TOC entry 3094 (class 0 OID 16779)
-- Dependencies: 206
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.session (session_id, user_id, created_at, last_activity_time) FROM stdin;
\.


--
-- TOC entry 3128 (class 0 OID 17172)
-- Dependencies: 240
-- Data for Name: share; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.share (advert_id, guest_id, social_media_id, shared_at) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 17188)
-- Dependencies: 242
-- Data for Name: social_media; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.social_media (social_media_id, name) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 17075)
-- Dependencies: 233
-- Data for Name: store; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store (store_id, brand_name, owner_id, slogan, profile_picture_url, background_picture_url) FROM stdin;
\.


--
-- TOC entry 3085 (class 0 OID 16724)
-- Dependencies: 197
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (user_id, name, email, profile_picture, password, auth_type_id, city_id) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 17201)
-- Dependencies: 244
-- Data for Name: verified_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.verified_user (user_id, firstname, lastname, id_card_no, id_card_url) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 17168)
-- Dependencies: 239
-- Data for Name: view; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.view (advert_id, guest_id, viewed_at) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 0)
-- Dependencies: 201
-- Name: account_state_account_state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_state_account_state_id_seq', 1, false);


--
-- TOC entry 3179 (class 0 OID 0)
-- Dependencies: 203
-- Name: account_type_account_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_type_account_type_id_seq', 1, false);


--
-- TOC entry 3180 (class 0 OID 0)
-- Dependencies: 218
-- Name: advert_advert_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.advert_advert_id_seq', 1, false);


--
-- TOC entry 3181 (class 0 OID 0)
-- Dependencies: 226
-- Name: advert_state_advert_state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.advert_state_advert_state_id_seq', 1, false);


--
-- TOC entry 3182 (class 0 OID 0)
-- Dependencies: 224
-- Name: advert_type_advert_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.advert_type_advert_type_id_seq', 1, false);


--
-- TOC entry 3183 (class 0 OID 0)
-- Dependencies: 199
-- Name: auth_type_auth_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_type_auth_type_id_seq', 1, false);


--
-- TOC entry 3184 (class 0 OID 0)
-- Dependencies: 212
-- Name: category_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_category_id_seq', 1, false);


--
-- TOC entry 3185 (class 0 OID 0)
-- Dependencies: 208
-- Name: chat_chat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chat_chat_id_seq', 1, false);


--
-- TOC entry 3186 (class 0 OID 0)
-- Dependencies: 234
-- Name: chat_state_chat_state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chat_state_chat_state_id_seq', 1, false);


--
-- TOC entry 3187 (class 0 OID 0)
-- Dependencies: 230
-- Name: city_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.city_city_id_seq', 1, false);


--
-- TOC entry 3188 (class 0 OID 0)
-- Dependencies: 216
-- Name: condition_condition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.condition_condition_id_seq', 1, false);


--
-- TOC entry 3189 (class 0 OID 0)
-- Dependencies: 210
-- Name: message_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.message_message_id_seq', 1, false);


--
-- TOC entry 3190 (class 0 OID 0)
-- Dependencies: 214
-- Name: message_type_table_message_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.message_type_table_message_type_id_seq', 1, false);


--
-- TOC entry 3191 (class 0 OID 0)
-- Dependencies: 228
-- Name: region_region_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.region_region_id_seq', 1, false);


--
-- TOC entry 3192 (class 0 OID 0)
-- Dependencies: 220
-- Name: report_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.report_report_id_seq', 1, false);


--
-- TOC entry 3193 (class 0 OID 0)
-- Dependencies: 222
-- Name: report_type_report_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.report_type_report_type_id_seq', 1, false);


--
-- TOC entry 3194 (class 0 OID 0)
-- Dependencies: 205
-- Name: session_session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.session_session_id_seq', 1, false);


--
-- TOC entry 3195 (class 0 OID 0)
-- Dependencies: 241
-- Name: social_media_social_media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.social_media_social_media_id_seq', 1, false);


--
-- TOC entry 3196 (class 0 OID 0)
-- Dependencies: 232
-- Name: store_store_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.store_store_id_seq', 1, false);


--
-- TOC entry 3197 (class 0 OID 0)
-- Dependencies: 196
-- Name: user_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_user_id_seq', 1, false);


--
-- TOC entry 3198 (class 0 OID 0)
-- Dependencies: 243
-- Name: verified_user_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.verified_user_user_id_seq', 1, false);


--
-- TOC entry 2888 (class 2606 OID 16768)
-- Name: account_state account_state_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_state
    ADD CONSTRAINT account_state_pkey PRIMARY KEY (account_state_id);


--
-- TOC entry 2890 (class 2606 OID 16776)
-- Name: account_type account_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_type
    ADD CONSTRAINT account_type_pkey PRIMARY KEY (account_type_id);


--
-- TOC entry 2904 (class 2606 OID 16925)
-- Name: advert advert_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.advert
    ADD CONSTRAINT advert_pkey PRIMARY KEY (advert_id);


--
-- TOC entry 2912 (class 2606 OID 17023)
-- Name: advert_state advert_state_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.advert_state
    ADD CONSTRAINT advert_state_pkey PRIMARY KEY (advert_state_id);


--
-- TOC entry 2910 (class 2606 OID 17011)
-- Name: advert_type advert_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.advert_type
    ADD CONSTRAINT advert_type_pkey PRIMARY KEY (advert_type_id);


--
-- TOC entry 2926 (class 2606 OID 17162)
-- Name: alert alert_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alert
    ADD CONSTRAINT alert_pkey PRIMARY KEY (alert_id);


--
-- TOC entry 2886 (class 2606 OID 16748)
-- Name: auth_type auth_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_type
    ADD CONSTRAINT auth_type_pkey PRIMARY KEY (auth_type_id);


--
-- TOC entry 2898 (class 2606 OID 16873)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (category_id);


--
-- TOC entry 2857 (class 2606 OID 16817)
-- Name: chat chat_check; Type: CHECK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.chat
    ADD CONSTRAINT chat_check CHECK ((advertiser_id <> guest_id)) NOT VALID;


--
-- TOC entry 2894 (class 2606 OID 16806)
-- Name: chat chat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat
    ADD CONSTRAINT chat_pkey PRIMARY KEY (chat_id);


--
-- TOC entry 2922 (class 2606 OID 17112)
-- Name: chat_state chat_state_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_state
    ADD CONSTRAINT chat_state_pkey PRIMARY KEY (chat_state_id);


--
-- TOC entry 2916 (class 2606 OID 17042)
-- Name: city city_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (city_id);


--
-- TOC entry 2902 (class 2606 OID 16907)
-- Name: advert_condition condition_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.advert_condition
    ADD CONSTRAINT condition_pkey PRIMARY KEY (condition_id);


--
-- TOC entry 2924 (class 2606 OID 17140)
-- Name: evaluation evaluation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluation
    ADD CONSTRAINT evaluation_pkey PRIMARY KEY (evaluation_id);


--
-- TOC entry 2896 (class 2606 OID 16828)
-- Name: message message_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT message_pkey PRIMARY KEY (message_id);


--
-- TOC entry 2900 (class 2606 OID 16888)
-- Name: message_type message_type_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message_type
    ADD CONSTRAINT message_type_table_pkey PRIMARY KEY (message_type_id);


--
-- TOC entry 2914 (class 2606 OID 17034)
-- Name: region region_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region
    ADD CONSTRAINT region_pkey PRIMARY KEY (region_id);


--
-- TOC entry 2906 (class 2606 OID 16937)
-- Name: report report_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report
    ADD CONSTRAINT report_pkey PRIMARY KEY (report_id);


--
-- TOC entry 2908 (class 2606 OID 16948)
-- Name: report_type report_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_type
    ADD CONSTRAINT report_type_pkey PRIMARY KEY (report_type_id);


--
-- TOC entry 2892 (class 2606 OID 16784)
-- Name: session session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_pkey PRIMARY KEY (session_id);


--
-- TOC entry 2928 (class 2606 OID 17193)
-- Name: social_media social_media_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_media
    ADD CONSTRAINT social_media_pkey PRIMARY KEY (social_media_id);


--
-- TOC entry 2918 (class 2606 OID 17085)
-- Name: store store_owner_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store
    ADD CONSTRAINT store_owner_id_key UNIQUE (owner_id);


--
-- TOC entry 2920 (class 2606 OID 17083)
-- Name: store store_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store
    ADD CONSTRAINT store_pkey PRIMARY KEY (store_id);


--
-- TOC entry 2884 (class 2606 OID 16732)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (user_id);


--
-- TOC entry 2944 (class 2606 OID 17053)
-- Name: advert advert_advert_state_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.advert
    ADD CONSTRAINT advert_advert_state_id_fkey FOREIGN KEY (advert_state_id) REFERENCES public.advert_state(advert_state_id);


--
-- TOC entry 2943 (class 2606 OID 17048)
-- Name: advert advert_advert_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.advert
    ADD CONSTRAINT advert_advert_type_id_fkey FOREIGN KEY (advert_type_id) REFERENCES public.advert_type(advert_type_id);


--
-- TOC entry 2941 (class 2606 OID 16994)
-- Name: advert advert_advertiser_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.advert
    ADD CONSTRAINT advert_advertiser_id_fkey FOREIGN KEY (advertiser_id) REFERENCES public."user"(user_id);


--
-- TOC entry 2942 (class 2606 OID 16999)
-- Name: advert advert_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.advert
    ADD CONSTRAINT advert_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category(category_id);


--
-- TOC entry 2945 (class 2606 OID 17058)
-- Name: advert advert_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.advert
    ADD CONSTRAINT advert_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.city(city_id);


--
-- TOC entry 2946 (class 2606 OID 17063)
-- Name: advert advert_condition_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.advert
    ADD CONSTRAINT advert_condition_id_fkey FOREIGN KEY (condition_id) REFERENCES public.advert_condition(condition_id);


--
-- TOC entry 2956 (class 2606 OID 17163)
-- Name: alert alert_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alert
    ADD CONSTRAINT alert_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public."user"(user_id);


--
-- TOC entry 2929 (class 2606 OID 16756)
-- Name: user auth_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT auth_type_id_fkey FOREIGN KEY (auth_type_id) REFERENCES public.auth_type(auth_type_id);


--
-- TOC entry 2940 (class 2606 OID 16874)
-- Name: category category_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.category(category_id);


--
-- TOC entry 2935 (class 2606 OID 16807)
-- Name: chat chat_advertiser_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat
    ADD CONSTRAINT chat_advertiser_id_fkey FOREIGN KEY (advertiser_id) REFERENCES public."user"(user_id);


--
-- TOC entry 3199 (class 0 OID 0)
-- Dependencies: 2935
-- Name: CONSTRAINT chat_advertiser_id_fkey ON chat; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT chat_advertiser_id_fkey ON public.chat IS 'advertiser id';


--
-- TOC entry 2937 (class 2606 OID 17113)
-- Name: chat chat_chat_state_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat
    ADD CONSTRAINT chat_chat_state_id_fkey FOREIGN KEY (chat_state_id) REFERENCES public.chat_state(chat_state_id);


--
-- TOC entry 2936 (class 2606 OID 16812)
-- Name: chat chat_guest_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat
    ADD CONSTRAINT chat_guest_id_fkey FOREIGN KEY (guest_id) REFERENCES public."user"(user_id);


--
-- TOC entry 3200 (class 0 OID 0)
-- Dependencies: 2936
-- Name: CONSTRAINT chat_guest_id_fkey ON chat; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT chat_guest_id_fkey ON public.chat IS 'guest user id';


--
-- TOC entry 2950 (class 2606 OID 17043)
-- Name: city city_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.region(region_id);


--
-- TOC entry 2954 (class 2606 OID 17141)
-- Name: evaluation evaluation_advertiser_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluation
    ADD CONSTRAINT evaluation_advertiser_id_fkey FOREIGN KEY (advertiser_id) REFERENCES public."user"(user_id) ON DELETE CASCADE;


--
-- TOC entry 2955 (class 2606 OID 17146)
-- Name: evaluation evaluation_guest_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluation
    ADD CONSTRAINT evaluation_guest_id_fkey FOREIGN KEY (guest_id) REFERENCES public."user"(user_id) ON DELETE CASCADE;


--
-- TOC entry 2953 (class 2606 OID 17127)
-- Name: favorite favorite_advert_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorite
    ADD CONSTRAINT favorite_advert_id_fkey FOREIGN KEY (advert_id) REFERENCES public.advert(advert_id);


--
-- TOC entry 2952 (class 2606 OID 17122)
-- Name: favorite favorite_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorite
    ADD CONSTRAINT favorite_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(user_id);


--
-- TOC entry 2934 (class 2606 OID 16793)
-- Name: follow fk_follower_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.follow
    ADD CONSTRAINT fk_follower_user_id FOREIGN KEY (follower_id) REFERENCES public."user"(user_id);


--
-- TOC entry 3201 (class 0 OID 0)
-- Dependencies: 2934
-- Name: CONSTRAINT fk_follower_user_id ON follow; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT fk_follower_user_id ON public.follow IS 'follower id';


--
-- TOC entry 2933 (class 2606 OID 16788)
-- Name: follow fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.follow
    ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(user_id);


--
-- TOC entry 3202 (class 0 OID 0)
-- Dependencies: 2933
-- Name: CONSTRAINT fk_user_id ON follow; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT fk_user_id ON public.follow IS 'followed user''s id';


--
-- TOC entry 2939 (class 2606 OID 16889)
-- Name: message message_message_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT message_message_type_id_fkey FOREIGN KEY (message_type_id) REFERENCES public.message_type(message_type_id);


--
-- TOC entry 2938 (class 2606 OID 16839)
-- Name: message message_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT message_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(user_id);


--
-- TOC entry 2948 (class 2606 OID 16954)
-- Name: report report_advert_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report
    ADD CONSTRAINT report_advert_id_fkey FOREIGN KEY (advert_id) REFERENCES public.advert(advert_id);


--
-- TOC entry 2947 (class 2606 OID 16949)
-- Name: report report_report_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report
    ADD CONSTRAINT report_report_type_id_fkey FOREIGN KEY (report_type_id) REFERENCES public.report_type(report_type_id);


--
-- TOC entry 2949 (class 2606 OID 16959)
-- Name: report report_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report
    ADD CONSTRAINT report_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(user_id);


--
-- TOC entry 2962 (class 2606 OID 17223)
-- Name: search search_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.search
    ADD CONSTRAINT search_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category(category_id);


--
-- TOC entry 2961 (class 2606 OID 17217)
-- Name: search search_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.search
    ADD CONSTRAINT search_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(user_id);


--
-- TOC entry 2932 (class 2606 OID 16895)
-- Name: session session_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(user_id);


--
-- TOC entry 2957 (class 2606 OID 17176)
-- Name: share share_advert_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.share
    ADD CONSTRAINT share_advert_id_fkey FOREIGN KEY (advert_id) REFERENCES public.advert(advert_id);


--
-- TOC entry 2958 (class 2606 OID 17181)
-- Name: share share_guest_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.share
    ADD CONSTRAINT share_guest_id_fkey FOREIGN KEY (guest_id) REFERENCES public."user"(user_id);


--
-- TOC entry 2959 (class 2606 OID 17194)
-- Name: share share_social_media_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.share
    ADD CONSTRAINT share_social_media_id_fkey FOREIGN KEY (social_media_id) REFERENCES public.social_media(social_media_id);


--
-- TOC entry 2951 (class 2606 OID 17086)
-- Name: store store_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store
    ADD CONSTRAINT store_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public."user"(user_id);


--
-- TOC entry 2930 (class 2606 OID 17068)
-- Name: user user_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.city(city_id);


--
-- TOC entry 2931 (class 2606 OID 16736)
-- Name: phone user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phone
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES public."user"(user_id);


--
-- TOC entry 2960 (class 2606 OID 17208)
-- Name: verified_user verified_user_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.verified_user
    ADD CONSTRAINT verified_user_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(user_id);


-- Completed on 2018-12-16 20:27:05

--
-- PostgreSQL database dump complete
--

