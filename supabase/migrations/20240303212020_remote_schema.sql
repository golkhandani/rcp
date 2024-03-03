drop policy "Enable select for users based on user_id" on "public"."user_profile";

set check_function_bodies = off;

CREATE OR REPLACE FUNCTION public.check_common_shopping_list_for_users(user1_id uuid, user2_id uuid)
 RETURNS boolean
 LANGUAGE plpgsql
AS $function$
DECLARE
    common_shopping_list_exists boolean;
BEGIN
    -- Check if there's any common shopping_list_id for both users
    SELECT EXISTS (
        SELECT 1
        FROM public.participants p1
        WHERE p1.user_id = user1_id
        AND EXISTS (
            SELECT 1
            FROM public.participants p2
            WHERE p2.user_id = user2_id
            AND p1.shopping_list_id = p2.shopping_list_id
            LIMIT 1  -- Limit the search to one record
        )
        LIMIT 1  -- Limit the search to one record
    )
    INTO common_shopping_list_exists;

    RETURN common_shopping_list_exists;
END;
$function$
;

CREATE OR REPLACE FUNCTION public.get_user_by_email(p_email text)
 RETURNS TABLE(id uuid, email character varying, email_confirmed_at timestamp with time zone, created_at timestamp with time zone, updated_at timestamp with time zone, phone text, phone_confirmed_at timestamp with time zone, confirmed_at timestamp with time zone, banned_until timestamp with time zone, deleted_at timestamp with time zone)
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$
BEGIN
    RETURN QUERY SELECT 
      au.id,
      au.email,
      au.email_confirmed_at,
      au.created_at,
      au.updated_at,
      au.phone,
      au.phone_confirmed_at,
      au.confirmed_at,
      au.banned_until,
      au.deleted_at
    FROM auth.users au WHERE au.email = $1;
END;
$function$
;

create policy "Enable select for users based on user_id"
on "public"."user_profile"
as permissive
for select
to authenticated
using (((auth.uid() = user_id) OR check_common_shopping_list_for_users(auth.uid(), user_id)));



