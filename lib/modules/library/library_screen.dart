import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/helpers.dart';

import '../../components/base_screen.dart';
import '../../utils/helpers.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BaseScreen(
          title: "Library",
          child: SingleChildScrollView(
            child: SizedBox(
              width: deviceWidth(context) - 50,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start, children: []),
            ),
          ),
        ),
      ),
    );
  }
}
