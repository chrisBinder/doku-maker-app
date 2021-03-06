import 'package:doku_maker/models/project/project.dart';
import 'package:doku_maker/screens/project/new_image_entry_modal.dart';
import 'package:doku_maker/screens/project/new_text_entry_modal.dart';
import 'package:flutter/material.dart';

class ProjectDetailEntryButtons extends StatelessWidget {
  const ProjectDetailEntryButtons({
    Key key,
    @required this.project,
  }) : super(key: key);

  final Project project;

  Widget _buildEntryButton(BuildContext ctx, IconData icon, Function onTab) {
    return Ink(
      decoration: ShapeDecoration(
        shape: CircleBorder(),
        color: Theme.of(ctx).accentColor,
      ),
      child: IconButton(
        icon: Icon(icon),
        onPressed: onTab,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildEntryButton(context, Icons.title, () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (ctx) => NewTextEntryModal(project.id));
          }),
          _buildEntryButton(context, Icons.image, () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (ctx) => NewImageEntryModal(project.id));
          }),
          _buildEntryButton(context, Icons.play_arrow, () {}),
          _buildEntryButton(context, Icons.mic, () {}),
          _buildEntryButton(context, Icons.gesture, () {}),
          Ink(
            decoration: ShapeDecoration(
              shape: CircleBorder(),
              color: Theme.of(context).buttonColor,
            ),
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
