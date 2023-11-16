import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'studentInfo.dart';
import 'listpage.dart';

class NumberPage extends StatelessWidget {
  const NumberPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Team Member'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ListPage()));
              },
              icon: Icon(Icons.list)),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NumberPanel(),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                if (context.read<StudentInfoList>().infoList.length == 3) {
                  showModalBottomSheet<void>(
                      context: context,
                      builder: (context) {
                        return Center(
                          child: Text('The team is already Full'),
                        );
                      });
                } else {
                  showModalBottomSheet<void>(
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: MyModalSheet(),
                        );
                      });
                }
              },
              child: Text('Add')),
        ],
      ),
    );
  }
}

class NumberPanel extends StatelessWidget {
  const NumberPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'The number of our Team members is:',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            context.watch<StudentInfoList>().infoList.length.toString(),
            style: TextStyle(fontSize: 30),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class MyModalSheet extends StatelessWidget {
  const MyModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final _noController = TextEditingController();
    final _nameController = TextEditingController();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Student No: '),
            SizedBox(
              width: 150,
              child: TextField(
                controller: _noController,
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text('Name: '),
            SizedBox(
              width: 150,
              child: TextField(
                controller: _nameController,
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {
              var noValue = int.parse(_noController.text.trim());
              var nameValue = _nameController.text.trim();
              context.read<StudentInfoList>().insertInfo(noValue, nameValue);

              Navigator.pop(context);
            },
            child: Text('Enter')),
      ],
    );
  }
}
