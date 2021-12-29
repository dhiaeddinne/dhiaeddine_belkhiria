import 'package:dhiaeddine_belkhiria/app/globalization/globalizationManager.dart';
import 'package:dhiaeddine_belkhiria/app/shared_widgets/custom_button.dart';
import 'package:dhiaeddine_belkhiria/app/shared_widgets/custom_text.dart';
import 'package:dhiaeddine_belkhiria/app/shared_widgets/text_form_widget.dart';
import 'package:dhiaeddine_belkhiria/app/utils/colors.dart' as colors;
import 'package:dhiaeddine_belkhiria/ui/views/auth/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  /// I thought about creating a single auth page and use tab navigation between signIn and SignUp screens,
  /// but when I saw the video I decided to create different screen and use normal navigation as shown on the video


  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
          backgroundColor: colors.primaryColor,
          body: WillPopScope(
            onWillPop: (){
              return Future.value(false);
            },
            child: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(color: Colors.white38, width: 1))),
                        child: Row(
                          children: [
                            Container(
                              width: 60,
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.white, width: 2))),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: CustomText(
                                  text: GlobalizationManager.of(context)
                                      .getMessage("auth", "login"),
                                  size: 18,
                                  color: Colors.white,
                                  weight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10, left: 80),
                              child: InkWell(
                                onTap: (){
                                  model.navigateToSignUpScreen(context: context);
                                },
                                child: CustomText(
                                  text: GlobalizationManager.of(context)
                                      .getMessage("auth", "signup"),
                                  size: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),

                            // // const SizedBox(width: 50,),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      SvgPicture.asset(
                        "assets/icons/Login.svg",
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      CustomText(
                        text: GlobalizationManager.of(context)
                            .getMessage("auth", "login_to_your_account"),
                        size: 28,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 48,
                      ),
                      emailField(loginViewModel: model),
                      const SizedBox(
                        height: 20,
                      ),
                      passwordField(loginViewModel: model),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomText(
                            text: GlobalizationManager.of(context)
                                .getMessage("auth", "forget_password"),
                            color: Colors.white,
                            size: 15,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      loginButton(loginViewModel: model),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                            color: colors.dividerColor,
                            height: 1,
                          )),
                          Padding(
                            padding: const EdgeInsets.only(left: 18, right: 18),
                            child: CustomText(
                              text: "Or",
                              color: Colors.white,
                            ),
                          ),
                          Expanded(
                              child: Container(
                            color: colors.dividerColor,
                            height: 1,
                          ))
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      loginWithGoogleButton(loginViewModel: model),
                    ],
                  ),
                ),
              ),
            ),
          )),
      viewModelBuilder: () => LoginViewModel(),
    );
  }

  Widget emailField({required LoginViewModel loginViewModel}) {
    /// CustomTextFormField is a custom widget for the textFormField

    return CustomTextFormField(
      label: GlobalizationManager.of(context).getMessage("auth", "email"),
      controller: loginViewModel.emailController,
      focusNode: loginViewModel.emailFocusNode,
      hintText: "example@gmail.com",
    );
  }

  Widget passwordField({required LoginViewModel loginViewModel}) {
    return CustomTextFormField(
      label: GlobalizationManager.of(context).getMessage("auth", "password"),
      controller: loginViewModel.passwordController,
      focusNode: loginViewModel.passwordFocusNode,
      obscureText: loginViewModel.obscurePassword,
      suffixIcon: GestureDetector(
        onTap: () {
          loginViewModel.changeObscurePassword();
        },
        child: loginViewModel.obscurePassword
            ? const Icon(Icons.visibility_off_outlined, color: Colors.white38,size: 16,)
            : SvgPicture.asset("assets/icons/show.svg",
            height: 10, width: 16.1, fit: BoxFit.scaleDown)
      ),
    );
  }

  Widget loginButton({required LoginViewModel loginViewModel}) {
    return CustomButton(
        text: GlobalizationManager.of(context).getMessage("auth", "login"),
        btnColor: colors.buttonColor,
        onTapFunction: () {
          loginViewModel.navigateToHomeScreen(context: context);
        });
  }

  Widget loginWithGoogleButton({required LoginViewModel loginViewModel}) {
    return CustomIconButton(
      onTapFunction: () {},
      text: GlobalizationManager.of(context)
          .getMessage("auth", "login_with_google"),
      btnIcon: SvgPicture.asset(
        "assets/icons/google.svg",
      ),
      height: 55,
      btnColor: colors.lightButtonColor,
    );
  }
}
