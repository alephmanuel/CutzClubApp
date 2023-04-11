import 'package:flutter/material.dart';

class ProfileItem extends StatefulWidget {
  const ProfileItem({super.key});

  @override
  State<ProfileItem> createState() => _ProfileItemState();
}

class _ProfileItemState extends State<ProfileItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
    );
  }
}
