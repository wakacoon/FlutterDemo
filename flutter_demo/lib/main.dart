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
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: MyListPage(),
    );
  }
}

class MyListPage extends StatelessWidget {
  final Map<String, dynamic> data = {
    '中途採用比率': {'前年度/2年度前/3年度前': '10%20%30%'},
    '中途採用比率2': {'前年度/2年度前/3年度前': '10%20%30%'},
    '正社員の平均継続勤務年数': '18.5年',
    '従業員の平均年齢': '50.5歳',
    '月平均所定外労働時間': '18時間',
    '平均の法定時間外労働60時間以上の労働者の数': '15人',
    '育児休業取得率（男性）': [
      {'正社員': '34%'},
      {'専門職': '50%'},
    ],
    '育児休業取得率（女性）': [
      {'正社員': '34%'},
      {'専門職': '50%'},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          String title = data.keys.elementAt(index);
          dynamic value = data[title];

          return ListTile(
            title: Text(title),
            // subtitle: _buildSubtitle(value),
            trailing: _buildSubtitle(value),
            onTap: () {
              print('Listtitle');
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return MyDialog();
                },
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildSubtitle(dynamic value) {
    if (value is String) {
      return Text(value);
    } else if (value is Map<String, String>) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: value.entries
            .map((entry) => Text('${entry.key}: ${entry.value}'))
            .toList(),
      );
    } else if (value is List<Map<String, String>>) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: value.map((map) => _buildSubtitle(map)).toList(),
      );
    } else {
      return SizedBox.shrink();
    }
  }
}

class MyDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('标题'),
      content: const TextField(
        decoration: InputDecoration(
          hintText: '请填写',
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text('确认'),
        ),
      ],
    );
  }
}
