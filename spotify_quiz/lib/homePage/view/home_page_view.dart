import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_quiz/eventsPage/view/events_page_view.dart';
import 'package:spotify_quiz/homePage/view/home_screen.dart';
import 'package:spotify_quiz/homePage/view/quiz_screen.dart';
import 'package:spotify_quiz/rankingPage/ranking_page_view.dart';
import 'package:spotify_quiz/repositories/user/user_repository.dart';
import 'package:spotify_quiz/user/bloc/user_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  static Route<void> route() {
    return MaterialPageRoute<void>(
        builder: (_) => const MyHomePage(title: "Ciao"));
  }

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

/*
 TO DEBUG FIREBASE FUNCTIONALITIES

  void _createUser(context) {
    BlocProvider.of<UserBloc>(context)
        .add(Create("mench", "Ursula", 1, 1, 1, 1));
  }

  void _getUsers(context) {
    BlocProvider.of<UserBloc>(context).add(GetDataByID("mench"));
  }
*/

  void _goToRankingPage(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const RankingPage(),
      ),
    );
  }

  void _goToEventPage(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EventsPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => UserRepository(),
      child: BlocProvider(
        create: (context) => UserBloc(
          userRepository: RepositoryProvider.of<UserRepository>(context),
        ),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is InitialState ||
                state is UserAdded ||
                state is UserNotFound ||
                state is UserLoaded) {
              //IF USERS ARE CORRECTLY LOADED
              return _selectedIndex == 0
                  ? HomeScreen(
                      firstButtonPressed: _goToRankingPage,
                      secondButtonPressed: _goToEventPage,
                      onItemTapped: _onItemTapped,
                      selectedIndex: _selectedIndex)
                  : QuizScreen(
                      onItemTapped: _onItemTapped,
                      selectedIndex: _selectedIndex,
                    );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
