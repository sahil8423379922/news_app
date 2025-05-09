import 'package:flutter/material.dart';
import 'package:news_app/screens/news_section/groupcard.dart';
import 'package:news_app/screens/news_section/newsSection.dart';

class PaigcHeader extends StatelessWidget {
  const PaigcHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: const EdgeInsets.all(10),
        color: const Color(0xFFFFF8F0), // Light beige background
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row: Logo, Title, Offline Badge
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // Replace with your actual asset path
                    Image.asset('assets/logo.png', width: 40, height: 40),
                    const SizedBox(width: 8),
                    const Text(
                      'PAIGC Connect',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.cloud_off, size: 16, color: Colors.brown),
                      SizedBox(width: 4),
                      Text('Offline', style: TextStyle(color: Colors.brown)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Search + Button Row
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.search, color: Colors.grey),
                        SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Procurar Grupos',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  icon: const Icon(Icons.group_add, color: Colors.white),
                  label: const Text(
                    'Criar Comunidade',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            CommunityGrid(),
            GroupCardUI(),
          ],
        ),
      ),
    );
  }
}
