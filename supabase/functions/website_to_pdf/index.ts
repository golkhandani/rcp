// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.
import puppeteer from 'https://deno.land/x/puppeteer@16.2.0/mod.ts';
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2.39.3';

console.log('Hello from Functions!');

Deno.serve((req) => {
	return new Response(
		JSON.stringify({}),
		{ headers: { 'Content-Type': 'application/json' } },
	);
});

/* To invoke locally:

  1. Run `supabase start` (see: https://supabase.com/docs/reference/cli/supabase-start)
  2. Make an HTTP request:

  curl -i --location --request POST 'http://127.0.0.1:54321/functions/v1/website_to_pdf' \
    --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.Jw7j17pyy5Lw3qXN51yv5-C18wua8wmgCcRem_crLRw' \
    --header 'Content-Type: application/json' \
    --data '{"name":"Functions"}'

*/
