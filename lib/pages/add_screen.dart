import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  DateTime selectedDate = DateTime.now();
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
        title: Text('Add Task'),
        actions: [
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
                decoration: InputDecoration(
                  labelText: 'Nama Task'
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                keyboardType: TextInputType.datetime,
                controller: _dateController,
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
                child: Text('Tambah', style: TextStyle(color: Colors.white),),
                  color: Colors.green,
                  onPressed: (){}
                  )
            ],
          ),
        ),
      ),
    );
  }
}
