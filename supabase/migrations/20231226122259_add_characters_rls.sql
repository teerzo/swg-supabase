
create sequence "public"."test_tenant_id_seq";

create table "public"."test_tenant" (
    "id" integer not null default nextval('test_tenant_id_seq'::regclass),
    "details" text
);


alter table "public"."characters" enable row level security;

alter sequence "public"."test_tenant_id_seq" owned by "public"."test_tenant"."id";

CREATE UNIQUE INDEX test_tenant_pkey ON public.test_tenant USING btree (id);

alter table "public"."test_tenant" add constraint "test_tenant_pkey" PRIMARY KEY using index "test_tenant_pkey";

create policy "Enable full access for authenticated users"
on "public"."characters"
as permissive
for all
to authenticated
using (true)
with check (true);


create policy "Enable insert for authenticated users only"
on "public"."characters"
as permissive
for insert
to authenticated
with check (true);


create policy "Enable update for authenticated users"
on "public"."characters"
as permissive
for update
to authenticated
using (true)
with check (true);

