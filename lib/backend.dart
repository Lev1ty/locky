import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rxdart/rxdart.dart';

export 'package:cloud_firestore/cloud_firestore.dart';
export 'package:firebase_auth/firebase_auth.dart';
export 'package:google_sign_in/google_sign_in.dart';
export 'package:rxdart/rxdart.dart';

class AppState extends InheritedWidget {
  static Map<String, Map<String, dynamic>> surveyDefaultAnswers =
      Map<String, Map<String, dynamic>>.fromIterables(
    List<String>.from(AppState.surveyQuestions)..removeLast(),
    <Map<String, dynamic>>{
      <String, dynamic>{
        'ts': <DateTime>[null],
      },
      <String, dynamic>{
        'mode': null,
      },
      <String, dynamic>{
        'ts': <String, dynamic>{
          'hours': null,
          'minutes': null,
          'yesterday': true,
        },
      },
      <String, dynamic>{
        'times': 0,
      },
      <String, dynamic>{
        'ts': <String, dynamic>{
          'hours': null,
          'minutes': null,
          'yesterday': false,
        },
      },
      <String, dynamic>{
        'duration': <String, int>{
          'hours': 0,
          'minutes': 0,
        },
      },
      <String, dynamic>{
        'mode': null,
      },
      <String, dynamic>{
        'mode': null,
      },
      <String, dynamic>{
        'mode': null,
      },
      <String, dynamic>{
        'duration': <String, int>{
          'hours': 0,
          'minutes': 0,
        },
      },
      <String, dynamic>{
        'duration': <String, int>{
          'hours': 0,
          'minutes': 0,
        },
      },
      <String, dynamic>{
        'abv': <double>[5],
        'size': <double>[300],
        'quantity': <double>[0],
      },
      <String, dynamic>{
        'edibles': 0,
        'blunts': 0,
        'joints': 0,
      },
      <String, dynamic>{
        'potency': 0,
        'duration': 0,
      },
      <String, dynamic>{
        'cigarettes': 0,
      },
    },
  );

  static const surveyQuestions = <String>[
    'When did you have an aura?',
    'Did you take your medication?',
    'When did you fall asleep last night?',
    'How many times did you wake up in-between sleeping?',
    'When did you wake up this morning?',
    'How long did you exercise?',
    'Did you eat breakfast?',
    'Did you eat lunch?',
    'Did you eat dinner?',
    'How long did you spend in class?',
    'How long did you spend on homework?',
    'How much alcohol did you drink?',
    'How much cannabis did you consume?',
    'How much nicotine did you vape?',
    'How much tobacco did you smoke?',
    'Submit',
  ];

  static const surveyCategories = <String>[
    'Therapy',
    'Therapy',
    'Sleep',
    'Sleep',
    'Sleep',
    'Health',
    'Health',
    'Health',
    'Health',
    'School',
    'School',
    'Leisure',
    'Leisure',
    'Leisure',
    'Leisure',
    'Pull up to review.',
  ];

  final BehaviorSubject<AppAction> appAction;
  final BehaviorSubject<GoogleSignInAccount> googleSignInAccount;
  final BehaviorSubject<FirebaseUser> firebaseUser;
  final BehaviorSubject<AuthCredential> authCredential;
  final BehaviorSubject<int> surveyQuestionIndex;
  final BehaviorSubject<String> surveyQuestionCategory;
  final BehaviorSubject<List<int>> surveyAnswerWidgetsByIndex;
  final BehaviorSubject<Map<String, Map<String, dynamic>>> surveyAnswers;

