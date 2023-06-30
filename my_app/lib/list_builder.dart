import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.title,
    required this.taskCount,
    required this.iconType,
  });

  final String title;
  final String taskCount;
  final IconData iconType;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconType, color: Colors.deepPurple),
      title: Text(title),
      textColor: const Color.fromARGB(255, 200, 200, 200),
      trailing: Text(taskCount),
    );
  }
}

class ListBuilder extends StatefulWidget {
  const ListBuilder({super.key, required this.listItems});

  final List<Widget> listItems;

  @override
  State<ListBuilder> createState() => ListBuilderState();
}

class ListBuilderState extends State<ListBuilder> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.listItems.length,
        itemBuilder: (context, index) {
          final item = widget.listItems[index];
          return Slidable(
            key: Key('$item'),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {
                    setState(() {
                      widget.listItems.removeAt(index);
                    });
                  },
                  backgroundColor: Colors.red,
                  icon: Icons.delete,
                )
              ],
            ),
            child: item,
          );
        });
  }
}
