import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:locky/backend.dart';

class Survey extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Column(
        children: <Widget>[
          Container(
            height: 350,
            child: SurveySwiper(),
          ),
          FractionallySizedBox(
            widthFactor: .8,
            child: Container(
              alignment: Alignment.topLeft,
              child: StreamBuilder<String>(
                stream: AppState.of(context).surveyQuestionCategory,
                builder: (context, surveyQuestionCategorySnapshot) {
                  if (!surveyQuestionCategorySnapshot.hasData)
                    return Container();
                  return AnimatedCrossFade(
                    sizeCurve: Curves.fastLinearToSlowEaseIn,
                    firstChild: Container(),
                    secondChild: Text(
                      surveyQuestionCategorySnapshot.data,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        letterSpacing: -2,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    duration: Duration(seconds: 2),
                    crossFadeState: CrossFadeState.showSecond,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SurveySwiper extends StatefulWidget {
  @override
  _SurveySwiperState createState() => _SurveySwiperState();
}

class _SurveySwiperState extends State<SurveySwiper> {
  int _subindex;

  @override
  void initState() {
    super.initState();
    _subindex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<int>>(
      stream: AppState.of(context).surveyAnswerWidgetsByIndex,
      builder: (context, surveyAnswerWidgetsByIndexSnapshot) {
        if (!surveyAnswerWidgetsByIndexSnapshot.hasData) return Container();
        return Swiper(
          itemCount: surveyAnswerWidgetsByIndexSnapshot.data.length,
          viewportFraction: .8,
          scale: .9,
          loop: false,
          onIndexChanged: (index) {
            AppState.of(context).appAction.add(
                  UpdateSurveyQuestionIndex(
                    index:
                        index < surveyAnswerWidgetsByIndexSnapshot.data.length
                            ? surveyAnswerWidgetsByIndexSnapshot.data[index]
                            : AppState.surveyQuestions.length,
                  ),
                );
            _subindex = index -
                AppState.of(context).surveyAnswerWidgetsByIndex.value.indexOf(
                    AppState.of(context)
                        .surveyAnswerWidgetsByIndex
                        .value[index]);
          },
          itemBuilder: (context, index) {
            if (AppState.surveyQuestions[
                    surveyAnswerWidgetsByIndexSnapshot.data[index]] !=
                'Submit')
              return Card(
                borderOnForeground: false,
                color: Colors.white,
                elevation: 12,
                margin: EdgeInsets.symmetric(
                  vertical: 36,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Container(
                  margin: EdgeInsets.only(
                    top: 24,
                    right: 24,
                    left: 24,
                    bottom: 18,
                  ),
                  child: Stack(
                    children: <Widget>[
                      Text(
                        AppState.surveyQuestions[
                            surveyAnswerWidgetsByIndexSnapshot.data[index]],
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 18,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Builder(
                          builder: (context) {
                            return _buildAnswerWidget(
                              surveyAnswerWidgetsByIndexSnapshot.data[index],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            return Card(
              borderOnForeground: false,
              color: Colors.white,
              elevation: 12,
              margin: EdgeInsets.symmetric(
                vertical: 36,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Container(
                margin: EdgeInsets.all(24),
                child: OutlineButton(
                  borderSide: BorderSide(
                    color: Colors.deepPurple,
                  ),
                  highlightedBorderColor: Colors.deepPurple,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.deepPurple.shade300,
                  onPressed: () {
                    AppState.of(context).appAction.add(SubmitSurveyAction());
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 18,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildAnswerWidget(int index) {
    final answerWidgets = <Widget>[
      AuraAnswerWidget(
        index: index,
        subindex: _subindex,
      ),
      ModalAnswerWidget(
        index: index,
      ),
      TimeOfDayAnswerWidget(
        index: index,
        prompt: 'I fell asleep at ...',
        yesterday: true,
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ThemedTitledSlider(
            initialValue: 0,
            divisions: 5,
            max: 5.0,
            min: 0.0,
            title: 'Times',
            index: index,
            labelInt: true,
          ),
        ],
      ),
      TimeOfDayAnswerWidget(
        index: index,
        prompt: 'I woke up at ...',
        yesterday: false,
      ),
      DurationAnswerWidget(
        index: index,
        prompt: 'I exercised for  ...',
      ),
      ModalAnswerWidget(
        index: index,
      ),
      ModalAnswerWidget(
        index: index,
      ),
      ModalAnswerWidget(
        index: index,
      ),
      DurationAnswerWidget(
        index: index,
        prompt: 'I spent  ...',
      ),
      DurationAnswerWidget(
        index: index,
        prompt: 'I spent  ...',
      ),
      AlcoholAnswerWidget(
        index: index,
        subindex: _subindex,
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ThemedTitledSlider(
            title: 'Edibles',
            divisions: 20,
            min: 0,
            max: 400,
            postfix: 'mg',
            index: index,
            initialValue: 0,
            labelInt: true,
          ),
          ThemedTitledSlider(
            title: 'Blunts',
            divisions: 10,
            min: 0,
            max: 5,
            index: index,
            initialValue: 0,
            labelInt: false,
          ),
          ThemedTitledSlider(
            title: 'Joints',
            divisions: 10,
            min: 0,
            max: 5,
            index: index,
            initialValue: 0,
            labelInt: false,
          ),
        ],
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ThemedTitledSlider(
            divisions: 20,
            min: 0,
            max: 60,
            title: 'Potency',
            postfix: 'mg/mL',
            index: index,
            initialValue: 0,
            labelInt: true,
          ),
          ThemedTitledSlider(
            divisions: 12,
            min: 0,
            max: 120,
            title: 'Duration',
            postfix: 'min',
            index: index,
            initialValue: 0,
            labelInt: true,
          ),
        ],
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ThemedTitledSlider(
            title: 'Cigarettes',
            divisions: 10,
            min: 0,
            max: 10,
            index: index,
            initialValue: 0,
            labelInt: true,
          ),
        ],
      ),
    ];
    assert(answerWidgets.length == AppState.surveyDefaultAnswers.length);
    return answerWidgets[index];
  }
}

class TimeOfDayAnswerWidget extends StatefulWidget {
  final String prompt;
  final int index;
  final bool yesterday;

  TimeOfDayAnswerWidget({
    Key key,
    @required String prompt,
    @required int index,
    @required bool yesterday,
  })  : assert(prompt != null),
        assert(index != null),
        assert(yesterday != null),
        this.prompt = prompt,
        this.index = index,
        this.yesterday = yesterday,
        super(key: key);

  @override
  _TimeOfDayAnswerWidgetState createState() => _TimeOfDayAnswerWidgetState();
}

class _TimeOfDayAnswerWidgetState extends State<TimeOfDayAnswerWidget> {
  bool _success;

  @override
  void initState() {
    super.initState();
    _success = false;
  }

  @override
  Widget build(BuildContext context) {
    return _success
        ? FlatButton(
            color: Colors.deepPurple,
            highlightColor: Colors.transparent,
            splashColor: Colors.white30,
            onPressed: () async {
              TimeOfDay timeOfDay = await showTimePicker(
                initialTime: TimeOfDay(
                  hour: TimeOfDay.now().hour,
                  minute: 0,
                ),
                context: context,
              );
              if (timeOfDay != null) {
                setState(() {
                  _success = true;
                });
                AppState.of(context).appAction.add(
                      UpdateSurveyAnswers(
                        surveyAnswers: AppState.of(context).surveyAnswers.value
                          ..update(
                            AppState.surveyQuestions[widget.index],
                            (Map<String, dynamic> old) {
                              return old
                                ..update(
                                  'ts',
                                  (old) {
                                    return (old as Map)
                                      ..update(
                                        'hours',
                                        (_) {
                                          return timeOfDay.hour;
                                        },
                                      )
                                      ..update(
                                        'minutes',
                                        (_) {
                                          return timeOfDay.minute;
                                        },
                                      )
                                      ..update(
                                        'yesterday',
                                        (_) {
                                          return widget.yesterday &&
                                                  timeOfDay.hour >= 12
                                              ? true
                                              : false;
                                        },
                                      );
                                  },
                                );
                            },
                          ),
                      ),
                    );
              } else
                setState(() {
                  _success = false;
                });
            },
            child: Text(
              widget.prompt,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        : OutlineButton(
            borderSide: BorderSide(
              color: Colors.deepPurple,
            ),
            highlightedBorderColor: Colors.deepPurple,
            highlightColor: Colors.transparent,
            splashColor: Colors.deepPurple.shade300,
            onPressed: () async {
              TimeOfDay timeOfDay = await showTimePicker(
                initialTime: TimeOfDay(
                  hour: TimeOfDay.now().hour,
                  minute: 0,
                ),
                context: context,
              );
              if (timeOfDay != null) {
                setState(() {
                  _success = true;
                });
                AppState.of(context).appAction.add(
                      UpdateSurveyAnswers(
                        surveyAnswers: AppState.of(context).surveyAnswers.value
                          ..update(
                            AppState.surveyQuestions[widget.index],
                            (Map<String, dynamic> old) {
                              return old
                                ..update(
                                  'ts',
                                  (old) {
                                    return (old as Map)
                                      ..update(
                                        'hours',
                                        (_) {
                                          return timeOfDay.hour;
                                        },
                                      )
                                      ..update(
                                        'minutes',
                                        (_) {
                                          return timeOfDay.minute;
                                        },
                                      )
                                      ..update(
                                        'yesterday',
                                        (_) {
                                          return widget.yesterday &&
                                                  timeOfDay.hour >= 12
                                              ? true
                                              : false;
                                        },
                                      );
                                  },
                                );
                            },
                          ),
                      ),
                    );
              } else
                setState(() {
                  _success = false;
                });
            },
            child: Text(
              widget.prompt,
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          );
  }
}

class DurationAnswerWidget extends StatefulWidget {
  final String prompt;
  final int index;

  DurationAnswerWidget({
    Key key,
    @required String prompt,
    @required int index,
  })  : assert(prompt != null),
        assert(index != null),
        this.prompt = prompt,
        this.index = index,
        super(key: key);

  @override
  _DurationAnswerWidgetState createState() => _DurationAnswerWidgetState();
}

class _DurationAnswerWidgetState extends State<DurationAnswerWidget> {
  bool _success;

  @override
  void initState() {
    super.initState();
    _success = false;
  }

  @override
  Widget build(BuildContext context) {
    return _success
        ? FlatButton(
            color: Colors.deepPurple,
            highlightColor: Colors.transparent,
            splashColor: Colors.white30,
            onPressed: () async {
              TimeOfDay timeOfDay = await showTimePicker(
                context: context,
                initialTime: TimeOfDay(hour: 0, minute: 0),
                builder: (BuildContext context, Widget child) {
                  return MediaQuery(
                    data: MediaQuery.of(context)
                        .copyWith(alwaysUse24HourFormat: true),
                    child: child,
                  );
                },
              );
              if (timeOfDay != null) {
                setState(() {
                  _success = true;
                });
                AppState.of(context).appAction.add(
                      UpdateSurveyAnswers(
                        surveyAnswers: AppState.of(context).surveyAnswers.value
                          ..update(
                            AppState.surveyQuestions[widget.index],
                            (Map<String, dynamic> old) {
                              return old
                                ..update(
                                  'duration',
                                  (old) {
                                    return (old as Map)
                                      ..update(
                                        'hours',
                                        (_) {
                                          return timeOfDay.hour;
                                        },
                                      )
                                      ..update(
                                        'minutes',
                                        (_) {
                                          return timeOfDay.minute;
                                        },
                                      );
                                  },
                                );
                            },
                          ),
                      ),
                    );
              } else
                setState(() {
                  _success = false;
                });
            },
            child: Text(
              widget.prompt,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        : OutlineButton(
            borderSide: BorderSide(
              color: Colors.deepPurple,
            ),
            highlightedBorderColor: Colors.deepPurple,
            highlightColor: Colors.transparent,
            splashColor: Colors.deepPurple.shade300,
            onPressed: () async {
              TimeOfDay timeOfDay = await showTimePicker(
                context: context,
                initialTime: TimeOfDay(hour: 0, minute: 0),
                builder: (BuildContext context, Widget child) {
                  return MediaQuery(
                    data: MediaQuery.of(context)
                        .copyWith(alwaysUse24HourFormat: true),
                    child: child,
                  );
                },
              );
              if (timeOfDay != null) {
                setState(() {
                  _success = true;
                });
                AppState.of(context).appAction.add(
                      UpdateSurveyAnswers(
                        surveyAnswers: AppState.of(context).surveyAnswers.value
                          ..update(
                            AppState.surveyQuestions[widget.index],
                            (Map<String, dynamic> old) {
                              return old
                                ..update(
                                  'duration',
                                  (old) {
                                    return (old as Map)
                                      ..update(
                                        'hours',
                                        (_) {
                                          return timeOfDay.hour;
                                        },
                                      )
                                      ..update(
                                        'minutes',
                                        (_) {
                                          return timeOfDay.minute;
                                        },
                                      );
                                  },
                                );
                            },
                          ),
                      ),
                    );
              } else
                setState(() {
                  _success = false;
                });
            },
            child: Text(
              widget.prompt,
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          );
  }
}

class ModalAnswerWidget extends StatefulWidget {
  final int index;

  ModalAnswerWidget({
    Key key,
    @required int index,
  })  : assert(index != null),
        this.index = index,
        super(key: key);

  @override
  _ModalAnswerWidgetState createState() => _ModalAnswerWidgetState();
}

class _ModalAnswerWidgetState extends State<ModalAnswerWidget> {
  bool _noToggle;
  bool _yesToggle;

  @override
  void initState() {
    super.initState();
    _noToggle = false;
    _yesToggle = false;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        _noToggle
            ? Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                child: FlatButton(
                  color: Colors.deepPurple,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.white30,
                  onPressed: () {
                    setState(() {
                      _noToggle = false;
                    });
                    AppState.of(context).appAction.add(
                          UpdateSurveyAnswers(
                            surveyAnswers:
                                AppState.of(context).surveyAnswers.value
                                  ..update(
                                    AppState.surveyQuestions[widget.index],
                                    (Map<String, dynamic> old) {
                                      return old
                                        ..update(
                                          'mode',
                                          (_) {
                                            return null;
                                          },
                                        );
                                    },
                                  ),
                          ),
                        );
                  },
                  child: Text(
                    'No',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              )
            : Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                child: FlatButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.deepPurple.shade300,
                  onPressed: () {
                    setState(() {
                      _noToggle = true;
                      _yesToggle = false;
                    });
                    AppState.of(context).appAction.add(
                          UpdateSurveyAnswers(
                            surveyAnswers:
                                AppState.of(context).surveyAnswers.value
                                  ..update(
                                    AppState.surveyQuestions[widget.index],
                                    (Map<String, dynamic> old) {
                                      return old
                                        ..update(
                                          'mode',
                                          (_) {
                                            return false;
                                          },
                                        );
                                    },
                                  ),
                          ),
                        );
                  },
                  child: Text(
                    'No',
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
        _yesToggle
            ? FlatButton(
                color: Colors.deepPurple,
                highlightColor: Colors.transparent,
                splashColor: Colors.white30,
                onPressed: () {
                  setState(() {
                    _yesToggle = false;
                  });
                  AppState.of(context).appAction.add(
                        UpdateSurveyAnswers(
                          surveyAnswers:
                              AppState.of(context).surveyAnswers.value
                                ..update(
                                  AppState.surveyQuestions[widget.index],
                                  (Map<String, dynamic> old) {
                                    return old
                                      ..update(
                                        'mode',
                                        (_) {
                                          return null;
                                        },
                                      );
                                  },
                                ),
                        ),
                      );
                },
                child: Text(
                  'Yes',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            : OutlineButton(
                borderSide: BorderSide(
                  color: Colors.deepPurple,
                ),
                highlightedBorderColor: Colors.deepPurple,
                highlightColor: Colors.transparent,
                splashColor: Colors.deepPurple.shade300,
                onPressed: () {
                  setState(() {
                    _noToggle = false;
                    _yesToggle = true;
                  });
                  AppState.of(context).appAction.add(
                        UpdateSurveyAnswers(
                          surveyAnswers:
                              AppState.of(context).surveyAnswers.value
                                ..update(
                                  AppState.surveyQuestions[widget.index],
                                  (Map<String, dynamic> old) {
                                    return old
                                      ..update(
                                        'mode',
                                        (_) {
                                          return true;
                                        },
                                      );
                                  },
                                ),
                        ),
                      );
                },
                child: Text(
                  'Yes',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
      ],
    );
  }
}

class AlcoholAnswerWidget extends StatefulWidget {
  final int index;
  final int subindex;

  AlcoholAnswerWidget({
    Key key,
    @required int index,
    @required int subindex,
  })  : assert(index != null),
        assert(subindex != null),
        this.index = index,
        this.subindex = subindex,
        super(key: key);

  @override
  _AlcoholAnswerWidgetState createState() => _AlcoholAnswerWidgetState();
}

class _AlcoholAnswerWidgetState extends State<AlcoholAnswerWidget> {
  double _alcoholByVolume;
  double _alcoholUnitSize;
  double _alcoholUnits;

  @override
  void initState() {
    super.initState();
    _alcoholByVolume = 5;
    _alcoholUnitSize = 300;
    _alcoholUnits = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            OutlineButton(
              borderSide: BorderSide(
                color: Colors.deepPurple,
              ),
              highlightedBorderColor: Colors.deepPurple,
              highlightColor: Colors.transparent,
              splashColor: Colors.deepPurple.shade300,
              onPressed: () {
                AppState.of(context).appAction.add(
                      UpdateSurveyAnswerWidgetsByIndex(
                        surveyQuestionWidgetsByIndex: AppState.of(context)
                            .surveyAnswerWidgetsByIndex
                            .value
                          ..add(widget.index),
                      ),
                    );
                AppState.of(context).appAction.add(
                      UpdateSurveyAnswers(
                        surveyAnswers: AppState.of(context).surveyAnswers.value
                          ..update(
                            AppState.surveyQuestions[widget.index],
                            (Map<String, dynamic> old) {
                              return old
                                ..update(
                                  'abv',
                                  (old) {
                                    return (old as List)
                                      ..add(
                                        (AppState.surveyDefaultAnswers[AppState
                                                    .surveyQuestions[
                                                widget.index]]['abv'] as List)
                                            .first,
                                      );
                                  },
                                )
                                ..update(
                                  'size',
                                  (old) {
                                    return (old as List)
                                      ..add(
                                        (AppState.surveyDefaultAnswers[AppState
                                                    .surveyQuestions[
                                                widget.index]]['size'] as List)
                                            .first,
                                      );
                                  },
                                )
                                ..update(
                                  'quantity',
                                  (old) {
                                    return (old as List)
                                      ..add(
                                        (AppState.surveyDefaultAnswers[
                                                    AppState.surveyQuestions[
                                                        widget.index]]
                                                ['quantity'] as List)
                                            .first,
                                      );
                                  },
                                );
                            },
                          ),
                      ),
                    );
              },
              child: Text(
                'Add entry',
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        TitledSlider(
          title: 'ABV',
          slider: Slider(
            value: _alcoholByVolume,
            label: () {
              if (_alcoholByVolume == 5) return 'Beer';
              if (_alcoholByVolume == 10) return 'Wine';
              if (_alcoholByVolume == 40) return 'Liquor';
              return '${_alcoholByVolume.toInt()}%';
            }(),
            min: 5,
            max: 40,
            activeColor: Colors.deepPurple,
            inactiveColor: Colors.white,
            divisions: 7,
            onChanged: (value) {
              setState(() {
                _alcoholByVolume = value;
                if (value == 5) _alcoholUnitSize = 300;
                if (value == 10) _alcoholUnitSize = 125;
                if (value == 40) _alcoholUnitSize = 25;
              });
            },
            onChangeEnd: (value) {
              AppState.of(context).appAction.add(
                    UpdateSurveyAnswers(
                      surveyAnswers: AppState.of(context).surveyAnswers.value
                        ..update(
                          AppState.surveyQuestions[widget.index],
                          (Map<String, dynamic> old) {
                            return old
                              ..update(
                                'abv',
                                (old) {
                                  (old as List)[widget.subindex] = value;
                                  return old;
                                },
                              );
                          },
                        ),
                    ),
                  );
            },
          ),
        ),
        TitledSlider(
          title: 'Size',
          slider: Slider(
            value: _alcoholUnitSize,
            label: () {
              if (_alcoholUnitSize == 300) return 'Beer bottle';
              if (_alcoholUnitSize == 125) return 'Wine glass';
              if (_alcoholUnitSize == 25) return 'Shot glass';
              return '${_alcoholUnitSize.toInt()} mL';
            }(),
            min: 25,
            max: 400,
            activeColor: Colors.deepPurple,
            inactiveColor: Colors.white,
            divisions: 15,
            onChanged: (value) {
              setState(() {
                _alcoholUnitSize = value;
                if (value == 300) _alcoholByVolume = 5;
                if (value == 125) _alcoholByVolume = 10;
                if (value == 25) _alcoholByVolume = 40;
              });
            },
            onChangeEnd: (value) {
              UpdateSurveyAnswers(
                surveyAnswers: AppState.of(context).surveyAnswers.value
                  ..update(
                    AppState.surveyQuestions[widget.index],
                    (Map<String, dynamic> old) {
                      return old
                        ..update(
                          'size',
                          (old) {
                            (old as List)[widget.subindex] = value;
                            return old;
                          },
                        );
                    },
                  ),
              );
            },
          ),
        ),
        TitledSlider(
          title: 'Quantity',
          slider: Slider(
            value: _alcoholUnits,
            label: () {
              if (_alcoholUnitSize == 300)
                return '${_alcoholUnits.toInt()} bottles';
              if (_alcoholUnitSize == 125 || _alcoholUnitSize == 25)
                return '${_alcoholUnits.toInt()} glasses';
              return '${_alcoholUnits.toInt()} units';
            }(),
            min: 0,
            max: 10,
            activeColor: Colors.deepPurple,
            inactiveColor: Colors.white,
            divisions: 10,
            onChanged: (value) {
              setState(() {
                _alcoholUnits = value;
              });
            },
            onChangeEnd: (value) {
              return UpdateSurveyAnswers(
                surveyAnswers: AppState.of(context).surveyAnswers.value
                  ..update(
                    AppState.surveyQuestions[widget.index],
                    (Map<String, dynamic> old) {
                      return old
                        ..update(
                          'quantity',
                          (old) {
                            (old as List)[widget.subindex] = value;
                            return old;
                          },
                        );
                    },
                  ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class TitledSlider extends StatelessWidget {
  final Slider slider;
  final String title;

  TitledSlider({
    Key key,
    @required Slider slider,
    @required String title,
  })  : assert(slider != null),
        assert(title != null),
        this.slider = slider,
        this.title = title,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            right: 6,
          ),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Expanded(
          child: slider,
        ),
      ],
    );
  }
}

class ThemedTitledSlider extends StatefulWidget {
  final double initialValue;
  final String title;
  final double min;
  final double max;
  final int divisions;
  final int index;
  final String postfix;
  final bool labelInt;

  ThemedTitledSlider({
    Key key,
    @required double initialValue,
    @required String title,
    @required double min,
    @required double max,
    @required int divisions,
    @required int index,
    @required bool labelInt,
    String postfix,
  })  : assert(initialValue != null),
        assert(title != null),
        assert(min != null),
        assert(max != null),
        assert(divisions != null),
        assert(index != null),
        assert(labelInt != null),
        this.initialValue = initialValue,
        this.title = title,
        this.min = min,
        this.max = max,
        this.divisions = divisions,
        this.index = index,
        this.postfix = postfix ?? '',
        this.labelInt = labelInt,
        super(key: key);

  @override
  _ThemedTitledSliderState createState() => _ThemedTitledSliderState();
}

class _ThemedTitledSliderState extends State<ThemedTitledSlider> {
  double _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return TitledSlider(
      title: widget.title,
      slider: Slider(
        value: _value,
        label: ('${widget.labelInt ? _value.toInt() : _value}' +
                ' ' +
                widget.postfix)
            .trim(),
        min: widget.min,
        max: widget.max,
        activeColor: Colors.deepPurple,
        inactiveColor: Colors.white,
        divisions: widget.divisions,
        onChanged: (value) {
          setState(() {
            _value = value;
          });
        },
        onChangeEnd: (value) {
          AppState.of(context).appAction.add(
                UpdateSurveyAnswers(
                  surveyAnswers: AppState.of(context).surveyAnswers.value
                    ..update(
                      AppState.surveyQuestions[widget.index],
                      (Map<String, dynamic> old) {
                        return old
                          ..update(
                            widget.title.toLowerCase(),
                            (_) {
                              return value;
                            },
                          );
                      },
                    ),
                ),
              );
        },
      ),
    );
  }
}

class AuraAnswerWidget extends StatefulWidget {
  final int index;
  final int subindex;

  AuraAnswerWidget({
    Key key,
    @required int index,
    @required int subindex,
  })  : assert(index != null),
        assert(subindex != null),
        this.index = index,
        this.subindex = subindex,
        super(key: key);

  @override
  _AuraAnswerWidgetState createState() => _AuraAnswerWidgetState();
}

class _AuraAnswerWidgetState extends State<AuraAnswerWidget> {
  bool _success;

  @override
  void initState() {
    super.initState();
    _success = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        OutlineButton(
          borderSide: BorderSide(
            color: Colors.deepPurple,
          ),
          highlightedBorderColor: Colors.deepPurple,
          highlightColor: Colors.transparent,
          splashColor: Colors.deepPurple.shade300,
          onPressed: () {
            AppState.of(context).appAction.add(
                  UpdateSurveyAnswerWidgetsByIndex(
                    surveyQuestionWidgetsByIndex:
                        AppState.of(context).surveyAnswerWidgetsByIndex.value
                          ..add(widget.index),
                  ),
                );
            AppState.of(context).appAction.add(
                  UpdateSurveyAnswers(
                    surveyAnswers: AppState.of(context).surveyAnswers.value
                      ..update(
                        AppState.surveyQuestions[widget.index],
                        (Map<String, dynamic> old) {
                          return old
                            ..update(
                              'ts',
                              (old) {
                                return (old as List)
                                  ..add((AppState.surveyDefaultAnswers[AppState
                                              .surveyQuestions[widget.index]]
                                          ['ts'] as List)
                                      .first);
                              },
                            );
                        },
                      ),
                  ),
                );
          },
          child: Text(
            'Add entry',
            style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        _success
            ? FlatButton(
                color: Colors.deepPurple,
                highlightColor: Colors.transparent,
                splashColor: Colors.white30,
                onPressed: () async {
                  DateTime dateTime = AppState.of(context)
                          .surveyAnswers
                          .value[AppState.surveyQuestions[widget.index]]['ts']
                      [widget.subindex];
                  TimeOfDay old = dateTime == null
                      ? null
                      : TimeOfDay.fromDateTime(dateTime);
                  TimeOfDay timeOfDay = await showTimePicker(
                    initialTime: old ??
                        TimeOfDay(
                          hour: TimeOfDay.now().hour,
                          minute: 0,
                        ),
                    context: context,
                  );
                  if (timeOfDay != null) {
                    setState(() {
                      _success = true;
                    });
                    DateTime referenceDateTime = DateTime.now();
                    AppState.of(context).appAction.add(
                          UpdateSurveyAnswers(
                            surveyAnswers:
                                AppState.of(context).surveyAnswers.value
                                  ..update(
                                    AppState.surveyQuestions[widget.index],
                                    (Map<String, dynamic> old) {
                                      return old
                                        ..update(
                                          'ts',
                                          (old) {
                                            (old as List)[widget.subindex] =
                                                DateTime(
                                              referenceDateTime.year,
                                              referenceDateTime.month,
                                              referenceDateTime.day,
                                              timeOfDay.hour,
                                              timeOfDay.minute,
                                            );
                                            return old;
                                          },
                                        );
                                    },
                                  ),
                          ),
                        );
                  } else
                    setState(() {
                      _success = false;
                    });
                },
                child: Text(
                  'I had an aura at ...',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            : OutlineButton(
                borderSide: BorderSide(
                  color: Colors.deepPurple,
                ),
                highlightedBorderColor: Colors.deepPurple,
                highlightColor: Colors.transparent,
                splashColor: Colors.deepPurple.shade300,
                onPressed: () async {
                  DateTime dateTime = AppState.of(context)
                          .surveyAnswers
                          .value[AppState.surveyQuestions[widget.index]]['ts']
                      [widget.subindex];
                  TimeOfDay old = dateTime == null
                      ? null
                      : TimeOfDay.fromDateTime(dateTime);
                  TimeOfDay timeOfDay = await showTimePicker(
                    initialTime: old ??
                        TimeOfDay(
                          hour: TimeOfDay.now().hour,
                          minute: 0,
                        ),
                    context: context,
                  );
                  if (timeOfDay != null) {
                    setState(() {
                      _success = true;
                    });
                    DateTime referenceDateTime = DateTime.now();
                    AppState.of(context).appAction.add(
                          UpdateSurveyAnswers(
                            surveyAnswers:
                                AppState.of(context).surveyAnswers.value
                                  ..update(
                                    AppState.surveyQuestions[widget.index],
                                    (Map<String, dynamic> old) {
                                      return old
                                        ..update(
                                          'ts',
                                          (old) {
                                            (old as List)[widget.subindex] =
                                                DateTime(
                                              referenceDateTime.year,
                                              referenceDateTime.month,
                                              referenceDateTime.day,
                                              timeOfDay.hour,
                                              timeOfDay.minute,
                                            );
                                            return old;
                                          },
                                        );
                                    },
                                  ),
                          ),
                        );
                  } else
                    setState(() {
                      _success = false;
                    });
                },
                child: Text(
                  'I had an aura at ...',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
      ],
    );
  }
}
