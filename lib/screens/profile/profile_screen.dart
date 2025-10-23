import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';
import '../../widgets/rtl_scaffold.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();

    return RtlScaffold(
      appBar: AppBar(title: const Text('الملف الشخصي')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('المستخدم'),
            subtitle: Text(auth.displayName ?? 'غير معروف'),
          ),
          ListTile(
            leading: const Icon(Icons.badge),
            title: const Text('المعرف'),
            subtitle: Text(auth.userId ?? '-'),
          ),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: auth.isLoggedIn ? auth.signOut : null,
            icon: const Icon(Icons.logout),
            label: const Text('تسجيل الخروج'),
          )
        ],
      ),
    );
  }
}
