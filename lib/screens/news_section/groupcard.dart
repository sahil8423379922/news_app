import 'package:flutter/material.dart';

class GroupCardUI extends StatelessWidget {
  const GroupCardUI({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: double.infinity,
      child: Container(
        color: Colors.white,
        child: Center(
          child: Card(
            elevation: 3,

            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Group Header
                  Row(
                    children: const [
                      Text("🇬🇼", style: TextStyle(fontSize: 18)),
                      SizedBox(width: 8),
                      Text(
                        "Grupo: Mulheres na Política",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Red alert box
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red[700],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 12,
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Próxima reunião: 15/10 às 18h!",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 6),
                        Text("🔴"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Yellow opinion box
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.amber[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 12,
                    ),
                    child: Row(
                      children: const [
                        Expanded(
                          child: Text(
                            "Concordo com priorizar educação! 🔔⚠️⚠️⚠️",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        Text(
                          "3x",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Poll section
                  const Text(
                    "Votár: Prioridade 2024 – Educação ou Saúde?",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  pollBar("Educação", 0.75, Colors.green[700]!),
                  const SizedBox(height: 6),
                  pollBar("Saúde", 0.25, Colors.green[300]!),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget pollBar(String label, double value, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LinearProgressIndicator(
          value: value,
          color: color,
          backgroundColor: Colors.grey[300],
          minHeight: 20,
        ),
        const SizedBox(height: 4),
        Text("$label ${(value * 100).toInt()}%"),
      ],
    );
  }
}
