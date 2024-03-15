import 'dart:async';

import 'package:dentsu/core/locator.dart';
import 'package:dentsu/features/auth/domain/params/sign_up_with_email_params.dart';
import 'package:dentsu/features/auth/domain/usecases/sign_up_with_email_usecase.dart';
import 'package:dentsu/features/bottom_nav_holder/presentation/bottom_nav_holder_screen.dart';
import 'package:dentsu/services/dialog_and_sheet_service/dialog_and_sheet_service.dart';
import 'package:dentsu/services/navigation_service/i_navigation_service.dart';
import 'package:dentsu/utils/dialogs/error_dialog.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) {});
    on<SignUpWithEmailAndPasswordEvent>(_signUpWithEmailAndPassword);
  }

  final _dialogService = locator<DialogAndSheetService>();
  final _navigation = locator<NavigationService>();

  FutureOr<void> _signUpWithEmailAndPassword(
      SignUpWithEmailAndPasswordEvent event, Emitter<SignUpState> emit) async {
    emit(SignUpLoading());
    final res = await SignUpWithEmailUsecase().call(
        SignUpWithEmailParams(email: event.email, password: event.password));

    res.fold((l) {
      emit(SignUpInitial());
      _dialogService.showAppDialog(ErrorDialog(message: l.message));
    }, (r) {
      emit(SignUpInitial());
      _navigation.navigateToNamed(BottomNavigationHolder.routeName);
    });
  }
}
