import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'MergeMyPDFs'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text("Press the + button to add PDFs")
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _chooseFiles,
        tooltip: 'Add PDFs',
        child: Icon(Icons.add),
      ),
    );
  }

  void _chooseFiles() async {
    var files = await FilePicker.getMultiFilePath();
    print(files);
  }
}
