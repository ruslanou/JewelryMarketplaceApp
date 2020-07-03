import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passion_jewelry/blocs/login_bloc/login_bloc.dart';
import 'package:passion_jewelry/blocs/login_bloc/login_event.dart';
import 'package:passion_jewelry/blocs/login_bloc/login_state.dart';
import 'package:passion_jewelry/widgets/login_screen/forgot_password.dart';
import 'package:passion_jewelry/widgets/login_screen/header_logo.dart';
import 'package:passion_jewelry/widgets/login_screen/register.dart';

class LoginMaster extends StatefulWidget {
  @override
  _LoginMasterState createState() => _LoginMasterState();
}

class _LoginMasterState extends State<LoginMaster> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(
        LoginButtonPressed(
          username: _usernameController.text,
          password: _passwordController.text,
        ),
      );
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('${state.error}'),
              backgroundColor: Colors.pink,
            ),
          );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                HeaderLogo(),
                Container(
                  padding: EdgeInsets.only(top: 35, left: 20, right: 20),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "USERNAME",
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.pink),
                          ),
                        ),
                        controller: _usernameController,
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "PASSWORD",
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.pink),
                          ),
                        ),
                        controller: _passwordController,
                      ),
                      SizedBox(height: 5),
                      ForgotPassword(),
                      SizedBox(height: 40),
                      Container(
                        height: 40,
                        child: Material(
                          borderRadius: BorderRadius.circular(20),
                          shadowColor: Colors.greenAccent,
                          color: Colors.pink,
                          elevation: 7,
                          child: GestureDetector(
                            onTap: state is! LoginInProgress ? _onLoginButtonPressed : null,
                            child: Center(
                              child: Text(
                                "LOGIN",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(),
                      Container(
                        height: 40,
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.pink,
                                style: BorderStyle.solid,
                                width: 1,
                              ),
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Center(
                                child: ImageIcon(AssetImage(
                                    "assets/images/google_logo.png")),
                              ),
                              SizedBox(width: 10),
                              Center(
                                child: Text(
                                  "Log in with Google",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Register()
              ],
            ),
          );
        },
      ),
    );
  }
}
