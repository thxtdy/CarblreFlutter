import 'package:class_v1111/screen/LaywerDetailPage.dart';
import 'package:class_v1111/screen/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:class_v1111/screen/login.dart';
import 'package:class_v1111/screen/board.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double _scrollPosition = 0.0;

  // List of lawyer data
  final List<Map<String, String>> lawyerList = [
    {
      'name': '강호석',
      'age': '35',
      'career': '(現)서울특별시 강남구 농지위원회 위원장(2022~현재)\n'
          '(現)서울송파경찰서 선도심사위원회 위원(2023~현재)\n',
      'image': 'assets/images/KangHoSeok-preview.png', // Replace with your image path
    },
    {
      'name': '고승우',
      'age': '42',
      'career': '동반성장위원회 자문 및 청문위원\n'
          '서울중앙지방법원 민사조정 위원',
      'image': 'assets/images/GoseungWoo-preview.png', // Replace with your image path
    },
    {
      'name': '유진영',
      'age': '32',
      'career': '서울특별시 재난예방 및 건설업분야 자문단 자문위원\n'
          '국토교통부 행정처분 심의위원\n'
          '원광대학교 법학전문대학원 2017, 2018년도 입시 면접평가 위원',
      'image': 'assets/images/Youjinyeong-preview.png', // Replace with your image path
    },
    {
      'name': '차성원',
      'age': '37',
      'career': '現 더클리닉 신라 등 다수의 고정자문 수행\n'
          '現 로얄컨설팅 주식회사 대표이사\n'
          '現 영풍제지 주식회사 비상근감사\n',
      'image': 'assets/images/Chaseongwon-preview.png', // Replace with your image path
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollUpdateNotification) {
            setState(() {
              _scrollPosition = scrollNotification.metrics.pixels;
            });
          }
          return true;
        },
        child: Stack(
          children: [
            // Background image with gradual fade
            Positioned.fill(
              child: Opacity(
                opacity: (1 - (_scrollPosition / 600)).clamp(0.0, 1.0),
                child: Image.asset(
                  'assets/images/background.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Transparent overlay
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(
                    (1 - (_scrollPosition / 600)).clamp(0.0, 0.5)),
              ),
            ),
            // Scrollable content
            SingleChildScrollView(
              child: Column(
                children: [
                  // Initial Content
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Opacity(
                            opacity: (1 - (_scrollPosition / 600)).clamp(0.0, 1.0),
                            child: Text(
                              '당신은 피해자입니까?\n가해자입니까?',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BoardPage()),
                              );
                            },
                            child: const Text('자세히 알아보기'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Lawyer list section
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: lawyerList.length,
                      itemBuilder: (context, index) {
                        final lawyer = lawyerList[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LawyerDetailPage(
                                  name: lawyer['name']!,
                                  age: lawyer['age']!,
                                  career: lawyer['career']!,
                                  image: lawyer['image']!,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 5,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                // Lawyer image
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Container(
                                    width: 150,
                                    height: 150,
                                    color: Colors.grey[200],
                                    child: Image.asset(
                                      lawyer['image']!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                // Lawyer information
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        lawyer['name']!,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        '나이: ${lawyer['age']}',
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        lawyer['career']!,
                                        style: const TextStyle(fontSize: 10),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            // Top Bar
            Positioned(
              top: -10,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset('assets/images/carblre.png'),
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LoginPage()),
                            );
                          },
                          child: Text(
                            '로그인',
                            style: TextStyle(
                                color: _scrollPosition > 200
                                    ? Colors.black
                                    : Colors.white),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignUpPage()),
                            );
                          },
                          child: Text(
                            '회원가입',
                            style: TextStyle(
                                color: _scrollPosition > 200
                                    ? Colors.black
                                    : Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}