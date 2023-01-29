import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/resources/components/app_text.dart';
import 'package:mvvm/resources/components/round_button.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_models/auth_view_model.dart';
import 'package:provider/provider.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  ValueNotifier<bool> _obsecurePassword = ValueNotifier(true);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    _obsecurePassword.dispose();
  }

  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;

    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Sign Up'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              focusNode: emailFocusNode,
              keyboardType: TextInputType.emailAddress,
              onFieldSubmitted: (value) {
                Utils.fieldFocusChange(
                    context, emailFocusNode, passwordFocusNode);
              },
              decoration: InputDecoration(
                hintText: 'Email',
                labelText: 'Email',
                prefixIcon: Icon(
                  Icons.alternate_email,
                ),
              ),
            ),
            ValueListenableBuilder(
                valueListenable: _obsecurePassword,
                builder: (context, value, child) {
                  return TextFormField(
                    focusNode: passwordFocusNode,
                    controller: _passwordController,
                    obscureText: _obsecurePassword.value,
                    keyboardType: TextInputType.visiblePassword,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock_outline_rounded),
                      suffix: InkWell(
                          onTap: () {
                            _obsecurePassword.value = !_obsecurePassword.value;
                          },
                          child: _obsecurePassword.value
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility)),
                    ),
                  );
                }),
            SizedBox(height: height * .1),
            RaoundButton(
              title: 'Sign Up',
              loading: authViewModel.signUpLoading,
              onPressed: () {
                if (_emailController.text.isEmpty ||
                    _emailController.text == null) {
                  Utils.flashBarErrorMessage(
                      'Email Not Found', "Please Enter Email", context);
                } else if (_passwordController.text.isEmpty ||
                    _passwordController.text == null) {
                  Utils.flashBarErrorMessage(
                      "Null Password ", 'Please Enter Password', context);
                } else if (_passwordController.text.length < 7) {
                  Utils.flashBarErrorMessage('Password Short',
                      'Please Enter at least 7 digits ', context);
                } else {
                  Map data = {
                    "email": _emailController.text.toString(),
                    "password": _passwordController.text.toString()
                  };
                  authViewModel.signUpApi(data, context);

                  print('API Hit');
                }
              },
            ),
            // SizedBox(height: height * 0.5),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: AppText(
                title: 'Already have an account? Signin',
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
