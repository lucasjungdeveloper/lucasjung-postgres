--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE curio_test;




--
-- Drop roles
--

DROP ROLE postgres;


--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:7xOlAXD+Wgo51Sg/5M60bA==$iRJ4YDSYVxPRkewIUEPb2GUpEFawW/5eblVUGfFRIHw=:Mm4iqG2w2v8nmNRCl23wjgGrazd9vNquJn8wa4wRrig=';






--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2 (Debian 14.2-1.pgdg110+1)
-- Dumped by pg_dump version 14.2 (Debian 14.2-1.pgdg110+1)

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO postgres;

\connect template1

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
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: postgres
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "curio_test" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2 (Debian 14.2-1.pgdg110+1)
-- Dumped by pg_dump version 14.2 (Debian 14.2-1.pgdg110+1)

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
-- Name: curio_test; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE curio_test WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE curio_test OWNER TO postgres;

\connect curio_test

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
-- Name: admin; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA admin;


ALTER SCHEMA admin OWNER TO postgres;

--
-- Name: client; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA client;


ALTER SCHEMA client OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: bancosdedados; Type: TABLE; Schema: admin; Owner: postgres
--

CREATE TABLE admin.bancosdedados (
    uuid uuid NOT NULL,
    host character varying(1024) NOT NULL,
    cliente_id integer NOT NULL,
    schema character varying(20) NOT NULL,
    "user" character varying(100) NOT NULL,
    password character varying(255) NOT NULL,
    port integer NOT NULL,
    dbname character varying(100) NOT NULL,
    ssl character varying(255) NOT NULL
);


ALTER TABLE admin.bancosdedados OWNER TO postgres;

--
-- Name: clientes; Type: TABLE; Schema: admin; Owner: postgres
--

CREATE TABLE admin.clientes (
    id integer NOT NULL,
    razaosocial character varying(100) NOT NULL,
    nomedefantasia character varying(100),
    telefone character varying(22),
    endereco character varying(100),
    cidade character varying(100),
    cnpj character varying(25),
    estado character varying(2),
    bairro character varying(100),
    cep character varying(9),
    complemento character varying(100),
    whatsapp character varying(25),
    email character varying(100),
    site character varying(100),
    contato character varying(50),
    proprietario character varying(100),
    cpfdoproprietario character varying(14),
    uuid uuid NOT NULL,
    senha character varying(256) NOT NULL,
    login character varying(50) NOT NULL,
    id_licenca integer,
    tokensenha character varying(100),
    logado boolean DEFAULT false,
    ultimoacesso timestamp(6) with time zone,
    validadetoken timestamp(6) with time zone
);


ALTER TABLE admin.clientes OWNER TO postgres;

--
-- Name: clientes_id_seq; Type: SEQUENCE; Schema: admin; Owner: postgres
--

CREATE SEQUENCE admin.clientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin.clientes_id_seq OWNER TO postgres;

--
-- Name: clientes_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: postgres
--

ALTER SEQUENCE admin.clientes_id_seq OWNED BY admin.clientes.id;


--
-- Name: licencas; Type: TABLE; Schema: admin; Owner: postgres
--

CREATE TABLE admin.licencas (
    id integer NOT NULL,
    uuid uuid NOT NULL,
    validade date,
    ativa boolean DEFAULT false NOT NULL,
    id_tipodelicenca integer
);


ALTER TABLE admin.licencas OWNER TO postgres;

--
-- Name: licencas_id_seq; Type: SEQUENCE; Schema: admin; Owner: postgres
--

CREATE SEQUENCE admin.licencas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin.licencas_id_seq OWNER TO postgres;

--
-- Name: licencas_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: postgres
--

ALTER SEQUENCE admin.licencas_id_seq OWNED BY admin.licencas.id;


--
-- Name: modulos; Type: TABLE; Schema: admin; Owner: postgres
--

CREATE TABLE admin.modulos (
    uuid uuid NOT NULL,
    descricao uuid NOT NULL
);


ALTER TABLE admin.modulos OWNER TO postgres;

--
-- Name: tipodelicenca; Type: TABLE; Schema: admin; Owner: postgres
--

CREATE TABLE admin.tipodelicenca (
    id integer NOT NULL,
    uuid uuid NOT NULL,
    descricao character varying(20) NOT NULL,
    detalhes character varying(256),
    ativa boolean DEFAULT true
);


ALTER TABLE admin.tipodelicenca OWNER TO postgres;

--
-- Name: tipodelicenca_id_seq; Type: SEQUENCE; Schema: admin; Owner: postgres
--

CREATE SEQUENCE admin.tipodelicenca_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin.tipodelicenca_id_seq OWNER TO postgres;

--
-- Name: tipodelicenca_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: postgres
--

ALTER SEQUENCE admin.tipodelicenca_id_seq OWNED BY admin.tipodelicenca.id;


--
-- Name: tipousuario; Type: TABLE; Schema: admin; Owner: postgres
--

CREATE TABLE admin.tipousuario (
    id integer NOT NULL,
    uuid uuid NOT NULL,
    descricao character varying(50) NOT NULL
);


ALTER TABLE admin.tipousuario OWNER TO postgres;

--
-- Name: tipousuario_id_seq; Type: SEQUENCE; Schema: admin; Owner: postgres
--

CREATE SEQUENCE admin.tipousuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin.tipousuario_id_seq OWNER TO postgres;

--
-- Name: tipousuario_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: postgres
--

ALTER SEQUENCE admin.tipousuario_id_seq OWNED BY admin.tipousuario.id;


--
-- Name: usuarios; Type: TABLE; Schema: admin; Owner: postgres
--

CREATE TABLE admin.usuarios (
    id integer NOT NULL,
    uuid uuid NOT NULL,
    login character varying(50) NOT NULL,
    senha character varying(256) NOT NULL,
    id_tipousuario integer,
    token character varying(256),
    validadetoken time(6) with time zone,
    imagem character varying(255),
    nome character varying(100) NOT NULL,
    email character varying(200),
    telefone character varying(25)
);


ALTER TABLE admin.usuarios OWNER TO postgres;

--
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: admin; Owner: postgres
--

CREATE SEQUENCE admin.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin.usuarios_id_seq OWNER TO postgres;

--
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: postgres
--

ALTER SEQUENCE admin.usuarios_id_seq OWNED BY admin.usuarios.id;


--
-- Name: usuariosdosclientes; Type: TABLE; Schema: admin; Owner: postgres
--

CREATE TABLE admin.usuariosdosclientes (
    uuid uuid NOT NULL,
    login character varying(20) NOT NULL,
    senha character varying(255) NOT NULL,
    nome character varying(50) NOT NULL,
    telefone character(21),
    cliente_id integer NOT NULL,
    token character varying(100),
    validadetoken timestamp(6) without time zone,
    logado boolean DEFAULT false NOT NULL,
    ultimoacesso timestamp(6) without time zone,
    email character varying(200) NOT NULL,
    tipodeusuario_id integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL
);


ALTER TABLE admin.usuariosdosclientes OWNER TO postgres;

--
-- Name: analisedesolo; Type: TABLE; Schema: client; Owner: postgres
--

CREATE TABLE client.analisedesolo (
    uuid uuid NOT NULL,
    descricao character varying(100) NOT NULL,
    dataanalise date NOT NULL,
    valor real,
    fornecedor_uuid uuid NOT NULL,
    safra_uuid uuid NOT NULL,
    mapageral character varying(256),
    relatorio character varying(256)
);


ALTER TABLE client.analisedesolo OWNER TO postgres;

--
-- Name: analiseindividual; Type: TABLE; Schema: client; Owner: postgres
--

CREATE TABLE client.analiseindividual (
    uuid uuid NOT NULL,
    analisedesolo_uuid uuid NOT NULL,
    descricao character varying(100) NOT NULL,
    imagem character varying(100),
    relatorio character varying(256),
    dataanalise date NOT NULL,
    talhao_uuid uuid NOT NULL,
    latitude text,
    longitude text
);


ALTER TABLE client.analiseindividual OWNER TO postgres;

--
-- Name: armadilha; Type: TABLE; Schema: client; Owner: postgres
--

CREATE TABLE client.armadilha (
    uuid uuid NOT NULL,
    codigobarras character varying(25) NOT NULL,
    latitude character varying(100),
    longitude character varying(100),
    ip character varying(100),
    versao character varying(100),
    datainstalacao date,
    dataatualizacao date,
    datadesinstalacao date,
    mac character varying(100),
    tipoarmadilha_uuid character varying(100),
    ativa boolean,
    talhao_uuid character varying(100)
);


ALTER TABLE client.armadilha OWNER TO postgres;

--
-- Name: conversaodemedidas; Type: TABLE; Schema: client; Owner: postgres
--

CREATE TABLE client.conversaodemedidas (
    uuid uuid NOT NULL,
    unidade1 uuid NOT NULL,
    unidade2 uuid NOT NULL,
    fatordeconversao real NOT NULL
);


ALTER TABLE client.conversaodemedidas OWNER TO postgres;

--
-- Name: dadosauxiliares; Type: TABLE; Schema: client; Owner: postgres
--

CREATE TABLE client.dadosauxiliares (
    uuid uuid NOT NULL,
    tiposauxiliares_uuid uuid NOT NULL,
    descricao character varying(100) NOT NULL
);


ALTER TABLE client.dadosauxiliares OWNER TO postgres;

--
-- Name: fazenda; Type: TABLE; Schema: client; Owner: postgres
--

CREATE TABLE client.fazenda (
    uuid uuid NOT NULL,
    nome character varying(100) NOT NULL,
    cidade character varying(100),
    car character varying(100),
    datacar date,
    areatotal real,
    areacultivavel real,
    imagemsatelite character varying(1024),
    assinaturadigital character varying(1024),
    senhaassinatura character varying(1024)
);


ALTER TABLE client.fazenda OWNER TO postgres;