  AppState({
    Key key,
    @required BehaviorSubject<AppAction> appAction,
    @required BehaviorSubject<GoogleSignInAccount> googleSignInAccount,
    @required BehaviorSubject<FirebaseUser> firebaseUser,
    @required BehaviorSubject<AuthCredential> authCredential,
    @required BehaviorSubject<int> surveyQuestionIndex,
    @required BehaviorSubject<String> surveyQuestionCategory,
    @required BehaviorSubject<List<int>> surveyAnswerWidgetsByIndex,
    @required BehaviorSubject<Map<String, Map<String, dynamic>>> surveyAnswers,
    @required Widget child,
  })  : assert(appAction != null),
        assert(googleSignInAccount != null),
        assert(firebaseUser != null),
        assert(authCredential != null),
        assert(surveyQuestionIndex != null),
        assert(surveyQuestionCategory != null),
        assert(surveyAnswerWidgetsByIndex != null),
        assert(surveyAnswers != null),
        assert(child != null),
        this.appAction = appAction,
        this.googleSignInAccount = googleSignInAccount,
        this.firebaseUser = firebaseUser,
        this.authCredential = authCredential,
        this.surveyQuestionIndex = surveyQuestionIndex,
        this.surveyQuestionCategory = surveyQuestionCategory,
        this.surveyAnswerWidgetsByIndex = surveyAnswerWidgetsByIndex,
        this.surveyAnswers = surveyAnswers,
        super(key: key, child: child) {
    assert(AppState.surveyCategories.length == AppState.surveyQuestions.length);
    assert(AppState.surveyCategories.length - 1 ==
        AppState.surveyDefaultAnswers.length);
    appAction.listen(
      (AppAction appAction) async {
        if (appAction is GoogleSignInAction) {
          await GoogleSignIn().signOut();
          googleSignInAccount.add(await GoogleSignIn().signIn());
        }
        if (appAction is UpdateSurveyQuestionIndex) {
          surveyQuestionIndex.add(appAction.index);
        }
        if (appAction is UpdateSurveyAnswerWidgetsByIndex) {
          surveyAnswerWidgetsByIndex
              .add(appAction.surveyQuestionWidgetsByIndex..sort());
        }
        if (appAction is UpdateSurveyAnswers) {
          surveyAnswers.add(appAction.surveyAnswers);
        }
        if (appAction is SubmitSurveyAction) {
          await Firestore.instance.collection('surveys').add(
            <String, dynamic>{
              'ts': DateTime.now(),
              'uid': firebaseUser.value.uid,
              'survey': surveyAnswers.value,
            },
          );
          surveyAnswers.add(AppState.surveyDefaultAnswers);
        }
      },
    );
    googleSignInAccount.listen(
      (GoogleSignInAccount googleSignInAccount) async {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        authCredential.add(
          GoogleAuthProvider.getCredential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken,
          ),
        );
      },
    );
    authCredential.listen(
      (AuthCredential authCredential) async {
        firebaseUser.add(
          await FirebaseAuth.instance.signInWithCredential(authCredential),
        );
      },
    );
    firebaseUser.listen(
      (FirebaseUser firebaseUser) async {
        Firestore.instance
            .collection('users')
            .document(firebaseUser.uid)
            .setData(
          <String, dynamic>{
            'ts': DateTime.now(),
          },
          merge: true,
        );
      },
    );
    surveyQuestionIndex.listen(
      (int index) {
        surveyQuestionCategory.add(AppState.surveyCategories[index]);
      },
    );
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return oldWidget != this;
  }

  static AppState of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(AppState) as AppState;
  }
}

class AppAction {}

class GoogleSignInAction extends AppAction {}

class UpdateSurveyQuestionIndex extends AppAction {
  final int index;

  UpdateSurveyQuestionIndex({
    @required int index,
  })  : assert(index != null),
        this.index = index;
}

class UpdateSurveyAnswerWidgetsByIndex extends AppAction {
  final List<int> surveyQuestionWidgetsByIndex;

  UpdateSurveyAnswerWidgetsByIndex({
    @required List<int> surveyQuestionWidgetsByIndex,
  })  : assert(surveyQuestionWidgetsByIndex != null),
        this.surveyQuestionWidgetsByIndex = surveyQuestionWidgetsByIndex;
}

class UpdateSurveyAnswers extends AppAction {
  final Map<String, Map<String, dynamic>> surveyAnswers;

  UpdateSurveyAnswers({
    @required Map<String, Map<String, dynamic>> surveyAnswers,
  })  : assert(surveyAnswers != null),
        this.surveyAnswers = surveyAnswers;
}

class SubmitSurveyAction extends AppAction {}
