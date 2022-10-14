import 'events/login_states.dart';
import 'states/login_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../repositories/login_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final LoginRepository loginRepository;
  final SharedPreferences shared;

  LoginBloc(this.loginRepository, this.shared):super(LoginIdle()){
    on<loginWithEmail>(loginEmail);
  }

  Future loginEmail(loginWithEmail event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    await Future.delayed(Duration(seconds: 2));
    try {
      await loginRepository.login(event.email, event.password);
      emit(LoginSucess());
      shared.setBool('isLogged', true);
    } catch (e) {
      emit(LoginFailure('erro...'));
    }
  }

  Future<bool> checkCurrentUser() async {
    return await shared.getBool('isLogged')?? true;
  }


}