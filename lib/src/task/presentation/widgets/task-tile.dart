import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/core/constants/color.dart';
import 'package:todo/gen/assets.gen.dart';

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
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.only(right: 22, top: 15.35, left: 15.35),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.taskTileBorderColor, width: 1),
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
              SvgPicture.asset(
                Assets.icons.updateIcon,
                color: AppColors.primaryIconColor,
                width: 15,
                height: 15,
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
    );
  }
}
