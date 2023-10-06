import 'package:flutter/material.dart';
import 'style.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First Flutter App',
      theme: ThemeData(
        primaryColor: Colors.blue,
        primarySwatch: Colors.indigo,
        fontFamily: 'Pretendard',
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final dogs = List.generate(16, (index) => index+1).toList();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Assignment 3'),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.add)),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.image)),
              Tab(icon: Icon(Icons.how_to_vote)),
              Tab(icon: Icon(Icons.upload)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Tab(
              child: GridView.count(
                crossAxisCount: 3,
                children: dogs.map((i) =>
                    Image.asset('dog_$i.jpeg'),
                ).toList(),
              ),
            ),
            Tab(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text("Candidate"),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 4.0,
                          child: Container(
                              height: 100,
                              child: const Center(
                                child: Text(
                                  "Dog1",
                                  style: TextStyle(color: Colors.red),
                                ),
                              )),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 4.0,
                          child: Container(
                              height: 100,
                              child: const Center(
                                child: Text(
                                  "Dog2",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              )),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 4.0,
                          child: Container(
                              height: 100,
                              child: const Center(
                                child: Text(
                                  "Dog2",
                                  style: TextStyle(color: Colors.green),
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text("Vote Rate"),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Container(
                          height: 100,
                          color: Colors.red,
                          child: const Center(
                            child: Text(
                              "50%",
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 100,
                          color: Colors.blue,
                          child: const Center(
                            child: Text(
                              "20%",
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          color: Colors.green,
                          height: 100,
                          child: const Center(
                            child: Text(
                              "30%",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Tab(
              child: LinearProgressIndicator(),
            ),
          ],
        ),
        drawer: Drawer(),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.photo_album), label: 'album'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'settings'),
          ],
        ),
      ),
    );
  }
}
