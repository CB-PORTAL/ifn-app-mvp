class AppConstants {
  static const String appName = 'Indie Film Network';
  static const String appVersion = '0.1.0';
  
  // Creator Types
  static const String creatorTypeHuman = 'Human';
  static const String creatorTypeAI = 'AI';
  static const String creatorTypeHybrid = 'Hybrid';
  
  // Filmmaker Roles
  static const List<String> filmmakerRoles = [
    'Director',
    'Producer',
    'Cinematographer',
    'Writer',
    'Editor',
    'Sound Designer',
    'Actor',
    'Production Designer',
    'Composer',
    'VFX Artist',
    'Other'
  ];
  
  // Initial Location - Atlanta
  static const double atlantaLatitude = 33.7490;
  static const double atlantaLongitude = -84.3880;
  
  // Supabase Configuration
  static const String supabaseUrl = 'YOUR_SUPABASE_URL';
  static const String supabaseAnonKey = 'YOUR_SUPABASE_ANON_KEY';
}
