import 'dart:async';

import 'package:dentsu/core/locator.dart';
import 'package:dentsu/features/auth/domain/params/sign_in_with_email_params.dart';
import 'package:dentsu/features/auth/domain/usecases/sign_in_with_email_usecase.dart';
import 'package:dentsu/features/auth/presentation/sign_up/sign_up_screen.dart';
import 'package:dentsu/features/bottom_nav_holder/presentation/bottom_nav_holder_screen.dart';
import 'package:dentsu/services/dialog_and_sheet_service/dialog_and_sheet_service.dart';
import 'package:dentsu/services/navigation_service/i_navigation_service.dart';
import 'package:dentsu/utils/dialogs/error_dialog.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<SignInEvent>((event, emit) {});
    on<DontHaveAnAccountEvent>(_dontHaveAnAccount);
    on<KeepMeLoggedInToogleEvent>(_keepMeLoggedInToogle);
    on<SignInWithEmailAndPasswordEvent>(_signInWithEmailAndPassword);
  }

  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogAndSheetService>();

  FutureOr<void> _dontHaveAnAccount(
      DontHaveAnAccountEvent event, Emitter<SignInState> emit) {
    _navigationService.navigateToNamed(SignUpScreen.routeName);
  }

  FutureOr<void> _keepMeLoggedInToogle(
      KeepMeLoggedInToogleEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(keepMeLoggedIn: event.keepMeLoggedIn));
  }

  FutureOr<void> _signInWithEmailAndPassword(
      SignInWithEmailAndPasswordEvent event, Emitter<SignInState> emit) async {
    emit(SignInLoading());

    final res = await SignInWithEmailUseCase().call(
        SignInWithEmailParams(email: event.email, password: event.password));

    res.fold((l) {
      emit(SignInInitial());
      _dialogService.showAppDialog(ErrorDialog(message: l.message));
    }, (r) {
      emit(SignInInitial());
      _navigationService.navigateToNamed(BottomNavigationHolder.routeName);
    });
  }
}