--
-- Name: fornecedores; Type: TABLE; Schema: client; Owner: postgres
--

CREATE TABLE client.fornecedores (
    uuid uuid NOT NULL,
    razaosocial character varying(100) NOT NULL,
    cnpj character varying(18),
    cpf character varying(14),
    telefone character varying(25),
    uf character varying(2),
    cidade character varying(50),
    endereco character varying(255),
    complemento character varying(100),
    cep character varying(9),
    site character varying(255),
    email character varying(255),
    contato character varying(50),
    telefonecontato character varying(25),
    nomefantasia character varying(100)
);


ALTER TABLE client.fornecedores OWNER TO postgres;

--
-- Name: imagemarmadilha; Type: TABLE; Schema: client; Owner: postgres
--

CREATE TABLE client.imagemarmadilha (
    uuid uuid NOT NULL,
    armadilha_uuid uuid NOT NULL,
    arquivo character varying(255),
    data date,
    hora time without time zone
);


ALTER TABLE client.imagemarmadilha OWNER TO postgres;

--
-- Name: insumos; Type: TABLE; Schema: client; Owner: postgres
--

CREATE TABLE client.insumos (
    uuid uuid NOT NULL,
    tipodeinsumo_uuid uuid NOT NULL,
    descricao text NOT NULL,
    cultura_uuid uuid,
    marcainsumo_uuid uuid,
    produtividade real,
    royalties real,
    unidadedemedida_uuid uuid NOT NULL
);


ALTER TABLE client.insumos OWNER TO postgres;

--
-- Name: itemorcamento; Type: TABLE; Schema: client; Owner: postgres
--

CREATE TABLE client.itemorcamento (
    uuid uuid NOT NULL,
    orcamento_uuid uuid NOT NULL,
    insumo_uuid uuid NOT NULL,
    descricao character varying(255) NOT NULL,
    quantidade real NOT NULL,
    unidadedemedida_uuid uuid NOT NULL
);


ALTER TABLE client.itemorcamento OWNER TO postgres;

--
-- Name: localcaomaquinas; Type: TABLE; Schema: client; Owner: postgres
--

CREATE TABLE client.localcaomaquinas (
    uuid uuid NOT NULL,
    fornecedor_uuid uuid NOT NULL,
    datainicio date NOT NULL,
    datafinal date NOT NULL,
    datacontrato date NOT NULL,
    descricao character varying(256) NOT NULL,
    valor real NOT NULL,
    safra_uuid uuid NOT NULL,
    executado boolean NOT NULL,
    tipodemaquina_uuid uuid NOT NULL,
    tipomoeda_uuid uuid NOT NULL,
    formadepagamento character varying(255) NOT NULL
);


ALTER TABLE client.localcaomaquinas OWNER TO postgres;

--
-- Name: manutencaomaquinas; Type: TABLE; Schema: client; Owner: postgres
--

CREATE TABLE client.manutencaomaquinas (
    uuid uuid NOT NULL,
    maquina_uuid uuid NOT NULL,
    datamanutencao date NOT NULL,
    descricao character varying(255) NOT NULL,
    valor real,
    safra_uuid uuid NOT NULL,
    fornecedor_uuid uuid NOT NULL
);


ALTER TABLE client.manutencaomaquinas OWNER TO postgres;

--
-- Name: maquinaseimplementos; Type: TABLE; Schema: client; Owner: postgres
--

CREATE TABLE client.maquinaseimplementos (
    uuid uuid NOT NULL,
    marcademaquinas_uuid uuid NOT NULL,
    tipodemaquina_uuid uuid NOT NULL,
    descricao character varying(100) NOT NULL,
    dataaquisicao date,
    valoraquisicao real,
    imagem character varying(255),
    qrcode character varying(32) NOT NULL
);


ALTER TABLE client.maquinaseimplementos OWNER TO postgres;

--
-- Name: orcamentos; Type: TABLE; Schema: client; Owner: postgres
--

CREATE TABLE client.orcamentos (
    uuid uuid NOT NULL,
    dataorcamento date NOT NULL,
    descricao character varying(255) NOT NULL,
    dataentrega date NOT NULL
);


ALTER TABLE client.orcamentos OWNER TO postgres;

--
-- Name: pecas; Type: TABLE; Schema: client; Owner: postgres
--

CREATE TABLE client.pecas (
    uuid uuid NOT NULL,
    descricao character varying(255) NOT NULL,
    quantidadeestoque real NOT NULL
);


ALTER TABLE client.pecas OWNER TO postgres;

--
-- Name: pecasmanutencao; Type: TABLE; Schema: client; Owner: postgres
--

CREATE TABLE client.pecasmanutencao (
    uuid uuid NOT NULL,
    pecas_uuid uuid NOT NULL,
    quantidade real NOT NULL,
    valorunitario real NOT NULL,
    manutencaomaquinas_uuid uuid NOT NULL
);


ALTER TABLE client.pecasmanutencao OWNER TO postgres;

--
-- Name: pragas; Type: TABLE; Schema: client; Owner: postgres
--

CREATE TABLE client.pragas (
    uuid uuid NOT NULL,
    nome character varying(100) NOT NULL,
    nomecientifico character varying(100),
    imagem character varying(255)
);


ALTER TABLE client.pragas OWNER TO postgres;

--
-- Name: pragasnaimagem; Type: TABLE; Schema: client; Owner: postgres
--

CREATE TABLE client.pragasnaimagem (
    uuid uuid NOT NULL,
    imagemarmadilha_uuid uuid NOT NULL,
    pragas_uuid uuid,
    estagio_uuid uuid,
    quantidade integer,
    tipodetecao_uuid uuid,
    confirmacao boolean,
    dataanalise date,
    dataconfirmacao date
);


ALTER TABLE client.pragasnaimagem OWNER TO postgres;

--
-- Name: safras; Type: TABLE; Schema: client; Owner: postgres
--

CREATE TABLE client.safras (
    uuid uuid NOT NULL,
    descricao character varying(100) NOT NULL,
    ativo boolean NOT NULL,
    dataabertura date NOT NULL,
    dataencerramento date,
    plantasporhectare integer NOT NULL,
    cultura_uuid uuid NOT NULL
);


ALTER TABLE client.safras OWNER TO postgres;

--
-- Name: selecaoinsumos; Type: TABLE; Schema: client; Owner: postgres
--

CREATE TABLE client.selecaoinsumos (
    uuid uuid NOT NULL,
    talhao_uuid uuid,
    insumo_uuid uuid NOT NULL,
    safra_uuid uuid NOT NULL,
    dataselecao date NOT NULL,
    quantidade integer NOT NULL,
    unidadedemedida_uuid uuid NOT NULL
);


ALTER TABLE client.selecaoinsumos OWNER TO postgres;

--
-- Name: talhoes; Type: TABLE; Schema: client; Owner: postgres
--

CREATE TABLE client.talhoes (
    uuid uuid NOT NULL,
    nome character varying(50) NOT NULL,
    tamanho real NOT NULL,
    ativo boolean NOT NULL,
    setor_uuid uuid
);


ALTER TABLE client.talhoes OWNER TO postgres;

--
-- Name: tiposauxiliares; Type: TABLE; Schema: client; Owner: postgres
--

CREATE TABLE client.tiposauxiliares (
    uuid uuid NOT NULL,
    chave character varying(30) NOT NULL,
    descricao character varying(100) NOT NULL
);


ALTER TABLE client.tiposauxiliares OWNER TO postgres;

--
-- Name: clientes id; Type: DEFAULT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.clientes ALTER COLUMN id SET DEFAULT nextval('admin.clientes_id_seq'::regclass);


--
-- Name: licencas id; Type: DEFAULT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.licencas ALTER COLUMN id SET DEFAULT nextval('admin.licencas_id_seq'::regclass);


--
-- Name: tipodelicenca id; Type: DEFAULT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.tipodelicenca ALTER COLUMN id SET DEFAULT nextval('admin.tipodelicenca_id_seq'::regclass);


--
-- Name: tipousuario id; Type: DEFAULT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.tipousuario ALTER COLUMN id SET DEFAULT nextval('admin.tipousuario_id_seq'::regclass);


--
-- Name: usuarios id; Type: DEFAULT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.usuarios ALTER COLUMN id SET DEFAULT nextval('admin.usuarios_id_seq'::regclass);


--
-- Data for Name: bancosdedados; Type: TABLE DATA; Schema: admin; Owner: postgres
--

COPY admin.bancosdedados (uuid, host, cliente_id, schema, "user", password, port, dbname, ssl) FROM stdin;
27ab4f8f-70cf-42db-8bb6-ea7669b11b51	ec2-34-230-198-12.compute-1.amazonaws.com	1	client	ukrauzgmvscime	4e61798b82427f6e44b0a493a2d2661dc49f14e49d15eea79fe43678d4a57d9b	5432	d3v0vtie2n7fm9	sem ssl
\.


--
-- Data for Name: clientes; Type: TABLE DATA; Schema: admin; Owner: postgres
--

