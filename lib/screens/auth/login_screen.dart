import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/app_routes.dart';
import '../../providers/user_provider.dart';
import '../../widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('تسجيل الدخول')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(hintText: 'البريد الإلكتروني'),
                validator: (v) => (v == null || v.isEmpty) ? 'مطلوب' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(hintText: 'كلمة المرور'),
                obscureText: true,
                validator: (v) => (v == null || v.length < 6)
                    ? 'كلمة المرور قصيرة'
                    : null,
              ),
              const SizedBox(height: 16),
              if (userProvider.error != null)
                Text(userProvider.error!, style: const TextStyle(color: Colors.red)),
              const SizedBox(height: 8),
              CustomButton(
                label: userProvider.isLoading ? '...جارٍ' : 'دخول',
                onPressed: userProvider.isLoading
                    ? null
                    : () async {
                        if (_formKey.currentState?.validate() ?? false) {
                          await context.read<UserProvider>().signIn(
                                _emailController.text,
                                _passwordController.text,
                              );
                          if (mounted && context.read<UserProvider>().isAuthenticated) {
                            Navigator.pushReplacementNamed(context, AppRoutes.home);
                          }
                        }
                      },
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, AppRoutes.signup),
                child: const Text('إنشاء حساب جديد'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
