import 'package:flutter/material.dart';
import 'package:wind_space_members/home_cards/home_card_size.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    void _login() {
      if (_formKey.currentState!.validate()) {
        String email = _emailController.text;
        String password = _passwordController.text;

        // ここに認証処理を追加
        print('Email: $email, Password: $password');
      }
    }

    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0), // ここで角を丸くする
        ),
        child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: CardSize().cardVerticalPaddingSize,
                horizontal: CardSize().cardHorizontalPaddingSize),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _login,
                  child: const Text('Login'),
                ),
              ],
            )));
  }
}
