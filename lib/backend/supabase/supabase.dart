import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

String _kSupabaseUrl = 'https://lyappgqcrvattzptlxcv.supabase.co';
String _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imx5YXBwZ3FjcnZhdHR6cHRseGN2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTI2MDYyNjAsImV4cCI6MjAyODE4MjI2MH0.HgMoA_eASn3KRiwLrygCcfyaloqlT9q_amiOIyuBIIQ';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}
