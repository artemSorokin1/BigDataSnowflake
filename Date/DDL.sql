DROP TABLE IF EXISTS d_date CASCADE;

CREATE TABLE d_date_month (
    month_id SERIAL PRIMARY KEY,
    month_name INTEGER NULL
);

CREATE TABLE d_date_day (
    day_id SERIAL PRIMARY KEY,
    day_name INTEGER NULL
);

CREATE TABLE d_date (
    date_id SERIAL PRIMARY KEY,
    date VARCHAR(50) NULL,
    day_id INTEGER,
    month_id INTEGER,
    year INTEGER,

    CONSTRAINT fk_date_day FOREIGN KEY (day_id) REFERENCES d_date_day(day_id),
    CONSTRAINT fk_date_month FOREIGN KEY (month_id) REFERENCES d_date_month(month_id)
);