import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_wine_admin/UI/ui.dart';

import '../../categories/categories.dart';
import '../widgets/widgets.dart';

class Categories extends StatelessWidget {
  Categories({required this.categoriesChange});

  final Function(String) categoriesChange;

  @override
  Widget build(BuildContext context) {
    final stateCategory = context.watch<CategoriesCubit>().state.category;
    return Container(
      color: HWTheme.burgundy,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: MenuButton(
                icon: HWImages.barrelIcon(color: Colors.white),
                isSelected: 'Winemaking Process' == stateCategory,
                onPressed: () {
                  categoriesChange('Winemaking Process');
                },
              ),
            ),
            Expanded(
              child: MenuButton(
                icon: HWImages.grapesIcon(color: Colors.white),
                isSelected: 'Varietal Facts' == stateCategory,
                onPressed: () {
                  categoriesChange('Varietal Facts');
                },
              ),
            ),
            Expanded(
              child: MenuButton(
                icon: HWImages.corkIcon(color: Colors.white),
                isSelected: 'Everything But The Grape' == stateCategory,
                onPressed: () {
                  categoriesChange('Everything But The Grape');
                },
              ),
            ),
            Expanded(
              child: MenuButton(
                icon: HWImages.foodIcon(color: Colors.white),
                isSelected: 'Pairings, Tastings, and Notes' == stateCategory,
                onPressed: () {
                  categoriesChange('Pairings, Tastings, and Notes');
                },
              ),
            ),
            Expanded(
              child: MenuButton(
                icon: HWImages.globeIcon(color: Colors.white),
                isSelected: 'Geography' == stateCategory,
                onPressed: () {
                  categoriesChange('Geography');
                },
              ),
            ),
            Expanded(
              child: MenuButton(
                icon: HWImages.towerIcon(color: Colors.white),
                isSelected: 'Fortified Wine' == stateCategory,
                onPressed: () {
                  categoriesChange('Fortified Wine');
                },
              ),
            ),
            Expanded(
              child: MenuButton(
                icon: HWImages.questionIcon(color: Colors.white),
                isSelected: 'Random Wine Facts' == stateCategory,
                onPressed: () {
                  categoriesChange('Random Wine Facts');
                },
              ),
            ),
            Expanded(
              child: MenuButton(
                icon: HWImages.stateIcon(color: Colors.white),
                isSelected: 'Michigan Wine' == stateCategory,
                onPressed: () {
                  categoriesChange('Michigan Wine');
                },
              ),
            ),
            // Expanded(
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: ElevatedButton(
            //       onPressed: () {
            //         categoriesChange('Everything But The Grape');
            //       },
            //       child: Text('Everything But The Grape'),
            //     ),
            //   ),
            // ),
            // Expanded(
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: ElevatedButton(
            //       onPressed: () {
            //         categoriesChange('Michigan Wine');
            //       },
            //       child: Text('Michigan Wine'),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
