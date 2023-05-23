import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../models/movement_model.dart';

class MovementRepo {
  //Table
  static const String _table = 'movement_history';
  //Columns
  static const String _id = 'id';
  static const String _time = 'time';
  static const String _code = 'code';
  static const String _description = 'description';
  static const String _document = 'document';
  static const String _warehouse = 'warehouse';
  static const String _concept = 'concept';
  static const String _conceptType = 'concept_type';
  static const String _quantity = 'quantity';
  //Database
  static final _supabase = Supabase.instance.client;

  Future<void> insertMovemets(List<MovementModel> newMovements) async {
    for (var element in newMovements) {
      await _supabase.from(_table).insert({
        _id: element.id,
        _time: element.time,
        _code: element.code,
        _description: element.description,
        _document: element.document,
        _warehouse: element.warehouse,
        _concept: element.concept,
        _conceptType: element.conceptType,
        _quantity: element.quantity,
      });
    }
  }
}