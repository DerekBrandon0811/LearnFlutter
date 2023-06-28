import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Widget> myListTiles;

  void insertTile() {
    myListTiles.add(ListItem(
        title: "New Item ${myListTiles.length}",
        notifCount: "0",
        iconType: Icons.new_label_outlined));
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    myListTiles = [
      const ListItem(
          title: "My Day", notifCount: "4", iconType: Icons.wb_sunny_outlined),
      const ListItem(
          title: "Important", notifCount: "5", iconType: Icons.star_border),
      const ListItem(
          title: "Planned", notifCount: "2", iconType: Icons.calendar_today),
      const ListItem(title: "Tasks", notifCount: "8M", iconType: Icons.home),
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
                listItems: myListTiles,
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
          onPressed: () => insertTile(),
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

class ListItem extends StatelessWidget {
  const ListItem(
      {super.key,
      required this.title,
      required this.notifCount,
      required this.iconType});

  final String title;
  final String notifCount;
  final IconData iconType;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconType, color: Colors.deepPurple),
      title: Text(title),
      textColor: const Color.fromARGB(255, 200, 200, 200),
      trailing: Text(notifCount),
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

// Darken New List on hover
// Add New List functionality
// Dynamically add TodoLists to ListView when New List button clicked