import 'package:flutter/material.dart';
import 'package:locky/backend.dart';
import 'package:locky/history.dart';
import 'package:locky/survey.dart';

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            leading: Padding(
              padding: EdgeInsets.all(10),
              child: Hero(
                tag: 'logo',
                child: Image.asset('images/logo.png'),
              ),
            ),
            title: Hero(
              tag: 'AuraIntel',
              child: Material(
                color: Colors.transparent,
                child: Text(
                  'AuraIntel',
                  style: TextStyle(
                    fontSize: 48,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.deepPurple,
            pinned: true,
            elevation: 12,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                FractionallySizedBox(
                  widthFactor: .8,
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 36,
                    ),
                    child: Text(
                      "Hello ${AppState.of(context).firebaseUser.value?.displayName?.split(' ')?.first}! Let's take some time to reflect on your day.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
                Survey(),
                StreamBuilder<QuerySnapshot>(
                  stream: Firestore.instance
                      .collection('surveys')
                      .where('uid',
                          isEqualTo:
                              AppState.of(context).firebaseUser.value.uid)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return Container();
                    if (snapshot.data.documents.isEmpty) return Container();
                    return History();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
