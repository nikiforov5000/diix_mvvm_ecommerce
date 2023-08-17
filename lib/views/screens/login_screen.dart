import 'package:diix_mvvm_ecommerce/viewmodels/auth_viewmodel.dart';
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

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool? isPassword;

  const LoginTextField({
    required this.label,
    required this.controller,
    this.isPassword,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: TextField(
          obscureText: isPassword ?? false,
          controller: controller,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: label,
          ),
        ),
      ),
    );
  }
}
