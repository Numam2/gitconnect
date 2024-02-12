import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CommitList extends StatefulWidget {
  const CommitList({super.key});

  @override
  State<CommitList> createState() => _CommitListState();
}

class _CommitListState extends State<CommitList> {
  List<dynamic> commits = [];

  Future<void> fetchCommits() async {
    final response = await http.get(
      Uri.parse(
          'https://api.github.com/repos/Numam2/gitconnect/commits'), // Replace with your repo details
      headers: {
        'Authorization': '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',
      },
    );

    if (response.statusCode == 200) {
      setState(() {
        commits = jsonDecode(response.body);
      });
    } else {
      throw Exception('Failed to load commits');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchCommits();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '${commits.length}',
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
