import 'package:flutter/material.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TeamMemberCard(name: "John Doe", role: "Project Manager"),
            TeamMemberCard(name: "Alice Smith", role: "UI/UX Designer"),
            TeamMemberCard(name: "Michael Brown", role: "Backend Developer"),
            TeamMemberCard(name: "Emily Davis", role: "Frontend Developer"),
          ],
        ),
      ),
    );
  }
}

class TeamMemberCard extends StatelessWidget {
  final String name;
  final String role;

  const TeamMemberCard({super.key, required this.name, required this.role});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundImage: AssetImage("assets/images/profile.png"),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(role, style: const TextStyle(color: Colors.grey)),
      ),
    );
  }
}
