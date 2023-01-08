import 'package:flutter/cupertino.dart';
import 'package:travel_booking_tour/res/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  State<StatefulWidget> createState() {
    return _ProfileScreen();
  }
}

class _ProfileScreen extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: AppColors.white,
        alignment: Alignment.center,
        child: const Text(
          'Profile Screen',
          style: TextStyle(color: AppColors.primary, fontSize: 20),
        ),
      ),
    );
  }
}
