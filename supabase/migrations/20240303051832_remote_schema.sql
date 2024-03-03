
SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

CREATE EXTENSION IF NOT EXISTS "pgsodium" WITH SCHEMA "pgsodium";

CREATE SCHEMA IF NOT EXISTS "public";

ALTER SCHEMA "public" OWNER TO "pg_database_owner";

COMMENT ON SCHEMA "public" IS 'standard public schema';

CREATE EXTENSION IF NOT EXISTS "pg_graphql" WITH SCHEMA "graphql";

CREATE EXTENSION IF NOT EXISTS "pg_stat_statements" WITH SCHEMA "extensions";

CREATE EXTENSION IF NOT EXISTS "pgcrypto" WITH SCHEMA "extensions";

CREATE EXTENSION IF NOT EXISTS "pgjwt" WITH SCHEMA "extensions";

CREATE EXTENSION IF NOT EXISTS "supabase_vault" WITH SCHEMA "vault";

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA "extensions";

CREATE OR REPLACE FUNCTION "public"."is_shopping_list_any_participant"("input_user_id" "uuid", "input_shopping_list_id" "uuid", "input_created_by" "uuid" DEFAULT NULL::"uuid") RETURNS boolean
    LANGUAGE "plpgsql" SECURITY DEFINER
    AS $$
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
$$;

ALTER FUNCTION "public"."is_shopping_list_any_participant"("input_user_id" "uuid", "input_shopping_list_id" "uuid", "input_created_by" "uuid") OWNER TO "postgres";

CREATE OR REPLACE FUNCTION "public"."is_shopping_list_joined_participant"("input_user_id" "uuid", "input_shopping_list_id" "uuid", "input_created_by" "uuid" DEFAULT NULL::"uuid") RETURNS boolean
    LANGUAGE "plpgsql" SECURITY DEFINER
    AS $$
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
$$;

ALTER FUNCTION "public"."is_shopping_list_joined_participant"("input_user_id" "uuid", "input_shopping_list_id" "uuid", "input_created_by" "uuid") OWNER TO "postgres";

SET default_tablespace = '';

SET default_table_access_method = "heap";

CREATE TABLE IF NOT EXISTS "public"."participants" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "user_id" "uuid" NOT NULL,
    "user_profile_id" "uuid" NOT NULL,
    "shopping_list_id" "uuid" NOT NULL,
    "status" character varying DEFAULT 'invited'::character varying NOT NULL,
    "invited_by" "uuid" DEFAULT "auth"."uid"() NOT NULL,
    "invited_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "created_by" "uuid" DEFAULT "auth"."uid"() NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_by" "uuid" DEFAULT "auth"."uid"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "user_email" character varying NOT NULL
);

ALTER TABLE "public"."participants" OWNER TO "postgres";

COMMENT ON TABLE "public"."participants" IS 'keep shopping list participant informtion';

CREATE TABLE IF NOT EXISTS "public"."shopping_items" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "shopping_list_id" "uuid" NOT NULL,
    "name" character varying NOT NULL,
    "quantity" "text",
    "purchased_by" "uuid",
    "purchased_at" timestamp with time zone,
    "updated_by" "uuid" DEFAULT "auth"."uid"(),
    "updated_at" timestamp with time zone DEFAULT "now"(),
    "created_by" "uuid" DEFAULT "auth"."uid"(),
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);

ALTER TABLE "public"."shopping_items" OWNER TO "postgres";

COMMENT ON TABLE "public"."shopping_items" IS 'keep items of each shopping list';

CREATE TABLE IF NOT EXISTS "public"."shopping_lists" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "name" character varying NOT NULL,
    "description" "text",
    "created_by" "uuid" DEFAULT "auth"."uid"() NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_by" "uuid" DEFAULT "auth"."uid"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "owner_id" "uuid" DEFAULT "auth"."uid"() NOT NULL
);

ALTER TABLE "public"."shopping_lists" OWNER TO "postgres";

COMMENT ON TABLE "public"."shopping_lists" IS 'keep shopping lists very basic info';

CREATE TABLE IF NOT EXISTS "public"."user_profile" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "username" character varying NOT NULL,
    "avatar_url" character varying,
    "full_name" character varying,
    "user_id" "uuid" DEFAULT "auth"."uid"() NOT NULL
);

ALTER TABLE "public"."user_profile" OWNER TO "postgres";

COMMENT ON TABLE "public"."user_profile" IS 'keep users''s profile information';

ALTER TABLE ONLY "public"."participants"
    ADD CONSTRAINT "participants_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."shopping_items"
    ADD CONSTRAINT "shopping_items_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."shopping_lists"
    ADD CONSTRAINT "shopping_lists_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."user_profile"
    ADD CONSTRAINT "user_id_unique" UNIQUE ("user_id");

