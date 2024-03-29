class CustomerModel {
  final int id;
  final String name;
  final String? rfc;
  final String? street;
  final int? outNumber;
  final int? intNumber;
  final String? hood;
  final String? postalCode;
  final String? town;
  final String? country;
  final int? phoneNumber;

  static const String propId = 'id';
  static const String propName = 'name';
  static const String propRfc = 'rfc';
  static const String propStreet = 'street';
  static const String propOutNumber = 'outNumber';
  static const String propIntNumber = 'intNumber';
  static const String propHood = 'hood';
  static const String propPostalCode = 'postalCode';
  static const String propTown = 'town';
  static const String propCountry = 'country';
  static const String propPhoneNumber = 'phoneNumber';

  const CustomerModel({
    required this.id,
    required this.name,
    this.country,
    this.hood,
    this.intNumber,
    this.outNumber,
    this.phoneNumber,
    this.postalCode,
    this.rfc,
    this.street,
    this.town,
  });

  static CustomerModel empty() => const CustomerModel(
        id: -1,
        name: '',
      );

  static CustomerModel fillMap(Map<String, dynamic> map) {
    CustomerModel customerModel;
    if (map.keys.contains(propId) && map.keys.contains(propName)) {
      customerModel = CustomerModel(
        id: map[propId],
        name: map[propName],
        country: map[propCountry],
        hood: map[propHood],
        intNumber: map[propIntNumber],
        outNumber: map[propOutNumber],
        phoneNumber: map[propPhoneNumber],
        postalCode: map[propPostalCode],
        rfc: map[propPostalCode],
        street: map[propStreet],
        town: map[propTown],
      );
    } else {
      customerModel = CustomerModel.empty();
    }
    return customerModel;
  }
}
