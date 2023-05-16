CREATE TABLE "users" (
  "id" integer PRIMARY KEY,
  "username" varchar UNIQUE,
  "password" varchar NOT NULL,
  "email" varchar UNIQUE,
  "first_name" varchar NOT NULL,
  "last_name" varchar NOT NULL,
  "role_id" integer NOT NULL,
  "status" boolean NOT NULL
);

CREATE TABLE "posts" (
  "id" integer PRIMARY KEY,
  "title" varchar NOT NULL,
  "content" text NOT NULL,
  "image" varchar,
  "author_id" integer NOT NULL,
  "status" varchar NOT NULL,
  "created_at" date NOT NULL
);

CREATE TABLE "comments" (
  "id" integer PRIMARY KEY,
  "content" text NOT NULL,
  "user_id" integer NOT NULL,
  "post_id" integer NOT NULL,
  "created_at" date NOT NULL
);

CREATE TABLE "roles" (
  "id" integer PRIMARY KEY,
  "name" varchar NOT NULL
);

COMMENT ON COLUMN "posts"."content" IS 'Content of the post';

COMMENT ON COLUMN "posts"."image" IS 'Url of the image';

COMMENT ON COLUMN "comments"."content" IS 'Content of the comment';

ALTER TABLE "posts" ADD FOREIGN KEY ("author_id") REFERENCES "users" ("id");

ALTER TABLE "comments" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "comments" ADD FOREIGN KEY ("post_id") REFERENCES "posts" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("role_id") REFERENCES "roles" ("id");
