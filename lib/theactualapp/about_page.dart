import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

//i dont even need to explain ts
final Uri _url = Uri.parse('https://kanye.rest');

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.bodyLarge?.copyWith(
      color: Colors.white70,
    );
    final headingStyle = theme.textTheme.titleLarge?.copyWith(
      color: theme.colorScheme.primary,
    );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'), //goes to home page
        ),

        title: Text('About', style: theme.textTheme.titleMedium),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Kanye Quotes App', style: headingStyle),
            const SizedBox(height: 16),
            Text(
              'App that displays quotes from Kanye West. Made this for my finals. Courtesy of my GOAT Ye.',
              style: textStyle,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _launchUrl,
              child: Text('API'),
            ),
            const SizedBox(height: 16),
            Text('Powered by the kanye.rest API', style: textStyle),
            const SizedBox(height: 24),
            Text('Dependencies:', style: headingStyle),
            const SizedBox(height: 16),
            Text(
              'Flutter & Dart\nRiverpod (State Management)\nGoRouter (Navigation)\nhttp (API calls)',
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