COPY admin.clientes (id, razaosocial, nomedefantasia, telefone, endereco, cidade, cnpj, estado, bairro, cep, complemento, whatsapp, email, site, contato, proprietario, cpfdoproprietario, uuid, senha, login, id_licenca, tokensenha, logado, ultimoacesso, validadetoken) FROM stdin;
2	Cliente standard	Cliente standard Fantasia	6632112343	\N	\N	\N	\N	\N	\N	\N	\N	standardmeu@email.com	\N	José standard	José standard proprietário	\N	5635db46-f33d-406c-9a57-7f2ca540d1c3	$argon2i$v=19$m=16,t=2,p=1$Tkh3Y3J5ellkVGtTNnVwNg$avkwxdfUJK+F3QFQC73AAQ	standard	2	\N	f	\N	\N
3	Cliente gold	Cliente gold Fantasia	6632112343	\N	\N	\N	\N	\N	\N	\N	\N	goldmeu@email.com	\N	José gold	José gold proprietário	\N	7599ad2e-5592-460c-bc30-d7941bea9bff	$argon2i$v=19$m=16,t=2,p=1$Tkh3Y3J5ellkVGtTNnVwNg$avkwxdfUJK+F3QFQC73AAQ	gold	3	\N	f	\N	\N
4	Cliente premium	Cliente premium Fantasia	6632112343	\N	\N	\N	\N	\N	\N	\N	\N	premiummeu@email.com	\N	José premium	José premium proprietário	\N	90b51d3a-2978-481b-a03a-f8e159d6d075	$argon2i$v=19$m=16,t=2,p=1$Tkh3Y3J5ellkVGtTNnVwNg$avkwxdfUJK+F3QFQC73AAQ	premium	4	\N	f	\N	\N
5	Cliente vencido	Cliente vencido Fantasia	6632112343	\N	\N	\N	\N	\N	\N	\N	\N	vencidomeu@email.com	\N	José vencido	José vencido proprietário	\N	ad12f740-ef55-44d9-bb6d-7c822dda3032	$argon2i$v=19$m=16,t=2,p=1$Tkh3Y3J5ellkVGtTNnVwNg$avkwxdfUJK+F3QFQC73AAQ	vencido	5	\N	f	\N	\N
6	Cliente inativo Demo	Cliente inativo Fantasia	6632112343	\N	\N	\N	\N	\N	\N	\N	\N	inativomeu@email.com	\N	José inativo	José inativo proprietário	\N	b470a904-694e-476c-a6b0-70e4df47d8e5	$argon2i$v=19$m=16,t=2,p=1$Tkh3Y3J5ellkVGtTNnVwNg$avkwxdfUJK+F3QFQC73AAQ	inativo	6	\N	f	\N	\N
1	Cliente Demo	Cliente Demo Fantasia	6632112343	\N	\N	\N	\N	\N	\N	\N	\N	contato@scriptn.com.br	\N	José	José proprietário	\N	a6e1a058-bec8-4b45-b960-7cba6277130b	$argon2i$v=19$m=4096,t=3,p=1$VkxSaEtTOHVDank4dGhGVQ$TGf7c89sEOzI774YRLAdW9MzcGBy6eQoMckAa8sbPjI	scriptn	1	82161bfd-7f27-4063-b6b6-63b8512fcf94	t	2022-04-27 18:54:20.745+00	2022-04-05 05:20:50.237+00
\.


--
-- Data for Name: licencas; Type: TABLE DATA; Schema: admin; Owner: postgres
--

COPY admin.licencas (id, uuid, validade, ativa, id_tipodelicenca) FROM stdin;
1	9083e875-933d-46df-98fa-212a05f50628	2022-12-31	t	1
2	dfc82808-a9d3-45ce-9db5-7d9ccaab3e17	2022-12-31	t	2
3	075c6693-942b-4eda-971f-f5e3267d36e0	2022-12-31	t	3
4	0663db7e-5b22-4fb6-bf5e-b7ab1a3eb01e	2022-12-31	t	4
5	1867fd56-8777-4f60-835a-58f233d71090	2022-02-03	t	1
6	1867fd56-8777-4f60-835a-58f233d71090	2022-12-31	f	1
\.


--
-- Data for Name: modulos; Type: TABLE DATA; Schema: admin; Owner: postgres
--

COPY admin.modulos (uuid, descricao) FROM stdin;
\.


--
-- Data for Name: tipodelicenca; Type: TABLE DATA; Schema: admin; Owner: postgres
--

COPY admin.tipodelicenca (id, uuid, descricao, detalhes, ativa) FROM stdin;
1	37c99025-74c6-4424-b4ec-6a24ba40a426	Demo	Licença Demonstrativa	t
2	a31c22a0-b793-45bd-acd0-e990a3b1ab5d	Standard	Licença Básica	t
3	1cc6e2bd-fc5c-4011-b488-642ddefbfaee	Gold	Licença Completa	t
4	5d9ac44a-51f1-40dd-81a8-22d2c2ad1968	Premium	Licença Premium	t
\.


--
-- Data for Name: tipousuario; Type: TABLE DATA; Schema: admin; Owner: postgres
--

COPY admin.tipousuario (id, uuid, descricao) FROM stdin;
1	be3a1e7c-9030-4e9b-adee-4a05ef2a79b5	Administrador
2	1bbc585e-9229-422e-92b9-9b5dcafd3a7d	Gerente
3	ee66c481-3946-4248-af21-b177c0912428	Escritório
4	0bf0e998-ce44-47bd-bbc2-49b687775654	Funcionário
26	be3a1e7c-9030-4e9b-adee-4a05ef2a79b5	Administrador
27	1bbc585e-9229-422e-92b9-9b5dcafd3a7d	Gerente
28	ee66c481-3946-4248-af21-b177c0912428	Escritório
6	0bf0e998-ce44-47bd-bbc2-49b687775654	Funcionário
5	0bf0e998-ce44-47bd-bbc2-49b687775654	Suporte
\.


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: admin; Owner: postgres
--

COPY admin.usuarios (id, uuid, login, senha, id_tipousuario, token, validadetoken, imagem, nome, email, telefone) FROM stdin;
2	71b55014-78c2-4e3d-903c-cc4ddeb55fb7	admin	$argon2i$v=19$m=16,t=2,p=1$VkxSaEtTOHVDank4dGhGVQ$DVb1k0kMhHIOg6pXiibKQQ	1	\N	\N	\N	Administrador	\N	\N
3	71b55014-78c2-4e3d-903c-cc4ddeb55fb7	admin	$argon2i$v=19$m=16,t=2,p=1$VkxSaEtTOHVDank4dGhGVQ$DVb1k0kMhHIOg6pXiibKQQ	1	\N	\N	\N	Administrador	\N	\N
\.


--
-- Data for Name: usuariosdosclientes; Type: TABLE DATA; Schema: admin; Owner: postgres
--

COPY admin.usuariosdosclientes (uuid, login, senha, nome, telefone, cliente_id, token, validadetoken, logado, ultimoacesso, email, tipodeusuario_id, ativo) FROM stdin;
88aee444-079e-4307-8737-f3560269fbb3	user1	$argon2i$v=19$m=16,t=2,p=1$Tkh3Y3J5ellkVGtTNnVwNg$avkwxdfUJK+F3QFQC73AAQ	Usuário 1	\N	1	\N	\N	f	\N	user1@email.com	4	t
e1bafe10-56a5-4aa6-a637-e295005d5a01	user2	$argon2i$v=19$m=16,t=2,p=1$Tkh3Y3J5ellkVGtTNnVwNg$avkwxdfUJK+F3QFQC73AAQ	Usuário 2	\N	1	\N	\N	f	\N	user2@email.com	3	t
71c3b979-8958-4b62-9c4a-d29fcf9e7a55	user3	$argon2i$v=19$m=16,t=2,p=1$Tkh3Y3J5ellkVGtTNnVwNg$avkwxdfUJK+F3QFQC73AAQ	Usuário 3	\N	1	\N	\N	f	\N	user3@email.com	3	t
4808d961-be9d-4339-bb77-c220c1838495	test1	$argon2i$v=19$m=4096,t=3,p=1$VkxSaEtTOHVDank4dGhGVQ$TGf7c89sEOzI774YRLAdW9MzcGBy6eQoMckAa8sbPjI	asda 6	123123123            	1	\N	\N	f	\N	asd@asd.com	3	t
b48da090-a356-47c6-8a30-363d43fd7d79	edu_test	$argon2i$v=19$m=4096,t=3,p=1$VkxSaEtTOHVDank4dGhGVQ$TGf7c89sEOzI774YRLAdW9MzcGBy6eQoMckAa8sbPjI	Eduardo Test	66999579223          	1	\N	\N	f	\N	edu@edu.com	3	t
\.


--
-- Data for Name: analisedesolo; Type: TABLE DATA; Schema: client; Owner: postgres
--

COPY client.analisedesolo (uuid, descricao, dataanalise, valor, fornecedor_uuid, safra_uuid, mapageral, relatorio) FROM stdin;
\.


--
-- Data for Name: analiseindividual; Type: TABLE DATA; Schema: client; Owner: postgres
--

COPY client.analiseindividual (uuid, analisedesolo_uuid, descricao, imagem, relatorio, dataanalise, talhao_uuid, latitude, longitude) FROM stdin;
\.


--
-- Data for Name: armadilha; Type: TABLE DATA; Schema: client; Owner: postgres
--

COPY client.armadilha (uuid, codigobarras, latitude, longitude, ip, versao, datainstalacao, dataatualizacao, datadesinstalacao, mac, tipoarmadilha_uuid, ativa, talhao_uuid) FROM stdin;
148a57d2-695f-447b-a858-45a9be7107e8	123123123				1.0	\N	\N	\N		\N	t	377e0614-5b22-45ac-957b-aafd33ebaa93
b0cd5dd1-e1a2-4bb6-a11e-7366391b7978	1234	\N	\N	\N	\N	2022-03-02	\N	2022-04-04	\N	\N	f	377e0614-5b22-45ac-957b-aafd33ebaa93
832b2771-e7a5-4aea-8fab-79085fc777d7	123123123123123	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	377e0614-5b22-45ac-957b-aafd33ebaa93
2b061e2a-5a1d-4326-a264-6ff369e8592f	121231231231231	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	377e0614-5b22-45ac-957b-aafd33ebaa93
a5ca5cc5-2d90-4060-a3c2-4a985a802182	4321	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	377e0614-5b22-45ac-957b-aafd33ebaa93
\.


--
-- Data for Name: conversaodemedidas; Type: TABLE DATA; Schema: client; Owner: postgres
--

COPY client.conversaodemedidas (uuid, unidade1, unidade2, fatordeconversao) FROM stdin;
\.


--
-- Data for Name: dadosauxiliares; Type: TABLE DATA; Schema: client; Owner: postgres
--

