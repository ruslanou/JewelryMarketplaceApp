import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:passion_jewelry/blocs/auth_bloc/auth_bloc.dart';
import 'package:passion_jewelry/blocs/auth_bloc/auth_event.dart';
import 'package:passion_jewelry/blocs/login_bloc/login_event.dart';
import 'package:passion_jewelry/blocs/login_bloc/login_state.dart';
import 'package:passion_jewelry/utils/user_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  });

  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginInProgress();

      try {
        final token = await userRepository.authenticate(username: event.username, password: event.password,);
        authenticationBloc.add(AuthenticationLoggedIn(token: token));
        yield LoginInitial();
      } catch(error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
