import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:multi_lang_l10n/l10n/app_localizations.dart';
import 'package:multi_lang_l10n/l10n/l10n.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      supportedLocales: L10n.all,
      locale: _locale ?? const Locale('en'),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: TranslationDemoPage(onLocaleChanged: setLocale),
    );
  }
}

class TranslationDemoPage extends StatelessWidget {
  final ValueChanged<Locale> onLocaleChanged;

  const TranslationDemoPage({super.key, required this.onLocaleChanged});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    // Check if the current locale is Arabic (RTL)
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.guide),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.language),
            tooltip: 'Change Language',
            onSelected: onLocaleChanged,
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem(
                value: Locale('en'),
                child: Text('English'),
              ),
              const PopupMenuItem(
                value: Locale('ta'),
                child: Text('தமிழ் (Tamil)'),
              ),
              const PopupMenuItem(
                value: Locale('zh'),
                child: Text('简体中文 (Chinese)'),
              ),
              const PopupMenuItem(
                value: Locale('ar'),
                child: Text('العربية (Arabic)'),
              ),
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Title
            Text(
              l10n.dis,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            // Introduction
            Text(
              l10n.traAll,
              style: const TextStyle(
                fontSize: 16,
                height: 1.6,
              ),
            ),

            const SizedBox(height: 30),

            // Section 1
            Text(
              l10n.why,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              l10n.traveling,
              style: const TextStyle(
                fontSize: 16,
                height: 1.7,
              ),
            ),

            const SizedBox(height: 24),

            // Section 2
            Text(
              l10n.pop,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),
            Text(isRtl ? "${l10n.photo} •" : "• ${l10n.photo}"),
            const SizedBox(height: 6),
            Text(isRtl ? "${l10n.shop} •" : "• ${l10n.shop}"),

            const SizedBox(height: 30),

            // Section 3
            Text(
              l10n.travel,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              l10n.always,
              style: const TextStyle(
                fontSize: 16,
                height: 1.7,
              ),
            ),

            const SizedBox(height: 30),

            // Quote Card
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  '"${l10n.trav}"',
                  style: const TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // FAQ
            Text(
              l10n.freq,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            Text(
              l10n.what,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              l10n.theBest,
            ),

            const SizedBox(height: 16),

            Text(
              l10n.how,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              l10n.book,
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(l10n.start),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}