-- create a new database
CREATE DATABASE tradingserver;

BEGIN;

-- try to connect to the new database
\c tradingserver

-- create a role with connect privileges to the warehouse
CREATE ROLE green NOLOGIN;

-- create a new operational role
CREATE ROLE anonymous LOGIN NOSUPERUSER NOCREATEDB NOCREATEROLE PASSWORD 'xwert5gtyut8jh6ui897iujuk';

-- grant green to anonymous
GRANT green TO anonymous;

-- revoke connections from public to the database
REVOKE ALL ON DATABASE tradingserver FROM public;

-- grant connect priveleges to green
GRANT CONNECT ON DATABASE tradingserver to green;

-- revoke all permisisons from public schema
REVOKE ALL ON SCHEMA public FROM public;

-- grant access on scehema public
GRANT USAGE ON SCHEMA public to green;

-- table that will contain all currency pair ID's
CREATE TABLE pair (
id          INTEGER         NOT NULL       GENERATED ALWAYS AS IDENTITY,
name        TEXT            NOT NULL,
tradable    BOOLEAN         NOT NULL       DEFAULT FALSE,
CONSTRAINT pk_pair PRIMARY KEY (id)
);

-- insert all avaialble currency pairs
INSERT INTO pair (name, tradable) VALUES 
('BTCUSDT', TRUE),
('ETHUSDT', TRUE),
('BNBUSDT', TRUE),
('BCCUSDT', TRUE),
('NEOUSDT', TRUE),
('LTCUSDT', TRUE),
('QTUMUSDT', TRUE),
('ADAUSDT', TRUE),
('XRPUSDT', TRUE),
('EOSUSDT', TRUE),
('TUSDUSDT', TRUE),
('IOTAUSDT', TRUE),
('XLMUSDT', TRUE),
('ONTUSDT', TRUE),
('TRXUSDT', TRUE),
('ETCUSDT', TRUE),
('ICXUSDT', TRUE),
('VENUSDT', TRUE),
('NULSUSDT', TRUE),
('VETUSDT', TRUE),
('PAXUSDT', TRUE),
('BCHABCUSDT', TRUE),
('BCHSVUSDT', TRUE),
('USDCUSDT', TRUE),
('LINKUSDT', TRUE),
('WAVESUSDT', TRUE),
('BTTUSDT', TRUE),
('USDSUSDT', TRUE),
('ONGUSDT', TRUE),
('HOTUSDT', TRUE),
('ZILUSDT', TRUE),
('ZRXUSDT', TRUE),
('FETUSDT', TRUE),
('BATUSDT', TRUE),
('XMRUSDT', TRUE),
('ZECUSDT', TRUE),
('IOSTUSDT', TRUE),
('CELRUSDT', TRUE),
('DASHUSDT', TRUE),
('NANOUSDT', TRUE),
('OMGUSDT', TRUE),
('THETAUSDT', TRUE),
('ENJUSDT', TRUE),
('MITHUSDT', TRUE),
('MATICUSDT', TRUE),
('ATOMUSDT', TRUE),
('TFUELUSDT', TRUE),
('ONEUSDT', TRUE),
('FTMUSDT', TRUE),
('ALGOUSDT', TRUE),
('USDSBUSDT', TRUE),
('GTOUSDT', TRUE),
('ERDUSDT', TRUE),
('DOGEUSDT', TRUE),
('DUSKUSDT', TRUE),
('ANKRUSDT', TRUE),
('WINUSDT', TRUE),
('COSUSDT', TRUE),
('NPXSUSDT', TRUE),
('COCOSUSDT', TRUE),
('MTLUSDT', TRUE),
('TOMOUSDT', TRUE),
('PERLUSDT', TRUE),
('DENTUSDT', TRUE),
('MFTUSDT', TRUE),
('KEYUSDT', TRUE),
('STORMUSDT', TRUE),
('DOCKUSDT', TRUE),
('WANUSDT', TRUE),
('FUNUSDT', TRUE),
('CVCUSDT', TRUE),
('CHZUSDT', TRUE),
('BANDUSDT', TRUE),
('BUSDUSDT', TRUE),
('BEAMUSDT', TRUE),
('XTZUSDT', TRUE),
('RENUSDT', TRUE),
('RVNUSDT', TRUE),
('HCUSDT', TRUE),
('HBARUSDT', TRUE),
('NKNUSDT', TRUE),
('STXUSDT', TRUE),
('KAVAUSDT', TRUE),
('ARPAUSDT', TRUE),
('IOTXUSDT', TRUE),
('RLCUSDT', TRUE),
('MCOUSDT', TRUE),
('CTXCUSDT', TRUE),
('BCHUSDT', TRUE),
('TROYUSDT', TRUE),
('VITEUSDT', TRUE),
('FTTUSDT', TRUE),
('EURUSDT', TRUE),
('OGNUSDT', TRUE),
('DREPUSDT', TRUE),
('BULLUSDT', TRUE),
('BEARUSDT', TRUE),
('ETHBULLUSDT', TRUE),
('ETHBEARUSDT', TRUE),
('TCTUSDT', TRUE),
('WRXUSDT', TRUE),
('BTSUSDT', TRUE),
('LSKUSDT', TRUE),
('BNTUSDT', TRUE),
('LTOUSDT', TRUE),
('EOSBULLUSDT', TRUE),
('EOSBEARUSDT', TRUE),
('XRPBULLUSDT', TRUE),
('XRPBEARUSDT', TRUE),
('STRATUSDT', TRUE),
('AIONUSDT', TRUE),
('MBLUSDT', TRUE),
('COTIUSDT', TRUE),
('BNBBULLUSDT', TRUE),
('BNBBEARUSDT', TRUE),
('STPTUSDT', TRUE),
('WTCUSDT', TRUE),
('DATAUSDT', TRUE),
('XZCUSDT', TRUE),
('SOLUSDT', TRUE),
('CTSIUSDT', TRUE),
('HIVEUSDT', TRUE),
('CHRUSDT', TRUE),
('BTCUPUSDT', TRUE),
('BTCDOWNUSDT', TRUE),
('GXSUSDT', TRUE),
('ARDRUSDT', TRUE),
('LENDUSDT', TRUE),
('MDTUSDT', TRUE),
('STMXUSDT', TRUE),
('KNCUSDT', TRUE),
('REPUSDT', TRUE),
('LRCUSDT', TRUE),
('PNTUSDT', TRUE),
('COMPUSDT', TRUE),
('BKRWUSDT', TRUE),
('SCUSDT', TRUE),
('ZENUSDT', TRUE),
('SNXUSDT', TRUE),
('ETHUPUSDT', TRUE),
('ETHDOWNUSDT', TRUE),
('ADAUPUSDT', TRUE),
('ADADOWNUSDT', TRUE),
('LINKUPUSDT', TRUE),
('LINKDOWNUSDT', TRUE),
('VTHOUSDT', TRUE),
('DGBUSDT', TRUE),
('GBPUSDT', TRUE),
('SXPUSDT', TRUE),
('MKRUSDT', TRUE),
('DAIUSDT', TRUE),
('DCRUSDT', TRUE),
('STORJUSDT', TRUE),
('BNBUPUSDT', TRUE),
('BNBDOWNUSDT', TRUE),
('XTZUPUSDT', TRUE),
('XTZDOWNUSDT', TRUE),
('MANAUSDT', TRUE),
('AUDUSDT', TRUE),
('YFIUSDT', TRUE),
('BALUSDT', TRUE),
('BLZUSDT', TRUE),
('IRISUSDT', TRUE),
('KMDUSDT', TRUE),
('JSTUSDT', TRUE),
('SRMUSDT', TRUE),
('ANTUSDT', TRUE),
('CRVUSDT', TRUE),
('SANDUSDT', TRUE),
('OCEANUSDT', TRUE),
('NMRUSDT', TRUE),
('DOTUSDT', TRUE),
('LUNAUSDT', TRUE),
('RSRUSDT', TRUE),
('PAXGUSDT', TRUE),
('WNXMUSDT', TRUE),
('TRBUSDT', TRUE),
('BZRXUSDT', TRUE),
('SUSHIUSDT', TRUE),
('YFIIUSDT', TRUE),
('KSMUSDT', TRUE),
('EGLDUSDT', TRUE),
('DIAUSDT', TRUE),
('RUNEUSDT', TRUE),
('FIOUSDT', TRUE),
('UMAUSDT', TRUE),
('EOSUPUSDT', TRUE),
('EOSDOWNUSDT', TRUE),
('TRXUPUSDT', TRUE),
('TRXDOWNUSDT', TRUE),
('XRPUPUSDT', TRUE),
('XRPDOWNUSDT', TRUE),
('DOTUPUSDT', TRUE),
('DOTDOWNUSDT', TRUE),
('BELUSDT', TRUE),
('WINGUSDT', TRUE),
('LTCUPUSDT', TRUE),
('LTCDOWNUSDT', TRUE),
('UNIUSDT', TRUE),
('NBSUSDT', TRUE),
('OXTUSDT', TRUE),
('SUNUSDT', TRUE),
('AVAXUSDT', TRUE),
('HNTUSDT', TRUE),
('FLMUSDT', TRUE),
('UNIUPUSDT', TRUE),
('UNIDOWNUSDT', TRUE),
('ORNUSDT', TRUE),
('UTKUSDT', TRUE),
('XVSUSDT', TRUE),
('ALPHAUSDT', TRUE),
('AAVEUSDT', TRUE),
('NEARUSDT', TRUE),
('SXPUPUSDT', TRUE),
('SXPDOWNUSDT', TRUE),
('FILUSDT', TRUE),
('FILUPUSDT', TRUE),
('FILDOWNUSDT', TRUE),
('YFIUPUSDT', TRUE),
('YFIDOWNUSDT', TRUE),
('INJUSDT', TRUE),
('AUDIOUSDT', TRUE),
('CTKUSDT', TRUE),
('BCHUPUSDT', TRUE),
('BCHDOWNUSDT', TRUE),
('AKROUSDT', TRUE),
('AXSUSDT', TRUE),
('HARDUSDT', TRUE),
('DNTUSDT', TRUE),
('STRAXUSDT', TRUE),
('UNFIUSDT', TRUE),
('ROSEUSDT', TRUE),
('AVAUSDT', TRUE),
('XEMUSDT', TRUE),
('AAVEUPUSDT', TRUE),
('AAVEDOWNUSDT', TRUE),
('SKLUSDT', TRUE),
('SUSDUSDT', TRUE),
('SUSHIUPUSDT', TRUE),
('SUSHIDOWNUSDT', TRUE),
('XLMUPUSDT', TRUE),
('XLMDOWNUSDT', TRUE),
('GRTUSDT', TRUE),
('JUVUSDT', TRUE),
('PSGUSDT', TRUE),
('1INCHUSDT', TRUE),
('REEFUSDT', TRUE),
('OGUSDT', TRUE),
('ATMUSDT', TRUE),
('ASRUSDT', TRUE),
('CELOUSDT', TRUE),
('RIFUSDT', TRUE),
('BTCSTUSDT', TRUE),
('TRUUSDT', TRUE),
('CKBUSDT', TRUE),
('TWTUSDT', TRUE),
('FIROUSDT', TRUE),
('LITUSDT', TRUE),
('SFPUSDT', TRUE),
('DODOUSDT', TRUE),
('CAKEUSDT', TRUE),
('ACMUSDT', TRUE),
('BADGERUSDT', TRUE),
('FISUSDT', TRUE),
('OMUSDT', TRUE),
('PONDUSDT', TRUE),
('DEGOUSDT', TRUE),
('ALICEUSDT', TRUE),
('LINAUSDT', TRUE),
('PERPUSDT', TRUE),
('RAMPUSDT', TRUE),
('SUPERUSDT', TRUE),
('CFXUSDT', TRUE),
('EPSUSDT', TRUE),
('AUTOUSDT', TRUE),
('TKOUSDT', TRUE),
('PUNDIXUSDT', TRUE),
('TLMUSDT', TRUE),
('1INCHUPUSDT', TRUE),
('1INCHDOWNUSDT', TRUE),
('BTGUSDT', TRUE),
('MIRUSDT', TRUE),
('BARUSDT', TRUE),
('FORTHUSDT', TRUE),
('BAKEUSDT', TRUE),
('BURGERUSDT', TRUE),
('SLPUSDT', TRUE),
('SHIBUSDT', TRUE),
('ICPUSDT', TRUE),
('ARUSDT', TRUE),
('POLSUSDT', TRUE),
('MDXUSDT', TRUE),
('MASKUSDT', TRUE),
('LPTUSDT', TRUE),
('NUUSDT', TRUE),
('XVGUSDT', TRUE),
('ATAUSDT', TRUE),
('GTCUSDT', TRUE),
('TORNUSDT', TRUE),
('KEEPUSDT', TRUE),
('ERNUSDT', TRUE),
('KLAYUSDT', TRUE),
('PHAUSDT', TRUE),
('BONDUSDT', TRUE),
('MLNUSDT', TRUE);
 
