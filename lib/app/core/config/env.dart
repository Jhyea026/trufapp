import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static String get supabaseUrl {
    final value = dotenv.env['SUPABASE_URL'];

    if (value == null || value.isEmpty) {
      throw Exception('SUPABASE_URL não configurada');
    }

    return value;
  }

  static String get supabaseKey {
    final value = dotenv.env['SUPABASE_KEY'];

    if (value == null || value.isEmpty) {
      throw Exception('SUPABASE_KEY não configurada');
    }

    return value;
  }
}
