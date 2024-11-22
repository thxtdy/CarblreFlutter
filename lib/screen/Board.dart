import 'package:flutter/material.dart';

class BoardPage extends StatelessWidget {
  List<Map<String, String>> posts = [
    {
      'title': '주차되어있던 제 차량을 다른 차가 들이박았어요',
      'content': '어제 저녁에 주차장에서 벌어진 사고가 있었어요.\n\n'
                 '차를 대놨는데 상대 비엠이 후진을 하다가 범퍼 쪽을 살짝 박았거든요?'
                 '제가 생각해도 전 잘못 없는 것 같은데 그냥 보험 처리하면 되겠죠?',
      'writer': '작성자: 박태현',
    },
    {
      'title': '좌회전 도중에 우측 도로에서 직진하던 차량과 부딪혔어요...',
      'content': '좌회전 시 우선권에 대해 궁금합니다...',
      'writer': '작성자: 배병호',
    },
    {
      'title': '신호등이 있는 길 우회전 중 보행자 신호가 초록색이라 대기 중..',
      'content': '보행자와의 사고를 방지하려면 어떻게 해야 할까요?',
      'writer': '작성자: 김명기',
    },
    {
      'title': '과속 차량이 칼치기를 하다가 옆 차선에 있던 제 차와...',
      'content': '고속도로에서 발생한 위험한 상황에 대해...',
      'writer': '작성자: 유형정',
    },
    {
      'title': '주차를 하던 도중에 길에서 아이가 튀어나와서 ...',
      'content': '예방 방법이나 보험 처리 절차에 대해 알고 싶습니다.',
      'writer': '작성자: 김도아',
    },
    {
      'title': '제 사연 좀 봐주실 분 ㅠㅠ 어제 저녁에 운전...',
      'content': '억울한 상황이라 의견을 듣고 싶습니다.',
      'writer': '작성자: 석지웅',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('게시글'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 2.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(0),
                    title: Text(
                      posts[index]['title']!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          posts[index]['content']!,
                          style: TextStyle(color: Colors.grey),
                          maxLines: 1, // Display only one line of content
                          overflow: TextOverflow.ellipsis, // Add ellipsis for truncated text
                        ),
                        SizedBox(height: 16.0),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            posts[index]['writer']!,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PostDetailPage(
                            title: posts[index]['title']!,
                            content: posts[index]['content']!,
                            writer: posts[index]['writer']!,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class PostDetailPage extends StatelessWidget {
  final String title;
  final String content;
  final String writer;

  final List<Map<String, String>> comments = [
    {
      'author': '김남철',
      'comment': '그거 무조건 가해 차량이 100임. 걱정 ㄴㄴ',
    },
    {
      'author': '변영준',
      'comment': '보험 처리하시고 윗분 말씀대로 그냥 님 잘못한거 없음',
    },
    {
      'author': '김동윤',
      'comment': '근데 주차를 이상하게 쳐 해놨으면 또 모르는거 아님?ㅋㅋㅋ',
    },
  ];

  PostDetailPage({
    required this.title,
    required this.content,
    required this.writer,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 8.0),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                writer,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200.0, // Adjust the height for content
                      child: Text(
                        content,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    Text(
                      '댓글',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(height: 8.0),
                    TextField(
                      decoration: InputDecoration(
                        hintText: '댓글을 입력하세요...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    ElevatedButton(
                      onPressed: () {
                        // Handle comment submission
                      },
                      child: Text('댓글 작성'),
                    ),
                    SizedBox(height: 16.0),
                    Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    Column(
                      children: comments.map((comment) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 16.0,
                                child: Text(comment['author']![0]),
                              ),
                              SizedBox(width: 8.0),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      comment['author']!,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(height: 4.0),
                                    Text(
                                      comment['comment']!,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
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