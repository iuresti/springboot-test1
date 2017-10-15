CREATE TABLE public.user
(
  id         BIGINT                 NOT NULL,
  first_name CHARACTER VARYING(100) NOT NULL,
  last_name  CHARACTER VARYING(100) NOT NULL,
  CONSTRAINT PK_user PRIMARY KEY (id)
);

CREATE SEQUENCE user_seq
INCREMENT 1
MINVALUE 1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

CREATE TABLE public.sale
(
  id        BIGINT                      NOT NULL,
  time      TIMESTAMP WITHOUT TIME ZONE NOT NULL,
  remote_ip CHARACTER VARYING(20)       NOT NULL,
  location  CHARACTER VARYING(200),
  user_id   BIGINT                      NOT NULL,
  CONSTRAINT PK_sale PRIMARY KEY (id),
  CONSTRAINT FK_sale_user FOREIGN KEY (user_id) REFERENCES public.user
);

CREATE SEQUENCE sale_seq
INCREMENT 1
MINVALUE 1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

CREATE TABLE public.item
(
  id          SMALLINT               NOT NULL,
  name        CHARACTER VARYING(100) NOT NULL,
  description CHARACTER VARYING(300) NOT NULL,
  price       INTEGER                NOT NULL,
  CONSTRAINT PK_item PRIMARY KEY (id)
);

CREATE SEQUENCE item_seq
INCREMENT 1
MINVALUE 1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

CREATE TABLE public.item_by_sale
(
  id      BIGINT NOT NULL,
  sale_id BIGINT NOT NULL,
  item_id BIGINT NOT NULL,
  price   INT    NOT NULL,
  CONSTRAINT PK_item_by_sale PRIMARY KEY (id),
  CONSTRAINT FK_item_by_sale__sale FOREIGN KEY (sale_id) REFERENCES public.sale,
  CONSTRAINT FK_item_by_sale__item FOREIGN KEY (item_id) REFERENCES public.item
);

CREATE SEQUENCE item_by_sale_seq
INCREMENT 1
MINVALUE 1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
