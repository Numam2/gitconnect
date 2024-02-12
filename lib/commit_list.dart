import 'package:flutter/material.dart';
import 'package:git_connect/history.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CommitList extends StatefulWidget {
  const CommitList({super.key});

  @override
  State<CommitList> createState() => _CommitListState();
}

class _CommitListState extends State<CommitList> {
  @override
  Widget build(BuildContext context) {
    final commits = Provider.of<List<History>>(context);

    if (commits.isEmpty) {
      return const Center(
          child: SizedBox(
        height: 50,
        child: CircularProgressIndicator(),
      ));
    }
    return Padding(
      padding:
          EdgeInsets.all((MediaQuery.of(context).size.width) > 900 ? 20.0 : 0),
      child: ListView.builder(
        itemCount: commits.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.black45.withOpacity(0.25),
                  borderRadius: const BorderRadius.all(Radius.circular(12))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    commits[index].message!,
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 5),
                  Text(
                      '${DateFormat.MMMMd().format(commits[index].date!)}, ${DateFormat.Hm().format(commits[index].date!)}',
                      style: const TextStyle(color: Colors.grey, fontSize: 12))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
