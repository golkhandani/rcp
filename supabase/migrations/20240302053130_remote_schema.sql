create table "public"."participants" (
    "id" uuid not null default gen_random_uuid(),
    "user_id" uuid not null,
    "user_profile_id" uuid not null,
    "shopping_list_id" uuid not null,
    "status" character varying not null default 'invited'::character varying,
    "invited_by" uuid not null default auth.uid(),
    "invited_at" timestamp with time zone not null default now(),
    "created_by" uuid not null default auth.uid(),
    "created_at" timestamp with time zone not null default now(),
    "updated_by" uuid not null default auth.uid(),
    "updated_at" timestamp with time zone not null default now()
);


alter table "public"."participants" enable row level security;

create table "public"."shopping_lists" (
    "id" uuid not null default gen_random_uuid(),
    "name" character varying not null,
    "description" text,
    "created_by" uuid not null default auth.uid(),
    "created_at" timestamp with time zone not null default now(),
    "updated_by" uuid not null default auth.uid(),
    "updated_at" timestamp with time zone not null default now(),
    "owner_id" uuid not null default auth.uid()
);


alter table "public"."shopping_lists" enable row level security;

CREATE UNIQUE INDEX participants_pkey ON public.participants USING btree (id);

CREATE UNIQUE INDEX shopping_lists_pkey ON public.shopping_lists USING btree (id);

alter table "public"."participants" add constraint "participants_pkey" PRIMARY KEY using index "participants_pkey";

alter table "public"."shopping_lists" add constraint "shopping_lists_pkey" PRIMARY KEY using index "shopping_lists_pkey";

alter table "public"."participants" add constraint "public_participants_shopping_list_id_fkey" FOREIGN KEY (shopping_list_id) REFERENCES shopping_lists(id) not valid;

alter table "public"."participants" validate constraint "public_participants_shopping_list_id_fkey";

alter table "public"."participants" add constraint "public_participants_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth.users(id) not valid;

alter table "public"."participants" validate constraint "public_participants_user_id_fkey";

alter table "public"."participants" add constraint "public_participants_user_profile_id_fkey" FOREIGN KEY (user_profile_id) REFERENCES user_profile(id) not valid;

alter table "public"."participants" validate constraint "public_participants_user_profile_id_fkey";

set check_function_bodies = off;

CREATE OR REPLACE FUNCTION public.is_shopping_list_any_participant(input_user_id uuid, input_shopping_list_id uuid)
 RETURNS boolean
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$
DECLARE
    user_exists BOOLEAN;
    user_owner BOOLEAN;
BEGIN
    -- Check if the user exists
    SELECT EXISTS (
        SELECT 1 FROM participants 
        WHERE user_id = input_user_id
        AND status in ('joined', 'invited')
    ) INTO user_exists;

    SELECT EXISTS (
        SELECT 1 FROM shopping_lists 
        WHERE owner_id = input_user_id
        AND input_shopping_list_id = id
    ) INTO user_owner;
      
    -- Return true if both user and group exist, otherwise return false
    RETURN user_exists OR user_owner;
END;
$function$
;

CREATE OR REPLACE FUNCTION public.is_shopping_list_joined_participant(input_user_id uuid, input_shopping_list_id uuid)
 RETURNS boolean
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$
DECLARE
    user_exists BOOLEAN;
    user_owner BOOLEAN;
BEGIN
    -- Check if the user exists
    SELECT EXISTS (
        SELECT 1 FROM participants 
        WHERE user_id = input_user_id
        AND status in ('joined')
    ) INTO user_exists;

    SELECT EXISTS (
        SELECT 1 FROM shopping_lists 
        WHERE owner_id = input_user_id
        AND input_shopping_list_id = id
    ) INTO user_owner;
      
    -- Return true if both user and group exist, otherwise return false
    RETURN user_exists OR user_owner;
END;
$function$
;

grant delete on table "public"."participants" to "anon";

grant insert on table "public"."participants" to "anon";

grant references on table "public"."participants" to "anon";

grant select on table "public"."participants" to "anon";

grant trigger on table "public"."participants" to "anon";

grant truncate on table "public"."participants" to "anon";

grant update on table "public"."participants" to "anon";

grant delete on table "public"."participants" to "authenticated";

grant insert on table "public"."participants" to "authenticated";

grant references on table "public"."participants" to "authenticated";

grant select on table "public"."participants" to "authenticated";

grant trigger on table "public"."participants" to "authenticated";

grant truncate on table "public"."participants" to "authenticated";

grant update on table "public"."participants" to "authenticated";

grant delete on table "public"."participants" to "service_role";

grant insert on table "public"."participants" to "service_role";

grant references on table "public"."participants" to "service_role";

grant select on table "public"."participants" to "service_role";

grant trigger on table "public"."participants" to "service_role";

grant truncate on table "public"."participants" to "service_role";

grant update on table "public"."participants" to "service_role";

grant delete on table "public"."shopping_lists" to "anon";

grant insert on table "public"."shopping_lists" to "anon";

grant references on table "public"."shopping_lists" to "anon";

grant select on table "public"."shopping_lists" to "anon";

grant trigger on table "public"."shopping_lists" to "anon";

grant truncate on table "public"."shopping_lists" to "anon";

grant update on table "public"."shopping_lists" to "anon";

grant delete on table "public"."shopping_lists" to "authenticated";

grant insert on table "public"."shopping_lists" to "authenticated";

grant references on table "public"."shopping_lists" to "authenticated";

grant select on table "public"."shopping_lists" to "authenticated";

grant trigger on table "public"."shopping_lists" to "authenticated";

grant truncate on table "public"."shopping_lists" to "authenticated";

grant update on table "public"."shopping_lists" to "authenticated";

grant delete on table "public"."shopping_lists" to "service_role";

grant insert on table "public"."shopping_lists" to "service_role";

grant references on table "public"."shopping_lists" to "service_role";

grant select on table "public"."shopping_lists" to "service_role";

grant trigger on table "public"."shopping_lists" to "service_role";

grant truncate on table "public"."shopping_lists" to "service_role";

grant update on table "public"."shopping_lists" to "service_role";

create policy "DELETE participants if user is authenticated"
on "public"."participants"
as permissive
for delete
to authenticated
using ((is_shopping_list_joined_participant(auth.uid(), shopping_list_id) OR (auth.uid() = user_id)));


create policy "INSERT participants if user is authenticated"
on "public"."participants"
as permissive
for insert
to authenticated
with check (is_shopping_list_joined_participant(auth.uid(), shopping_list_id));


create policy "SELECT participants if user is authenticated"
on "public"."participants"
as permissive
for select
to authenticated
using (is_shopping_list_any_participant(auth.uid(), shopping_list_id));


create policy "UPDATE participants if user is a participant"
on "public"."participants"
as permissive
for update
to authenticated
using ((is_shopping_list_joined_participant(auth.uid(), shopping_list_id) OR (auth.uid() = user_id)));


create policy "DELETE shopping_lists if user is authenticated"
on "public"."shopping_lists"
as permissive
for delete
to authenticated
using ((auth.uid() = owner_id));


create policy "INSERT shopping_lists if user is authenticated"
on "public"."shopping_lists"
as permissive
for insert
to authenticated
with check (true);


create policy "SELECT shopping_lists if user is authenticated"
on "public"."shopping_lists"
as permissive
for select
to authenticated
using (is_shopping_list_joined_participant(auth.uid(), id));


create policy "UPDATE shopping_lists if user is a participant"
on "public"."shopping_lists"
as permissive
for update
to authenticated
using (is_shopping_list_joined_participant(auth.uid(), id));



