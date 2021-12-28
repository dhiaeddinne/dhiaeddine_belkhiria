import 'package:dhiaeddine_belkhiria/app/globalization/globalizationManager.dart';
import 'package:dhiaeddine_belkhiria/app/shared_widgets/custom_button.dart';
import 'package:dhiaeddine_belkhiria/app/shared_widgets/custom_text.dart';
import 'package:dhiaeddine_belkhiria/app/shared_widgets/text_form_widget.dart';
import 'package:dhiaeddine_belkhiria/app/utils/form_utils.dart';
import 'package:dhiaeddine_belkhiria/app/utils/colors.dart' as colors;
import 'package:dhiaeddine_belkhiria/app/validators/emailValidator.dart';
import 'package:dhiaeddine_belkhiria/ui/views/auth/sign_up/sign_up_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
          backgroundColor: colors.secondaryColor,
          body: SafeArea(
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
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: CustomText(
                              text: GlobalizationManager.of(context)
                                  .getMessage("auth", "login"),
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 90),
                            child: Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.white, width: 2))),
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: CustomText(
                                  text: GlobalizationManager.of(context)
                                      .getMessage("auth", "signup"),
                                  size: 18,
                                  color: Colors.white,
                                ),
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
                      "assets/icons/Signup.svg",
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    CustomText(
                      text: GlobalizationManager.of(context)
                          .getMessage("auth", "create_account"),
                      size: 28,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    emailField(signUpViewModel: model),
                    const SizedBox(
                      height: 20,
                    ),
                    passwordField(signUpViewModel: model),
                    signUpButton(signUpViewModel: model),
                    const SizedBox(
                      height: 48,
                    ),
                  ],
                ),
              ),
            ),
          )),
      viewModelBuilder: () => SignUpViewModel(),
    );
  }

  Widget emailField({required SignUpViewModel signUpViewModel}) {
    return CustomTextFormField(
      label: GlobalizationManager.of(context).getMessage("auth", "email"),
      controller: signUpViewModel.emailController,
      focusNode: signUpViewModel.emailFocusNode,
      hintText: "example@gmail.com",
    );
  }

  Widget passwordField({required SignUpViewModel signUpViewModel}) {
    return CustomTextFormField(
      label: GlobalizationManager.of(context).getMessage("auth", "password"),
      controller: signUpViewModel.passwordController,
      focusNode: signUpViewModel.passwordFocusNode,
      suffixIcon: GestureDetector(
        onTap: () {
          signUpViewModel.changeObscurePassword();
        },
        child: signUpViewModel.obscurePassword
            ? const Icon(
          Icons.visibility_off,
          color: Colors.white38,
        )
            : const Icon(Icons.visibility, color: Colors.white38),
      ),
    );
  }

  Widget signUpButton({required SignUpViewModel signUpViewModel}) {
    return CustomButton(
        text: GlobalizationManager.of(context).getMessage("Button", "save"),
        btnColor: colors.mediumButtonColor,
        onTapFunction: () {});
  }

}
