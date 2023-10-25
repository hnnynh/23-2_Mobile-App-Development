import 'package:flutter/material.dart';

List<StudentInfo> studentList = [];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grade Calculator',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Grade Calculator'),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.add)),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Information'),
              Tab(text: 'List'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Tab(
              child: MyForm(),
            ),
            Tab(
                child: MyListPage(),
            ),
          ],
        )
        // drawer: Drawer(),
      ),
    );
  }
}

class MyForm extends StatefulWidget{
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm>{

  StudentInfo studentInfo = StudentInfo('', 0, 0);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name'
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                } else if (int.tryParse(value) != null) {
                  return 'Please enter some string, not a number';
                }
                return null;
              },
              onSaved: (value){
                studentInfo.name = value!;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Project point'
              ),
              keyboardType: TextInputType.number,
              validator: (value){
                if (value == null || value.isEmpty) {
                  return 'Please insert some text';
                } else if (int.tryParse(value) == null) {
                  return 'Please insert some integer';
                }
                return null;
              },
              onSaved: (value){
                studentInfo.projectPoint = int.parse(value!);
              },
            ),
            SizedBox(
              height: 20,
            ),
            DropdownButtonFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Additional Point',
              ),
              value: studentInfo.additionalPoint,
              items: List.generate(11, (i) {
                if (i == 0) {
                  return DropdownMenuItem(
                    value: i-1,
                    child: Text('Choose the additional Point'),
                  );
                }
                return DropdownMenuItem(
                  value: i-1,
                  child: Text('${i - 1} point'),
                );
              }),
              onChanged: (value) {
                setState(() {
                  studentInfo.additionalPoint = value!;
                });
              },
              validator: (value) {
                if (value == -1) {
                  return 'Please select the point';
                }
                return null;
              },
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              child: Container(
                  height: 60, color: Colors.indigo,
                  child: const Center(
                    child: Text('Enter',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  )),
              onTap: () {
                setState(() {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Processing data'),
                    ));
                    _formKey.currentState!.save();
                    studentList.add(studentInfo);
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MyListPage extends StatefulWidget {
  const MyListPage({Key? key}) : super(key:key);

  @override
  State<MyListPage> createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {
  @override
  Widget build(BuildContext context) {
    return ReorderableListView.builder(
      itemCount: studentList.length,
      itemBuilder: (c, i){
        return Dismissible(
          key: ValueKey(studentList[i]),
          background: Container(
            color: Colors.green,
          ),
          child: ListTile(
            leading: const Icon(Icons.home),
            title: Text(studentList[i].toString()),
          ),
          onDismissed: (direction) {
            setState(() {
              studentList.removeAt(i);
            });
          },
        );
      },
      onReorder: (oldIndex, newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          studentList.insert(newIndex, studentList.removeAt(oldIndex));
        });
      },
    );
  }
}

class StudentInfo {
  String name;
  int projectPoint;
  int additionalPoint;

  StudentInfo(
      this.name,
      this.projectPoint,
      this.additionalPoint,
      );

  @override
  String toString() {
    return
        '$name :'
        '${projectPoint + additionalPoint}';
  }
}