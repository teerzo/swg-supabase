CREATE TYPE "public"."species" AS ENUM (
    'bothan',
    'human',
    'ithorian',
    'mon calamari',
    'rodian',
    'sullustan',
    'trandoshan',
    'twilek',
    'wookie',
    'zabrak'
);

CREATE TYPE "public"."professions" AS ENUM (
    'bounty hunter',
    'commando',
    'jedi',
    'medic',
    'officer',
    'smuggler',
    'spy',
    'entertainer',
    'trader domestics',
    'trader engineering',
    'trader muntions',
    'trader structures'
);

create table characters (
    id uuid primary key default uuid_generate_v4 (),
    user_id uuid references auth.users,
    updated_at timestamp with time zone,
    name text,
    profession professions,
    species species,
    level int
);