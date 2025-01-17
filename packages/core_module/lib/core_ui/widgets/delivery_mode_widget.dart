import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:core_module/core/def/global_definitions.dart';
import 'package:core_module/core/model/remote/delivery_mode_model.dart';
import 'package:core_module/core_ui/widgets/delivery_mode_item_widget.dart';

class DeliveryModeWidget extends StatelessWidget {
  final Function(DeliveryModeModel)? onTap;
  final RxList<DeliveryModeModel> modeList;

  const DeliveryModeWidget({
    super.key,
    this.onTap,
    required this.modeList,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Obx(
      () => SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: appDimen.dimen(10)),
            DeliveryModeItemWidget.withUpperBorder(
              model: modeList.first,
              onTap: onTap,
            ),
            DeliveryModeItemWidget.withLowerBorder(
              model: modeList.last,
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }
}
