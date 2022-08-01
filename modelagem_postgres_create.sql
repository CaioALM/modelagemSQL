CREATE TABLE "public.users" (
	"id" serial NOT NULL,
	"name" varchar(50) NOT NULL,
	"email" TEXT NOT NULL,
	"password" TEXT NOT NULL,
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products" (
	"id" serial,
	"name" TEXT NOT NULL,
	"price" integer NOT NULL,
	"type" TEXT NOT NULL,
	"size" TEXT NOT NULL,
	"mainImage" integer NOT NULL,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.purchases" (
	"id" serial NOT NULL,
	"status" TEXT NOT NULL,
	"date" DATE NOT NULL DEFAULT 'now()',
	"addressId" integer NOT NULL,
	"userId" integer NOT NULL,
	CONSTRAINT "purchases_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.image" (
	"id" serial NOT NULL,
	"productId" integer NOT NULL,
	"url" serial NOT NULL,
	CONSTRAINT "image_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.address" (
	"id" serial NOT NULL,
	"street" TEXT NOT NULL,
	"number" integer NOT NULL,
	"complement" TEXT,
	"postalCode" TEXT NOT NULL,
	"state" TEXT NOT NULL,
	"city" TEXT NOT NULL,
	"userId" integer NOT NULL,
	CONSTRAINT "address_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.purchaseProduct" (
	"id" serial NOT NULL,
	"productId" integer NOT NULL,
	"purchaseId" integer NOT NULL,
	"quantity" integer NOT NULL,
	"purchasePrice" integer NOT NULL,
	CONSTRAINT "purchaseProduct_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("mainImage") REFERENCES "image"("id");

ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk0" FOREIGN KEY ("addressId") REFERENCES "address"("id");
ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk1" FOREIGN KEY ("userId") REFERENCES "users"("id");

ALTER TABLE "image" ADD CONSTRAINT "image_fk0" FOREIGN KEY ("productId") REFERENCES "products"("id");

ALTER TABLE "address" ADD CONSTRAINT "address_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");

ALTER TABLE "purchaseProduct" ADD CONSTRAINT "purchaseProduct_fk0" FOREIGN KEY ("productId") REFERENCES "products"("id");
ALTER TABLE "purchaseProduct" ADD CONSTRAINT "purchaseProduct_fk1" FOREIGN KEY ("purchaseId") REFERENCES "purchases"("id");







