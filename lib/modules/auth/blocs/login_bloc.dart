import 'events/login_states.dart';
import 'states/login_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../repositories/login_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final LoginRepository loginRepository;
  
  LoginBloc(this.loginRepository):super(LoginIdle()){
    on<loginWithEmail>(loginEmail);
  }

  Future loginEmail(loginWithEmail event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    await Future.delayed(Duration(seconds: 2));
    try {
      await loginRepository.login(event.email, event.password);
      emit(LoginSucess());
    } catch (e) {
      emit(LoginFailure('erro...'));
    }

  }
}