import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _name = '';
  String _email = '';

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('name') ?? 'No Name';
      _email = prefs.getString('email') ?? 'No Email';
    });
  }

  Future<void> _logout() async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(radius: 50, backgroundColor: Colors.blue, child: const Icon(Icons.person, size: 50, color: Colors.white)),
            const SizedBox(height: 20),
            Text('Name: $_name', style: const TextStyle(fontSize: 18)),
            Text('Email: $_email', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _logout, child: const Text('Logout')),
          ],
        ),
      ),
    );
  }
}
