class DictionaryModel {
  String key;
  String value;
  bool selected;

  DictionaryModel({
    required this.key,
    required this.value,
    this.selected = false,
  });

  DictionaryModel copyWith({
    String? key,
    String? value,
    bool? selected,
  }) {
    return DictionaryModel(
      key: key ?? this.key,
      value: value ?? this.value,
      selected: selected ?? this.selected,
    );
  }
}
