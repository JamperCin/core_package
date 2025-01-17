class DeliveryModeModel {
  final String title;
  final String asset;
  final bool selected;

  DeliveryModeModel({
     this.title = '',
     this.asset = '',
     this.selected = false,
  });

  DeliveryModeModel copyWith({
    String? title,
    String? asset,
    bool? selected,
  }) {
    return DeliveryModeModel(
      title: title ?? this.title,
      asset: asset ?? this.asset,
      selected: selected ?? this.selected,
    );
  }

  static DeliveryModeModel fromJson(Map<String, dynamic> json) {
    return DeliveryModeModel(
      title: json['title'] as String? ?? "",
      asset: json['asset'] as String? ?? "",
      selected: json['selected'] as bool? ?? false,
    );
  }
}
