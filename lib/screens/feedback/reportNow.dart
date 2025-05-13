import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/l10n/app_localizations.dart';

class ReportForm extends StatefulWidget {
  const ReportForm({super.key});
  @override
  State<ReportForm> createState() => _ReportFormState();
}

class _ReportFormState extends State<ReportForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();
  bool _anonymous = false;

  final _firestore = FirebaseFirestore.instance;

  void _submitReport() async {
    try {
      final report = {
        'location': _locationController.text.trim(),
        'details': _detailsController.text.trim(),
        'timestamp': FieldValue.serverTimestamp(),
      };

      if (!_anonymous) {
        report['name'] = _nameController.text.trim();
      }

      await _firestore.collection('reports').add(report);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.reportsentsuccessfully),
        ),
      );

      _nameController.clear();
      _locationController.clear();
      _detailsController.clear();
      setState(() => _anonymous = false);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F7F2),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('IF G15', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text(
              AppLocalizations.of(context)!.reportnow,
              style: TextStyle(
                fontSize: 22,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            if (!_anonymous)
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.name,
                  border: OutlineInputBorder(),
                ),
              ),
            if (!_anonymous) const SizedBox(height: 12),
            TextField(
              controller: _locationController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.location,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _detailsController,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.reportdetails,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(AppLocalizations.of(context)!.anonymous),
                const Spacer(),
                Switch(
                  value: _anonymous,
                  onChanged: (val) {
                    setState(() => _anonymous = val);
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitReport,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(
                  horizontal: 60,
                  vertical: 15,
                ),
              ),
              child: const Text('To send', style: TextStyle(fontSize: 16)),
            ),
            const Spacer(),
            const Text(
              'Protected by encryption',
              style: TextStyle(color: Colors.brown),
            ),
          ],
        ),
      ),
    );
  }
}
