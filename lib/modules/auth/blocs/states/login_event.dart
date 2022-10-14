abstract class LoginEvent {}

class loginWithEmail implements LoginEvent{
  final String password;
  final String email;

  loginWithEmail({required this.password, required this.email});
}