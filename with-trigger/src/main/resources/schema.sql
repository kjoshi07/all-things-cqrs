CREATE TABLE IF NOT EXISTS CREDIT_CARD (
  ID            UUID PRIMARY KEY,
  INITIAL_LIMIT DECIMAL(18,2) NOT NULL,
  USED_LIMIT    DECIMAL(18,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS WITHDRAWAL (
  ID     UUID PRIMARY KEY,
  CARD_ID   UUID    NOT NULL,
  AMOUNT DECIMAL(18,2) NOT NULL
);

CREATE TRIGGER ON_CARD_WITHDRAWN
  AFTER UPDATE
  ON CREDIT_CARD
  FOR EACH ROW
CALL "io.dddbyexamples.cqrs.persistance.CreditCardUsedTrigger";

