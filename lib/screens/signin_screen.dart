import 'package:flutter/material.dart';
import 'package:vierzieskincare/main.dart';
import 'package:vierzieskincare/screens/signup_screen.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;
    // Lakukan validasi atau proses login di sini

    // Contoh validasi sederhana. Ganti dengan logika login yang sesuai
    if (username == 'admin' && password == 'admin') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MainScreen(),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Login Failed'),
          content: Text('Invalid username or password.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage('assets/images/logo.png')),
            SizedBox(height: 10.0),
            Text(
              'LOGIN',
              style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 202, 214, 240)),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            Text(
              'Sign in to your account',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 16.0),
            TextButton(
              onPressed: () {},
              child: Align(
                alignment: Alignment.centerRight,
                child: Text('Forgot Password?'),
              ),
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: _login,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF4C58A5), // Background color
                padding: EdgeInsets.symmetric(vertical: 12.0), // Padding
              ),
              child: Text('Login',
                  style: TextStyle(fontSize: 16.0, color: Colors.white)),
            ),
            SizedBox(height: 32.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account? '),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignupScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Sign Up',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
