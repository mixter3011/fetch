import 'package:fetch/constants/colors.dart';
import 'package:fetch/widgets/side_bar_button.dart';
import 'package:flutter/material.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  bool iscollapsed = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      width: iscollapsed ? 64 : 150,
      color: AppColors.sideNav,
      child: Column(
        children: [
          const SizedBox(height: 16),
          Icon(
            Icons.auto_awesome_mosaic,
            color: Colors.white,
            size: iscollapsed ? 30 : 60,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: iscollapsed
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                SideBarButton(
                  isCollapsed: iscollapsed,
                  icon: Icons.add,
                  text: "Home",
                ),
                SideBarButton(
                  isCollapsed: iscollapsed,
                  icon: Icons.search,
                  text: "Search",
                ),
                SideBarButton(
                  isCollapsed: iscollapsed,
                  icon: Icons.language,
                  text: "Spaces",
                ),
                SideBarButton(
                  isCollapsed: iscollapsed,
                  icon: Icons.auto_awesome,
                  text: "Discover",
                ),
                SideBarButton(
                  isCollapsed: iscollapsed,
                  icon: Icons.cloud_outlined,
                  text: "Library",
                ),
                const Spacer(),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                iscollapsed = !iscollapsed;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(microseconds: 100),
              margin: const EdgeInsets.symmetric(vertical: 14),
              child: Icon(
                iscollapsed
                    ? Icons.keyboard_arrow_right
                    : Icons.keyboard_arrow_left,
                color: AppColors.iconGrey,
                size: 22,
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
