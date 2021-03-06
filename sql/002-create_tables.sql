-- Table: roles

-- DROP TABLE roles;

CREATE TABLE roles
(
  role_ref uuid NOT NULL DEFAULT uuid_generate_v4(),
  organisation_ref uuid NOT NULL,
  org_odscode character varying(10),
  role_code character varying(10) NOT NULL,
  CONSTRAINT roles_pk PRIMARY KEY (role_ref)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE roles
  OWNER TO openods;

CREATE INDEX role_code_idx ON roles (role_code);



-- Table: relationships

-- DROP TABLE relationships;

CREATE TABLE relationships
(
  relationship_ref uuid NOT NULL DEFAULT uuid_generate_v4(),
  organisation_ref uuid NOT NULL,
  target_ref uuid,
  relationship_code character varying(10),
  target_odscode character varying(10),
  org_odscode character varying(10),
  CONSTRAINT relationships_pk PRIMARY KEY (relationship_ref)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE relationships
  OWNER TO openods;



-- Table: organisations

-- DROP TABLE organisations;

CREATE TABLE organisations
(
  organisation_ref uuid NOT NULL DEFAULT uuid_generate_v4(),
  org_odscode character varying(10),
  org_name character varying(200),
  org_status character varying(10),
  org_recordclass character varying(10),
  org_lastchanged date,
  CONSTRAINT organisations_pk PRIMARY KEY (organisation_ref)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE organisations
  OWNER TO openods;

CREATE INDEX org_name_idx ON organisations (org_name);
CREATE INDEX org_odscode_idx ON organisations (org_odscode);



-- Table: codesystems

-- DROP TABLE codesystems;

CREATE TABLE codesystems
(
  codesystem_name character varying(50),
  codesystem_ref uuid NOT NULL DEFAULT uuid_generate_v4(),
  codesystem_id character varying(10),
  codesystem_displayname character varying(200),
  CONSTRAINT codesystems_pk PRIMARY KEY (codesystem_ref)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE codesystems
  OWNER TO openods;

CREATE UNIQUE INDEX codesystem_id_idx ON codesystems (codesystem_id);

-- Table: addresses

-- DROP TABLE addresses;

CREATE TABLE addresses
(
  address_ref uuid NOT NULL DEFAULT uuid_generate_v4(),
  organisation_ref uuid NOT NULL,
  org_odscode character varying(10),
  "streetAddressLine1" text,
  "streetAddressLine2" text,
  town text,
  county text,
  postal_code text,
  country text,
  CONSTRAINT addresses_pk PRIMARY KEY (address_ref)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE addresses
  OWNER TO openods;
