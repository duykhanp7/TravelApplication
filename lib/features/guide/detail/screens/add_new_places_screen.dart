import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking_tour/common/extensions/context_extension.dart';
import 'package:travel_booking_tour/res/appbar_app_widget.dart';
import 'package:travel_booking_tour/res/colors.dart';
import 'package:travel_booking_tour/res/icons.dart';
import 'package:travel_booking_tour/res/input_field.dart';

class AddNewPlacesScreen extends StatefulWidget {
  const AddNewPlacesScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddNewPlacesScreen();
  }
}

class _AddNewPlacesScreen extends State<AddNewPlacesScreen> {
  final List<String> items = [];

  @override
  void initState() {
    items.add('Nguyen Van A');
    items.add('Nguyen Van B');
    items.add('Nguyen Van C');
    items.add('Nguyen Van D');
    items.add('Nguyen Van E');
    items.add('Nguyen Van F');
    items.add('Nguyen Van G');
    items.add('Nguyen Van H');
    items.add('Nguyen Van K');
    items.add('Nguyen Van L');
    items.add('Nguyen Van M');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppbarAppWidget(
        title: 'New Attraction',
        suffixWidget: Container(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Text(
            'DONE',
            style: context.textStyle.titleMedium?.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 17,
                color: AppColors.primary),
          ),
        ),
        suffixAction: () {},
      ),
      body: GestureDetector(
        child: Container(
          color: AppColors.white,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 16, top: 30, right: 16),
                child: LayoutBuilder(
                  builder: (context, constraint) => Autocomplete<String>(
                    optionsBuilder: (textEditingValue) {
                      String query = textEditingValue.text;
                      if (query.isEmpty) {
                        return items;
                      }
                      return items.where((element) =>
                          element.toLowerCase().contains(query.toLowerCase()));
                    },
                    optionsViewBuilder: (context, onSelected, options) => Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: const EdgeInsets.only(top: 5),
                        height: options.length > 4 ? 200 : options.length * 50,
                        width: constraint.maxWidth,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.black.withOpacity(0.1),
                                  blurRadius: 10,
                                  blurStyle: BlurStyle.outer)
                            ]),
                        child: ListView.builder(
                            itemExtent: 50,
                            scrollDirection: Axis.vertical,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) => Container(
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                      color: AppColors.transparent,
                                      borderRadius: index == 0
                                          ? const BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              topRight: Radius.circular(15))
                                          : index == options.length - 1
                                              ? const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(15),
                                                  bottomRight:
                                                      Radius.circular(15))
                                              : BorderRadius.zero),
                                  child: Material(
                                      borderRadius: index == 0
                                          ? const BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              topRight: Radius.circular(15))
                                          : index == options.length - 1
                                              ? const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(15),
                                                  bottomRight:
                                                      Radius.circular(15))
                                              : BorderRadius.zero,
                                      color: AppColors.transparent,
                                      child: InkWell(
                                        borderRadius: index == 0
                                            ? const BorderRadius.only(
                                                topLeft: Radius.circular(15),
                                                topRight: Radius.circular(15))
                                            : index == options.length - 1
                                                ? const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(15),
                                                    bottomRight:
                                                        Radius.circular(15))
                                                : BorderRadius.zero,
                                        splashColor:
                                            AppColors.black.withOpacity(0.2),
                                        highlightColor:
                                            AppColors.black.withOpacity(0.2),
                                        child: Container(
                                            padding:
                                                const EdgeInsets.only(left: 24),
                                            alignment: Alignment.centerLeft,
                                            height: 60,
                                            child:
                                                Text(options.elementAt(index))),
                                        onTap: () {
                                          onSelected(options.elementAt(index));
                                        },
                                      )),
                                ),
                            itemCount: options.length),
                      ),
                    ),
                    fieldViewBuilder: (context, textEditingController,
                            focusNode, onFieldSubmitted) =>
                        Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.black.withOpacity(0.1),
                                blurRadius: 10,
                                blurStyle: BlurStyle.outer)
                          ]),
                      child: AppTextField(
                        focusNode: focusNode,
                        textEditingController: textEditingController,
                        textStyle: context.textStyle.titleMedium?.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: AppColors.textOnboardingBlack),
                        inputDecoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.fromLTRB(24, 15, 24, 15),
                            suffixIconConstraints: const BoxConstraints(
                                maxWidth: 40, maxHeight: 30),
                            suffixIcon: Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(
                                right: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.primary,
                              ),
                              child: SvgPicture.asset(
                                AppIcons.icAddBlue,
                                color: AppColors.white,
                              ),
                            ),
                            hintStyle: context.textStyle.titleMedium?.copyWith(
                                color: AppColors.textHintColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                            hintText: 'Type a place',
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 0, color: AppColors.white),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 0, color: AppColors.white),
                                borderRadius: BorderRadius.circular(10)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 0, color: AppColors.white))),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
      ),
    );
  }
}
