import 'package:flutter/material.dart';
import 'package:spotify_quiz/custom_widgets/text.dart';
import 'package:spotify_quiz/eventsPage/view/events_page_view.dart';
import 'package:spotify_quiz/rankingPage/ranking_page_view.dart';
import 'package:spotify_quiz/utility/utilities.dart' as utilities;

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../utility/transitions.dart';

// ignore: must_be_immutable
class CustomButtonsHome extends StatefulWidget {
  const CustomButtonsHome({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomButtonsHome> createState() => _CustomButtonsHomeState();
}

class _CustomButtonsHomeState extends State<CustomButtonsHome> {
  bool _tapped1 = false;
  bool _tapped2 = false;
  final animationDuration = const Duration(milliseconds: 50);

  @override
  void initState() {
    super.initState();
    _tapped1 = false;
    _tapped2 = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 16),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  heroTag: null,
                  backgroundColor: _tapped1
                      ? utilities.primaryColor
                      : utilities.tertiaryColor,
                  foregroundColor: utilities.secondaryColor,
                  onPressed: () {
                    setState(() {
                      _tapped1 = true;
                    });
                    Future.delayed(animationDuration).then((_) => {
                          Navigator.push(
                            context,
                            SlideRightRoute(
                              page: const RankingPage(),
                            ),
                          ).then(
                            (value) => setState(() {
                              _tapped1 = false;
                            }),
                          ),
                        });
                  },
                  child: const Icon(Icons.emoji_events_outlined),
                ),
                CustomText(
                  text: AppLocalizations.of(context)!.ranking,
                  size: 20.0,
                  thirdColor: !_tapped1,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  heroTag: null,
                  backgroundColor: _tapped2
                      ? utilities.primaryColor
                      : utilities.tertiaryColor,
                  foregroundColor: utilities.secondaryColor,
                  onPressed: () {
                    setState(() {
                      _tapped2 = true;
                    });
                    Future.delayed(animationDuration).then((_) => {
                          Navigator.push(
                            context,
                            SlideLeftRoute(
                              page: const EventsPage(),
                            ),
                          ).then(
                            (value) => setState(() {
                              _tapped2 = false;
                            }),
                          ),
                        });
                  },
                  child: const Icon(Icons.star_outline_sharp),
                ),
                CustomText(
                  text: AppLocalizations.of(context)!.events,
                  size: 20.0,
                  thirdColor: !_tapped2,
                ),
              ],
            ),
            const SizedBox(width: 16),
          ],
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
/*class CustomButtonsQuiz extends StatelessWidget {
  void Function(dynamic context)? firstButtonPressed;
  void Function(dynamic context)? secondButtonPressed;

  CustomButtonsQuiz({
    Key? key,
    required this.firstButtonPressed,
    required this.secondButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 16),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  heroTag: null,
                  backgroundColor: utilities.primaryColor,
                  foregroundColor: utilities.secondaryColor,
                  onPressed: () {
                    firstButtonPressed!(context);
                  },
                  child: const Icon(Icons.home),
                ),
                CustomText(
                  text: "Return",
                  size: 20.0,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  heroTag: null,
                  backgroundColor: utilities.primaryColor,
                  foregroundColor: utilities.secondaryColor,
                  onPressed: () {
                    secondButtonPressed!(context);
                  },
                  child: const Icon(Icons.arrow_forward_rounded),
                ),
                CustomText(
                  text: "Continue",
                  size: 20.0,
                ),
              ],
            ),
            const SizedBox(width: 16),
          ],
        ),
      ],
    );
  }
}
*/