import 'package:flutter/material.dart';
import 'style.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First Flutter App',
      theme: ThemeData(
        primaryColor:  Colors.blue,
        // primarySwatch: Colors.orange,
        fontFamily: 'Pretendard',
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  // final items = List.generate(100, (index) => index).toList();   // 0 ~ 99까지 넣기
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.Malachite,
        title: const Text('Assignment 2'),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.add)),
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          IconButton(onPressed: (){}, icon: Icon(Icons.person))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const Stack(
              alignment: Alignment.center,
              children: [
                Opacity(
                  opacity: 0.2,
                  child: Image(
                    image: AssetImage(
                        'assets/warning.jpeg'
                    ),
                    width: 300.0,
                  ),
                ),

                Text('This page does not include contents'),
              ],
            ),
            Expanded(
                child:
                ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    ListTile(
                      leading: const Icon(Icons.home),
                      title: const Text('Home'),
                      trailing: const Icon(Icons.navigate_next),
                      onTap: (){},
                    ),
                    ListTile(
                      leading: const Icon(Icons.calendar_month),
                      title: const Text('Calendar'),
                      trailing: const Icon(Icons.navigate_next),
                      onTap: (){},
                    ),
                    ListTile(
                      leading: const Icon(Icons.camera),
                      title: const Text('Camera'),
                      trailing: const Icon(Icons.navigate_next),
                      onTap: (){},
                    ),
                  ],
                ),
            ),
          ],
        ),
      ),
      drawer: Drawer(),
    );
  }
}
