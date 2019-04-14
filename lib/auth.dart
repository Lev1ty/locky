import 'package:flutter/material.dart';
import 'package:locky/backend.dart';

class Auth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Form(
          child: Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(
                  top: 128,
                ),
                child: Column(
                  children: <Widget>[
                    FractionallySizedBox(
                      widthFactor: .25,
                      child: Hero(
                        tag: 'logo',
                        child: Image.asset(
                          'images/logo.png',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Hero(
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
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(
                  bottom: 64,
                ),
                child: OutlineButton(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                  highlightedBorderColor: Colors.white,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.white30,
                  onPressed: () {
                    AppState.of(context).appAction.add(GoogleSignInAction());
                    AppState.of(context).firebaseUser.listen(
                      (FirebaseUser firebaseUser) {
                        Navigator.of(context).pushReplacementNamed('/feed');
                      },
                    );
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
