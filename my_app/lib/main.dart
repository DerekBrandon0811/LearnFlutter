import 'package:flutter/material.dart';
import 'package:macrohard/task_page.dart';
import 'package:macrohard/list_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 0, 0, 0),
            background: const Color.fromARGB(255, 20, 20, 20)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late List<Widget> listItems;

  void insertTile(BuildContext context) {
    ListItem newItem = ListItem(
        title: "Untitled List ${listItems.length}",
        taskCount: "0",
        iconType: Icons.new_label_outlined);
    listItems.add(newItem);
    setState(() {});
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TaskPage()),
    );
  }

  @override
  void initState() {
    super.initState();
    listItems = [
      const ListItem(
          title: "My Day", taskCount: "4", iconType: Icons.wb_sunny_outlined),
      const ListItem(
          title: "Important", taskCount: "5", iconType: Icons.star_border),
      const ListItem(
          title: "Planned", taskCount: "2", iconType: Icons.calendar_today),
      const ListItem(title: "Tasks", taskCount: "8M", iconType: Icons.home),
      const Padding(
        padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
        child: Divider(color: Colors.grey),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
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
            const Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.all(12.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.deepPurple,
                          )),
                      Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          "Gorptillius IV",
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1)),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Icon(
                          Icons.search,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Flexible(
              child: ListBuilder(
                listItems: listItems,
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
                "New List",
                style: TextStyle(color: Color.fromARGB(255, 100, 100, 100)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Darken New List on hover
// Add New List functionality
// Dynamically add TodoLists to ListView when New List button clicked