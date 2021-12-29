import 'package:dhiaeddine_belkhiria/app/shared_widgets/custom_navigation/slide_left_route.dart';
import 'package:dhiaeddine_belkhiria/ui/views/auth/sign_up/sign_up_view.dart';
import 'package:dhiaeddine_belkhiria/ui/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
  bool _obscurePassword = true;

  bool get obscurePassword => _obscurePassword;

  /// focus Node
  final FocusNode _emailFocusNode = FocusNode();

  FocusNode get emailFocusNode => _emailFocusNode;

  final FocusNode _passwordFocusNode = FocusNode();

  FocusNode get passwordFocusNode => _passwordFocusNode;

  /// TextEditingController
  final TextEditingController _emailController = TextEditingController();

  TextEditingController get emailController => _emailController;

  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get passwordController => _passwordController;

  void changeObscurePassword() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  void navigateToSignUpScreen({required BuildContext context}) {
    Navigator.of(context).push(SlideLeftRoute(page: SignUpView()));
  }

  void navigateToHomeScreen({required BuildContext context}) {
    Navigator.of(context).push(SlideLeftRoute(page: HomeView()));
  }
}
