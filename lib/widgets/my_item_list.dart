import 'package:flutter/material.dart';
import 'package:medical_project/utils/color.dart';

class ProfileItem extends StatelessWidget {
  final IconData leftIcon;
  final IconData? rightIcon;
  final String itemTitle;
  final Function() onTap;

  const ProfileItem({
    super.key,
    required this.leftIcon,
    this.rightIcon,
    required this.itemTitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
          color: Colors.green[400],
          border: Border.all(color: primary, width: 2),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  leftIcon,
                  size: 35,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 25,
                ),
                Text(
                  itemTitle,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Icon(
              rightIcon,
              color: Colors.white,
              size: 35,
            )
          ],
        ),
      ),
    );
  }
}
