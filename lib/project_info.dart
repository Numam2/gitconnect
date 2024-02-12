import 'package:flutter/material.dart';

class ProjectInfo extends StatelessWidget {
  const ProjectInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //About
            Text(
              'Hi! Welcome to Git Connect',
              style: TextStyle(color: Colors.white, fontSize: 24),
              softWrap: true,
            ),
            SizedBox(height: 20),
            Text(
              'This is a test project that shows Git Commit history for this app. This app was developed by Numa Montes de Oca as a test by FULLTIME FORCE in order to complete a job application',
              style: TextStyle(color: Colors.white, fontSize: 14),
              softWrap: true,
            ),
            SizedBox(height: 20),
            Text(
              'The commit history is retrieved using Git API. To view the list just click on "Commit List"',
              style: TextStyle(color: Colors.white, fontSize: 14),
              softWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}
