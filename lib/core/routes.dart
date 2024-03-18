import 'package:dentsu/core/models/lead_model.dart';
import 'package:dentsu/features/auth/presentation/sign_in/bloc/sign_in_bloc.dart';
import 'package:dentsu/features/auth/presentation/sign_in/sign_in_screen.dart';
import 'package:dentsu/features/auth/presentation/sign_up/bloc/sign_up_bloc.dart';
import 'package:dentsu/features/auth/presentation/sign_up/sign_up_screen.dart';
import 'package:dentsu/features/bottom_nav_holder/presentation/bloc/bottom_nav_holder_bloc.dart';
import 'package:dentsu/features/bottom_nav_holder/presentation/bottom_nav_holder_screen.dart';
import 'package:dentsu/features/home/presentation/lead_details/lead_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SignInScreen.routeName:
        return _registerBlocView(
          view: const SignInScreen(),
          bloc: SignInBloc(),
          settings: settings,
        );

      case SignUpScreen.routeName:
        return _registerBlocView(
          view: const SignUpScreen(),
          bloc: SignUpBloc(),
          settings: settings,
        );
      case BottomNavigationHolder.routeName:
        return _registerBlocView(
            view: const BottomNavigationHolder(),
            bloc: BottomNavHolderBloc(),
            settings: settings);

      case LeadDetailsScreen.routeName:
        final args = settings.arguments as Lead;
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => LeadDetailsScreen(
            lead: args,
          ),
        );

      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }

  static MaterialPageRoute _registerBlocView<T extends Bloc>({
    required Widget view,
    required T bloc,
    required RouteSettings settings,
  }) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => BlocProvider<T>(
        create: (context) => bloc,
        child: view,
      ),
    );
  }
}
