import 'dart:async';

import 'package:dentsu/core/locator.dart';
import 'package:dentsu/core/usecase.dart';
import 'package:dentsu/features/auth/domain/usecases/check_auth_status_usecase.dart';
import 'package:dentsu/features/auth/presentation/sign_in/sign_in_screen.dart';
import 'package:dentsu/features/bottom_nav_holder/presentation/bottom_nav_holder_screen.dart';
import 'package:dentsu/services/navigation_service/i_navigation_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashEvent>((event, emit) {});
    on<SplashInitEvent>(_splashInit);
  }

  final _navigation = locator<NavigationService>();

  FutureOr<void> _splashInit(
      SplashInitEvent event, Emitter<SplashState> emit) async {
    await Future.delayed(const Duration(seconds: 2), () {});
    var res = await CheckAuthStatusUseCase().call(NoParams());

    res.fold((l) {
      Logger().e(l);
    }, (r) {
      if (r == null) {
        _navigation.navigateToOffAllNamed(
            SignInScreen.routeName, (p0) => false);
      } else {
        _navigation.navigateToOffAllNamed(
            BottomNavigationHolder.routeName, (p0) => false);
      }
    });
  }
}
