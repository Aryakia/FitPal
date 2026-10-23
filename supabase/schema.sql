-- Run this in the Supabase SQL editor before enabling account sync.
-- Each confirmed user can read/write ONLY their own fitness state.
create table if not exists public.user_fitness_state (
  user_id uuid primary key references auth.users (id) on delete cascade,
  payload jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now(),
  constraint max_payload_size check (pg_column_size(payload) < 3000000)
);

alter table public.user_fitness_state enable row level security;
revoke all on table public.user_fitness_state from anon, authenticated;
grant select, insert, update, delete on table public.user_fitness_state to authenticated;

create policy "Read own fitness state"
on public.user_fitness_state for select to authenticated
using ((select auth.uid()) = user_id);

create policy "Insert own fitness state"
on public.user_fitness_state for insert to authenticated
with check ((select auth.uid()) = user_id);

create policy "Update own fitness state"
on public.user_fitness_state for update to authenticated
using ((select auth.uid()) = user_id)
with check ((select auth.uid()) = user_id);

create policy "Delete own fitness state"
on public.user_fitness_state for delete to authenticated
using ((select auth.uid()) = user_id);
