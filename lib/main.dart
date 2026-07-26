import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:trufapp/app/core/config/env.dart';
import 'package:trufapp/app/init/app_page.dart';

const supabaseUrl = String.fromEnvironment('SUPABASE_URL');

const supabaseKey = String.fromEnvironment('SUPABASE_KEY');
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');

  // ignore: deprecated_member_use
  await Supabase.initialize(url: Env.supabaseUrl, anonKey: Env.supabaseKey);
  runApp(const AppPage());
}
