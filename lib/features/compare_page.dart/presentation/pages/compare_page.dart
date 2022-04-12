import 'package:flutter/material.dart';

class ComparePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<ComparePage> {
  String _obj1 = 'one';
  String _obj2 = 'two';

  _buildList(bool first) {
    String sel = "";
    if (first) {
      sel = _obj1;
    } else {
      sel = _obj2;
    }

    return Container(
//                        width: 120,
//                        height: 120,
      alignment: Alignment.center,
      child: DropdownButton<String>(
        items: [
          DropdownMenuItem<String>(
            child: Text("Object 1"),
            value: 'one',
          ),
          DropdownMenuItem<String>(
            child: Text("Object 2"),
            value: 'two',
          ),
          DropdownMenuItem<String>(
            child: Text("Object 3"),
            value: 'three',
          ),
        ],
        onChanged: (String? value) {
          if (value != null) {
            setState(() {
              if (first) {
                _obj1 = value;
              } else {
                _obj2 = value;
              }
            });
          }
        },
        hint: Text('Select Item'),
        value: sel,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Compare top hashes"),
      ),

      body: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: this._buildList(true),
              ),
              Expanded(
                  child: Text(
                "VS",
                textAlign: TextAlign.center,
              )),
              Expanded(
                child: this._buildList(false),
              ),
            ],
          ),
          Divider(
            height: 15,
            thickness: 3,
            color: Colors.black,
          ),
          Container(
              child: DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  'Rank',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Hash',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Rank',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ],
            rows: const <DataRow>[
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('1')),
                  DataCell(Text('123233e31132dee12345a')),
                  DataCell(Text('6')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('2')),
                  DataCell(Text('4311aa5b1a1345ff251345')),
                  DataCell(Text('1')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('3')),
                  DataCell(Text('87787611288a66282e1345')),
                  DataCell(Text('3')),
                ],
              ),
            ],
          )),
        ],
      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: () { goBackToPreviousScreen(context); },
//        tooltip: 'Back',
//        child: Icon(Icons.arrow_back),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
