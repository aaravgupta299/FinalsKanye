import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../baneofmyexistence/auth_provider.dart';
//half of the stuff here is really similar to my midterm login page so i wont comment everything
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState(); //standard stateful stuff
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  void _onSignIn() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 1)); //waits a second for everything to load

    final bool success =
        _emailController.text == 'jaydensbus@is.here' && //TODO: Email: jaydensbus@is.here
        _passwordController.text == 'jackis67'; //TODO: Password: jackis67
    if (success) {
      ref.read(authProvider.notifier).state = _emailController.text; //tells authprovidet to change state
    }

    if (mounted) {
      setState(() => _isLoading = false); //makes isloading false so it loads
      if (!success) { //wrong email/password
        ScaffoldMessenger.of(context).showSnackBar( //finally figured out how to make a snackbar
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text('Wrong email or password.'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Kanye Quotes',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 48),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                const SizedBox(height: 32),
                ElevatedButton( //seemed a little extra but for safety i made it so you cant spam/overload the login system
                  onPressed: _isLoading ? null : _onSignIn,
                  child: _isLoading
                      ? const SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(),
                        )
                      : const Text('Sign In'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