COPY client.dadosauxiliares (uuid, tiposauxiliares_uuid, descricao) FROM stdin;
ac8af977-c174-4522-9dd2-54b297e648ac	1cccd265-4b4b-4b15-bfd1-72419910436d	Combustível
3a677fc1-1b3c-4420-9025-5d892b6dac6f	c45bf76e-51a4-45c8-ab51-82e34557f598	Trator
47834975-7119-4994-a2cf-80ad2e805a7a	c45bf76e-51a4-45c8-ab51-82e34557f598	Colheitadeira
ef0fae8f-29b8-4a60-a0a9-cb0880c979fc	c45bf76e-51a4-45c8-ab51-82e34557f598	Plantadeira
7818d822-9c6e-4376-9ca8-27eed2110ce9	c45bf76e-51a4-45c8-ab51-82e34557f598	Semeadora
c7f1cd59-31f3-49a3-98f8-fb3c272b0605	c45bf76e-51a4-45c8-ab51-82e34557f598	Grade
2d589d10-5d98-42f0-8752-8463f36cad41	c45bf76e-51a4-45c8-ab51-82e34557f598	Subsolador
6eeed29b-b9da-4581-a73c-a92f45f6defe	c45bf76e-51a4-45c8-ab51-82e34557f598	Pulverizador
9f1188b7-f158-44aa-867a-de19bb23a505	c45bf76e-51a4-45c8-ab51-82e34557f598	Rolo faca
33222a46-449a-4729-b47e-ad0d5fed166c	c45bf76e-51a4-45c8-ab51-82e34557f598	Arado
0698a953-f1b5-40ef-816a-3ee4332389e0	c45bf76e-51a4-45c8-ab51-82e34557f598	Esteira
a4905520-b7ed-46fe-bc6a-cd9f7a13ee8b	c45bf76e-51a4-45c8-ab51-82e34557f598	Enxada rotativa
f7913cba-8d65-46ed-9cc1-9ecd17f3ba26	c45bf76e-51a4-45c8-ab51-82e34557f598	Avião
51ceed10-c41d-41e3-8792-bc7f08f4ec1a	c45bf76e-51a4-45c8-ab51-82e34557f598	Carro
88d74afd-8dd3-459c-9fe8-e2069d3b152e	c45bf76e-51a4-45c8-ab51-82e34557f598	Motocicleta
412a3852-e800-40e2-a2bc-6cbb00a20b52	c45bf76e-51a4-45c8-ab51-82e34557f598	Caminhonete
da61448b-01ec-45bf-812a-89b559499857	c45bf76e-51a4-45c8-ab51-82e34557f598	Caminhão
8c7abdf7-baef-48d7-89f9-bf3b8b6e69bb	c45bf76e-51a4-45c8-ab51-82e34557f598	Carreta
128cc9f2-05e2-4784-8729-2c38c11e4c08	c45bf76e-51a4-45c8-ab51-82e34557f598	Drone
ac6b2693-74fb-4750-a62f-b92ba2e6eb5f	c45bf76e-51a4-45c8-ab51-82e34557f598	Distribuidor de adudo
440cc8b0-8551-4ed1-8808-f411fb6108f5	c45bf76e-51a4-45c8-ab51-82e34557f598	Tratamento de semente
fbf50f5c-c67d-4a0f-8f7d-877faec7cce8	c45bf76e-51a4-45c8-ab51-82e34557f598	Guindaste
b6ab6a03-f34d-4b0f-82cd-cd6700f772ac	c45bf76e-51a4-45c8-ab51-82e34557f598	Empilhadeira
e39fbf25-600d-4785-8317-0da926616022	c45bf76e-51a4-45c8-ab51-82e34557f598	Pivô de irrigação
0ea912fc-a526-4733-bf63-64fa43a85ac4	c45bf76e-51a4-45c8-ab51-82e34557f598	Coluna de irrigação
a103b68f-9242-438e-87e0-d6c232e71988	bfc454fb-3cbd-453c-973d-42e7626b0751	Massey Ferguson
da9a7ed2-740d-417f-9c25-f87bbdd94f7f	bfc454fb-3cbd-453c-973d-42e7626b0751	Valtra
b5b85c6d-5bbd-4bc2-a2b4-4c9d2c1c088e	bfc454fb-3cbd-453c-973d-42e7626b0751	John Deere
c448c4c8-9590-4593-99e6-4f18fb5d91f3	bfc454fb-3cbd-453c-973d-42e7626b0751	Case
314f0188-3dac-46cf-bbb0-77847e9a4258	bfc454fb-3cbd-453c-973d-42e7626b0751	New Holland
844885f5-871f-4501-b85b-b4bc99796d05	bfc454fb-3cbd-453c-973d-42e7626b0751	Jacto
4bcf3af7-fbad-4fc7-b053-35a8e92c2610	bfc454fb-3cbd-453c-973d-42e7626b0751	Huhn
952a7197-ac3b-4855-bb5b-7f88f54666fb	bfc454fb-3cbd-453c-973d-42e7626b0751	Scania
4e23b617-fc49-4f9a-a668-96aa8ace7f56	bfc454fb-3cbd-453c-973d-42e7626b0751	Ford
29ee1fba-953d-48c7-83f5-c05c156c275f	bfc454fb-3cbd-453c-973d-42e7626b0751	Volkswagen
1d64ece5-d0e7-4ee1-a596-843f556f764a	bfc454fb-3cbd-453c-973d-42e7626b0751	Iveco
33f1a7b0-6a62-43c2-acf2-d7f60244f40f	bfc454fb-3cbd-453c-973d-42e7626b0751	Volvo
251e7ce8-3de3-4e60-a6f3-b212a3bc6149	bfc454fb-3cbd-453c-973d-42e7626b0751	Mercedes-Benz
a96ffb59-02ca-4c2e-9664-6735e7ae2138	bfc454fb-3cbd-453c-973d-42e7626b0751	MAN
8d175978-f914-49b1-8421-900658896eda	838b3d89-2797-49b4-9602-dac24eea1cf5	Adubação
6b4be57f-8b8b-4e02-8319-4b25abdbaf07	838b3d89-2797-49b4-9602-dac24eea1cf5	Calagem
04f3c69e-dfaa-4437-90d3-f64f5f98080b	838b3d89-2797-49b4-9602-dac24eea1cf5	Plantio
2ed1cdd6-8328-410b-a653-b8af54f86d57	838b3d89-2797-49b4-9602-dac24eea1cf5	Pulverização
8cd7a90c-0f13-4aed-abda-c0d8cb57f3da	838b3d89-2797-49b4-9602-dac24eea1cf5	Transporte
c44cccb8-56cd-4ae3-b708-f8a4be74433a	838b3d89-2797-49b4-9602-dac24eea1cf5	Colheita
96baa196-2520-46ee-b266-95d10b3a7f7c	838b3d89-2797-49b4-9602-dac24eea1cf5	Monitoramento de pragas
bec9bf80-047b-4641-b75d-d81719a6900e	838b3d89-2797-49b4-9602-dac24eea1cf5	Preparo de produtos químicos
046ace80-952b-41f9-8f96-17cbdfc8b93f	838b3d89-2797-49b4-9602-dac24eea1cf5	Preparo de sementes
4ba844b2-abac-4717-8057-cdd4240aba93	6bb5d8ea-5676-4c18-811e-7fc5b98343a1	Lagarata da soja
2242a402-b603-4255-8a48-f6c8da8b6911	6bb5d8ea-5676-4c18-811e-7fc5b98343a1	Lagarta do cartucho
279c7aa8-64a8-4fea-b51a-974f6b76b1cf	6bb5d8ea-5676-4c18-811e-7fc5b98343a1	Lagarta elastano
c7fd2b1e-888c-4116-a879-59c61f8d0e65	6bb5d8ea-5676-4c18-811e-7fc5b98343a1	Lagarta falsa medideira
d4ae5624-fb48-4514-a1db-a8a7b21e5c77	6bb5d8ea-5676-4c18-811e-7fc5b98343a1	Mosca branca
edda025a-0692-41d4-9f99-f008ece36c90	6bb5d8ea-5676-4c18-811e-7fc5b98343a1	Percevejo castanho
e22f3c0b-636a-426c-96c7-956472b4933c	6bb5d8ea-5676-4c18-811e-7fc5b98343a1	Bicudo da soja
3d36cfea-865b-486d-8bb7-45bec6572fb2	6bb5d8ea-5676-4c18-811e-7fc5b98343a1	Ácaros verde
758a0a50-3731-444a-9580-292ef92d88ff	6bb5d8ea-5676-4c18-811e-7fc5b98343a1	Coros
b24d0c2a-a306-40ca-8ab7-eae1ab4acba2	6bb5d8ea-5676-4c18-811e-7fc5b98343a1	Percevejo marrom
40665bfe-fe22-40d9-9427-615eb29b6a30	6bb5d8ea-5676-4c18-811e-7fc5b98343a1	Percevejo barriga verde
29806153-7858-4c92-b600-f25b0680e902	6bb5d8ea-5676-4c18-811e-7fc5b98343a1	Ferrugem asiática
0c3ed032-e19a-458b-b610-d831ffbe2c57	6bb5d8ea-5676-4c18-811e-7fc5b98343a1	Podridão radicular de fitóftora
e7c751e7-46b2-469b-a434-e0e8f85d2a77	6bb5d8ea-5676-4c18-811e-7fc5b98343a1	Antracnose
9c33312e-7c76-44a3-998c-443549a7c03b	6bb5d8ea-5676-4c18-811e-7fc5b98343a1	Mancha alvo
8118bc81-2280-493d-ac42-c83d487a375c	6bb5d8ea-5676-4c18-811e-7fc5b98343a1	Movo branco
6a04115c-e24f-4b19-925c-c5c40bee26ae	6bb5d8ea-5676-4c18-811e-7fc5b98343a1	Podridão de carvão
c0f9de3e-2e0a-4cff-8602-56d532ff2814	6bb5d8ea-5676-4c18-811e-7fc5b98343a1	Crestamento foliar de cercopora
27745961-6aac-4046-bb17-1bf13afe31fa	6bb5d8ea-5676-4c18-811e-7fc5b98343a1	Mancha parda
a78a1787-eb7a-40b7-bec7-56d6fa6cf5e8	6bb5d8ea-5676-4c18-811e-7fc5b98343a1	Buva
51628836-0f94-41bf-9511-c813c394157e	6bb5d8ea-5676-4c18-811e-7fc5b98343a1	Picão preto
65582773-3502-40a2-bbba-1ddf9d0c8dfa	6bb5d8ea-5676-4c18-811e-7fc5b98343a1	Capim amargoso
a7597e1b-5011-449f-a482-8b43dec89378	6bb5d8ea-5676-4c18-811e-7fc5b98343a1	Capim colonião
c6b3cfc7-f0db-4112-9679-dc2fdf88ec71	6bb5d8ea-5676-4c18-811e-7fc5b98343a1	Joá de capote
2a92be64-26a4-418e-aca8-efa795102c53	6bb5d8ea-5676-4c18-811e-7fc5b98343a1	Corda de vióla
8071c943-b4f6-4b7c-8dc6-a6a4d34ba83d	6bb5d8ea-5676-4c18-811e-7fc5b98343a1	Capim pé de galinha
c5fbb90c-4197-4933-8915-4525c16235f2	16271e8f-69e9-4ef7-a537-e81c6bf263fd	Defensivos
146cdda9-98c5-49af-a974-aeb0a7a49618	16271e8f-69e9-4ef7-a537-e81c6bf263fd	Fertilizantes
cb5a3c5a-acfd-43e2-a55f-19856bc865e5	16271e8f-69e9-4ef7-a537-e81c6bf263fd	Sementes
28342ca3-1d05-4112-aa1e-b2055783fcc5	16271e8f-69e9-4ef7-a537-e81c6bf263fd	Herbicidas
1d1960ae-1774-43dc-8512-674767cf2e41	16271e8f-69e9-4ef7-a537-e81c6bf263fd	Fungicidas
78445c91-573b-4720-a8b2-306d8720daa9	16271e8f-69e9-4ef7-a537-e81c6bf263fd	Combustível
df09fe02-5dbb-4e2f-a61a-bc983596f3bb	16271e8f-69e9-4ef7-a537-e81c6bf263fd	Adubos
986bfab9-8672-4a1f-a46d-6b27509db470	16271e8f-69e9-4ef7-a537-e81c6bf263fd	Corretivos de Solo
25fb48c7-c21a-4e38-b17b-ff7fe45580f8	cfb0e4b5-611d-4c2d-8e8b-4a62e817c143	Real
7ded3525-9366-4cb1-9952-5191f437a134	cfb0e4b5-611d-4c2d-8e8b-4a62e817c143	Dólar
1703a5f2-ab15-4cb8-8e4b-44f128291721	cfb0e4b5-611d-4c2d-8e8b-4a62e817c143	Euro
0d2b1f0f-0939-41fb-bfcf-d078fa0f2f05	c06c9625-5aa6-479e-8e5a-3ae361881e88	Soja
8b175d30-e657-4b09-a241-67f059c30880	c06c9625-5aa6-479e-8e5a-3ae361881e88	Milho
e3a36853-0211-4b8a-b0c7-5f2364937271	c06c9625-5aa6-479e-8e5a-3ae361881e88	Algodão
3dd42b3f-c037-4dfc-99bb-6620ebea96fe	c06c9625-5aa6-479e-8e5a-3ae361881e88	Feijão
83fb9b61-0f31-41bf-b9de-ace2d5c4edd2	c06c9625-5aa6-479e-8e5a-3ae361881e88	Milheto
e19c44cf-c44d-4cbb-ac0f-4f3579473336	c06c9625-5aa6-479e-8e5a-3ae361881e88	Arroz
6ff1b532-3254-4134-b87e-b645dc061088	f18a9f72-7c9e-450b-a74e-0aaf9500f2d4	Basf
7747dd1e-226e-4a58-93a7-8b8494610c8a	f18a9f72-7c9e-450b-a74e-0aaf9500f2d4	Pioneer
cb8d9cab-596c-4f42-afac-b93ae1deae92	f18a9f72-7c9e-450b-a74e-0aaf9500f2d4	Adriana
86be1b66-9ce1-4b67-9625-76b1e7facb7c	f18a9f72-7c9e-450b-a74e-0aaf9500f2d4	Triunfo
01bede9e-13aa-470b-815e-521ecfa0f080	f18a9f72-7c9e-450b-a74e-0aaf9500f2d4	Syngenta
04ea7e7e-6e0b-41df-b0d4-bd1befa6f56d	f18a9f72-7c9e-450b-a74e-0aaf9500f2d4	Neogen
9d8417df-f474-42ce-9eff-390da27073b5	f18a9f72-7c9e-450b-a74e-0aaf9500f2d4	Monsoy
73cea5a5-021b-4d59-9b0e-cb90e599c551	f18a9f72-7c9e-450b-a74e-0aaf9500f2d4	Bom Futuro
4134af7e-e098-4a17-9da1-fa3f229f4554	f18a9f72-7c9e-450b-a74e-0aaf9500f2d4	GDM
18001041-5c76-4cbc-b3bd-348d7680647b	212c549b-a271-4a76-83e8-f8cbbad2463a	L - Litro
edacef7f-83fa-4f05-8c47-fa8bc8b7fd9d	212c549b-a271-4a76-83e8-f8cbbad2463a	Kg - Kilo
43b6e5b2-8979-4f52-8211-361898ef75ab	212c549b-a271-4a76-83e8-f8cbbad2463a	m - Metro
11df898c-0fc4-4876-95a4-749ac87f8b07	212c549b-a271-4a76-83e8-f8cbbad2463a	ml - Milímetro
97d8e811-3b93-4946-b391-1a8b6ff1f48a	212c549b-a271-4a76-83e8-f8cbbad2463a	g - Grama
01b5921d-63cb-49d8-b6a9-46599e3d9061	212c549b-a271-4a76-83e8-f8cbbad2463a	mg - Miligrama
ad568d19-f20f-4223-9ffc-2fd169fcf3db	212c549b-a271-4a76-83e8-f8cbbad2463a	T - Tonelada
d8d6bdf9-331c-4f08-90ef-220fd6041d6d	06bdaaf0-aa46-4e29-9e58-013e0e85b145	Norte
ce5553a5-dda1-44a2-9b1d-75590a7a781e	06bdaaf0-aa46-4e29-9e58-013e0e85b145	Sul
3a186bb4-20ce-4fab-b441-f1e9879a2b3c	06bdaaf0-aa46-4e29-9e58-013e0e85b145	Total
ef09b44c-dbe8-428f-bb46-394a4cb68005	42f7e25d-13bb-4216-b8bd-b4f4c9b89035	Sede da fazenda
112845cc-7fdc-4054-a755-f8eee6e4cc31	42f7e25d-13bb-4216-b8bd-b4f4c9b89035	Abastecimento central
e90b9c17-c6f0-4042-a4c3-101800a80bb9	42f7e25d-13bb-4216-b8bd-b4f4c9b89035	Abastecimento móvel
2b8eb908-3b0d-4e14-9787-3039816dbf76	42f7e25d-13bb-4216-b8bd-b4f4c9b89035	Estoque sementes
ab9c1fc5-837e-4c3b-a76e-6cbb8b0a190b	42f7e25d-13bb-4216-b8bd-b4f4c9b89035	Estoque químicos
c1504cd9-6b38-4b03-ab46-ec5a868d632d	42f7e25d-13bb-4216-b8bd-b4f4c9b89035	Estoque campo
79ba71fa-03b5-4ceb-a336-9dfb4a3a267e	42f7e25d-13bb-4216-b8bd-b4f4c9b89035	Armazém
5cdebb53-ed22-4fef-a0bd-494247593f02	d4fda483-e2c5-4408-b29c-5234fba400e6	Operação com Máquinas/Implementos
53bdacfe-90fb-4156-8e5e-115121451cf4	d4fda483-e2c5-4408-b29c-5234fba400e6	Mão de Obra
90233c36-c84e-4861-813d-a5ed6024a8d8	d4fda483-e2c5-4408-b29c-5234fba400e6	Semente
578dd4e1-5e12-42b3-877c-e18361328a55	d4fda483-e2c5-4408-b29c-5234fba400e6	Semente de Cobertura
afe1acd8-a830-4a8d-a1e4-4f7c97b3f226	d4fda483-e2c5-4408-b29c-5234fba400e6	Corretivo de Solo
0e410ee6-d5b3-4a85-98be-d3e4544f61dd	d4fda483-e2c5-4408-b29c-5234fba400e6	Macronutriente
a2c7bcfd-83b5-4a0e-9faf-7e753abddc85	d4fda483-e2c5-4408-b29c-5234fba400e6	Micronutriente
9536c362-efb5-4d65-a7b6-3c61f4d8a446	d4fda483-e2c5-4408-b29c-5234fba400e6	Fungicida
c110d49d-9e9b-4f5f-9c0b-be8a05b3db22	d4fda483-e2c5-4408-b29c-5234fba400e6	Herbicida
77158ae4-e147-4e8f-b491-a68eb816d4f4	d4fda483-e2c5-4408-b29c-5234fba400e6	Inseticida
1caebf9c-de1f-416b-b0d0-c380a69aec8a	d4fda483-e2c5-4408-b29c-5234fba400e6	Adjuvante/Outros
8b900478-21b0-4e36-a245-5366f9adcafd	d4fda483-e2c5-4408-b29c-5234fba400e6	Seguro Agrícola
edc0b1ac-eeeb-4f4b-8355-db375410fa2b	d4fda483-e2c5-4408-b29c-5234fba400e6	Transporte Externo
e4632348-45aa-43bd-b236-94e8ee40093a	d4fda483-e2c5-4408-b29c-5234fba400e6	Armazenagem
9fbdf78d-84a5-42bf-af95-f00eba2874aa	d4fda483-e2c5-4408-b29c-5234fba400e6	Classificação e Beneficiamento
8d60b5d8-2196-490f-b812-bb02ea2ab540	d4fda483-e2c5-4408-b29c-5234fba400e6	Impostos e Taxas
79e54aaa-e5ae-4cd7-a20f-26d934fcffa5	d4fda483-e2c5-4408-b29c-5234fba400e6	Manutenção Máquinas/Implementos
9d8945b7-a691-4d64-b18f-cd953af5e8f5	d4fda483-e2c5-4408-b29c-5234fba400e6	Despesas Administrativas
af751361-41f0-4b4a-87fd-fec6f99ec19c	d4fda483-e2c5-4408-b29c-5234fba400e6	Juros
91bb070f-8401-4659-ac74-e4b25d466fc4	d4fda483-e2c5-4408-b29c-5234fba400e6	Depreciação Benfeitorias
a6f779ff-77b1-41d6-851d-9786654f5f67	d4fda483-e2c5-4408-b29c-5234fba400e6	Depreciação Máquinas/Implementos
e86af2d2-98f0-4b21-bdc1-8db95433a533	d4fda483-e2c5-4408-b29c-5234fba400e6	Encargos
12001846-e411-49f3-922a-2be893d281a5	d4fda483-e2c5-4408-b29c-5234fba400e6	Seguro do Capital Fixo
a836901e-544e-4de1-af23-ef7d9df2ad14	d4fda483-e2c5-4408-b29c-5234fba400e6	Manutenção Benfeitorias
84dc1f3b-c301-4f3d-8665-8456810b3f82	d4fda483-e2c5-4408-b29c-5234fba400e6	Arrendamento
da236009-3fda-4ee9-83cc-68aebe4fc8f9	d4fda483-e2c5-4408-b29c-5234fba400e6	Remuneração Esperada sobre Capital
49aa38d3-16f2-4e39-b3aa-c3b2c76de920	d4fda483-e2c5-4408-b29c-5234fba400e6	Terra
\.


