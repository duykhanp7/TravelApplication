import 'package:flutter/cupertino.dart';
import 'package:travel_booking_tour/res/colors.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  State<StatefulWidget> createState() {
    return _NotificationScreen();
  }
}

class _NotificationScreen extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: AppColors.white,
        alignment: Alignment.center,
        child: const Text(
          'Notification Screen',
          style: TextStyle(color: AppColors.primary, fontSize: 20),
        ),
      ),
    );
  }
}
