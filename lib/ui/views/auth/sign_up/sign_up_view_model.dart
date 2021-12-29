import 'package:dhiaeddine_belkhiria/app/shared_widgets/custom_navigation/slide_left_route.dart';
import 'package:dhiaeddine_belkhiria/ui/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:dhiaeddine_belkhiria/app/utils/router.dart' as route;

class SignUpViewModel extends BaseViewModel {
  final String _title = 'LoginViewModel';
  String get title => _title;
  bool _obscurePassword = true;
  bool get obscurePassword => _obscurePassword;

  bool _obscureConfirmPassword = true;
  bool get obscureConfirmPassword => _obscureConfirmPassword;

  bool _checkBoxValue = false;
  bool get checkBoxValue => _checkBoxValue;

  final FocusNode _firstNameFocusNode = FocusNode();
  FocusNode get firstNameFocusNode => _firstNameFocusNode;

  final FocusNode _nameFocusNode = FocusNode();
  FocusNode get nameFocusNode => _nameFocusNode;

  final FocusNode _emailFocusNode = FocusNode();
  FocusNode get emailFocusNode => _emailFocusNode;
  
  final FocusNode _passwordFocusNode = FocusNode();
  FocusNode get passwordFocusNode => _passwordFocusNode;

  final FocusNode _confirmPasswordFocusNode = FocusNode();
  FocusNode get confirmPasswordFocusNode => _confirmPasswordFocusNode;

  /// controllers
  final TextEditingController _firstNameController = TextEditingController();
  TextEditingController get firstNameController => _firstNameController;

  final TextEditingController _nameController = TextEditingController();
  TextEditingController get nameController => _nameController;

  final TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;

  final TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;

  final TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController get confirmPasswordController => _confirmPasswordController;

  void changeObscurePassword() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  void changeObscureConfirmPassword() {
    _obscureConfirmPassword = !_obscureConfirmPassword;
    notifyListeners();
  }

  void changeCheckBoxValue() {
    _checkBoxValue = !_checkBoxValue;
    notifyListeners();
  }

  void navigateToLoginScreen({required BuildContext context}){
    Navigator.of(context)
        .pushNamedAndRemoveUntil(route.loginScreenRoute, (route) => false);
  }

  void navigateToHomeScreen({required BuildContext context}) {
    Navigator.of(context).push(SlideLeftRoute(page: HomeView()));
  }
}