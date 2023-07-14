import 'package:flutter/material.dart';
import 'package:macrohard/widgets/project_item.dart';
import 'package:macrohard/widgets/list_builder.dart';

class ProjectListModel extends ChangeNotifier {
  late List<Widget> projects;

  ProjectListModel() {
    projects = [
      const ProjectItem(title: "My Day", iconType: Icons.wb_sunny_outlined),
      const ProjectItem(title: "Important", iconType: Icons.star_border),
      const ProjectItem(title: "Planned", iconType: Icons.calendar_today),
      const ProjectItem(title: "Tasks", iconType: Icons.home),
      const Padding(
        padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
        child: Divider(color: Colors.grey),
      ),
    ];
  }

  ListBuilder get listBuilder => ListBuilder(items: projects);

  void add() {
    projects.add(ProjectItem(
        title: "Untitled List ${projects.length}",
        iconType: Icons.new_label_outlined));
    notifyListeners();
  }
}
