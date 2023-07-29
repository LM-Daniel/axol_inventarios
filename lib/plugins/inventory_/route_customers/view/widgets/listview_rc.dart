import 'package:flutter/material.dart';

import '../../../../../models/textfield_model.dart';
import '../../../../../settings/theme.dart';
import '../../model/routcustomer_model.dart';
import 'finder_rc.dart';
import 'toolbar_rc.dart';

class ListviewRc extends StatelessWidget {
  final List<RoutcustomerModel> listData;
  final TextfieldModel finder;

  const ListviewRc({super.key, required this.finder, required this.listData});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              FinderRc(
                currentFinder: finder,
                isLoading: false,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                    child: Center(
                        child: Text(
                      'Id',
                      style: Typo.bodyText5,
                    )),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                        child: Text(
                      'Nombre',
                      style: Typo.bodyText5,
                    )),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                        child: Text(
                      'Ubicación',
                      style: Typo.bodyText5,
                    )),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                        child: Text(
                      'Direción',
                      style: Typo.bodyText5,
                    )),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                        child: Text(
                      'Estado',
                      style: Typo.bodyText5,
                    )),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: listData.length,
                  itemBuilder: (context, index) {
                    final rcRow = listData[index];

                    return Container(
                      height: 30,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black45)),
                      child: OutlinedButton(
                        onPressed: () {
                          /*showDialog(
                            context: context,
                            builder: (context) =>
                                DrawerDetailsProduct(product: productRow),
                          );*/
                        },
                        child: Row(
                          children: [
                            Expanded(
                              //1) ID
                              flex: 1,
                              child: Center(
                                child: Text(
                                  rcRow.id.toString(),
                                  style: Typo.labelText1,
                                ),
                              ),
                            ),
                            Expanded(
                              // 2) Nombre
                              flex: 1,
                              child: Center(
                                child: Text(
                                  rcRow.name,
                                  style: Typo.labelText1,
                                ),
                              ),
                            ),
                            Expanded(
                              // 3) Ubicación
                              flex: 1,
                              child: Center(
                                child: Text(
                                  rcRow.location,
                                  style: Typo.labelText1,
                                ),
                              ),
                            ),
                            Expanded(
                              // 4) Dirección
                              flex: 1,
                              child: Center(
                                child: Text(
                                  '${rcRow.address[RoutcustomerModel.pAddress]}, ${rcRow.address[RoutcustomerModel.pHood]}, ${rcRow.address[RoutcustomerModel.pTown]}, ${rcRow.address[RoutcustomerModel.pCountry]}',
                                  style: Typo.labelText1,
                                ),
                              ),
                            ),
                            Expanded(
                              // 5) Estado
                              flex: 1,
                              child: Center(
                                  child: rcRow.validation[
                                              RoutcustomerModel.pStatus] ==
                                          true
                                      ? const Icon(Icons
                                          .check_box_outline_blank_outlined)
                                      : const Icon(Icons.check_box_outlined)),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        const ToolbarRc(
          isLoading: false,
        ),
      ],
    );
  }
}
