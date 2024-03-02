class Environment {
  static const String supabaseUrl = String.fromEnvironment('SUPABASE_URL');
  static const String supabaseKey = String.fromEnvironment('SUPABASE_KEY');
  static const String persistSessionKey = 'PERSIST_SESSION_KEY';
  static const String isIntroCheckedKey = 'isIntroCheckedKey';
  static const String selectedGroupKey = 'selectedGroupKey';
}
