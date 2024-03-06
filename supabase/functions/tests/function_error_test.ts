// Import required libraries and modules
import {
	assert,
	assertEquals,
	assertExists,
} from 'https://deno.land/std@0.192.0/testing/asserts.ts';
import {
	createClient,
	SupabaseClient,
} from 'https://esm.sh/@supabase/supabase-js@2.23.0';
import { load } from 'https://deno.land/std@0.218.0/dotenv/mod.ts';

// Set up the configuration for the Supabase client
const env = await load({ envPath: '../../../.env.local' });
const supabaseUrl = Deno.env.get('SUPABASE_URL') ?? '';
const supabaseKey = Deno.env.get('SUPABASE_ANON_KEY') ?? '';
const options = {
	auth: {
		autoRefreshToken: false,
		persistSession: false,
		detectSessionInUrl: false,
	},
};

// Test the 'hello-world' function
const testError = async () => {
	console.log('supabaseUrl', supabaseUrl);
	const client: SupabaseClient = createClient(
		supabaseUrl,
		supabaseKey,
		options,
	);

	// Invoke the 'hello-world' function with a parameter
	const { data: func_data, error: func_error } = await client.functions
		.invoke(
			'users/invitation_is_available?email=golkhandani%2B1@gmail.com',
			{
				method: 'GET',
			},
		);

	console.log('supabaseUrl', func_error);
	// Check for errors from the function invocation
	if (func_error) {
		throw new Error('Invalid response: ' + func_error.message);
	}

	// Log the response from the function
	console.log(JSON.stringify(func_data, null, 2));

	// Assert that the function returned the expected result
	assertEquals(func_data.message, 'Hello bar!');
};

// Register and run the tests
Deno.test('testError', testError);
