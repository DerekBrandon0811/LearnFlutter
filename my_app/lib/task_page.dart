import 'package:flutter/material.dart';
import 'package:macrohard/list_builder.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => TaskPageState();
}

class TaskPageState extends State<TaskPage> {
  late List<Widget> taskItems;

  void insertTile(BuildContext context) {
    taskItems.add(const ListItem(
        title: "Untitled Task",
        taskCount: "0",
        iconType: Icons.check_box_outline_blank));
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    taskItems = [];
    //widget.listItem.title = "Untitled List";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 20, 20, 20),
      appBar: AppBar(
        title: const Text(
          "Macrohard From Don't",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: false,
        backgroundColor: const Color.fromARGB(255, 20, 20, 20),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                    fit: FlexFit.tight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          initialValue: "Untitled List",
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              alignLabelWithHint: true,
                              hintText: "Untitled List",
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(120, 103, 58, 183),
                                  fontSize: 48)),
                          style: const TextStyle(
                              color: Colors.deepPurple, fontSize: 48),
                          cursorColor: Colors.white),
                    )),
              ],
            ),
            Flexible(
              child: ListBuilder(
                listItems: taskItems,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: const Color.fromARGB(255, 20, 20, 20),
        color: const Color.fromARGB(255, 20, 20, 20),
        padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
        child: TextButton(
          onPressed: () => insertTile(context),
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.resolveWith<Color?>((_) {
              return Theme.of(context).colorScheme.background;
            }),
          ),
          child: const Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 20, 5),
                child: Icon(
                  Icons.add,
                  color: Color.fromARGB(255, 100, 100, 100),
                ),
              ),
              Text(
                "New Task",
                style: TextStyle(color: Color.fromARGB(255, 100, 100, 100)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
