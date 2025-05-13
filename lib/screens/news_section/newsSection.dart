import 'package:flutter/material.dart';
import 'package:news_app/screens/news_section/articles/load_articles.dart';

class CommunityGrid extends StatelessWidget {
  const CommunityGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final communities = [
      {
        'image': 'assets/images/img1.PNG',
        'title': 'Jovens PAIGC Bissau',
        'subtitle': '12 K membros',
        'tag': 'Agricultura',
        'desc': 'Grupo de jovens agricultores',
      },
      {
        'image': 'assets/images/img2.PNG',
        'title': 'Voluntarios Gabu',
        'subtitle': 'Requer aprovação',
        'tag': '',
        'desc': 'Grupo de voluntarios em Gabu',
      },
      {
        'image': 'assets/images/img3.PNG',
        'title': 'Anuncios Oficiais',
        'subtitle': 'Somenteadmins',
        'tag': 'podem postar',
        'desc': 'Grupo de anuncios oficiais',
      },
      {
        'image': 'assets/images/img4.PNG',
        'title': 'Campo 24',
        'subtitle': '874 - Myynth',
        'tag': 'Art · Histo',
        'desc': 'Grupo de jovens agricultores',
      },
      {
        'image': 'assets/images/img1.PNG',
        'title': 'Jovens PAIGC Bissau',
        'subtitle': '12 K membros',
        'tag': 'Agricultura',
        'desc': 'Grupo de jovens agricultores',
      },
      {
        'image': 'assets/images/img2.PNG',
        'title': 'Voluntarios Gabu',
        'subtitle': 'Requer aprovação',
        'tag': '',
        'desc': 'Grupo de voluntarios em Gabu',
      },
      {
        'image': 'assets/images/img3.PNG',
        'title': 'Anuncios Oficiais',
        'subtitle': 'Somenteadmins',
        'tag': 'podem postar',
        'desc': 'Grupo de anuncios oficiais',
      },
      {
        'image': 'assets/images/img4.PNG',
        'title': 'Campo 24',
        'subtitle': '874 - Myynth',
        'tag': 'Art · Histo',
        'desc': 'Grupo de jovens agricultores',
      },
      // Add more items as needed
    ];

    return GridView.count(
      crossAxisCount: 4, // ✅ 4 cards per row
      crossAxisSpacing: 2,
      mainAxisSpacing: 6,
      childAspectRatio: 0.6, // Adjust card height
      shrinkWrap: true,

      children:
          communities.map((community) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoadArticle(community: community),
                  ),
                );
              },
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(6),
                      ),
                      child: Image.asset(
                        community['image']!,
                        height: 60,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            community['title']!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),

                          Text(
                            community['subtitle']!,
                            style: TextStyle(fontSize: 10),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          if (community['tag']!.isNotEmpty)
                            Text(
                              community['tag']!,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
    );
  }
}
