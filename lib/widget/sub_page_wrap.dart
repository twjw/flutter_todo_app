import 'package:flutter/material.dart';
import 'package:flutter_todo_app/widget/color_safearea.dart';

import 'sub_page_header.dart';

class SubPageWrap extends StatelessWidget {
  const SubPageWrap({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ColorSafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubPageHeader(
              title: title,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 16,
              ),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
