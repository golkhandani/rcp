create policy "Enable all for users based on user_id"
on "public"."user_profile"
as permissive
for all
to authenticated
using ((auth.uid() = user_id))
with check ((auth.uid() = user_id));



