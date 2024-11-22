import 'package:flutter/material.dart';
import 'package:class_v1111/Main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              // Logo
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MainPage())
                      );

                    },
                    child: Image.asset(
                      'assets/images/carblre.png', // Replace with your logo path
                      height: 60,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              // Tabs for Login Type
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    '일반 로그인',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 20),
                  Text(
                    '변호사 로그인',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              // Login Form
              TextFormField(
                decoration: InputDecoration(
                  hintText: '아이디 입력',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: '비밀번호 입력',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              const SizedBox(height: 20),
              // Login Button
              ElevatedButton(
                onPressed: () {
                  // Login action
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const Text('로그인'),
              ),
              const SizedBox(height: 10),
              // Links
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      // Find ID action
                    },
                    child: const Text('아이디찾기'),
                  ),
                  const Text('|'),
                  TextButton(
                    onPressed: () {
                      // Find Password action
                    },
                    child: const Text('패스워드 찾기'),
                  ),
                  const Text('|'),
                  TextButton(
                    onPressed: () {
                      // Sign-up action
                    },
                    child: const Text('가입하기'),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              // Social Login
              const Text(
                '소셜 로그인',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      // Kakao login
                    },
                    icon: Image.asset('assets/images/kakao_logo.png'),
                    iconSize: 50,
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    onPressed: () {
                      // Naver login
                    },
                    icon: Image.asset('assets/images/naver_logo.png'),
                    iconSize: 50,
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    onPressed: () {
                      // Google login
                    },
                    icon: Image.asset('assets/images/google_logo.png'),
                    iconSize: 50,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Floating "TOP" button
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    // Scroll to top
                  },
                  child: const Icon(Icons.arrow_upward),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}