import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<void> cadastrarUsuario({
    required String name,
    required String username,
    required String email,
    required String senha,
  }) async {
    final response = await _supabase.auth.signUp(
      email: email,
      password: senha,
      data: {'nome': name, 'usuario': username},
    );

    final user = response.user;

    if (user == null) {
      throw Exception('Não foi possível criar o usuário.');
    }
  }

  Future<void> login({required String login, required String password}) async {
    final response = await _supabase.rpc(
      'get_login_email',
      params: {'p_login': login},
    );

    final email = response as String;

    await _supabase.auth.signInWithPassword(email: email, password: password);
  }

  User? get currentUser => _supabase.auth.currentUser;

  Stream<AuthState> get authStateChanges => _supabase.auth.onAuthStateChange;

  // Encerra a sessão
  Future<void> logout() async {
    await _supabase.auth.signOut();
  }
}
