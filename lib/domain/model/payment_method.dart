class PaymentMethod {
  String id;
  String name;
  String info;
  String imagePath;

  PaymentMethod({
    required this.id,
    required this.name,
    required this.info,
    required this.imagePath,
  });

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'info': info, 'imagePath': imagePath};
  }

  factory PaymentMethod.fromMap(Map<String, dynamic> map) {
    return PaymentMethod(
      id: map['id'],
      name: map['name'],
      info: map['info'],
      imagePath: map['imagePath'],
    );
  }

  @override
  String toString() {
    return 'PaymentMethod{id: $id, name: $name, info: $info, imagePath: $imagePath}';
  }
}
