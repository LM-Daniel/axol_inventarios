import 'package:axol_inventarios/plugins/sale_note/repository/vendor_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../models/textfield_model.dart';
import '../../../../sale_note/model/vendor_model.dart';
import 'vendor_select_state.dart';

class VendorSelectCubit extends Cubit<VendorSelectState> {
  VendorSelectCubit() : super(InitialState());

  Future<void> load(TextfieldModel finder) async {
    try {
      List<VendorModel> vendorsDB;
      emit(InitialState());
      emit(LoadingState(textfieldFinder: finder));
      vendorsDB = await VendorRepo().fetchVendorIlike(finder.text);
      emit(LoadedState(textfieldFinder: finder, vendorList: vendorsDB));
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }
}
