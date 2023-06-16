import 'package:flutter/material.dart';

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
        title: const Text("Macrohard From Don't"),
        centerTitle: false,
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
              child: ListView(
                children: const [
                  ListTile(
                    leading:
                        Icon(Icons.wb_sunny_outlined, color: Colors.deepPurple),
                    title: Text("My Day"),
                    textColor: Color.fromARGB(255, 200, 200, 200),
                    trailing: Text("4"),
                  ),
                  ListTile(
                    leading: Icon(Icons.star_border, color: Colors.deepPurple),
                    title: Text("Important"),
                    textColor: Color.fromARGB(255, 200, 200, 200),
                    trailing: Text("5"),
                  ),
                  ListTile(
                    leading:
                        Icon(Icons.calendar_today, color: Colors.deepPurple),
                    title: Text("Planned"),
                    textColor: Color.fromARGB(255, 200, 200, 200),
                    trailing: Text("2"),
                  ),
                  ListTile(
                    leading: Icon(Icons.home, color: Colors.deepPurple),
                    title: Text("Tasks"),
                    textColor: Color.fromARGB(255, 200, 200, 200),
                    trailing: Text("8M"),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: Divider(color: Colors.grey),
                  ),
                  ListTile(
                    leading: Icon(Icons.list, color: Colors.deepPurple),
                    title: Text("Projects"),
                    textColor: Color.fromARGB(255, 200, 200, 200),
                    trailing: Text("3"),
                  ),
                ],
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
          onPressed: () => print("hi world"),
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
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
