import 'package:flutter/material.dart';
import 'package:git_connect/commit_list.dart';
import 'package:git_connect/project_info.dart';

class Home extends StatefulWidget {
  final String title;
  const Home(this.title, {super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _pageController = PageController(initialPage: 0);
  bool showCommitList = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(
            widget.title,
            style: const TextStyle(color: Colors.black),
          ),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 900) {
              return const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Info
                  Expanded(child: ProjectInfo()),
                  SizedBox(width: 25),
                  //List
                  Expanded(child: CommitList()),
                ],
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      height: 75,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Info
                          TextButton(
                              style: TextButton.styleFrom(
                                  side: BorderSide(
                                      color: !showCommitList
                                          ? Theme.of(context)
                                              .colorScheme
                                              .primary
                                          : Colors.transparent)),
                              onPressed: () => setState(() {
                                    showCommitList = false;
                                    _pageController.animateToPage(0,
                                        duration:
                                            const Duration(milliseconds: 250),
                                        curve: Curves.ease);
                                  }),
                              child: Text('Project Info',
                                  style: TextStyle(
                                      color: !showCommitList
                                          ? Theme.of(context)
                                              .colorScheme
                                              .primary
                                          : Colors.grey))),
                          const SizedBox(width: 10),
                          //List
                          TextButton(
                              style: TextButton.styleFrom(
                                  side: BorderSide(
                                      color: showCommitList
                                          ? Theme.of(context)
                                              .colorScheme
                                              .primary
                                          : Colors.transparent)),
                              onPressed: () => setState(() {
                                    showCommitList = true;
                                    _pageController.animateToPage(1,
                                        duration:
                                            const Duration(milliseconds: 250),
                                        curve: Curves.ease);
                                  }),
                              child: Text('Commit List',
                                  style: TextStyle(
                                      color: showCommitList
                                          ? Theme.of(context)
                                              .colorScheme
                                              .primary
                                          : Colors.grey))),
                        ],
                      ),
                    ),
                  ),
                  //PageView
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      children: const [
                        //Info
                        ProjectInfo(),
                        //List
                        CommitList()
                      ],
                    ),
                  ),
                ],
              );
            }
          },
        ));
  }
}
