import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../global_widgets/appbar/appbar_global.dart';
import '../../../../../global_widgets/plugins_bar.dart';
import '../../../../../global_widgets/views_bar.dart';
import '../../../../../models/elemnets_bar_model.dart';
import '../../../../../settings/theme.dart';
import '../../../../sale_note/view/views/sale_note_view.dart';
import '../../../../user/view/views/home_view.dart';
import '../../../inventory/view/views/warehouse_menu_view.dart';
import '../../../movements/view/views/movements_view.dart';
import '../../../product/view/views/product_view.dart';
import '../../cubit/routcustomer cubit/routcustomer_cubit.dart';
import '../controller/listview_rc_controller.dart';

class RoutCustomers extends StatelessWidget {
  const RoutCustomers({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => RoutcustomerCubit()),
      ],
      child: Scaffold(
        backgroundColor: ColorPalette.primaryBackground,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarGlobal(
            title: 'Clientes de ruta',
            iconButton: null,
            iconActions: [],
          ),
        ),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PluginsBar(listData: [
                ElementsBarModel(
                    text: null,
                    icon: const Icon(Icons.home),
                    action: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeView()));
                    }),
                ElementsBarModel(
                    text: null,
                    icon: const Icon(Icons.inventory),
                    action: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WarehouseMenuView()));
                    }),
                ElementsBarModel(
                    text: null,
                    icon: const Icon(Icons.note),
                    action: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SaleNoteView()));
                    })
              ]),
              ViewsBar(
                listData: [
                  ElementsBarModel(
                      icon: const Icon(Icons.house_siding),
                      text: 'Multialmacen',
                      action: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const WarehouseMenuView()));
                      }),
                  ElementsBarModel(
                      icon: const Icon(Icons.move_down),
                      text: 'Movimientos',
                      action: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MovementsView()));
                      }),
                  ElementsBarModel(
                      text: 'Productos',
                      icon: const Icon(Icons.grid_view_sharp),
                      action: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProductView()));
                      }),
                  ElementsBarModel(
                      text: 'Clientes de ruta',
                      icon: const Icon(Icons.people),
                      action: () {}),
                ],
              ),
              const Expanded(child: ListviewRcController()),
            ],
          ),
        ),
      ),
    );
  }
}
