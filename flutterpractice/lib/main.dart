import 'package:flutter/material.dart';

enum Language {cpp, python, dart}

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
        primarySwatch: Colors.orange,
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

class _MyHomePageState extends State<MyHomePage>{

  final _midController = TextEditingController();
  final _finalController = TextEditingController();
  final _pointList = List.generate(10, (i) => i);
  var _selectedValue = 0;
  bool _isLeader = false;
  bool _isAbsenceLess4 = true;
  String _grade = 'B';

  void dispose(){
    _midController.dispose();
    _finalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: Text('Receive User Information'),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.add)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
            child: ListView(
              children: [
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Midterm Exam'
                  ),
                  controller: _midController,
                  keyboardType: TextInputType.number,
                ),
                Container(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Final Exam'
                  ),
                  controller: _finalController,
                  keyboardType: TextInputType.number,
                ),
                Container(
                  height: 20,
                ),
                RadioListTile(
                    title: Text('Project Team Leader (+10)'),
                    value: true,
                    groupValue: _isLeader,
                    onChanged: (value){
                      setState(() {
                        _isLeader = value!;
                      });
                    }
                ),
                RadioListTile(
                    title: Text('Project Team Member'),
                    value: false,
                    groupValue: _isLeader,
                    onChanged: (value){
                      setState(() {
                        _isLeader = value!;
                      });
                    }
                ),
                Container(
                  height: 20,
                ),
                Row(
                  children: [
                    const Expanded(
                      flex: 7,
                      child: Text(
                          'Additional Point',
                          textAlign: TextAlign.left,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: DropdownButton(
                          isExpanded: true,
                          alignment: Alignment.centerRight,
                          value: _selectedValue,
                          items: _pointList.map(
                              (point) => DropdownMenuItem(
                                  value: point,
                                  child: Text('$point point'))).toList(),
                        onChanged: (value) {
                            setState(() {
                              _selectedValue = value!;
                            });
                        },

                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Expanded(
                      flex: 9,
                      child: Text(
                          'Absence less than 4',
                          textAlign: TextAlign.left,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Checkbox(
                          value: _isAbsenceLess4,
                          onChanged: (value){
                            setState(() {
                              _isAbsenceLess4 = value!;
                            });
                          }
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 20,
                ),
                Text(
                  _grade,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, color: Colors.orange),
                ),
                Container(
                  height: 20,
                ),
                ElevatedButton(onPressed: (){
                  setState(() {
                    var midValue = double.parse(_midController.text.trim());
                    var finalValue = double.parse(_finalController.text.trim());
                    var sum = midValue + finalValue + _selectedValue;
                    if(_isLeader) {
                      sum += 10;
                    }
                    if(!_isAbsenceLess4){
                      _grade = 'F';
                    }
                    else if(sum >= 170){
                      _grade = 'A';
                    }
                    else if(sum >= 150){
                      _grade = 'B';
                    }
                    else if(sum >= 130){
                      _grade = 'C';
                    }
                    else if(sum >= 110){
                      _grade = 'D';
                    }
                    else{
                      _grade = 'F';
                    }
                  });
                }, child: Text('Enter')),
              ],
            ),
          
        ),
      ),
      drawer: Drawer(),
    );
  }

}