--
-- Data for Name: fazenda; Type: TABLE DATA; Schema: client; Owner: postgres
--

COPY client.fazenda (uuid, nome, cidade, car, datacar, areatotal, areacultivavel, imagemsatelite, assinaturadigital, senhaassinatura) FROM stdin;
b8dbe467-6e99-4736-9ff6-67e16f9e6c3e	Fazenda de teste	Sinop	123123123	2022-01-10	5000	3000	\N	aqw1234DE	senha
\.


--
-- Data for Name: fornecedores; Type: TABLE DATA; Schema: client; Owner: postgres
--

COPY client.fornecedores (uuid, razaosocial, cnpj, cpf, telefone, uf, cidade, endereco, complemento, cep, site, email, contato, telefonecontato, nomefantasia) FROM stdin;
\.


--
-- Data for Name: imagemarmadilha; Type: TABLE DATA; Schema: client; Owner: postgres
--

COPY client.imagemarmadilha (uuid, armadilha_uuid, arquivo, data, hora) FROM stdin;
fb9a0ce4-e8d5-44ae-bbbb-768bc2143bc5	a5ca5cc5-2d90-4060-a3c2-4a985a802182	5cc11e63ec1478e57a7d55853bd120c4-arquivo-teste-2022-05-10--12-15 - Copia - Copia.png	2022-05-10	16:15:00
5bf59e27-2588-4c04-8bbe-0d9108b1c22e	a5ca5cc5-2d90-4060-a3c2-4a985a802182	d10aaad8517a9dc611c21a8a82aea0e0-arquivo-teste-2022-05-10--12-15 - Copia (2) - Copia.png	2022-05-10	16:15:00
c79b13f9-98ba-497f-b97b-a910eec963c1	a5ca5cc5-2d90-4060-a3c2-4a985a802182	5539da736d2cf39fb4f2a9fc5ffb3677-arquivo-teste-2022-05-10--12-15 - Copia (2).png	2022-05-10	16:15:00
c8184e4b-58a5-4ebc-8843-f01b86adcc7a	a5ca5cc5-2d90-4060-a3c2-4a985a802182	9e7d22e4b056076f3e110d41002d60fa-arquivo-teste-2022-05-10--12-15 - Copia (3) - Copia.png	2022-05-10	16:15:00
3b227a6a-6b96-4408-b61b-3b90860b59fa	a5ca5cc5-2d90-4060-a3c2-4a985a802182	5326b7b8515904ad5396f1261d321f57-arquivo-teste-2022-05-10--12-15 - Copia (6).png	2022-05-10	16:15:00
\.


