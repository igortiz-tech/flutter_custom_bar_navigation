class LoginRepository {
  Future<bool> login(String email, String password) async {
    if(email == 'igor@g.com' && password == '123123'){
      return true;
    } else {
      throw Exception('erro no login');
    }
  }
}