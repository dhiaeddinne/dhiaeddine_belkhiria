import 'package:dhiaeddine_belkhiria/app/shared_widgets/custom_navigation/slide_left_route.dart';
import 'package:dhiaeddine_belkhiria/ui/views/auth/login/login_view.dart';
import 'package:dhiaeddine_belkhiria/ui/views/startup/startup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';



class StartUpView extends StatefulWidget {
  @override
  _AuthViewState createState() => _AuthViewState();
}

class _AuthViewState extends State<StartUpView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartUpViewModel>.reactive(
      builder: (context,model,child) =>
          Scaffold(
            body: Center(child: Text(model.title),),
            floatingActionButton: FloatingActionButton(
              onPressed: (){
                Navigator.of(context)
                    .push(SlideLeftRoute(page: LoginView()));
              },
            ),
          ),
      viewModelBuilder: ()=> StartUpViewModel(),
    );
  }
}