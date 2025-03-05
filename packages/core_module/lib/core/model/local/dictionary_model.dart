class DictionaryModel {
  String key;
  String value;
  bool selected;

  DictionaryModel({
    required this.key,
    required this.value,
    this.selected = false,
  });
}
