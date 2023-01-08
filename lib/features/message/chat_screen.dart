import 'package:flutter/cupertino.dart';
import 'package:travel_booking_tour/res/colors.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  State<StatefulWidget> createState() {
    return _ChatScreen();
  }
}

class _ChatScreen extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: AppColors.white,
        alignment: Alignment.center,
        child: const Text(
          'Message Screen',
          style: TextStyle(color: AppColors.primary, fontSize: 20),
        ),
      ),
    );
  }
}
