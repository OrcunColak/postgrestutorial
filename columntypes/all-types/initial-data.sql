-- Types are from https://phoenixnap.com/kb/postgresql-data-types
create TABLE all_char_types_table (
    char_column CHAR(10),                    -- Fixed-length character string
    varchar_column VARCHAR(255),             -- Variable-length character string with a maximum length of 255 characters
    text_column TEXT,                        -- Variable-length character string with no specified maximum length
    char_varying_column CHARACTER VARYING(20) -- Variable-length character string with a maximum length of 20 characters
);

create TABLE all_numeric_types_table (
    smallint_column SMALLINT,        -- 16-bit signed integer . -32768 to +32767
    integer_column INTEGER,          -- 32-bit signed integer . -2147483648 to +2147483647
    bigint_column BIGINT,            -- 64-bit signed integer. -9223372036854775808 to 9223372036854775807
    decimal_column decimal,          -- Variable precision. Alias for NUMERIC . Up to 131072 digits before the decimal point. Up to 16383 digits after the decimal point
    numeric_column NUMERIC(10, 2),   -- Variable precision decimal with 10 digits, 2 of which are after the decimal point
    real_column REAL,                -- 32-bit floating-point . Variable precision decimal. 6 decimal digits precision
    double_column DOUBLE PRECISION,  -- 64-bit floating-point. Variable precision decimal. 15 decimal digits precision
    smallserial_column SMALLSERIAL,-- 16-bit auto-incrementing integer . 1 to 32767
    serial_column SERIAL,          -- 32-bit auto-incrementing integer. 1 to 2147483647
    bigserial_column BIGSERIAL    -- 64-bit auto-incrementing integer . 1 to 9223372036854775807
);

CREATE TABLE datetime_types_table (
    timestamp_column TIMESTAMP(3),   -- Date and time with fractional seconds
    timestamptz_column TIMESTAMPTZ(6), -- Date and time with time zone information
    date_column DATE,             -- Date without a time component
    time_column TIME,             -- Time without a date component
    time_with_timezone_column time with time zone, -- Time with time zone
    interval_column INTERVAL       -- Time interval
);

CREATE TABLE binary_types_table (
    binary_data BYTEA
);

CREATE TABLE boolean_types_table (
    is_active BOOLEAN
);


-- Define the enumerated type
CREATE TYPE mood AS ENUM ('happy', 'sad', 'neutral');

-- Create a table with an enumerated type column
CREATE TABLE person_mood (
    current_mood mood
);

CREATE TABLE bit_types_table (
    fixed_bit_column BIT(8),  -- Fixed-length bit string with a length of 8 bits
    variable_bit_column VARBIT(16)  -- Variable-length bit string with a maximum length of 16 bits
);

CREATE TABLE uuid_types_table (
    id UUID
);

CREATE TABLE inet_types_table (
    ipv4_address INET,  -- IPv4 address
    ipv6_address INET   -- IPv6 address
);

CREATE TABLE cidr_types_table (
    ipv4_network CIDR,  -- IPv4 network address
    ipv6_network CIDR   -- IPv6 network address
);

CREATE TABLE json_types_table (
    json_data JSON,
    jsonb_data JSONB
);

CREATE TABLE xml_types_table (
    xml_data XML
);

CREATE TABLE geometric_types_table (
    point_column POINT,
    line_column LINE,
    lseg_column LSEG,
    box_column BOX,
    path_column PATH,
    polygon_column POLYGON,
    circle_column CIRCLE
);

CREATE TABLE array_types_table (
    integer_array INTEGER[],
    varchar_array VARCHAR(255)[],
    boolean_array BOOLEAN[],
    timestamp_array TIMESTAMP[]
);

CREATE TABLE ranges_table (
    id SERIAL PRIMARY KEY,
    int4_range int4range,
    int8_range int8range,
    num_range numrange,
    char_range daterange,
    tstz_range tstzrange
);

