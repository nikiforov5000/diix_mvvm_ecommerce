import 'package:diix_mvvm_ecommerce/viewmodels/auth_viewmodel.dart';
import 'package:diix_mvvm_ecommerce/views/widgets/login_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authModelView = context.watch<AuthViewModel>();
    _emailController.text = 'default@email.com';
    _passwordController.text = '123456';
    return Scaffold(
      body: Builder(
        builder: (context) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              LoginTextField(
                controller: _emailController,
                label: 'Email',
              ),
              const SizedBox(height: 8.0),
              LoginTextField(
                isPassword: true,
                controller: _passwordController,
                label: 'Password',
              ),
              const SizedBox(height: 24.0),
              TextButton(
                onPressed: () => authModelView.login(_emailController.text, _passwordController.text),
                child: Text('Login'),
              ),
              const SizedBox(height: 8.0),
              const SizedBox(height: 8.0),
            ],
          ),
        ),
      ),
    );
  }
}


