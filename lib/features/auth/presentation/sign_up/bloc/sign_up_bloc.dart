
import 'dart:async';

import 'package:dentsu/features/auth/domain/params/sign_up_with_email_params.dart';
import 'package:dentsu/features/auth/domain/usecases/sign_up_with_email_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) {
      
    });
    on<SignUpWithEmailAndPasswordEvent>(_signUpWithEmailAndPassword);
  }

  FutureOr<void> _signUpWithEmailAndPassword(SignUpWithEmailAndPasswordEvent event, Emitter<SignUpState> emit) async{
    emit(SignUpLoading());
    final res = await SignUpWithEmailUsecase().call(SignUpWithEmailParams(email: event.email, password: event.password));
    
  }
}
