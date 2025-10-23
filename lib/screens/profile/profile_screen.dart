import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/user_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
    return Scaffold(
      appBar: AppBar(title: const Text('الحساب الشخصي')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (user != null) ...[
              Text('المعرف: ${user.uid}'),
              if (user.email != null) Text('البريد: ${user.email}'),
              const SizedBox(height: 16),
            ],
            ElevatedButton(
              onPressed: () async {
                await context.read<UserProvider>().signOut();
                if (context.mounted) Navigator.pop(context);
              },
              child: const Text('تسجيل الخروج'),
            ),
          ],
        ),
      ),
    );
  }
}
