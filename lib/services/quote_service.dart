import 'dart:convert';
import 'package:http/http.dart' as http;

class QuoteService {
  Future<String> fetchQuote() async {
    final response = await http.get(
      Uri.parse('https://dummyjson.com/quotes/random'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['quote'] as String;
    } else {
      throw Exception('Failed to load inspiration');
    }
  }
}