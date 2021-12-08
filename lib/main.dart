import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:todo/custom_widgets/todo_card.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Todo App",
      home: TodoHome(),
    );
  }
}

class TodoHome extends StatelessWidget {
  const TodoHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f7fe),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        leading: const Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: CircleAvatar(
            backgroundImage: AssetImage('images/female.jpg'),
          ),
        ),
        title: const Text('My Tasks'),
        actions: const [
          Icon(Icons.sort),
          SizedBox(
            width: 10,
          ),
          Icon(CupertinoIcons.search)
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return TodoCard();
        },
        itemCount: 20,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: InkWell(
          onTap: () {
            showBarModalBottomSheet(
                context: context,
                builder: (context) => Container(
                      height: MediaQuery.of(context).size.height - 200,
                      width: MediaQuery.of(context).size.width - 100,
                      color: Colors.grey,
                      child: ListView.builder(
                        itemBuilder: (context, index) => TodoCard(),
                        itemCount: 10,
                      ),
                    ));
          },
          child: Container(
            margin: const EdgeInsets.all(15),
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: const Color(0xffccd9e5)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(CupertinoIcons.checkmark_circle_fill),
                      SizedBox(
                        width: 10,
                      ),
                      Text('completed'),
                      SizedBox( 
                        width: 10,
                      ),
                      Icon(Icons.keyboard_arrow_down)
                    ],
                  ),
                  Text('24')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
