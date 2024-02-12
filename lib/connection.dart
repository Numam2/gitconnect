import 'dart:convert';
import 'package:git_connect/history.dart';
import 'package:http/http.dart' as http;

class ConnectionService {
  Future<List<History>> fetchCommits() async {
    final response = await http.get(
      Uri.parse(
          'https://api.github.com/repos/Numam2/gitconnect/commits?sha=master'),
      headers: {
        'Authorization': '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',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData
          .map((json) => History(
              message: json['commit']['message'],
              author: json['commit']['committer']['name'],
              date: DateTime.parse(json['commit']['committer']['date'])))
          .toList();
    } else {
      throw Exception('Failed to load commits');
    }
  }
}
