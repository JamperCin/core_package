import 'dart:ui';

class DisclosureModel {
  final String? asset;
  final String? title;
  final String? subTitle;
  final String? buttonTitle;
  final String? buttonSubTitle;
  final VoidCallback onTap;
  final VoidCallback? onSubTap;

  DisclosureModel({
    this.asset,
    this.title,
    this.subTitle,
    this.buttonTitle,
    this.buttonSubTitle,
    required this.onTap,
    this.onSubTap,
  });
}
