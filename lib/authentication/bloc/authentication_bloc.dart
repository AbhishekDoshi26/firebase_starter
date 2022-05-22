import 'package:bloc/bloc.dart';
import 'package:auth_service/auth.dart';
import 'package:realtime_database/realtime_database.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required AuthService authService,
  })  : _authService = authService,
        super(AuthenticationInitial()) {
    on<LoginWithEmailAndPasswordEvent>(_mapLoginWithEmailAndPasswordEvent);
    on<CreateAccountEvent>(_mapCreateAccountEvent);
  }

  final AuthService _authService;

  Future<void> _mapLoginWithEmailAndPasswordEvent(
    LoginWithEmailAndPasswordEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      await _authService.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      final _name =
          await RealtimeDatabase.read(userId: _authService.getCurrentUserId());
      emit(SuccessState(name: _name));
    } catch (e) {
      emit(
        ErrorState(
          message: e.toString(),
        ),
      );
    }
  }

  Future<void> _mapCreateAccountEvent(
    CreateAccountEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      await _authService.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      RealtimeDatabase.write(
        userId: _authService.getCurrentUserId(),
        data: {
          'name': event.name,
          'email': event.email,
        },
      );
      emit(SuccessState(name: event.name));
    } catch (e) {
      emit(
        ErrorState(
          message: e.toString(),
        ),
      );
    }
  }
}
