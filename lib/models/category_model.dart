class CategoryModel {
  final String icon;
  final String name;
  CategoryModel({required this.icon, required this.name});
  Map<String, dynamic> toJson() => {
        "icon": icon,
        "name": name,
      };
}
