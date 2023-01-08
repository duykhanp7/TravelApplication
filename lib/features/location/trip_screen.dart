import 'package:flutter/cupertino.dart';
import 'package:travel_booking_tour/res/colors.dart';

class TripScreen extends StatefulWidget {
  const TripScreen({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  State<StatefulWidget> createState() {
    return _TripScreen();
  }
}

class _TripScreen extends State<TripScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: AppColors.white,
        alignment: Alignment.center,
        child: const Text(
          'Location Screen',
          style: TextStyle(color: AppColors.primary, fontSize: 20),
        ),
      ),
    );
  }
}
