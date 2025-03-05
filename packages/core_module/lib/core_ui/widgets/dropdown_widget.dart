import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core/model/local/dictionary_model.dart';
import 'package:core_module/core_ui/widgets/container_widget.dart';
import 'package:flutter/material.dart';

class DropdownWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final List<DictionaryModel> values;
  DictionaryModel selectedValue;
  final Function(DictionaryModel)? onSelected;

  DropdownWidget({
    super.key,
    this.width,
    this.height,
    required this.values,
    required this.selectedValue,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return ContainerWidget(
      width: width ?? 150.dp(),
      height: height ?? 28.dp(),
      padding: EdgeInsets.symmetric(horizontal: 5.dp()),
      child: DropdownButton<String>(
        value: selectedValue.key,
        isExpanded: true,
        icon: Icon(
          Icons.arrow_drop_down_outlined,
          size: 16.dp(),
        ),
        elevation: 0,
        style: textTheme.labelMedium,
        underline: Container(
          height: 2,
          color: Colors.transparent,
        ),
        onChanged: (String? key) {
          selectedValue = values.where((element) => element.key == key).single;
          if (onSelected != null) {
            onSelected!(selectedValue);
          }
        },
        items: values.map<DropdownMenuItem<String>>((DictionaryModel dict) {
          return DropdownMenuItem<String>(
            value: dict.key,
            child: Row(
              children: [
                if (dict.key.isNotEmpty)
                  Flexible(
                    child: Icon(
                      selectedValue.key == dict.key
                          ? Icons.done_outline_outlined
                          : Icons.done,
                      color: selectedValue.key == dict.key
                          ? colorScheme.primary
                          : colorScheme.secondary,
                      size: 10.dp(),
                    ),
                  ),
                SizedBox(width: 5.dp()),
                Expanded(
                  child: Text(
                    dict.value,
                    style: dict.key.isEmpty
                        ? textTheme.labelLarge
                        : textTheme.labelMedium,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