--
-- Data for Name: insumos; Type: TABLE DATA; Schema: client; Owner: postgres
--

COPY client.insumos (uuid, tipodeinsumo_uuid, descricao, cultura_uuid, marcainsumo_uuid, produtividade, royalties, unidadedemedida_uuid) FROM stdin;
5933e113-fc10-4c85-a28d-89c58d998efe	ac8af977-c174-4522-9dd2-54b297e648ac	Gasolina comum	\N	\N	\N	\N	18001041-5c76-4cbc-b3bd-348d7680647b
6302b1a2-b061-4352-81b4-7cfd049d2f30	ac8af977-c174-4522-9dd2-54b297e648ac	Gasolina aditivada	\N	\N	\N	\N	18001041-5c76-4cbc-b3bd-348d7680647b
9464608d-9c30-412e-99c9-33adc1c1a040	ac8af977-c174-4522-9dd2-54b297e648ac	Diesel comum	\N	\N	\N	\N	18001041-5c76-4cbc-b3bd-348d7680647b
7f43bd1a-7942-411f-afb5-31ee40d43bc5	ac8af977-c174-4522-9dd2-54b297e648ac	Diesel S10	\N	\N	\N	\N	18001041-5c76-4cbc-b3bd-348d7680647b
419bc43d-13ab-4a13-8433-4b99e0a434b6	986bfab9-8672-4a1f-a46d-6b27509db470	Calcário	\N	\N	\N	\N	ad568d19-f20f-4223-9ffc-2fd169fcf3db
c829070e-1cbc-462c-8498-36891a95dbb0	986bfab9-8672-4a1f-a46d-6b27509db470	Gesso	\N	\N	\N	\N	ad568d19-f20f-4223-9ffc-2fd169fcf3db
1c31b62b-472a-459a-91e7-74f88cef1d2b	c5fbb90c-4197-4933-8915-4525c16235f2	Fastac 100SC	\N	6ff1b532-3254-4134-b87e-b645dc061088	\N	\N	edacef7f-83fa-4f05-8c47-fa8bc8b7fd9d
\.


--
-- Data for Name: itemorcamento; Type: TABLE DATA; Schema: client; Owner: postgres
--

COPY client.itemorcamento (uuid, orcamento_uuid, insumo_uuid, descricao, quantidade, unidadedemedida_uuid) FROM stdin;
\.


--
-- Data for Name: localcaomaquinas; Type: TABLE DATA; Schema: client; Owner: postgres
--

COPY client.localcaomaquinas (uuid, fornecedor_uuid, datainicio, datafinal, datacontrato, descricao, valor, safra_uuid, executado, tipodemaquina_uuid, tipomoeda_uuid, formadepagamento) FROM stdin;
\.


--
-- Data for Name: manutencaomaquinas; Type: TABLE DATA; Schema: client; Owner: postgres
--

COPY client.manutencaomaquinas (uuid, maquina_uuid, datamanutencao, descricao, valor, safra_uuid, fornecedor_uuid) FROM stdin;
\.


--
-- Data for Name: maquinaseimplementos; Type: TABLE DATA; Schema: client; Owner: postgres
--

COPY client.maquinaseimplementos (uuid, marcademaquinas_uuid, tipodemaquina_uuid, descricao, dataaquisicao, valoraquisicao, imagem, qrcode) FROM stdin;
\.


--
-- Data for Name: orcamentos; Type: TABLE DATA; Schema: client; Owner: postgres
--

COPY client.orcamentos (uuid, dataorcamento, descricao, dataentrega) FROM stdin;
\.


--
-- Data for Name: pecas; Type: TABLE DATA; Schema: client; Owner: postgres
--

COPY client.pecas (uuid, descricao, quantidadeestoque) FROM stdin;
\.


--
-- Data for Name: pecasmanutencao; Type: TABLE DATA; Schema: client; Owner: postgres
--

COPY client.pecasmanutencao (uuid, pecas_uuid, quantidade, valorunitario, manutencaomaquinas_uuid) FROM stdin;
\.


--
-- Data for Name: pragas; Type: TABLE DATA; Schema: client; Owner: postgres
--

COPY client.pragas (uuid, nome, nomecientifico, imagem) FROM stdin;
\.


--
-- Data for Name: pragasnaimagem; Type: TABLE DATA; Schema: client; Owner: postgres
--

COPY client.pragasnaimagem (uuid, imagemarmadilha_uuid, pragas_uuid, estagio_uuid, quantidade, tipodetecao_uuid, confirmacao, dataanalise, dataconfirmacao) FROM stdin;
\.


--
-- Data for Name: safras; Type: TABLE DATA; Schema: client; Owner: postgres
--

COPY client.safras (uuid, descricao, ativo, dataabertura, dataencerramento, plantasporhectare, cultura_uuid) FROM stdin;
3db68b8f-1409-4274-b97f-1dcd9d4d168f	21/22 Soja	t	2021-03-01	\N	5200	0d2b1f0f-0939-41fb-bfcf-d078fa0f2f05
5eb2e7ea-05a1-46a5-a870-0f2a0fce6a89	22 milho	t	2021-03-01	\N	4000	8b175d30-e657-4b09-a241-67f059c30880
\.


