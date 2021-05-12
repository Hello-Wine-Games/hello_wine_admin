import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hello_wine_admin/UI/HWTheme.dart';

class AdminQuestions extends StatelessWidget {
  const AdminQuestions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: add bool to selected and unselected
    return Expanded(
      flex: 4,
      child: Container(
        color: HWTheme.background,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 115,
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: HWTheme.grayOutline,
                      ),
                      color: Colors.white,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Parings, Tastings, and Notes',
                          style: HWTheme.lightTheme.textTheme.headline5
                              ?.copyWith(fontSize: 20),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Questions (44)',
                              style: HWTheme.lightTheme.textTheme.headline5
                                  ?.copyWith(
                                      fontSize: 20, color: HWTheme.darkGray),
                            ),
                            RawMaterialButton(
                              onPressed: () {},
                              elevation: 2.0,
                              fillColor: HWTheme.burgundy,
                              padding: const EdgeInsets.all(10.0),
                              shape: const CircleBorder(),
                              child: const Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const PointsHeader(
                  points: '500pts',
                ),
                const PointsHeader(
                  points: '400pts',
                ),
                const PointsHeader(
                  points: '300pts',
                ),
                const PointsHeader(
                  points: '200pts',
                ),
                const PointsHeader(
                  points: '100pts',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PointsHeader extends StatelessWidget {
  const PointsHeader({
    Key? key,
    required this.points,
  }) : super(key: key);

  final String points;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              points,
              style: HWTheme.lightTheme.textTheme.headline5
                  ?.copyWith(fontSize: 24, color: HWTheme.darkGray),
            ),
            const Divider(
              //height: 8,
              thickness: 4,
              color: HWTheme.darkGray,
            ),
          ],
        ),
      ),
    );
  }
}
