import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:manage_project_1/screens/login_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/images/profile.png"),
            ),
            const SizedBox(height: 10),
            const Text(
              "John Doe",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text(
              "johndoe@email.com",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),
            AccountOption(
              title: "Edit Profile",
              icon: Icons.edit,
              onTap: () {},
            ),
            AccountOption(
              title: "Settings",
              icon: Icons.settings,
              onTap: () {},
            ),
            AccountOption(
              title: "Logout",
              icon: Icons.logout,
              onTap: () async {
                // Đổi từ onPressed thành onTap
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                  // ignore: use_build_context_synchronously
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AccountOption extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const AccountOption({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: Colors.black),
        title: Text(title, style: const TextStyle(fontSize: 16)),
        onTap: onTap,
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}
