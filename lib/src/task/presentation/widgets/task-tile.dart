import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/core/constants/color.dart';
import 'package:todo/gen/assets.gen.dart';
import 'package:todo/src/task/presentation/screens/update_todo_screen.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskTile extends StatelessWidget {
  final String taskID;
  final String title;
  final String date;
  final String priority;
  final String status;

  const TaskTile(
      {super.key,
      required this.taskID,
      required this.title,
      required this.date,
      required this.priority,
      required this.status});

  @override
  Widget build(BuildContext context) {
    return Slidable(
        key: const ValueKey(0),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          dismissible: DismissiblePane(onDismissed: () {}),
          children: [
            SlidableAction(
              onPressed: (context) async {
                try {
                  await FirebaseFirestore.instance
                      .collection('todos')
                      .doc(taskID)
                      .delete();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: AppColors.successSnackBarColor,
                      content: Text('Todo deleted successfully'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                } catch (error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: AppColors.failureSnackBarColor,
                      content: Text('Todo deletion failed'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
                ;
              },
              backgroundColor: AppColors.slideableDeleteColor,
              foregroundColor: AppColors.slideableIconColor,
              icon: Icons.delete_outline_rounded,
            ),
          ],
        ),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              flex: 1,
              onPressed: (context) async {
                try {
                  await FirebaseFirestore.instance
                      .collection('todos')
                      .doc(taskID)
                      .update({
                    'status': status == "completed" ? "pending" : "completed"
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: AppColors.successSnackBarColor,
                      content: Text('Todo status updated successfully'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                } catch (error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: AppColors.failureSnackBarColor,
                      content: Text('Todo status update failed'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
              backgroundColor: AppColors.slideableCompleteColor,
              foregroundColor: AppColors.slideableIconColor,
              icon: Icons.check_box_outlined,
            ),
          ],
        ),
        child: Container(
          margin: const EdgeInsets.only(bottom: 15),
          padding: const EdgeInsets.only(right: 22, top: 15.35, left: 15.35),
          decoration: BoxDecoration(
              border:
                  Border.all(color: AppColors.taskTileBorderColor, width: 1),
              borderRadius: BorderRadius.circular(10)),
          height: 72.7,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        color: AppColors.primaryTextColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w700),
                  ),
                  GestureDetector(
                    child: SvgPicture.asset(
                      Assets.icons.updateIcon,
                      color: AppColors.primaryIconColor,
                      width: 15,
                      height: 15,
                    ),
                    onTap: () => {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => TodoUpdateScreen(
                                title: title,
                                date: date,
                                status: status,
                                priority: priority,
                                id: taskID,
                              )))
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    Assets.icons.calenderIcon,
                    color: AppColors.secondaryIconColor,
                    height: 10,
                    width: 10,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(date,
                      style: const TextStyle(
                          color: AppColors.secondaryTextColor,
                          fontSize: 8,
                          fontWeight: FontWeight.w500)),
                  Container(
                    height: 8,
                    width: 5,
                    margin: const EdgeInsets.only(left: 12, right: 3),
                    decoration: BoxDecoration(
                      color: priority == "High"
                          ? AppColors.highPriorityIndicatorColor
                          : priority == "Medium"
                              ? AppColors.mediumPriorityIndicatorColor
                              : AppColors.lowPriorityIndicatorColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Text(priority,
                      style: const TextStyle(
                          color: AppColors.secondaryTextColor,
                          fontSize: 8,
                          fontWeight: FontWeight.w500)),
                ],
              ),
            ],
          ),
        ));
  }
}
