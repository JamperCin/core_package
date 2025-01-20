import 'package:core_module/core/def/global_definitions.dart';
import 'package:core_module/core/model/remote/delivery_address_model.dart';
import 'package:core_module/core_ui/widgets/card_container_widget.dart';
import 'package:core_module/core_ui/widgets/checkbox_widget.dart';
import 'package:core_module/core_ui/widgets/text_button_widget.dart';
import 'package:flutter/material.dart';

class AddressItemWidget extends StatelessWidget {
  final DeliveryAddressModel addressModel;
  final Function(DeliveryAddressModel)? onEdit;
  final Function(DeliveryAddressModel)? onChecked;

  const AddressItemWidget({
    super.key,
    required this.addressModel,
    this.onEdit,
    this.onChecked,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return CardContainerWidget(
      padding: EdgeInsets.symmetric(
          horizontal: appDimen.dimen(-2), vertical: appDimen.dimen(-2)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                addressModel.fullName,
                style: textTheme.bodyMedium,
              ),
              if (onEdit != null) SizedBox(width: appDimen.dimen(1)),
              if (onEdit != null)
                TextButtonWidget.withTextOnly(
                  onTap: () {
                    if (onEdit != null) {
                      onEdit!(addressModel);
                    }
                  },
                  text: "Edit",
                  textColor: colorScheme.primary,
                )
            ],
          ),
          SizedBox(height: appDimen.dimen(1)),
          Text(
            addressModel.phoneNumber,
            style: textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w300),
          ),
          SizedBox(height: appDimen.dimen(1)),
          Text(
            addressModel.location?.address ?? '',
            style: textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w300),
          ),
          if (onChecked != null)
            CheckboxWidget(
              checkValue: addressModel.selected,
              style:
                  textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w300),
              onChange: (value) {
                final model = addressModel.copyWith(selected: value);
                onChecked!(model);
              },
              text: "Use as the delivery address",
            )
        ],
      ),
    );
  }
}
