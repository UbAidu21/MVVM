import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view_models/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final userPreferences = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: (){
              userPreferences.removeUser().then((value){
                Navigator.pushReplacementNamed(context, RoutesName.login);
              });
            },
            child: Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              'Home Screen',
              style: TextStyle(fontSize: 40),
            ),
          )
        ],
      ),
    );
  }
}
