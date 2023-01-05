import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_booking_tour/common/extensions/context_extension.dart';

import '../../../res/colors.dart';
import '../../../res/icons.dart';
import '../../../res/images.dart';

class TopExperienceItem extends StatefulWidget {
  const TopExperienceItem({super.key, required this.callback});
  final VoidCallback callback;

  @override
  State<StatefulWidget> createState() {
    return _TopExperienceItem();
  }
}

class _TopExperienceItem extends State<TopExperienceItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 206,
        height: 350,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Stack(
          children: [
            Column(
              children: [
                Flexible(
                    flex: 3,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          child: Image.asset(
                            AppImages.hoiAn,
                            width: 206,
                            height: 259,
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                            bottom: 15,
                            left: 16,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 70,
                                  height: 70,
                                  padding: const EdgeInsets.all(3),
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(35)),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(35)),
                                    child: Image.asset(AppImages.emmy),
                                  ),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: 88,
                                  height: 23,
                                  padding:
                                      const EdgeInsets.only(left: 5, right: 5),
                                  decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    'Emmy',
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    textAlign: TextAlign.center,
                                    style: context.textStyle.titleSmall
                                        ?.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.white),
                                  ),
                                )
                              ],
                            ))
                      ],
                    )),
                Flexible(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            '2 Hour Bicycle Tour exploring Hoian',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: context.textStyle.titleMedium
                                ?.copyWith(fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 3, right: 3),
                            child: Row(
                              children: [
                                SvgPicture.asset(AppIcons.locationGreen),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  'Hoi An, Viet Nam',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: context.textStyle.titleSmall?.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.primary),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
              ],
            ),
            Container(
              width: 206,
              height: 350,
              decoration: const BoxDecoration(
                  color: AppColors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              alignment: Alignment.center,
              child: Material(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                color: AppColors.transparent,
                child: InkWell(
                  highlightColor: AppColors.white.withOpacity(0.1),
                  splashColor: AppColors.white.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  onTap: widget.callback,
                ),
              ),
            )
          ],
        ));
  }
}
