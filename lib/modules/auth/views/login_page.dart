import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../blocs/login_bloc.dart';
import '../blocs/states/login_event.dart';
import '../blocs/events/login_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final bloc = Modular.get<LoginBloc>();


  @override
  void initState() {
    super.initState();
    bloc.stream.listen((state) async{
      if(state is LoginSucess){
        await Future.delayed(Duration(seconds: 2));
        Modular.to.navigate('/profile/');
      }
    });
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: BlocBuilder<LoginBloc, LoginState> (
        bloc: bloc,
        builder: (context, state){
          if(state is LoginSucess){
            Modular.to.navigate('/profile/');
          }
          if(state is LoginLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Center(
              child: ElevatedButton(
                  onPressed: () {
                    bloc.add(loginWithEmail(
                      password: "123123",
                      email: "igor@g.com"
                    ));
                  },
                  child: const Text('Entrar')
              )
          );

        }),



    );
  }
}
