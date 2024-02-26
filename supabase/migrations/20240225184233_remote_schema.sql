drop function if exists "public"."handle_new_user"();

create table "public"."user_profile" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "updated_at" timestamp with time zone not null default now(),
    "username" character varying not null,
    "avatar_url" character varying,
    "full_name" character varying,
    "user_id" uuid not null default auth.uid()
);


alter table "public"."user_profile" enable row level security;

CREATE UNIQUE INDEX user_profile_pkey ON public.user_profile USING btree (id);

CREATE UNIQUE INDEX user_profile_username_key ON public.user_profile USING btree (username);

alter table "public"."user_profile" add constraint "user_profile_pkey" PRIMARY KEY using index "user_profile_pkey";

alter table "public"."user_profile" add constraint "user_profile_username_key" UNIQUE using index "user_profile_username_key";

grant delete on table "public"."user_profile" to "anon";

grant insert on table "public"."user_profile" to "anon";

grant references on table "public"."user_profile" to "anon";

grant select on table "public"."user_profile" to "anon";

grant trigger on table "public"."user_profile" to "anon";

grant truncate on table "public"."user_profile" to "anon";

grant update on table "public"."user_profile" to "anon";

grant delete on table "public"."user_profile" to "authenticated";

grant insert on table "public"."user_profile" to "authenticated";

grant references on table "public"."user_profile" to "authenticated";

grant select on table "public"."user_profile" to "authenticated";

grant trigger on table "public"."user_profile" to "authenticated";

grant truncate on table "public"."user_profile" to "authenticated";

grant update on table "public"."user_profile" to "authenticated";

grant delete on table "public"."user_profile" to "service_role";

grant insert on table "public"."user_profile" to "service_role";

grant references on table "public"."user_profile" to "service_role";

grant select on table "public"."user_profile" to "service_role";

grant trigger on table "public"."user_profile" to "service_role";

grant truncate on table "public"."user_profile" to "service_role";

grant update on table "public"."user_profile" to "service_role";

create policy "Enable delete for users based on user_id"
on "public"."user_profile"
as permissive
for delete
to authenticated
using ((auth.uid() = user_id));


create policy "Enable insert for users based on user_id"
on "public"."user_profile"
as permissive
for insert
to authenticated
with check ((auth.uid() = user_id));


create policy "Enable select for users based on user_id"
on "public"."user_profile"
as permissive
for select
to authenticated
using ((auth.uid() = user_id));


create policy "Enable update for users based on user_id"
on "public"."user_profile"
as permissive
for update
to authenticated
with check ((auth.uid() = user_id));



