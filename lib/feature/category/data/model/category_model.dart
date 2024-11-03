// ignore_for_file: public_member_api_docs, sort_constructors_first
class CategoryModel {
  final String name;
  final String icon;
  final String color;
  CategoryModel({
    required this.name,
    required this.icon,
    required this.color,
  });
  factory CategoryModel.fromJson(json) {
    return CategoryModel(
      name: json['name'] as String,
      icon: json['icon'] as String,
      color: json['color'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'icon': icon,
      'color': color,
    };
  }
  
}