--
-- Data for Name: selecaoinsumos; Type: TABLE DATA; Schema: client; Owner: postgres
--

COPY client.selecaoinsumos (uuid, talhao_uuid, insumo_uuid, safra_uuid, dataselecao, quantidade, unidadedemedida_uuid) FROM stdin;
\.


--
-- Data for Name: talhoes; Type: TABLE DATA; Schema: client; Owner: postgres
--

COPY client.talhoes (uuid, nome, tamanho, ativo, setor_uuid) FROM stdin;
1394bb23-8a69-4518-b22a-74f48f424b6c	talhao 02	90	t	\N
58076237-db1c-45a0-914f-f3b4100bf092	talhao 03	65	t	\N
ad76a5ac-af4c-45b0-bd3b-31889626e39d	talhao 04	140	t	\N
80e715c2-7b02-4751-af0c-40f956d5107a	talhao 05	59	t	\N
377e0614-5b22-45ac-957b-aafd33ebaa93	talhao 06	75	f	\N
bfa64a41-20c6-4c35-b62a-454658341075	talhao 01	110	t	\N
\.


--
-- Data for Name: tiposauxiliares; Type: TABLE DATA; Schema: client; Owner: postgres
--

COPY client.tiposauxiliares (uuid, chave, descricao) FROM stdin;
1cccd265-4b4b-4b15-bfd1-72419910436d	combustivel	Combustível
c45bf76e-51a4-45c8-ab51-82e34557f598	maquina	Máquinas e Implementos
bfc454fb-3cbd-453c-973d-42e7626b0751	marcamaquina	Marca de Máquinas e Implementos
838b3d89-2797-49b4-9602-dac24eea1cf5	operacao	Operações de campo
6bb5d8ea-5676-4c18-811e-7fc5b98343a1	pragasdoencasdaninhas	Pragas, Doenças e Daninhas
16271e8f-69e9-4ef7-a537-e81c6bf263fd	insumo	Insumos
cfb0e4b5-611d-4c2d-8e8b-4a62e817c143	moeda	Moeda
c06c9625-5aa6-479e-8e5a-3ae361881e88	cultura	Cultura
f18a9f72-7c9e-450b-a74e-0aaf9500f2d4	marcainsumo	Marca de Insumos
212c549b-a271-4a76-83e8-f8cbbad2463a	unidademedida	Unidade de Medida
d4fda483-e2c5-4408-b29c-5234fba400e6	centrocustos	Centro de Custos
42f7e25d-13bb-4216-b8bd-b4f4c9b89035	localestoque	Local de Estoque
06bdaaf0-aa46-4e29-9e58-013e0e85b145	setor	Setor
69ab54c8-2010-43d1-b5e3-2e46fde85ee6	tipofrete	Tipo de Frete
0e109b90-7051-4d2f-8226-928a64a22b87	tipopagamento	Tipo de Pagamento
\.


--
-- Name: clientes_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: postgres
--

SELECT pg_catalog.setval('admin.clientes_id_seq', 1, false);


--
-- Name: licencas_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: postgres
--

SELECT pg_catalog.setval('admin.licencas_id_seq', 1, false);


--
-- Name: tipodelicenca_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: postgres
--

SELECT pg_catalog.setval('admin.tipodelicenca_id_seq', 1, false);


--
-- Name: tipousuario_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: postgres
--

SELECT pg_catalog.setval('admin.tipousuario_id_seq', 1, false);


--
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: postgres
--

SELECT pg_catalog.setval('admin.usuarios_id_seq', 1, false);


--
-- Name: bancosdedados bancosdedados_pkey; Type: CONSTRAINT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.bancosdedados
    ADD CONSTRAINT bancosdedados_pkey PRIMARY KEY (uuid);


--
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);


--
-- Name: licencas licencas_pkey; Type: CONSTRAINT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.licencas
    ADD CONSTRAINT licencas_pkey PRIMARY KEY (id);


--
-- Name: modulos modulos_pkey; Type: CONSTRAINT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.modulos
    ADD CONSTRAINT modulos_pkey PRIMARY KEY (uuid);


--
-- Name: tipodelicenca tipodelicenca_pkey; Type: CONSTRAINT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.tipodelicenca
    ADD CONSTRAINT tipodelicenca_pkey PRIMARY KEY (id);


--
-- Name: tipousuario tipousuario_pkey; Type: CONSTRAINT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.tipousuario
    ADD CONSTRAINT tipousuario_pkey PRIMARY KEY (id);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- Name: usuariosdosclientes usuariosdosclientes_pkey; Type: CONSTRAINT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.usuariosdosclientes
    ADD CONSTRAINT usuariosdosclientes_pkey PRIMARY KEY (uuid);


--
-- Name: analisedesolo analisedesolo_pkey; Type: CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.analisedesolo
    ADD CONSTRAINT analisedesolo_pkey PRIMARY KEY (uuid);


--
-- Name: analiseindividual analiseindividual_pkey; Type: CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.analiseindividual
    ADD CONSTRAINT analiseindividual_pkey PRIMARY KEY (uuid);


--
-- Name: armadilha armadilha_pkey; Type: CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.armadilha
    ADD CONSTRAINT armadilha_pkey PRIMARY KEY (uuid);


--
-- Name: conversaodemedidas conversaodemedidas_pkey; Type: CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.conversaodemedidas
    ADD CONSTRAINT conversaodemedidas_pkey PRIMARY KEY (uuid);


--
-- Name: dadosauxiliares dadosauxiliares_pkey; Type: CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.dadosauxiliares
    ADD CONSTRAINT dadosauxiliares_pkey PRIMARY KEY (uuid);


--
-- Name: fazenda fazenda_pkey; Type: CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.fazenda
    ADD CONSTRAINT fazenda_pkey PRIMARY KEY (uuid);


--
-- Name: fornecedores fornecedores_pkey; Type: CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.fornecedores
    ADD CONSTRAINT fornecedores_pkey PRIMARY KEY (uuid);


--
-- Name: imagemarmadilha imagemarmadilha_pkey; Type: CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.imagemarmadilha
    ADD CONSTRAINT imagemarmadilha_pkey PRIMARY KEY (uuid);


--
-- Name: insumos insumos_pkey; Type: CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.insumos
    ADD CONSTRAINT insumos_pkey PRIMARY KEY (uuid);


--
-- Name: itemorcamento itemorcamento_pkey; Type: CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.itemorcamento
    ADD CONSTRAINT itemorcamento_pkey PRIMARY KEY (uuid);


--
-- Name: localcaomaquinas localcaomaquinas_pkey; Type: CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.localcaomaquinas
    ADD CONSTRAINT localcaomaquinas_pkey PRIMARY KEY (uuid);


--
-- Name: manutencaomaquinas manutencaomaquinas_pkey; Type: CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.manutencaomaquinas
    ADD CONSTRAINT manutencaomaquinas_pkey PRIMARY KEY (uuid);


--
-- Name: maquinaseimplementos maquinaseimplementos_pkey; Type: CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.maquinaseimplementos
    ADD CONSTRAINT maquinaseimplementos_pkey PRIMARY KEY (uuid);


--
-- Name: orcamentos orcamentos_pkey; Type: CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.orcamentos
    ADD CONSTRAINT orcamentos_pkey PRIMARY KEY (uuid);


--
-- Name: pecas pecas_pkey; Type: CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.pecas
    ADD CONSTRAINT pecas_pkey PRIMARY KEY (uuid);


--
-- Name: pecasmanutencao pecasmanutencao_pkey; Type: CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.pecasmanutencao
    ADD CONSTRAINT pecasmanutencao_pkey PRIMARY KEY (uuid);


--
-- Name: pragas pragas_pkey; Type: CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.pragas
    ADD CONSTRAINT pragas_pkey PRIMARY KEY (uuid);


--
-- Name: pragasnaimagem pragasnaimagem_pkey; Type: CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.pragasnaimagem
    ADD CONSTRAINT pragasnaimagem_pkey PRIMARY KEY (uuid);


--
-- Name: safras safras_pkey; Type: CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.safras
    ADD CONSTRAINT safras_pkey PRIMARY KEY (uuid);


--
-- Name: selecaoinsumos selecaoinsumos_pkey; Type: CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.selecaoinsumos
    ADD CONSTRAINT selecaoinsumos_pkey PRIMARY KEY (uuid);


--
-- Name: talhoes talhoes_pkey; Type: CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.talhoes
    ADD CONSTRAINT talhoes_pkey PRIMARY KEY (uuid);


--
-- Name: tiposauxiliares tiposauxiliares_pkey; Type: CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.tiposauxiliares
    ADD CONSTRAINT tiposauxiliares_pkey PRIMARY KEY (uuid);


--
-- Name: bancosdedados bancosdedados_cliente_id_fkey; Type: FK CONSTRAINT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.bancosdedados
    ADD CONSTRAINT bancosdedados_cliente_id_fkey FOREIGN KEY (cliente_id) REFERENCES admin.clientes(id);


--
-- Name: clientes clientes_id_licenca_fkey; Type: FK CONSTRAINT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.clientes
    ADD CONSTRAINT clientes_id_licenca_fkey FOREIGN KEY (id_licenca) REFERENCES admin.licencas(id);


--
-- Name: licencas licencas_id_tipodelicenca_fkey; Type: FK CONSTRAINT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.licencas
    ADD CONSTRAINT licencas_id_tipodelicenca_fkey FOREIGN KEY (id_tipodelicenca) REFERENCES admin.tipodelicenca(id);


--
-- Name: usuarios usuarios_id_tipousuario_fkey; Type: FK CONSTRAINT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.usuarios
    ADD CONSTRAINT usuarios_id_tipousuario_fkey FOREIGN KEY (id_tipousuario) REFERENCES admin.tipousuario(id);


