class Address {
  String id;
  String cep;
  String street;
  String number;
  String complement;
  String neighborhood;
  String city;
  String state;

  Address({
    required this.id,
    required this.cep,
    required this.street,
    required this.number,
    required this.complement,
    required this.neighborhood,
    required this.city,
    required this.state,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cep': cep,
      'street': street,
      'complement': complement,
      'number': number,
      'neighborhood': neighborhood,
      'city': city,
      'state': state,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      id: map['id'],
      cep: map['cep'],
      street: map['street'],
      number: map['number'],
      complement: map['complement'],
      neighborhood: map['neighborhood'],
      city: map['city'],
      state: map['state'],
    );
  }

  @override
  String toString() {
    return 'Address{id: $id, cep: $cep, street: $street, number: $number, complement: $complement, neighborhood: $neighborhood, city: $city, state: $state}';
  }
}
