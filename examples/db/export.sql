PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE lang (
    id varchar(2) primary key,
    name varchar(32) not null
);
INSERT INTO "lang" VALUES('nn','Nynorsk');
INSERT INTO "lang" VALUES('nb','Bokmål');
CREATE TABLE entry (
    id integer primary key,
    lang varchar(2) not null references lang(id),
    pos_id integer not null,
    tei xml null default null,
    xjtei json not null
);
INSERT INTO "entry" VALUES(1,'nn','v',NULL,'{}');
CREATE TABLE lemma (
    id integer primary key,
    orth varchar(255) not null,
    entry_id integer not null references entry(id)
);
INSERT INTO "lemma" VALUES(1,'fly',1);
CREATE TABLE pos (
    id varchar(2) primary key,
    name varchar(32) not null,
    lang varchar(2) not null references lang(id)
);
INSERT INTO "pos" VALUES('v','verb','nn');
INSERT INTO "pos" VALUES('n','substrantiv','nn');
CREATE TABLE gram (
    id integer primary key,
    name varchar(32),
    "order" integer not null default 0,
    pos_id integer references pos(id),
    lang varchar(2) not null references lang(id)
);
INSERT INTO "gram" VALUES(1,'Entall; Ubestemt form',0,'n','nn');
INSERT INTO "gram" VALUES(2,'Eintall; Bestemt form',1,'n','nn');
INSERT INTO "gram" VALUES(3,'Flertall; Ubestemt form',2,'n','nn');
INSERT INTO "gram" VALUES(4,'Eintall; Bestemt form',3,'n','nn');
CREATE TABLE form (
    lemma_id integer not null references lemma(id),
    gram_id integer not null references gram(id),
    paradigm integer not null default 0,
    orth varchar(255) not null,
    primary key (lemma_id, gram_id, paradigm)
);
INSERT INTO "form" VALUES(1,1,0,'fly');
INSERT INTO "form" VALUES(1,2,0,'flyet');
INSERT INTO "form" VALUES(1,3,0,'fly');
INSERT INTO "form" VALUES(1,4,0,'flyene');
COMMIT;
