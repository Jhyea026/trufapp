import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:trufapp/app/init/app_page.dart';

const supabaseUrl = String.fromEnvironment('SUPABASE_URL');

const supabaseKey = String.fromEnvironment('SUPABASE_KEY');
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (supabaseUrl.isEmpty) {
    throw Exception('SUPABASE_URL não foi configurada.');
  }

  if (supabaseKey.isEmpty) {
    throw Exception('SUPABASE_KEY não foi configurada.');
  }

  await Supabase.initialize(
    url: supabaseUrl,
    // ignore: deprecated_member_use
    anonKey: supabaseKey,
  );
  runApp(const AppPage());
}