--
-- Name: usuariosdosclientes usuariosdosclientes_tipodeusuario_id_fkey; Type: FK CONSTRAINT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.usuariosdosclientes
    ADD CONSTRAINT usuariosdosclientes_tipodeusuario_id_fkey FOREIGN KEY (tipodeusuario_id) REFERENCES admin.tipousuario(id);


--
-- Name: analisedesolo analisedesolo_fornecedor_uuid_fkey; Type: FK CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.analisedesolo
    ADD CONSTRAINT analisedesolo_fornecedor_uuid_fkey FOREIGN KEY (fornecedor_uuid) REFERENCES client.fornecedores(uuid) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: analisedesolo analisedesolo_safra_uuid_fkey; Type: FK CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.analisedesolo
    ADD CONSTRAINT analisedesolo_safra_uuid_fkey FOREIGN KEY (safra_uuid) REFERENCES client.safras(uuid) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: analiseindividual analiseindividual_analisedesolo_uuid_fkey; Type: FK CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.analiseindividual
    ADD CONSTRAINT analiseindividual_analisedesolo_uuid_fkey FOREIGN KEY (analisedesolo_uuid) REFERENCES client.analisedesolo(uuid) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: analiseindividual analiseindividual_talhao_uuid_fkey; Type: FK CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.analiseindividual
    ADD CONSTRAINT analiseindividual_talhao_uuid_fkey FOREIGN KEY (talhao_uuid) REFERENCES client.talhoes(uuid) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: conversaodemedidas conversaodemedidas_unidade1_fkey; Type: FK CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.conversaodemedidas
    ADD CONSTRAINT conversaodemedidas_unidade1_fkey FOREIGN KEY (unidade1) REFERENCES client.dadosauxiliares(uuid) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: conversaodemedidas conversaodemedidas_unidade2_fkey; Type: FK CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.conversaodemedidas
    ADD CONSTRAINT conversaodemedidas_unidade2_fkey FOREIGN KEY (unidade2) REFERENCES client.dadosauxiliares(uuid) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: imagemarmadilha imagemarmadilha_armadilha_uuid_fkey; Type: FK CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.imagemarmadilha
    ADD CONSTRAINT imagemarmadilha_armadilha_uuid_fkey FOREIGN KEY (armadilha_uuid) REFERENCES client.armadilha(uuid) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: insumos insumos_cultura_uuid_fkey; Type: FK CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.insumos
    ADD CONSTRAINT insumos_cultura_uuid_fkey FOREIGN KEY (cultura_uuid) REFERENCES client.dadosauxiliares(uuid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: insumos insumos_marcainsumo_uuid_fkey; Type: FK CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.insumos
    ADD CONSTRAINT insumos_marcainsumo_uuid_fkey FOREIGN KEY (marcainsumo_uuid) REFERENCES client.dadosauxiliares(uuid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: insumos insumos_tipodeinsumo_uuid_fkey; Type: FK CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.insumos
    ADD CONSTRAINT insumos_tipodeinsumo_uuid_fkey FOREIGN KEY (tipodeinsumo_uuid) REFERENCES client.dadosauxiliares(uuid) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: insumos insumos_unidadedemedida_uuid_fkey; Type: FK CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.insumos
    ADD CONSTRAINT insumos_unidadedemedida_uuid_fkey FOREIGN KEY (unidadedemedida_uuid) REFERENCES client.dadosauxiliares(uuid) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: itemorcamento itemorcamento_insumo_uuid_fkey; Type: FK CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.itemorcamento
    ADD CONSTRAINT itemorcamento_insumo_uuid_fkey FOREIGN KEY (insumo_uuid) REFERENCES client.insumos(uuid) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: itemorcamento itemorcamento_orcamento_uuid_fkey; Type: FK CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.itemorcamento
    ADD CONSTRAINT itemorcamento_orcamento_uuid_fkey FOREIGN KEY (orcamento_uuid) REFERENCES client.orcamentos(uuid) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: itemorcamento itemorcamento_unidadedemedida_uuid_fkey; Type: FK CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.itemorcamento
    ADD CONSTRAINT itemorcamento_unidadedemedida_uuid_fkey FOREIGN KEY (unidadedemedida_uuid) REFERENCES client.dadosauxiliares(uuid) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: localcaomaquinas localcaomaquinas_fornecedor_uuid_fkey; Type: FK CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.localcaomaquinas
    ADD CONSTRAINT localcaomaquinas_fornecedor_uuid_fkey FOREIGN KEY (fornecedor_uuid) REFERENCES client.fornecedores(uuid) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: localcaomaquinas localcaomaquinas_safra_uuid_fkey; Type: FK CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.localcaomaquinas
    ADD CONSTRAINT localcaomaquinas_safra_uuid_fkey FOREIGN KEY (safra_uuid) REFERENCES client.safras(uuid) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: localcaomaquinas localcaomaquinas_tipodemaquina_uuid_fkey; Type: FK CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.localcaomaquinas
    ADD CONSTRAINT localcaomaquinas_tipodemaquina_uuid_fkey FOREIGN KEY (tipodemaquina_uuid) REFERENCES client.dadosauxiliares(uuid) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: localcaomaquinas localcaomaquinas_tipomoeda_uuid_fkey; Type: FK CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.localcaomaquinas
    ADD CONSTRAINT localcaomaquinas_tipomoeda_uuid_fkey FOREIGN KEY (tipomoeda_uuid) REFERENCES client.dadosauxiliares(uuid) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: manutencaomaquinas manutencaomaquinas_fornecedor_uuid_fkey; Type: FK CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.manutencaomaquinas
    ADD CONSTRAINT manutencaomaquinas_fornecedor_uuid_fkey FOREIGN KEY (fornecedor_uuid) REFERENCES client.fornecedores(uuid) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: manutencaomaquinas manutencaomaquinas_maquina_uuid_fkey; Type: FK CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.manutencaomaquinas
    ADD CONSTRAINT manutencaomaquinas_maquina_uuid_fkey FOREIGN KEY (maquina_uuid) REFERENCES client.maquinaseimplementos(uuid) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: manutencaomaquinas manutencaomaquinas_safra_uuid_fkey; Type: FK CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.manutencaomaquinas
    ADD CONSTRAINT manutencaomaquinas_safra_uuid_fkey FOREIGN KEY (safra_uuid) REFERENCES client.safras(uuid) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: pecasmanutencao pecasmanutencao_manutencaomaquinas_uuid_fkey; Type: FK CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.pecasmanutencao
    ADD CONSTRAINT pecasmanutencao_manutencaomaquinas_uuid_fkey FOREIGN KEY (manutencaomaquinas_uuid) REFERENCES client.manutencaomaquinas(uuid) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: pecasmanutencao pecasmanutencao_pecas_uuid_fkey; Type: FK CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.pecasmanutencao
    ADD CONSTRAINT pecasmanutencao_pecas_uuid_fkey FOREIGN KEY (pecas_uuid) REFERENCES client.pecas(uuid) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: pragasnaimagem pragasnaimagem_estagio_uuid_fkey; Type: FK CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.pragasnaimagem
    ADD CONSTRAINT pragasnaimagem_estagio_uuid_fkey FOREIGN KEY (estagio_uuid) REFERENCES client.dadosauxiliares(uuid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: pragasnaimagem pragasnaimagem_imagemarmadilha_uuid_fkey; Type: FK CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.pragasnaimagem
    ADD CONSTRAINT pragasnaimagem_imagemarmadilha_uuid_fkey FOREIGN KEY (imagemarmadilha_uuid) REFERENCES client.imagemarmadilha(uuid) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: pragasnaimagem pragasnaimagem_pragas_uuid_fkey; Type: FK CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.pragasnaimagem
    ADD CONSTRAINT pragasnaimagem_pragas_uuid_fkey FOREIGN KEY (pragas_uuid) REFERENCES client.pragas(uuid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: pragasnaimagem pragasnaimagem_tipodetecao_uuid_fkey; Type: FK CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.pragasnaimagem
    ADD CONSTRAINT pragasnaimagem_tipodetecao_uuid_fkey FOREIGN KEY (tipodetecao_uuid) REFERENCES client.dadosauxiliares(uuid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: safras safras_cultura_uuid_fkey; Type: FK CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.safras
    ADD CONSTRAINT safras_cultura_uuid_fkey FOREIGN KEY (cultura_uuid) REFERENCES client.dadosauxiliares(uuid) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: selecaoinsumos selecaoinsumos_insumo_uuid_fkey; Type: FK CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.selecaoinsumos
    ADD CONSTRAINT selecaoinsumos_insumo_uuid_fkey FOREIGN KEY (insumo_uuid) REFERENCES client.insumos(uuid) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: selecaoinsumos selecaoinsumos_safra_uuid_fkey; Type: FK CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.selecaoinsumos
    ADD CONSTRAINT selecaoinsumos_safra_uuid_fkey FOREIGN KEY (safra_uuid) REFERENCES client.safras(uuid) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: selecaoinsumos selecaoinsumos_talhao_uuid_fkey; Type: FK CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.selecaoinsumos
    ADD CONSTRAINT selecaoinsumos_talhao_uuid_fkey FOREIGN KEY (talhao_uuid) REFERENCES client.talhoes(uuid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: selecaoinsumos selecaoinsumos_unidadedemedida_uuid_fkey; Type: FK CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.selecaoinsumos
    ADD CONSTRAINT selecaoinsumos_unidadedemedida_uuid_fkey FOREIGN KEY (unidadedemedida_uuid) REFERENCES client.dadosauxiliares(uuid) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: talhoes talhoes_setor_uuid_fkey; Type: FK CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client.talhoes
    ADD CONSTRAINT talhoes_setor_uuid_fkey FOREIGN KEY (setor_uuid) REFERENCES client.dadosauxiliares(uuid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2 (Debian 14.2-1.pgdg110+1)
-- Dumped by pg_dump version 14.2 (Debian 14.2-1.pgdg110+1)

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