------------------
-- public.order --
------------------
CREATE TABLE "order" (
id                          BIGINT GENERATED ALWAYS AS IDENTITY     NOT NULL,
symbol                      TEXT                                    NOT NULL,
order_id                    BIGINT                                  NOT NULL,
order_list_id               INTEGER                                 NOT NULL,
client_order_id             TEXT                                    NOT NULL,
transaction_time            NUMERIC                                 NOT NULL,
price                       NUMERIC                                 NOT NULL,
orig_qty                    NUMERIC                                 NOT NULL,
executed_qty                NUMERIC                                 NOT NULL,
cummulative_quote_qty       NUMERIC                                 NOT NULL,
status                      TEXT                                    NOT NULL,
time_in_force               TEXT                                    NOT NULL,
type                        TEXT                                    NOT NULL,
side                        TEXT                                    NOT NULL,
filled_price                NUMERIC                                 NOT NULL,
filled_qty                  NUMERIC                                 NOT NULL,
commission                  NUMERIC                                 NOT NULL,
commission_asset            TEXT                                    NOT NULL,
CONSTRAINT pk_order PRIMARY KEY (id)
);

CREATE INDEX idx_order_1 ON "order" (transaction_time);
CREATE INDEX idx_order_2 ON "order" (symbol);

-----------------------
-- public.open_order --
-----------------------
CREATE TABLE open_order (
id                          INTEGER GENERATED ALWAYS AS IDENTITY    NOT NULL,
symbol                      TEXT                                    NOT NULL,
side                        TEXT                                    NOT NULL,
executed_qty                NUMERIC                                 NOT NULL,
transaction_time            TIMESTAMP WITHOUT TIME ZONE             NOT NULL,
num_updates                 INTEGER                                 NOT NULL        DEFAULT 0,
CONSTRAINT pk_open_order PRIMARY KEY (id)
);


-- grant privileges to green
GRANT SELECT, INSERT, UPDATE, DELETE ON pair, "order", open_order to green;

COMMIT;
