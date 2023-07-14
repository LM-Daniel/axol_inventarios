import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/vendor_model.dart';

class VendorRepo {
  static const String _table = 'vendors';
  static const String _id = 'id';
  static const String _name = 'name';
  final _supabase = Supabase.instance.client;

  Future<List<VendorModel>> fetchVendorEq(String inText) async {
    List<Map<String, dynamic>> vendorsDB = [];
    List<VendorModel> vendors = [];
    VendorModel vendor;
    vendorsDB = await _supabase
        .from(_table)
        .select<List<Map<String, dynamic>>>()
        .or('$_id.eq.$inText,$_name.eq.$inText');
    if (vendorsDB.isNotEmpty) {
      for (var element in vendorsDB) {
        vendor = VendorModel(
          id: element[_id],
          name: element[_name],
        );
        vendors.add(vendor);
      }
    }
    return vendors;
  }

  Future<List<VendorModel>> fetchVendorIlike(String inText) async {
    List<Map<String, dynamic>> vendorsDB = [];
    List<VendorModel> vendors = [];
    VendorModel vendor;
    vendorsDB = await _supabase
        .from(_table)
        .select<List<Map<String, dynamic>>>()
        .or('$_id.ilike.$inText,$_name.ilike.$inText');
    if (vendorsDB.isNotEmpty) {
      for (var element in vendorsDB) {
        vendor = VendorModel(
          id: element[_id],
          name: element[_name],
        );
        vendors.add(vendor);
      }
    }
    return vendors;
  }
}