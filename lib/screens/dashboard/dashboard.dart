import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/screens/feedback/reportNow.dart';
import 'package:news_app/screens/feedback/starVoulenteer.dart';
import 'package:news_app/screens/news_section/groupcard.dart';
import 'package:news_app/screens/news_section/newsSection.dart';
import 'package:news_app/screens/news_section/recentNews.dart';
import 'package:news_app/screens/news_section/youtubeVideoplayer.dart';
import 'package:news_app/screens/utils/onlineStatusWidget.dart';

class PaigcHeader extends StatefulWidget {
  const PaigcHeader({super.key});

  @override
  State<PaigcHeader> createState() => _PaigcHeaderState();
}

class _PaigcHeaderState extends State<PaigcHeader> {
  Locale? _locale;

  void _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacementNamed('/login');
  }

  void _changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: _locale,
      supportedLocales: const [Locale('en'), Locale('fr'), Locale('pt')],
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      home: Builder(
        builder:
            (context) => Scaffold(
              appBar: AppBar(
                backgroundColor: const Color(0xFFFFF8F0),
                title: Text(
                  AppLocalizations.of(context)!.appTitle,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                actions: [
                  PopupMenuButton<Locale>(
                    icon: const Icon(Icons.language),
                    onSelected: _changeLanguage,
                    itemBuilder:
                        (context) => [
                          PopupMenuItem(
                            value: const Locale('en'),
                            child: const Text('English'),
                          ),
                          PopupMenuItem(
                            value: const Locale('fr'),
                            child: const Text('Français'),
                          ),
                          PopupMenuItem(
                            value: const Locale('pt'),
                            child: const Text('Português'),
                          ),
                        ],
                  ),
                  const OnlineStatusWidget(),
                ],
              ),
              drawer: Drawer(
                child: Column(
                  children: [
                    DrawerHeader(
                      decoration: const BoxDecoration(color: Color(0xFFFFF8F0)),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/logo.PNG',
                            width: 50,
                            height: 50,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            AppLocalizations.of(context)!.appTitle,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.dashboard),
                      title: Text(AppLocalizations.of(context)!.dashboard),
                      onTap: () => Navigator.pop(context),
                    ),
                    ListTile(
                      leading: const Icon(Icons.info_outline),
                      title: Text(AppLocalizations.of(context)!.aboutUs),
                      onTap: () => Navigator.pop(context),
                    ),
                    ListTile(
                      leading: const Icon(Icons.document_scanner),
                      title: Text(AppLocalizations.of(context)!.reportNow),
                      onTap:
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReportForm(),
                            ),
                          ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.star),
                      title: Text(AppLocalizations.of(context)!.starVolunteer),
                      onTap:
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileCard(),
                            ),
                          ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.exit_to_app),
                      title: Text(AppLocalizations.of(context)!.exit),
                      onTap: () => Navigator.pop(context),
                    ),
                    const Spacer(),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.logout, color: Colors.red),
                      title: Text(
                        AppLocalizations.of(context)!.logout,
                        style: const TextStyle(color: Colors.red),
                      ),
                      onTap: () => _logout(context),
                    ),
                  ],
                ),
              ),
              body: SafeArea(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  color: const Color(0xFFFFF8F0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 1,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.search, color: Colors.grey),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText:
                                            AppLocalizations.of(
                                              context,
                                            )!.searchGroups,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Text(
                                          AppLocalizations.of(
                                            context,
                                          )!.recentNews,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          right: 5,
                                        ),
                                        child: GestureDetector(
                                          onTap:
                                              () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder:
                                                      (context) =>
                                                          RecentNewsScreen(),
                                                ),
                                              ),
                                          child: Text(
                                            AppLocalizations.of(
                                              context,
                                            )!.seeAll,
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              CommunityGrid(),
                              GroupCardUI(),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  10,
                                  10,
                                  10,
                                  0,
                                ),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    AppLocalizations.of(context)!.liveStream,
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                              VideoPlayer(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
      ),
    );
  }
}
