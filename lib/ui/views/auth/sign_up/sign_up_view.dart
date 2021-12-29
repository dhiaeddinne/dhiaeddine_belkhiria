import 'package:dhiaeddine_belkhiria/app/globalization/globalizationManager.dart';
import 'package:dhiaeddine_belkhiria/app/shared_widgets/custom_button.dart';
import 'package:dhiaeddine_belkhiria/app/shared_widgets/custom_text.dart';
import 'package:dhiaeddine_belkhiria/app/shared_widgets/text_form_widget.dart';
import 'package:dhiaeddine_belkhiria/app/utils/colors.dart' as colors;
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
                          InkWell(
                            onTap: () {
                              model.navigateToLoginScreen(context: context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: CustomText(
                                text: GlobalizationManager.of(context)
                                    .getMessage("auth", "login"),
                                size: 18,
                                color: Colors.white,
                              ),
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
                                padding: const EdgeInsets.only(bottom: 10),
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
                      weight: FontWeight.bold,
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    firstNameField(signUpViewModel: model),
                    const SizedBox(
                      height: 20,
                    ),
                    nameField(signUpViewModel: model),
                    const SizedBox(
                      height: 20,
                    ),
                    emailField(signUpViewModel: model),
                    const SizedBox(
                      height: 20,
                    ),
                    passwordField(signUpViewModel: model),
                    const SizedBox(
                      height: 20,
                    ),
                    confirmPasswordField(signUpViewModel: model),
                    const SizedBox(
                      height: 9,
                    ),
                    termsAndConditions(signUpViewModel: model),
                    const SizedBox(
                      height: 20,
                    ),
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
      obscureText:signUpViewModel.obscurePassword ,
      suffixIcon: GestureDetector(
          onTap: () {
            signUpViewModel.changeObscurePassword();
          },
          child: signUpViewModel.obscurePassword
              ? const Icon(
                  Icons.visibility_off_outlined,
                  color: Colors.white38,
                  size: 16,
                )
              : SvgPicture.asset("assets/icons/show.svg",
                  height: 10, width: 16.1, fit: BoxFit.scaleDown)),
    );
  }

  Widget confirmPasswordField({required SignUpViewModel signUpViewModel}) {
    return CustomTextFormField(
      label: GlobalizationManager.of(context)
          .getMessage("auth", "confirm_password"),
      controller: signUpViewModel.confirmPasswordController,
      focusNode: signUpViewModel.confirmPasswordFocusNode,
      obscureText:signUpViewModel.obscureConfirmPassword ,
      suffixIcon: GestureDetector(
          onTap: () {
            signUpViewModel.changeObscureConfirmPassword();
          },
          child: signUpViewModel.obscureConfirmPassword
              ? const Icon(
                  Icons.visibility_off_outlined,
                  color: Colors.white38,
                  size: 16,
                )
              : SvgPicture.asset("assets/icons/show.svg",
                  height: 10, width: 16.1, fit: BoxFit.scaleDown)),
    );
  }

  Widget firstNameField({required SignUpViewModel signUpViewModel}) {
    return CustomTextFormField(
      label: GlobalizationManager.of(context).getMessage("auth", "first_name"),
      controller: signUpViewModel.firstNameController,
      focusNode: signUpViewModel.firstNameFocusNode,
      hintText:
          GlobalizationManager.of(context).getMessage("auth", "first_name"),
    );
  }

  Widget nameField({required SignUpViewModel signUpViewModel}) {
    return CustomTextFormField(
      label: GlobalizationManager.of(context).getMessage("auth", "name"),
      controller: signUpViewModel.nameController,
      focusNode: signUpViewModel.nameFocusNode,
      hintText: GlobalizationManager.of(context).getMessage("auth", "name"),
    );
  }

  Widget termsAndConditions({required SignUpViewModel signUpViewModel}) {
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Theme(
            data: ThemeData(
              unselectedWidgetColor: Colors.white38,
            ),
            child: Checkbox(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              checkColor: colors.primaryColor,
              activeColor: Colors.white,
              value: signUpViewModel.checkBoxValue,
              onChanged: (value) {
                signUpViewModel.changeCheckBoxValue();
              },
            ),
          ),
        ),
        const SizedBox(
          width: 9,
        ),
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                  text: GlobalizationManager.of(context)
                      .getMessage("auth", "agree_to"),
                  style: const TextStyle(color: Colors.white)),
              TextSpan(
                  text: GlobalizationManager.of(context)
                      .getMessage("auth", "terms_&_conditions"),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                  )),
            ],
          ),
        )
      ],
    );
  }

  Widget signUpButton({required SignUpViewModel signUpViewModel}) {
    return CustomButton(
        text: GlobalizationManager.of(context).getMessage("Button", "save"),
        btnColor: colors.mediumButtonColor,
        onTapFunction: () {
          signUpViewModel.navigateToHomeScreen(context: context);
        });
  }
}
