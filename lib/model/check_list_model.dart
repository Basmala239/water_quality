class CheckListModel {
  String title;
  String description;
  bool isChecked;

  CheckListModel({
    required this.title,
    required this.description,
    this.isChecked = false,
  });
}