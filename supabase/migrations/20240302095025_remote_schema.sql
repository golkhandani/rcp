drop policy "DELETE participants if user is authenticated" on "public"."participants";

drop policy "INSERT participants if user is authenticated" on "public"."participants";

drop policy "SELECT participants if user is authenticated" on "public"."participants";

drop policy "UPDATE participants if user is a participant" on "public"."participants";

drop policy "SELECT shopping_lists if user is authenticated" on "public"."shopping_lists";

drop policy "UPDATE shopping_lists if user is a participant" on "public"."shopping_lists";

alter table "public"."participants" add column "user_email" character varying not null;

CREATE UNIQUE INDEX user_id_unique ON public.user_profile USING btree (user_id);

alter table "public"."participants" add constraint "public_participants_created_by_fkey" FOREIGN KEY (created_by) REFERENCES user_profile(user_id) not valid;

alter table "public"."participants" validate constraint "public_participants_created_by_fkey";

alter table "public"."participants" add constraint "public_participants_invited_by_fkey" FOREIGN KEY (invited_by) REFERENCES user_profile(user_id) not valid;

alter table "public"."participants" validate constraint "public_participants_invited_by_fkey";

alter table "public"."participants" add constraint "public_participants_updated_by_fkey" FOREIGN KEY (updated_by) REFERENCES user_profile(user_id) not valid;

alter table "public"."participants" validate constraint "public_participants_updated_by_fkey";

alter table "public"."shopping_lists" add constraint "public_shopping_lists_created_by_fkey" FOREIGN KEY (created_by) REFERENCES user_profile(user_id) not valid;

alter table "public"."shopping_lists" validate constraint "public_shopping_lists_created_by_fkey";

alter table "public"."shopping_lists" add constraint "public_shopping_lists_owner_id_fkey" FOREIGN KEY (owner_id) REFERENCES user_profile(user_id) not valid;

alter table "public"."shopping_lists" validate constraint "public_shopping_lists_owner_id_fkey";

alter table "public"."shopping_lists" add constraint "public_shopping_lists_updated_by_fkey" FOREIGN KEY (updated_by) REFERENCES user_profile(user_id) not valid;

alter table "public"."shopping_lists" validate constraint "public_shopping_lists_updated_by_fkey";

alter table "public"."user_profile" add constraint "public_user_profile_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth.users(id) not valid;

alter table "public"."user_profile" validate constraint "public_user_profile_user_id_fkey";

alter table "public"."user_profile" add constraint "user_id_unique" UNIQUE using index "user_id_unique";

set check_function_bodies = off;

CREATE OR REPLACE FUNCTION public.is_shopping_list_any_participant(input_user_id uuid, input_shopping_list_id uuid, input_created_by uuid DEFAULT NULL::uuid)
 RETURNS boolean
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$
DECLARE
    user_participant BOOLEAN;
    user_owner BOOLEAN;
    user_creator BOOLEAN;
BEGIN
    -- Check if the user exists
    SELECT EXISTS (
        SELECT 1 FROM participants 
        WHERE user_id = input_user_id
        AND status in ('joined', 'invited')
    ) INTO user_participant;

    SELECT EXISTS (
        SELECT 1 FROM shopping_lists 
        WHERE owner_id = input_user_id
        AND input_shopping_list_id = id
    ) INTO user_owner;

    SELECT EXISTS (
        SELECT input_created_by = input_user_id
    ) INTO user_creator;
      
    -- Return true if both user and group exist, otherwise return false
    RETURN user_participant OR user_owner OR user_creator;
END;
$function$
;

CREATE OR REPLACE FUNCTION public.is_shopping_list_joined_participant(input_user_id uuid, input_shopping_list_id uuid, input_created_by uuid DEFAULT NULL::uuid)
 RETURNS boolean
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$
DECLARE
    user_participant BOOLEAN;
    user_owner BOOLEAN;
    user_creator BOOLEAN;
BEGIN
    -- Check if the user exists
    SELECT EXISTS (
        SELECT 1 FROM participants 
        WHERE user_id = input_user_id
        AND status in ('joined')
    ) INTO user_participant;

    SELECT EXISTS (
        SELECT 1 FROM shopping_lists 
        WHERE owner_id = input_user_id
        AND input_shopping_list_id = id
    ) INTO user_owner;

    SELECT EXISTS (
        SELECT input_created_by = input_user_id
    ) INTO user_creator;
      
    -- Return true if both user and group exist, otherwise return false
    RETURN user_participant OR user_owner OR user_creator;
END;
$function$
;

create policy "ALL shopping_lists if user is authenticated"
on "public"."shopping_lists"
as permissive
for all
to authenticated
using (public.is_shopping_list_joined_participant(auth.uid(), id));


create policy "DELETE participants if user is authenticated"
on "public"."participants"
as permissive
for delete
to authenticated
using ((public.is_shopping_list_joined_participant(auth.uid(), shopping_list_id) OR (auth.uid() = user_id)));


create policy "INSERT participants if user is authenticated"
on "public"."participants"
as permissive
for insert
to authenticated
with check (public.is_shopping_list_joined_participant(auth.uid(), shopping_list_id));


create policy "SELECT participants if user is authenticated"
on "public"."participants"
as permissive
for select
to authenticated
using (public.is_shopping_list_any_participant(auth.uid(), shopping_list_id));


create policy "UPDATE participants if user is a participant"
on "public"."participants"
as permissive
for update
to authenticated
using ((public.is_shopping_list_joined_participant(auth.uid(), shopping_list_id) OR (auth.uid() = user_id)));


create policy "SELECT shopping_lists if user is authenticated"
on "public"."shopping_lists"
as permissive
for select
to authenticated
using (is_shopping_list_joined_participant(auth.uid(), id, owner_id));


create policy "UPDATE shopping_lists if user is a participant"
on "public"."shopping_lists"
as permissive
for update
to authenticated
using (public.is_shopping_list_joined_participant(auth.uid(), id));



