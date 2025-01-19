CREATE TABLE users (
  id BIGSERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(30) NOT NULL,
  surname VARCHAR(30) NOT NULL,
  email TEXT NOT NULL UNIQUE,
  phone_number TEXT NOT NULL UNIQUE,
  date_of_birth DATE,
  password TEXT NOT NULL
);
SELECT setval('users_id_seq', 100000, false);

CREATE TABLE user_finances (
  user_id BIGINT NOT NULL REFERENCES users(id),
  balance DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
  debt DECIMAL(10, 2) NOT NULL DEFAULT 0.00
);

CREATE TABLE transactions (
  id BIGSERIAL PRIMARY KEY NOT NULL,
  sender_id BIGINT NOT NULL REFERENCES users(id),
  reciver_id BIGINT NOT NULL REFERENCES users(id),
  amount DECIMAL(10, 2) NOT NULL,
  date TIMESTAMP NOT NULL
);