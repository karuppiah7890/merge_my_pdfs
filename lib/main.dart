import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

import 'file.dart';

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
  List<File> files = new List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _bodyContent(),
      floatingActionButton: FloatingActionButton(
        onPressed: _chooseFiles,
        tooltip: 'Add PDFs',
        child: Icon(Icons.add),
      ),
    );
  }

  void _chooseFiles() async {
    var files = await FilePicker.getMultiFilePath();
    setState(() {
      files.forEach((key, value) => this.files.add(File(key, value)));
    });
  }

  Widget _bodyContent() {
    if (this.files.length == 0) {
      return Center(
          child: Text("Press the + button to add PDFs")
      );
    }

    return ListView.builder(
      itemCount: this.files.length,
      itemBuilder: (BuildContext context, int index) => Card(
        child: ListTile(
          title: Text(this.files.elementAt(index).Name),
          key: Key(this.files.elementAt(index).Name),
          trailing: IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: () {
              this.setState(() {
                this.files.removeAt(index);
              });
            },
          ),
        ),
      )
    );
  }
}
