import 'package:flutter/material.dart';
import 'package:locky/auth.dart';
import 'package:locky/backend.dart';
import 'package:locky/feed.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppState(
      appAction: BehaviorSubject<AppAction>(),
      googleSignInAccount: BehaviorSubject<GoogleSignInAccount>(),
      firebaseUser: BehaviorSubject<FirebaseUser>(),
      authCredential: BehaviorSubject<AuthCredential>(),
      surveyQuestionIndex: BehaviorSubject<int>.seeded(0),
      surveyQuestionCategory: BehaviorSubject<String>(),
      surveyAnswerWidgetsByIndex: BehaviorSubject<List<int>>.seeded(
        List.generate(
          AppState.surveyQuestions.length,
          (index) {
            return index;
          },
        ),
      ),
      surveyAnswers: BehaviorSubject<Map<String, Map<String, dynamic>>>.seeded(
          AppState.surveyDefaultAnswers),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'AuraIntel',
        routes: <String, WidgetBuilder>{
          '/': (context) {
            return Auth();
          },
          '/feed': (context) {
            return Feed();
          },
        },
      ),
    );
  }
}
