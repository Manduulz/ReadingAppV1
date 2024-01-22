import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String firstName;
  final String lastName;
  const ProfileAvatar({required this.firstName, required this.lastName, Key? key}) : super(key: key);

  /// TODO : Царайлаг болгох
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              firstName,
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w600,
                color: Colors.blue,
              ),
            ),
            Text(
              lastName,
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w600,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
