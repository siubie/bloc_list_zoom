import 'package:bloc/bloc.dart';
import 'package:bloc_list_zoom/login/model/login_request.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginStarted>((event, emit) async {
      // TODO: implement event handler
      emit(LoginLoading());
      await Future.delayed(Duration(seconds: 2));
      if (event.email == 'admin' && event.password == 'admin') {
        emit(LoginSuccess());
      } else {
        emit(LoginFailed());
      }
    });
  }
}
