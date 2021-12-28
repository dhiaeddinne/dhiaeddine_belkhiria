import 'package:dhiaeddine_belkhiria/ui/views/auth/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';



class AuthView extends StatefulWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  _AuthViewState createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
      builder: (context,model,child) =>
        Scaffold(
          body: Center(child: Text(model.title),),
        ),
      viewModelBuilder: ()=> AuthViewModel(),
    );
  }
}
