CREATE VIEW v_generated_dates AS
SELECT date(generate_series) FROM generate_series('2022-01-01'::timestamp, '2022-01-31', '1 day');
SELECT * FROM v_generated_dates;