ALTER TABLE ONLY "public"."user_profile"
    ADD CONSTRAINT "user_profile_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."user_profile"
    ADD CONSTRAINT "user_profile_username_key" UNIQUE ("username");

ALTER TABLE ONLY "public"."participants"
    ADD CONSTRAINT "public_participants_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."user_profile"("user_id");

ALTER TABLE ONLY "public"."participants"
    ADD CONSTRAINT "public_participants_invited_by_fkey" FOREIGN KEY ("invited_by") REFERENCES "public"."user_profile"("user_id");

ALTER TABLE ONLY "public"."participants"
    ADD CONSTRAINT "public_participants_shopping_list_id_fkey" FOREIGN KEY ("shopping_list_id") REFERENCES "public"."shopping_lists"("id");

ALTER TABLE ONLY "public"."participants"
    ADD CONSTRAINT "public_participants_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "public"."user_profile"("user_id");

ALTER TABLE ONLY "public"."participants"
    ADD CONSTRAINT "public_participants_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth"."users"("id");

ALTER TABLE ONLY "public"."participants"
    ADD CONSTRAINT "public_participants_user_profile_id_fkey" FOREIGN KEY ("user_profile_id") REFERENCES "public"."user_profile"("id");

ALTER TABLE ONLY "public"."shopping_items"
    ADD CONSTRAINT "public_shopping_items_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."user_profile"("user_id");

ALTER TABLE ONLY "public"."shopping_items"
    ADD CONSTRAINT "public_shopping_items_purchased_by_fkey" FOREIGN KEY ("purchased_by") REFERENCES "public"."user_profile"("user_id");

ALTER TABLE ONLY "public"."shopping_items"
    ADD CONSTRAINT "public_shopping_items_shopping_list_id_fkey" FOREIGN KEY ("shopping_list_id") REFERENCES "public"."shopping_lists"("id");

ALTER TABLE ONLY "public"."shopping_items"
    ADD CONSTRAINT "public_shopping_items_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "public"."user_profile"("user_id");

ALTER TABLE ONLY "public"."shopping_lists"
    ADD CONSTRAINT "public_shopping_lists_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."user_profile"("user_id");

ALTER TABLE ONLY "public"."shopping_lists"
    ADD CONSTRAINT "public_shopping_lists_owner_id_fkey" FOREIGN KEY ("owner_id") REFERENCES "public"."user_profile"("user_id");

ALTER TABLE ONLY "public"."shopping_lists"
    ADD CONSTRAINT "public_shopping_lists_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "public"."user_profile"("user_id");

ALTER TABLE ONLY "public"."user_profile"
    ADD CONSTRAINT "public_user_profile_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth"."users"("id");

CREATE POLICY "ALL shopping_lists if user is authenticated" ON "public"."shopping_lists" TO "authenticated" USING ("public"."is_shopping_list_joined_participant"("auth"."uid"(), "id", NULL::"uuid"));

CREATE POLICY "DELETE participants if user is authenticated" ON "public"."participants" FOR DELETE TO "authenticated" USING (("public"."is_shopping_list_joined_participant"("auth"."uid"(), "shopping_list_id", NULL::"uuid") OR ("auth"."uid"() = "user_id")));

CREATE POLICY "DELETE shopping_items if user is authenticated" ON "public"."shopping_items" FOR DELETE TO "authenticated" USING ("public"."is_shopping_list_joined_participant"("auth"."uid"(), "shopping_list_id", NULL::"uuid"));

CREATE POLICY "DELETE shopping_lists if user is authenticated" ON "public"."shopping_lists" FOR DELETE TO "authenticated" USING (("auth"."uid"() = "owner_id"));

CREATE POLICY "Enable all for users based on user_id" ON "public"."user_profile" TO "authenticated" USING (("auth"."uid"() = "user_id")) WITH CHECK (("auth"."uid"() = "user_id"));

CREATE POLICY "Enable delete for users based on user_id" ON "public"."user_profile" FOR DELETE TO "authenticated" USING (("auth"."uid"() = "user_id"));

CREATE POLICY "Enable insert for users based on user_id" ON "public"."user_profile" FOR INSERT TO "authenticated" WITH CHECK (("auth"."uid"() = "user_id"));

CREATE POLICY "Enable select for users based on user_id" ON "public"."user_profile" FOR SELECT TO "authenticated" USING (("auth"."uid"() = "user_id"));

CREATE POLICY "Enable update for users based on user_id" ON "public"."user_profile" FOR UPDATE TO "authenticated" WITH CHECK (("auth"."uid"() = "user_id"));

