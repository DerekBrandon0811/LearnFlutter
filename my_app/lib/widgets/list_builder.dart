import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ListBuilder extends StatefulWidget {
  const ListBuilder({super.key, required this.items});

  final List<Widget> items;

  @override
  State<ListBuilder> createState() => ListBuilderState();
}

class ListBuilderState extends State<ListBuilder> {
  static const staticListLen = 4;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          final item = widget.items[index];
          if (index <= staticListLen) {
            return item;
          }
          return Slidable(
            key: Key('$item'),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {
                    setState(() {
                      widget.items.removeAt(index);
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
