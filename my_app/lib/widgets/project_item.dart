import 'package:flutter/material.dart';

class ProjectItem extends StatelessWidget {
  const ProjectItem({
    super.key,
    required this.title,
    required this.iconType,
  }) : taskCount = 0;

  final String title;
  final int taskCount;
  final IconData iconType;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconType, color: Colors.deepPurple),
      title: Text(title),
      textColor: const Color.fromARGB(255, 200, 200, 200),
      trailing: Text('$taskCount'),
    );
  }
}