CREATE POLICY "INSERT participants if user is authenticated" ON "public"."participants" FOR INSERT TO "authenticated" WITH CHECK ("public"."is_shopping_list_joined_participant"("auth"."uid"(), "shopping_list_id", NULL::"uuid"));

CREATE POLICY "INSERT shopping_items if user is authenticated" ON "public"."shopping_items" FOR INSERT TO "authenticated" WITH CHECK ("public"."is_shopping_list_joined_participant"("auth"."uid"(), "shopping_list_id", NULL::"uuid"));

CREATE POLICY "INSERT shopping_lists if user is authenticated" ON "public"."shopping_lists" FOR INSERT TO "authenticated" WITH CHECK (true);

CREATE POLICY "SELECT participants if user is authenticated" ON "public"."participants" FOR SELECT TO "authenticated" USING ("public"."is_shopping_list_any_participant"("auth"."uid"(), "shopping_list_id", NULL::"uuid"));

CREATE POLICY "SELECT shopping_items if user is authenticated" ON "public"."shopping_items" FOR SELECT TO "authenticated" USING ("public"."is_shopping_list_joined_participant"("auth"."uid"(), "shopping_list_id", "created_by"));

CREATE POLICY "SELECT shopping_lists if user is authenticated" ON "public"."shopping_lists" FOR SELECT TO "authenticated" USING ("public"."is_shopping_list_joined_participant"("auth"."uid"(), "id", "owner_id"));

CREATE POLICY "UPDATE participants if user is a participant" ON "public"."participants" FOR UPDATE TO "authenticated" USING (("public"."is_shopping_list_joined_participant"("auth"."uid"(), "shopping_list_id", NULL::"uuid") OR ("auth"."uid"() = "user_id")));

CREATE POLICY "UPDATE shopping_items if user is a participant" ON "public"."shopping_items" FOR UPDATE TO "authenticated" USING ("public"."is_shopping_list_joined_participant"("auth"."uid"(), "shopping_list_id", NULL::"uuid"));

CREATE POLICY "UPDATE shopping_lists if user is a participant" ON "public"."shopping_lists" FOR UPDATE TO "authenticated" USING ("public"."is_shopping_list_joined_participant"("auth"."uid"(), "id", NULL::"uuid"));

ALTER TABLE "public"."participants" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."shopping_items" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."shopping_lists" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."user_profile" ENABLE ROW LEVEL SECURITY;

GRANT USAGE ON SCHEMA "public" TO "postgres";
GRANT USAGE ON SCHEMA "public" TO "anon";
GRANT USAGE ON SCHEMA "public" TO "authenticated";
GRANT USAGE ON SCHEMA "public" TO "service_role";

GRANT ALL ON FUNCTION "public"."is_shopping_list_any_participant"("input_user_id" "uuid", "input_shopping_list_id" "uuid", "input_created_by" "uuid") TO "anon";
GRANT ALL ON FUNCTION "public"."is_shopping_list_any_participant"("input_user_id" "uuid", "input_shopping_list_id" "uuid", "input_created_by" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."is_shopping_list_any_participant"("input_user_id" "uuid", "input_shopping_list_id" "uuid", "input_created_by" "uuid") TO "service_role";

GRANT ALL ON FUNCTION "public"."is_shopping_list_joined_participant"("input_user_id" "uuid", "input_shopping_list_id" "uuid", "input_created_by" "uuid") TO "anon";
GRANT ALL ON FUNCTION "public"."is_shopping_list_joined_participant"("input_user_id" "uuid", "input_shopping_list_id" "uuid", "input_created_by" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."is_shopping_list_joined_participant"("input_user_id" "uuid", "input_shopping_list_id" "uuid", "input_created_by" "uuid") TO "service_role";

GRANT ALL ON TABLE "public"."participants" TO "anon";
GRANT ALL ON TABLE "public"."participants" TO "authenticated";
GRANT ALL ON TABLE "public"."participants" TO "service_role";

GRANT ALL ON TABLE "public"."shopping_items" TO "anon";
GRANT ALL ON TABLE "public"."shopping_items" TO "authenticated";
GRANT ALL ON TABLE "public"."shopping_items" TO "service_role";

GRANT ALL ON TABLE "public"."shopping_lists" TO "anon";
GRANT ALL ON TABLE "public"."shopping_lists" TO "authenticated";
GRANT ALL ON TABLE "public"."shopping_lists" TO "service_role";

GRANT ALL ON TABLE "public"."user_profile" TO "anon";
GRANT ALL ON TABLE "public"."user_profile" TO "authenticated";
GRANT ALL ON TABLE "public"."user_profile" TO "service_role";

ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "service_role";

ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "service_role";

ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "service_role";

RESET ALL;
