import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      shadowColor: Colors.blue[200],
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        leading: const Icon(
          Icons.check_circle_outline,
          color: Color(0xffef31f3),
          size: 27.5,
        ),
        title: const Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            'Plan Trip to Finland',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        subtitle: Text(
          'The family`s trip to Finland this summer ',
        ),
        trailing: SizedBox(
          width: 100,
          child: Row(
            children: const [
              Icon(
                Icons.notifications_none_outlined,
                color: Color(0xffef31f3),
              ),
              SizedBox(width: 10),
              Text(
                'Yesterday',
                style: TextStyle(color: Color(0xffef31f3)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
