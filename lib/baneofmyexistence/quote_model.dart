//turns the json into a string
class Quote {
  final String quote;
  Quote({required this.quote});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(quote: json['quote'] as String);
  }
}
