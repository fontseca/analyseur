import 'package:analyseur/classes/color.dart';
import 'package:flutter/material.dart';

class NewActivity extends StatefulWidget {
  const NewActivity({Key? key}) : super(key: key);

  @override
  NewActivityState createState() => NewActivityState();
}

class NewActivityState extends State<NewActivity> {
  late List<InternalActivityColor> defaultColors = [
    InternalActivityColor(Colors.greenAccent, 'Green', this),
    InternalActivityColor(Colors.redAccent, 'Redish', this),
    InternalActivityColor(Colors.purpleAccent, 'Purlple', this),
    InternalActivityColor(Colors.brown, 'Brown', this),
  ];
  late InternalActivityColor pickedColor = defaultColors[0];

  void selectColor(String name) {
    for (int i = 0; i < defaultColors.length; ++i) {
      if (defaultColors[i].colorName == name) {
        setState(() {
          pickedColor = defaultColors[i];
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuilder(context),
      body: bodyBuilder(context, defaultColors, pickedColor),
    );
  }
}

AppBar appBarBuilder(BuildContext context) {
  return AppBar(
    leading: IconButton(
      splashRadius: 25,
      icon: Icon(Icons.close),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    title: Text('New activity'),
    actions: [
      IconButton(
        splashRadius: 25,
        icon: Icon(Icons.done),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ],
  );
}

ListView bodyBuilder(
  BuildContext context,
  List<InternalActivityColor> defaultColors,
  InternalActivityColor pickedColor,
  ) {
    final theme = Theme.of(context);
    final titleColor = theme.textTheme.bodyText1?.color;
    final subTextColor = theme.textTheme.bodyText1?.color!.withOpacity(0.4);

    void showColorPicker() {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [...defaultColors],
          );
        },
      );
    }

  return ListView(
    children: [
      ///// Act name
      ListTile(
        leading: Icon(Icons.title),
        title: Text('Name', style: TextStyle(color: titleColor)),
        subtitle: Container(
          height: 15,
          child: TextField(
            style: TextStyle(color: subTextColor, fontSize: 14),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Name',
              hintStyle: TextStyle(color: subTextColor),
              filled: false,
            ),
          ),
        ),
        onTap: () {},
        focusColor: Colors.transparent,
      ),
      Divider(height: 0),

      ///// Act color
      ListTile(
        leading: Icon(Icons.circle, color: pickedColor.color),
        title: Text('Color', style: TextStyle(color: titleColor)),
        subtitle: Text(
          pickedColor.colorName,
          style: TextStyle(color: subTextColor, fontSize: 14)),
        onTap: showColorPicker,
      ),
      Divider(height: 0),

      ///// Act color
      ListTile(
        leading: Icon(Icons.description),
        title: Text('Descirption', style: TextStyle(color: titleColor)),
        subtitle: Container(
          height: 15,
          child: TextField(
            style: TextStyle(color: subTextColor, fontSize: 14),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'No description',
              hintStyle: TextStyle(color: subTextColor),
              filled: false,
            ),
          ),
        ),
        onTap: () {},
        focusColor: Colors.transparent,
      ),
      Divider(height: 0),

      ///// Act category
      ListTile(
        leading: Icon(Icons.category),
        title: Text('Category', style: TextStyle(color: titleColor)),
        subtitle: Text('Others',
            style: TextStyle(color: subTextColor, fontSize: 14)),
        onTap: showColorPicker,
      ),
    ],
  );
}