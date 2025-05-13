import 'package:flutter/material.dart';

class LoadArticle extends StatefulWidget {
  final Map<String, dynamic> community;

  const LoadArticle({super.key, required this.community});

  @override
  State<LoadArticle> createState() => _LoadArticleState();
}

class _LoadArticleState extends State<LoadArticle> {
  @override
  Widget build(BuildContext context) {
    final community = widget.community;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          community['title'] ?? 'Comunidade',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image banner
            if (community['image'] != null)
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: Image.asset(
                  community['image'],
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.cover,
                ),
              ),

            const SizedBox(height: 20),

            // Title & Subtitle
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                community['title'] ?? '',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Text(
                community['subtitle'] ?? '',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
            ),

            const SizedBox(height: 10),

            // Tag
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.red[50],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  community['tag'] ?? '',
                  style: const TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                community['desc'] ?? '',
                style: const TextStyle(fontSize: 16, height: 1.5),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
