import 'package:flutter/material.dart';
import 'package:vierzieskincare/screens/signin_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isSignedIn = false;
  String Email = 'admin@gmail.com';
  String userName = 'admin';
  String password = '*****';

  void signIn(String Email, String username, String password) {
    setState(() {
      isSignedIn = true;
      userName = username;
      this.password = password;
    });
  }

  void SignOut() {
    setState(() {
      isSignedIn = true;
      userName = '';
      password = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Color(0xFFCAD6F0),
        title: Text(
          'VIERZIE SKINCARE',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 26.0,
            shadows: [
              Shadow(
                blurRadius: 10.0,
                color: Colors.black,
                offset: Offset(2.0, 2.0),
              ),
            ],
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(10.0),
          child: Text(
            'Nourish, Hydrate, and Shine!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontStyle: FontStyle.italic,
              shadows: [
                Shadow(
                  blurRadius: 5.0,
                  color: Colors.black,
                  offset: Offset(1.0, 1.0),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: const Color(0xffCAD6F0),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 150),
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                                shape: BoxShape.circle),
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(
                                  'assets/images/placeholder_image.png'),
                            ),
                          ),
                          if (isSignedIn)
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.camera_alt),
                              color: Colors.white,
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Divider(
                    color: Colors.indigoAccent[100],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: const Row(
                          children: [
                            Icon(
                              Icons.person,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Email',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          child: Text(
                        ': $Email',
                        style: TextStyle(fontSize: 18),
                      )),
                      if (isSignedIn) Icon(Icons.edit),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Divider(
                    color: Colors.indigoAccent[100],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: const Row(
                          children: [
                            Icon(
                              Icons.lock,
                              color: Colors.amber,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Username',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Text(
                          ': $userName',
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Divider(
                    color: Colors.indigoAccent[100],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: const Row(
                          children: [
                            Icon(
                              Icons.lock,
                              color: Colors.amber,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Password',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Text(
                          ': $password',
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Divider(
                    color: Colors.indigoAccent[100],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  isSignedIn
                      ? TextButton(
                          onPressed: SignOut, child: const Text('Sign Out'))
                      : TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignInScreen(),
                              ),
                            );
                          },
                          child: const Text('Sign Out'))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
