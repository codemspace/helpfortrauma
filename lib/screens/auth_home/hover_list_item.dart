import 'package:flutter/material.dart';

class HoverListItem extends StatefulWidget {
  final IconData iconData;
  final String title;

  HoverListItem({Key? key, required this.iconData, required this.title}) : super(key: key);

  @override
  _HoverListItemState createState() => _HoverListItemState();
}

class _HoverListItemState extends State<HoverListItem> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {
        setState(() {
          _isHovering = value;
        });
      },
      onTap: () {
        // Handle navigation or action here
        print('Item Tapped');
      },
      child: ListTile(
        leading: Icon(widget.iconData, color: _isHovering ? Colors.blue : Colors.grey[700]),
        title: Text(
          widget.title,
          style: TextStyle(
            color: _isHovering ? Colors.blue : Colors.grey[800],
            fontSize: 14
          ),
        ),
      ),
    );
  }
}
