import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../baneofmyexistence/auth_provider.dart';
import '../baneofmyexistence/quote_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quoteAsync = ref.watch(quoteProvider); //watches until a quote is given
    final theme = Theme.of(context); //theme

    return Scaffold(
      appBar: AppBar(
        title: Text('Kanye Quotes', style: theme.textTheme.titleMedium),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => context.go('/about'),
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              ref.read(authProvider.notifier).state = null; //makes authProvider null so that we have to log back in
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Center(
                  child: quoteAsync.when(
                    loading: () => const CircularProgressIndicator(), //shows loading screen if loading
                    error: (err, stack) => Text( //shows error if theres an error
                      'Error: $err',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: Colors.red,
                      ),
                    ),
                    data: (quote) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '"${quote.quote}"', //where the quote is displayed once/if you get data
                          textAlign: TextAlign.center,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  ref.read(quoteProvider.notifier).fetchQuote(); //fetches a new quote
                },
                child: const Text('New Random Quote'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
