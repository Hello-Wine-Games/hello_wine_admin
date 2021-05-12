import 'package:flutter/material.dart';
import 'package:hello_wine_admin/UI/HWTheme.dart';
import 'package:hello_wine_admin/UI/images.dart';
import 'package:hello_wine_admin/app/admin/widgets/widgets.dart';

class Categories extends StatelessWidget {
  Categories({required this.categoriesChange});

  final Function(String) categoriesChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: HWTheme.burgundy,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: MenuButton(
                icon: HWImages.barrelIcon(color: Colors.white),
                isSelected: true,
                onPressed: () {
                  categoriesChange('Everything But The Grape');
                },
              ),
            ),
            Expanded(
              child: MenuButton(
                icon: HWImages.grapesIcon(color: Colors.white),
                isSelected: false,
                onPressed: () {
                  categoriesChange('Michigan Wine');
                },
              ),
            ),
            Expanded(
              child: MenuButton(
                icon: HWImages.corkIcon(color: Colors.white),
                isSelected: false,
                onPressed: () {
                  categoriesChange('Michigan Wine');
                },
              ),
            ),
            Expanded(
              child: MenuButton(
                icon: HWImages.foodIcon(color: Colors.white),
                isSelected: false,
                onPressed: () {
                  categoriesChange('Michigan Wine');
                },
              ),
            ),
            Expanded(
              child: MenuButton(
                icon: HWImages.globeIcon(color: Colors.white),
                isSelected: false,
                onPressed: () {
                  categoriesChange('Michigan Wine');
                },
              ),
            ),
            Expanded(
              child: MenuButton(
                icon: HWImages.towerIcon(color: Colors.white),
                isSelected: false,
                onPressed: () {
                  categoriesChange('Michigan Wine');
                },
              ),
            ),
            Expanded(
              child: MenuButton(
                icon: HWImages.questionIcon(color: Colors.white),
                isSelected: false,
                onPressed: () {
                  categoriesChange('Michigan Wine');
                },
              ),
            ),
            Expanded(
              child: MenuButton(
                icon: HWImages.stateIcon(color: Colors.white),
                isSelected: false,
                onPressed: () {
                  categoriesChange('Michigan Wine');
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    categoriesChange('Everything But The Grape');
                  },
                  child: Text('Everything But The Grape'),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    categoriesChange('Michigan Wine');
                  },
                  child: Text('Michigan Wine'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
