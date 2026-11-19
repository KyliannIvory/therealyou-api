CREATE TABLE salon (
    id                  UUID            NOT NULL,
    name                VARCHAR(100)    NOT NULL,
    description         TEXT            NOT NULL,
    city                VARCHAR(50)     NOT NULL,
    municipality        VARCHAR(50)     NOT NULL,
    neighborhood        VARCHAR(50)     NOT NULL,
    location_marker     VARCHAR(255)    NOT NULL,
    phone               VARCHAR(20)     NOT NULL,

    CONSTRAINT pk_salon PRIMARY KEY (id)
);

CREATE TABLE offering (
    id                  UUID            NOT NULL,
    name                VARCHAR(50)     NOT NULL,
    category            VARCHAR(20)     NOT NULL,
    duration_in_minutes INTEGER         NOT NULL,
    price_xof           INTEGER         NOT NULL,
    salon_id            UUID            NOT NULL,

    CONSTRAINT pk_offering PRIMARY KEY (id),
    CONSTRAINT ck_offering_duration_in_minutes CHECK (duration_in_minutes BETWEEN 1 AND 1440),
    CONSTRAINT ck_offering_price_xof CHECK (price_xof >= 0),
    CONSTRAINT ck_offering_category CHECK (category IN ('BRAIDS', 'BARBER', 'LOCKS', 'HAIR_CARE', 'WIGS_WEAVES')),
    CONSTRAINT fk_offering_salon FOREIGN KEY (salon_id) REFERENCES salon (id) ON DELETE CASCADE
);

CREATE INDEX idx_offering_salon_id ON offering (salon_id);

CREATE TABLE IF NOT EXISTS event_publication (
    id                     UUID NOT NULL,
    listener_id            TEXT NOT NULL,
    event_type             TEXT NOT NULL,
    serialized_event       TEXT NOT NULL,
    publication_date       TIMESTAMP WITH TIME ZONE NOT NULL,
    completion_date        TIMESTAMP WITH TIME ZONE,
    status                 TEXT,
    completion_attempts    INT,
    last_resubmission_date TIMESTAMP WITH TIME ZONE,
    PRIMARY KEY (id)
);

CREATE INDEX IF NOT EXISTS event_publication_serialized_event_hash_idx ON event_publication USING hash(serialized_event);
CREATE INDEX IF NOT EXISTS event_publication_by_completion_date_idx ON event_publication (completion_date);