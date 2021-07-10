import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  DateTime selectedDate = DateTime.now();
  bool _edit = false;
  TextEditingController _dateController = TextEditingController();
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      initialDatePickerMode: DatePickerMode.day,
      lastDate: DateTime(2101),
      firstDate: DateTime(2015)
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat.yMd().format(selectedDate);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Screen'),
        actions: [
          IconButton(
              onPressed: (){
                setState(() {
                  _edit = true;
                });
              },
              icon: Icon(Icons.edit)
          )
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                keyboardType: TextInputType.name,
                enabled: _edit,
                decoration: InputDecoration(
                  labelText: 'Nama Task'
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                keyboardType: TextInputType.datetime,
                controller: _dateController,
                enabled: _edit,
                readOnly: true,
                decoration: InputDecoration(
                    labelText: 'Waktu',
                    suffixIcon: IconButton(
                      onPressed: (){
                        print("date");
                        _selectDate(context);
                      },
                      icon: Icon(Icons.date_range),
                    )
                ),
              ),
              SizedBox(height: 30,),
              RaisedButton(
                child: Text('Simpan', style: TextStyle(color: Colors.white),),
                  color: Colors.green,
                  onPressed: _edit ? (){} : null
                  )
            ],
          ),
        ),
      ),
    );
  }
}
