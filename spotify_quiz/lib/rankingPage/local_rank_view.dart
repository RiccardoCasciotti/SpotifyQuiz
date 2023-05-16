import 'package:flutter/material.dart';
import 'package:spotify_quiz/custom_widgets/text.dart';
import 'package:spotify_quiz/models/user.dart';
import 'package:spotify_quiz/utility/utilities.dart' as utilities;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_quiz/authentication/bloc/authentication_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../custom_widgets/bottom_nav_bar.dart';

class LocalRankScreen extends StatelessWidget {
  final void Function(int)? onItemTapped;
  final int selectedIndex;

  const LocalRankScreen({
    Key? key,
    required this.onItemTapped,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rows = <TableRow>[];

    for (User user in context.read<AuthenticationBloc>().userByNation) {
      rows.add(
        TableRow(
          children: <Widget>[
            CustomText(
              alignCenter: true,
              text: user.username,
              thirdColor: true,
              size: 18,
            ),
            CustomText(
              alignCenter: true,
              text: user.level.toString(),
              size: 18,
              thirdColor: true,
              bold: true,
            ),
            CustomText(
              alignCenter: true,
              text: user.bestScore.toString(),
              size: 18,
              bold: true,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: utilities.secondaryColor,
        foregroundColor: utilities.primaryColor,
        elevation: 0.0,
        title: Text(AppLocalizations.of(context)!.gobackbutton),
      ),
      backgroundColor: utilities.secondaryColor,
      body: Center(
        child: Column(
          children: [
            Flexible(
              flex: 4,
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: double.infinity,
                child: CustomText(
                  text: AppLocalizations.of(context)!.localranking,
                  size: 30,
                  bold: true,
                  thirdColor: true,
                ),
              ),
            ),
            const Flexible(
              flex: 1,
              child: SizedBox(
                height: 50,
              ),
            ),
            Flexible(
              flex: 16,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        color: utilities.tertiaryColor,
                        style: BorderStyle.solid,
                        width: 0.1,
                      ),
                      shape: BoxShape.rectangle),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Table(
                        border: TableBorder.symmetric(),
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        children: <TableRow>[
                          TableRow(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.center,
                                child: CustomText(
                                  text: AppLocalizations.of(context)!
                                      .usernameranking,
                                  thirdColor: true,
                                  size: 18,
                                  bold: true,
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: CustomText(
                                  text: AppLocalizations.of(context)!.level,
                                  thirdColor: true,
                                  size: 18,
                                  bold: true,
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: CustomText(
                                  text: AppLocalizations.of(context)!
                                      .bestscoreranking,
                                  thirdColor: true,
                                  size: 18,
                                  bold: true,
                                ),
                              ),
                            ],
                          ),
                          const TableRow(
                            children: <Widget>[
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                          for (TableRow row in rows) row
                        ],
                        defaultColumnWidth: const FlexColumnWidth(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBarRanking(
        selectedIndex: selectedIndex,
        onItemTapped: onItemTapped,
      ),
    );
  }
}
