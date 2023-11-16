import 'package:flutter/material.dart';
import 'studentInfo.dart';
import 'package:provider/provider.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Team Member List'),
      ),
      body: ReorderableListView.builder(
        itemCount: context.read<StudentInfoList>().infoList.length,
        itemBuilder: (c, i) {
          return Dismissible(
            key: ValueKey(context.read<StudentInfoList>().infoList[i]),
            background: Container(
              color: Colors.green,
            ),
            child: ListTile(
              title:
                  Text(context.read<StudentInfoList>().infoList[i].toString()),
            ),
            onDismissed: (direction) {
              context.read<StudentInfoList>().removeInfo(i);
            },
          );
        },
        onReorder: (oldIndex, newIndex) {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          context.read<StudentInfoList>().infoList.insert(
              newIndex, context.read<StudentInfoList>().removeInfo(oldIndex));
        },
      ),
    );
  }
}
