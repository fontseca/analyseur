import 'package:analyseur/components/ui_color_circle.dart';
import 'package:analyseur/models/activity_model.dart';
import 'package:flutter/material.dart';

class EditActivityScreen extends StatefulWidget {
  final Activity activity;
  EditActivityScreen({required this.activity});

  @override
  EditActivityScreenState createState() => EditActivityScreenState();
}

class EditActivityScreenState extends State<EditActivityScreen> {
  late List<ActivityColorCircleWidget> defaultColors = [
    ActivityColorCircleWidget(Colors.greenAccent, 'Green', this),
    ActivityColorCircleWidget(Colors.redAccent, 'Redish', this),
    ActivityColorCircleWidget(Colors.purpleAccent, 'Purlple', this),
    ActivityColorCircleWidget(Colors.brown, 'Brown', this),
  ];
  late Activity act = widget.activity;
  late ActivityColorCircleWidget pickedColor = defaultColors[0];
  late String actName = '';
  late Color actColor = pickedColor.color;
  late String actDesc = '';
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  late FocusNode _nameFocusNode;
  late FocusNode _descFocusNode;

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
  void initState() {
    super.initState();
    pickedColor = ActivityColorCircleWidget(this.act.color, '', this);
    _nameFocusNode = FocusNode();
    _descFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    _nameFocusNode.dispose();
    _descFocusNode.dispose();
    super.dispose();
  }

  void editActivity() {
    widget.activity.name = _nameController.text;
    // return Activity(
    //   name: _nameController.text,
    //   color: pickedColor.color,
    //   description: _descController.text,
    //   category: 'Others',
    // );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Scaffold(
          appBar: appBarBuilder(context, this),
          body: bodyBuilder(context, defaultColors, pickedColor, this),
        ),
        onTap: () {
          FocusScope.of(context).unfocus();
        });
  }
}

AppBar appBarBuilder(BuildContext context, EditActivityScreenState self) {
  return AppBar(
    // Close page
    // future assert: not close if there exist info
    leading: IconButton(
      splashRadius: 25,
      icon: Icon(Icons.close),
      onPressed: () {
        Navigator.pop(context);
      },
    ),

    // Create
    title: Text('Edit activity'),
    actions: [
      IconButton(
        splashRadius: 25,
        icon: Icon(Icons.done),
        onPressed: () {
          // Navigator.pop(context, self.editActivity());
          Navigator.pop(context);
        },
      ),
    ],
  );
}

ListView bodyBuilder(
  BuildContext context,
  List<ActivityColorCircleWidget> defaultColors,
  ActivityColorCircleWidget pickedColor,
  EditActivityScreenState self,
) {
  final theme = Theme.of(context);
  final titleColor = theme.textTheme.bodyText1?.color;
  final subTextColor = theme.textTheme.bodyText1?.color!.withOpacity(0.4);

  void showColorPicker() {
    FocusScope.of(context).unfocus();
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
          height: 16,
          child: TextField(
            focusNode: self._nameFocusNode,
            controller: self._nameController,
            style: TextStyle(color: subTextColor, fontSize: 14),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: self.act.name,
              hintStyle: TextStyle(color: subTextColor),
              filled: false,
            ),
          ),
        ),
        onTap: () {
          self._nameFocusNode.requestFocus();
        },
        focusColor: Colors.transparent,
      ),
      Divider(height: 0),

      ///// Act color
      ListTile(
        leading: Icon(Icons.circle, color: pickedColor.color),
        title: Text('Color', style: TextStyle(color: titleColor)),
        subtitle: Text(pickedColor.colorName,
            style: TextStyle(color: subTextColor, fontSize: 14)),
        onTap: showColorPicker,
      ),
      Divider(height: 0),

      ///// Act desc
      ListTile(
        leading: Icon(Icons.description),
        title: Text('Descirption', style: TextStyle(color: titleColor)),
        subtitle: Container(
          height: 15,
          child: TextField(
            controller: self._descController,
            focusNode: self._descFocusNode,
            style: TextStyle(color: subTextColor, fontSize: 14),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: self.act.description.isEmpty
                  ? 'No description'
                  : self.act.description,
              hintStyle: TextStyle(color: subTextColor),
              filled: false,
            ),
          ),
        ),
        onTap: () {
          self._descFocusNode.requestFocus();
        },
        focusColor: Colors.transparent,
      ),
      Divider(height: 0),

      ///// Act category
      ListTile(
        leading: Icon(Icons.category),
        title: Text('Category', style: TextStyle(color: titleColor)),
        subtitle:
            Text('Others', style: TextStyle(color: subTextColor, fontSize: 14)),
        onTap: showColorPicker,
      ),
    ],
  );
}
