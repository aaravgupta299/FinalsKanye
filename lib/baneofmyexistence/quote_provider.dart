import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../baneofmyexistence/quote_model.dart';
import '../api_service.dart';

@immutable
// ignore: must_be_immutable because i hate warnings
class QuoteNotifier extends AsyncNotifier<Quote> {
  @override
  Future<Quote> build() async {
    return fetchQuote();
  }

  Future<Quote> fetchQuote() async { //function to fetch the quote
    final apiService = ref.read(apiServiceProvider);
    const url = 'https://api.kanye.rest';

    state = const AsyncValue.loading();

    try {
      final quote = await apiService.get( //tries to get the jason value from the website
        uri: url,
        fromJson: (json) => Quote.fromJson(json), 
      );
      state = AsyncValue.data(quote);
      return quote;
    } catch (e, s) {
      state = AsyncValue.error(e, s); //throws an error if kanye fails
      rethrow;
    }
  }
}

final quoteProvider = AsyncNotifierProvider<QuoteNotifier, Quote>(() {
  return QuoteNotifier();
});
