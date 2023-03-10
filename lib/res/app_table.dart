import 'package:flutter/cupertino.dart';
import 'package:travel_booking_tour/common/extensions/context_extension.dart';

import 'colors.dart';

class AppTable extends StatefulWidget {
  const AppTable({super.key, required this.datas});

  final Map<String, String> datas;

  @override
  State<StatefulWidget> createState() {
    return _AppTable();
  }
}

class _AppTable extends State<AppTable> {
  @override
  Widget build(BuildContext context) {
    return _buildTablePrices();
  }

  Widget _buildTablePrices() {
    return Container(
      alignment: Alignment.center,
      child: Table(
        border: TableBorder(
            borderRadius: BorderRadius.circular(10),
            top: const BorderSide(width: 1, color: AppColors.tableBorder),
            right: const BorderSide(width: 1, color: AppColors.tableBorder),
            bottom: const BorderSide(width: 1, color: AppColors.tableBorder),
            left: const BorderSide(width: 1, color: AppColors.tableBorder),
            horizontalInside: const BorderSide(
              width: 1,
              color: AppColors.tableBorder,
            ),
            verticalInside:
                const BorderSide(width: 1, color: AppColors.tableBorder)),
        children: List.generate(
            widget.datas.length,
            (index) => TableRow(children: [
                  Container(
                    alignment: Alignment.center,
                    height: 40,
                    child: Text(widget.datas.entries.elementAt(index).key,
                        textAlign: TextAlign.center,
                        style: context.textStyle.titleMedium?.copyWith(
                            color: AppColors.inActiveRadioBorderColor,
                            fontWeight: FontWeight.w500)),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 40,
                    child: Text(widget.datas.entries.elementAt(index).value,
                        textAlign: TextAlign.center,
                        style: context.textStyle.titleMedium?.copyWith(
                            color: AppColors.blackDefault,
                            fontWeight: FontWeight.w500)),
                  )
                ])),
      ),
    );
  }
}
