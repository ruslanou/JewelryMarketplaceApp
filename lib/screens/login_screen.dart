import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passion_jewelry/blocs/auth_bloc/auth_bloc.dart';
import 'package:passion_jewelry/blocs/login_bloc/login_bloc.dart';
import 'package:passion_jewelry/utils/user_repository.dart';
import 'package:passion_jewelry/widgets/login_screen/login_master.dart';

class LoginScreen extends StatelessWidget {
  final UserRepository userRepository;
  LoginScreen({Key key, @required this.userRepository})
  : assert(userRepository != null), 
  super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) {
          return LoginBloc(userRepository: userRepository, authenticationBloc: BlocProvider.of<AuthenticationBloc>(context));
        },
        child: LoginMaster(),
      )
    );
  }
}
