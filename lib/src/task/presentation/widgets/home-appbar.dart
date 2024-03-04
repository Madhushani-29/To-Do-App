import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo/core/constants/color.dart';
import 'package:todo/core/constants/strings.dart';
import 'package:todo/gen/assets.gen.dart';
class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: AppColors.primaryBackgroundColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 28),
            child: ClipOval(
                child: SvgPicture.asset(
              Assets.icons.userIcon,
              height: 40,
            )),
          )
        ],
        title: Padding(
          padding: const EdgeInsets.only(left: 13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                (DateTime.now()).hour < 11
                    ? "Morning!"
                    : (DateTime.now()).hour < 15
                        ? "Afternoon!"
                        : (DateTime.now()).hour < 19
                            ? "Evening!"
                            : "Night!",
                style: const TextStyle(
                    color: AppColors.greetingFontColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w700),
              ),
              const Text(
                AppStrings.userName,
                style: TextStyle(
                    color: AppColors.userNameFontColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ));
  }
}
