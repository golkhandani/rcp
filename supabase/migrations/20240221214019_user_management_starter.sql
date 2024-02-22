-- Set up Storage!
insert into storage.buckets (id, name)
  values ('avatars', 'avatars');

create policy "Avatar select" on storage.objects
  for select using ((bucket_id = 'avatars'::text) AND (((storage.foldername(name))[1])::uuid = auth.uid()) AND (auth.role() = 'authenticated'::text));

create policy "Avatar insert" on storage.objects
  for insert with check ((bucket_id = 'avatars'::text) AND (((storage.foldername(name))[1])::uuid = auth.uid()) AND (auth.role() = 'authenticated'::text));

create policy "Avatar update" on storage.objects
  for update with check ((bucket_id = 'avatars'::text) AND (((storage.foldername(name))[1])::uuid = auth.uid()) AND (auth.role() = 'authenticated'::text));

create policy "Avatar delete" on storage.objects
  for delete using ((bucket_id = 'avatars'::text) AND (((storage.foldername(name))[1])::uuid = auth.uid()) AND (auth.role() = 'authenticated'::text));
