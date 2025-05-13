import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/screens/news_section/articles/load_articles.dart';

class RecentNewsScreen extends StatelessWidget {
  RecentNewsScreen({super.key});

  final List<Map<String, String>> newsList = [
    {
      'image': 'assets/images/img1.PNG',
      'title': 'Jovens PAIGC Bissau',
      'subtitle': '12 K membros',
      'tag': 'Agricultura',
      'desc': 'Grupo de jovens agricultores',
      'dateTime': '2025-05-10 14:30',
    },
    {
      'image': 'assets/images/img2.PNG',
      'title': 'Voluntarios Gabu',
      'subtitle': 'Requer aprovação',
      'tag': '',
      'desc': 'Grupo de voluntarios em Gabu',
      'dateTime': '2025-05-09 18:00',
    },
    {
      'image': 'assets/images/img3.PNG',
      'title': 'Anuncios Oficiais',
      'subtitle': 'Somenteadmins',
      'tag': 'podem postar',
      'desc': 'Grupo de anuncios oficiais',
      'dateTime': '2025-05-08 11:15',
    },
    {
      'image': 'assets/images/img4.PNG',
      'title': 'Campo 24',
      'subtitle': '874 - Myynth',
      'tag': 'Art · Histo',
      'desc': 'Grupo de jovens agricultores',
      'dateTime': '2025-05-07 09:50',
    },
  ];

  String formatDateTime(String dateTimeStr) {
    final dt = DateTime.parse(dateTimeStr);
    return DateFormat('MMM d, yyyy • hh:mm a').format(dt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.recentNews),
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
        elevation: 1,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          final news = newsList[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => LoadArticle(community: news)),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              margin: const EdgeInsets.only(bottom: 16),
              elevation: 4,
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Thumbnail
                  Image.asset(
                    news['image']!,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title and Date Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                news['title']!,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.access_time,
                                  size: 16,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  formatDateTime(news['dateTime']!),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 6),

                        // Description
                        Text(
                          news['desc']!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.black87),
                        ),

                        const SizedBox(height: 8),

                        // Optional Tag
                        if ((news['tag'] ?? '').isNotEmpty)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.red[50],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.label_important,
                                  size: 16,
                                  color: Colors.redAccent,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  news['tag']!,
                                  style: const TextStyle(
                                    color: Colors.redAccent,
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
          );
        },
      ),
    );
  }
}
