import 'package:flutter/material.dart';

class CommunityGrid extends StatelessWidget {
  const CommunityGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final communities = [
      {
        'image': 'assets/img1.png',
        'title': 'Jovens PAIGC Bissau',
        'subtitle': '12 K membros',
        'tag': 'Agricultura',
      },
      {
        'image': 'assets/img2.png',
        'title': 'Voluntarios Gabu',
        'subtitle': 'Requer aprovação',
        'tag': '',
      },
      {
        'image': 'assets/img3.png',
        'title': 'Anuncios Oficiais',
        'subtitle': 'Somenteadmins',
        'tag': 'podem postar',
      },
      {
        'image': 'assets/img4.png',
        'title': 'Campo 24',
        'subtitle': '874 - Myynth',
        'tag': 'Art · Histo',
      },
      {
        'image': 'assets/img1.png',
        'title': 'Jovens PAIGC Bissau',
        'subtitle': '12 K membros',
        'tag': 'Agricultura',
      },
      {
        'image': 'assets/img2.png',
        'title': 'Voluntarios Gabu',
        'subtitle': 'Requer aprovação',
        'tag': '',
      },
      {
        'image': 'assets/img3.png',
        'title': 'Anuncios Oficiais',
        'subtitle': 'Somenteadmins',
        'tag': 'podem postar',
      },
      {
        'image': 'assets/img4.png',
        'title': 'Campo 24',
        'subtitle': '874 - Myynth',
        'tag': 'Art · Histo',
      },
      // Add more items as needed
    ];

    return Padding(
      padding: const EdgeInsets.all(10),
      child: GridView.count(
        crossAxisCount: 4, // ✅ 4 cards per row
        crossAxisSpacing: 6,
        mainAxisSpacing: 6,
        childAspectRatio: 0.65, // Adjust card height
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children:
            communities.map((community) {
              return Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                      child: Image.asset(
                        community['image']!,
                        height: 80,
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
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            community['subtitle']!,
                            style: TextStyle(fontSize: 12),
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
              );
            }).toList(),
      ),
    );
  }
}
