import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context), // Goes back
        ),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            width: 350,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                  ),
                  child: Column(
                    children: const [
                      Text(
                        'José Antunes',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'PAIGC ID: 0251348',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5EEDC),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Card(
                            color: const Color(0xFFF2E2B3),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
                              child: Column(
                                children: [
                                  Container(
                                    child: const Icon(
                                      Icons.star,
                                      size: 78,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      children: [
                                        Container(
                                          color: Colors.white,
                                          child: Icon(Icons.qr_code, size: 64),
                                        ),

                                        Text('Region: Bissau'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            children: [
                              Container(
                                width: 130,
                                height: 130,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(Icons.person, size: 60),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Region: Bissau',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 1, 88, 4),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Icon(
                                      Icons.emoji_events,
                                      color: Color.fromARGB(255, 255, 186, 24),
                                      size: 30,
                                    ), // Badge icon
                                    SizedBox(width: 6),
                                    Text(
                                      'TOP\nVOLUNTEER',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                          size: 50,
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          'ACTIVE\nMEMBER\n2023',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Divider(
                                    color: Colors.grey[300],
                                    thickness: 1,
                                  ),

                                  Text(
                                    'Activity',
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.chat_bubble,
                                        color: Colors.amber,
                                      ),
                                      SizedBox(width: 8),
                                      Text('Made a donation'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Card(
                                color: const Color.fromARGB(255, 255, 249, 231),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      SizedBox(height: 16),
                                      SizedBox(
                                        width: double.infinity,
                                        child: Text(
                                          'Activity',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                            size: 30,
                                          ),
                                          SizedBox(width: 8),
                                          Text('Made a\ndonation'),
                                        ],
                                      ),
                                      SizedBox(height: 15),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.campaign,
                                            color: Colors.green,
                                            size: 30,
                                          ),
                                          SizedBox(width: 8),
                                          Text('Participated\nin rally'),
                                        ],
                                      ),
                                      SizedBox(height: 15),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.share,
                                            color: Colors.orange,
                                            size: 30,
                                          ),
                                          SizedBox(width: 8),
                                          Text('Shared\nevent'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
