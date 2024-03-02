# Prerequisites for Project Setup

Before setting up the project, ensure you have the following prerequisites installed:

## Docker

You need Docker installed for containerization. If not already installed, follow the instructions to install Docker from [here](https://docs.docker.com/get-docker/).

## Supabase CLI

Supabase CLI is required for interacting with Supabase services. If you haven't installed it yet, you can install it by following the instructions [here](https://github.com/supabase/cli).

## Deno

Deno is necessary for edge function development. If Deno is not installed on your system, you can install it by following the instructions provided [here](https://docs.deno.com/runtime/manual/getting_started/installation).

## Flutter

For frontend development, Flutter is required. If you haven't installed Flutter yet, follow the instructions [here](https://docs.flutter.dev/get-started/install).

## Flutter VSCode Extension

To enhance Flutter development experience within Visual Studio Code, make sure to install the Flutter extension.

## Deno VSCode Extension

For better development support with Deno in Visual Studio Code, install the Deno extension.

# How to Run the Project

Before running the project, follow the steps below:

```
deno run --allow-read --allow-run --allow-write https://deno.land/x/deno_hooks@0.1.1/mod.ts
```

Create a bucked called `avatars` and make sure user can read and write on it;

## Local Development

1. **Set Up Supabase Local Environment**:

   - Create a `.env` file for Supabase local environment and add the following:

   ```
   SUPABASE_AUTH_JWT_SECRET=[USE THE SAME IN THE PROD FOR NOW]
   ```

   - Run the following commands:
   - Note: Provide the database password when prompted, or it will ask every time it connects to the database.

   ```
   $ supabase login
   $ supabase link --project-ref hhahtffbqirozvtxskgd
   $ supabase start
   ```

   Ensure that the response includes the necessary local development setup information.

   ```
    supabase local development setup is running.
    API URL: http://127.0.0.1:54321
    GraphQL URL: http://127.0.0.1:54321/graphql/v1
    DB URL: postgresql://postgres:postgres@127.0.0.1:54322/postgres
    Studio URL: http://127.0.0.1:54323
    Inbucket URL: http://127.0.0.1:54324
    JWT secret: [YOUR JWT SECRET FROM .env]
    anon key: [ANON_KEY]
    service_role key: [ROLE_KEY]

   ```

2. **Sync Database**:

   ```
   supabase db pull --schema auth,storage
   supabase db dump --schema auth,storage
   supabase db dump -f supabase/seed.sql --data-only
   supabase db push --local
   supabase db migration up --local
   ```

   npx supabase gen types typescript --project-id "hhahtffbqirozvtxskgd" --schema public > supabase/functions/types.ts



3. **Run Supabase Functions**:
   To be able to watch edge function changes and logs

   Run
   `supabase functions serve`.

4. **Create Local Environment for Flutter App**:

   - Create a `.flutter.env.local.json` file with the following content:

   ```json
   {
     "SUPABASE_URL": "[API URL]",
     "SUPABASE_KEY": "[ANON_KEY]"
   }
   ```

   - Run the Flutter app using:

   ```
   flutter run --dart-define-from-file=.flutter.env.local.json
   ```

## To Run Remote

1. **Create Remote Environment for Flutter App**:

   - Create a `.flutter.env.remote.json` file with the following content:

   ```json
   {
     "SUPABASE_URL": "[API URL]",
     "SUPABASE_KEY": "[ANON_KEY]"
   }
   ```

2. **Before You Run**:

   - If you've made any changes to the database using Studio UI, sync your local environment:

   ```
   supabase db pull --local
   ```

3. **Sync Database with Remote**:

   ```
   supabase db push
   supabase db migration up
   ```

4. **Flutter Remote Run**:
   Run the Flutter app using:
   ```
   flutter run --dart-define-from-file=.flutter.env.remote.json
   ```

# Create and Deploy New Edge Function

To create and deploy a new edge function, follow these steps:

Suggested structure:

```
└── supabase
    ├── functions
    │   ├── function-one
    │   │   └── index.ts
    │   └── function-two
    │   │   └── index.ts
    │   └── tests
    │       └── function-one-test.ts  # Tests for function-one
    │       └── function-two-test.ts  # Tests for function-two
    └── config.toml
```

1. **Create a New Edge Function**:
   Run the following command to create a new edge function:

   ```
   supabase functions new [function_name]
   ```

   Replace `[function_name]` with the desired name for your edge function.

2. **Serve the Function Locally**:
   Start serving the function locally by running:

   ```
   supabase functions serve
   ```

   This step allows you to test your function locally before deploying it.

3. **Test the Fucntion Locally**:
   Create the environment variables file for test - `.env.test`:

   ```
   SUPABASE_URL=[Local API URL]
   SUPABASE_ANON_KEY=[ANON_KEY]
   ```

   deno test --allow-all supabase/functions/[function_name].ts --env-file .env.test

   Sample:

   ```TS
    // Test the 'hello-world' function
    const testHelloWorld = async () => {
    var client: SupabaseClient = createClient(supabaseUrl, supabaseKey, options)

    // Invoke the 'hello-world' function with a parameter
    const { data: func_data, error: func_error } = await client.functions.invoke('hello-world', {
        body: { name: 'bar' },
    })

    // Check for errors from the function invocation
    if (func_error) {
        throw new Error('Invalid response: ' + func_error.message)
    }

    // Log the response from the function
    console.log(JSON.stringify(func_data, null, 2))

    // Assert that the function returned the expected result
    assertEquals(func_data.message, 'Hello bar!')
    }

    // Register and run the tests
    Deno.test('Hello-world Function Test', testHelloWorld)
   ```

4. **Deploy the Function**:
   Once you've tested the function locally and it's ready for deployment, use the following command to deploy it:

   ```
   supabase functions deploy --project-ref hhahtffbqirozvtxskgd
   ```
