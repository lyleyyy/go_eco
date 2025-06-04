import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class NewActivity extends StatefulWidget {
  final Function addActivity;

  NewActivity(this.addActivity);

  @override
  State<NewActivity> createState() => _NewActivityState();
}

class _NewActivityState extends State<NewActivity> {
  // const NewActivity({super.key});
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = int.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addActivity(
      enteredTitle,
      enteredAmount,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Activity'),
              // style: TextStyle(color: Colors.green),
              // onChanged: (val) {
              //   titleInput = val;
              // },
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              // onChanged: (val) => amountInput = val,
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              child: Text("Add Activity",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  )),
              // color: Colors.green,
              onPressed: submitData,
              // activities.add(Activity(
              //     id: 'shit',
              //     title: titleController.text,
              //     amount: double.parse(amountController.text),
              //     description: "Manually Added",
              //     icon: Icons.alarm));
              // setState(() {});
              // Navigator.of(context).pop();
              // },
              // onPressed: () {
              //   // print(titleController.text);
              //   // print(amountController.text);
              //   // addActivity(
              //   //   titleController.text,
              //   //   double.parse(amountController.text),
              //   // );
              // },
            ),
          ],
        ),
      ),
    );
  }
}
