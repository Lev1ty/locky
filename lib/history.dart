import 'dart:math';
import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:locky/backend.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  bool _auraSeries;
  bool _medicationSeries;
  bool _sleepSeries;
  bool _wakeSeries;
  bool _wakeTweenSeries;
  bool _exerciseSeries;
  bool _breakfastSeries;
  bool _lunchSeries;
  bool _dinnerSeries;
  bool _classSeries;
  bool _homeworkSeries;
  bool _alcoholSeries;
  bool _cannabisSeries;
  bool _nicotineSeries;
  bool _tobaccoSeries;

  bool _selectAll;

  @override
  void initState() {
    super.initState();
    _auraSeries = true;
    _medicationSeries = true;
    _sleepSeries = false;
    _wakeSeries = false;
    _wakeTweenSeries = false;
    _exerciseSeries = false;
    _breakfastSeries = false;
    _lunchSeries = false;
    _dinnerSeries = false;
    _classSeries = false;
    _homeworkSeries = false;
    _alcoholSeries = false;
    _cannabisSeries = false;
    _nicotineSeries = false;
    _tobaccoSeries = false;
    _selectAll = false;
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: .8,
      child: Column(
        children: <Widget>[
          Container(
            height: 300,
            child: Card(
              borderOnForeground: false,
              color: Colors.white,
              elevation: 12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              margin: EdgeInsets.symmetric(
                vertical: 18,
              ),
              child: Container(
                margin: EdgeInsets.only(bottom: 24),
                child: HistoryChart(
                  auraSeries: _auraSeries,
                  medicationSeries: _medicationSeries,
                  sleepSeries: _sleepSeries,
                  wakeSeries: _wakeSeries,
                  wakeTweenSeries: _wakeTweenSeries,
                  exerciseSeries: _exerciseSeries,
                  breakfastSeries: _breakfastSeries,
                  lunchSeries: _lunchSeries,
                  dinnerSeries: _dinnerSeries,
                  classSeries: _classSeries,
                  homeworkSeries: _homeworkSeries,
                  alcoholSeries: _alcoholSeries,
                  cannabisSeries: _cannabisSeries,
                  nicotineSeries: _nicotineSeries,
                  tobaccoSeries: _tobaccoSeries,
                ),
              ),
            ),
          ),
          Card(
            borderOnForeground: false,
            color: Colors.white,
            elevation: 12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            margin: EdgeInsets.only(
              top: 18,
              bottom: 36,
            ),
            child: DataTable(
              onSelectAll: (selected) {
                setState(() {
                  _selectAll = !_selectAll;
                  _auraSeries = _selectAll;
                  _medicationSeries = _selectAll;
                  _sleepSeries = _selectAll;
                  _wakeSeries = _selectAll;
                  _wakeTweenSeries = _selectAll;
                  _exerciseSeries = _selectAll;
                  _breakfastSeries = _selectAll;
                  _lunchSeries = _selectAll;
                  _dinnerSeries = _selectAll;
                  _classSeries = _selectAll;
                  _homeworkSeries = _selectAll;
                  _alcoholSeries = _selectAll;
                  _cannabisSeries = _selectAll;
                  _nicotineSeries = _selectAll;
                  _tobaccoSeries = _selectAll;
                });
              },
              columns: <DataColumn>[
                DataColumn(
                  label: Text('Category'),
                  numeric: false,
                ),
                DataColumn(
                  label: Text('Summary'),
                  numeric: false,
                ),
              ],
              rows: <DataRow>[
                DataRow(
                  selected: _auraSeries,
                  onSelectChanged: (_) {
                    setState(() {
                      _auraSeries = !_auraSeries;
                    });
                  },
                  cells: <DataCell>[
                    DataCell(
                      Text('Aura'),
                    ),
                    DataCell(
                      Container(),
                    ),
                  ],
                ),
                DataRow(
                  selected: _medicationSeries,
                  onSelectChanged: (_) {
                    setState(() {
                      _medicationSeries = !_medicationSeries;
                    });
                  },
                  cells: <DataCell>[
                    DataCell(
                      Text('Medication'),
                    ),
                    DataCell(
                      HistoryChart(
                        auraSeries: false,
                        medicationSeries: true,
                        sleepSeries: false,
                        wakeSeries: false,
                        wakeTweenSeries: false,
                        exerciseSeries: false,
                        breakfastSeries: false,
                        lunchSeries: false,
                        dinnerSeries: false,
                        classSeries: false,
                        homeworkSeries: false,
                        alcoholSeries: false,
                        cannabisSeries: false,
                        nicotineSeries: false,
                        tobaccoSeries: false,
                      ),
                    ),
                  ],
                ),
                DataRow(
                  selected: _sleepSeries,
                  onSelectChanged: (_) {
                    setState(() {
                      _sleepSeries = !_sleepSeries;
                    });
                  },
                  cells: <DataCell>[
                    DataCell(
                      Text('Sleep'),
                    ),
                    DataCell(
                      HistoryChart(
                        auraSeries: false,
                        medicationSeries: false,
                        sleepSeries: true,
                        wakeSeries: false,
                        wakeTweenSeries: false,
                        exerciseSeries: false,
                        breakfastSeries: false,
                        lunchSeries: false,
                        dinnerSeries: false,
                        classSeries: false,
                        homeworkSeries: false,
                        alcoholSeries: false,
                        cannabisSeries: false,
                        nicotineSeries: false,
                        tobaccoSeries: false,
                      ),
                    ),
                  ],
                ),
                DataRow(
                  selected: _wakeTweenSeries,
                  onSelectChanged: (_) {
                    setState(() {
                      _wakeTweenSeries = !_wakeTweenSeries;
                    });
                  },
                  cells: <DataCell>[
                    DataCell(
                      Text('W. between'),
                    ),
                    DataCell(
                      HistoryChart(
                        auraSeries: false,
                        medicationSeries: false,
                        sleepSeries: false,
                        wakeSeries: false,
                        wakeTweenSeries: true,
                        exerciseSeries: false,
                        breakfastSeries: false,
                        lunchSeries: false,
                        dinnerSeries: false,
                        classSeries: false,
                        homeworkSeries: false,
                        alcoholSeries: false,
                        cannabisSeries: false,
                        nicotineSeries: false,
                        tobaccoSeries: false,
                      ),
                    ),
                  ],
                ),
                DataRow(
                  selected: _wakeSeries,
                  onSelectChanged: (_) {
                    setState(() {
                      _wakeSeries = !_wakeSeries;
                    });
                  },
                  cells: <DataCell>[
                    DataCell(
                      Text('Wake'),
                    ),
                    DataCell(
                      HistoryChart(
                        auraSeries: false,
                        medicationSeries: false,
                        sleepSeries: false,
                        wakeSeries: true,
                        wakeTweenSeries: false,
                        exerciseSeries: false,
                        breakfastSeries: false,
                        lunchSeries: false,
                        dinnerSeries: false,
                        classSeries: false,
                        homeworkSeries: false,
                        alcoholSeries: false,
                        cannabisSeries: false,
                        nicotineSeries: false,
                        tobaccoSeries: false,
                      ),
                    ),
                  ],
                ),
                DataRow(
                  selected: _exerciseSeries,
                  onSelectChanged: (_) {
                    setState(() {
                      _exerciseSeries = !_exerciseSeries;
                    });
                  },
                  cells: <DataCell>[
                    DataCell(
                      Text('Exercise'),
                    ),
                    DataCell(
                      HistoryChart(
                        auraSeries: false,
                        medicationSeries: false,
                        sleepSeries: false,
                        wakeSeries: false,
                        wakeTweenSeries: false,
                        exerciseSeries: true,
                        breakfastSeries: false,
                        lunchSeries: false,
                        dinnerSeries: false,
                        classSeries: false,
                        homeworkSeries: false,
                        alcoholSeries: false,
                        cannabisSeries: false,
                        nicotineSeries: false,
                        tobaccoSeries: false,
                      ),
                    ),
                  ],
                ),
                DataRow(
                  selected: _breakfastSeries,
                  onSelectChanged: (_) {
                    setState(() {
                      _breakfastSeries = !_breakfastSeries;
                    });
                  },
                  cells: <DataCell>[
                    DataCell(
                      Text('Breakfast'),
                    ),
                    DataCell(
                      HistoryChart(
                        auraSeries: false,
                        medicationSeries: false,
                        sleepSeries: false,
                        wakeSeries: false,
                        wakeTweenSeries: false,
                        exerciseSeries: false,
                        breakfastSeries: true,
                        lunchSeries: false,
                        dinnerSeries: false,
                        classSeries: false,
                        homeworkSeries: false,
                        alcoholSeries: false,
                        cannabisSeries: false,
                        nicotineSeries: false,
                        tobaccoSeries: false,
                      ),
                    ),
                  ],
                ),
                DataRow(
                  selected: _lunchSeries,
                  onSelectChanged: (_) {
                    setState(() {
                      _lunchSeries = !_lunchSeries;
                    });
                  },
                  cells: <DataCell>[
                    DataCell(
                      Text('Lunch'),
                    ),
                    DataCell(
                      HistoryChart(
                        auraSeries: false,
                        medicationSeries: false,
                        sleepSeries: false,
                        wakeSeries: false,
                        wakeTweenSeries: false,
                        exerciseSeries: false,
                        breakfastSeries: false,
                        lunchSeries: true,
                        dinnerSeries: false,
                        classSeries: false,
                        homeworkSeries: false,
                        alcoholSeries: false,
                        cannabisSeries: false,
                        nicotineSeries: false,
                        tobaccoSeries: false,
                      ),
                    ),
                  ],
                ),
                DataRow(
                  selected: _dinnerSeries,
                  onSelectChanged: (_) {
                    setState(() {
                      _dinnerSeries = !_dinnerSeries;
                    });
                  },
                  cells: <DataCell>[
                    DataCell(
                      Text('Dinner'),
                    ),
                    DataCell(
                      HistoryChart(
                        auraSeries: false,
                        medicationSeries: false,
                        sleepSeries: false,
                        wakeSeries: false,
                        wakeTweenSeries: false,
                        exerciseSeries: false,
                        breakfastSeries: false,
                        lunchSeries: false,
                        dinnerSeries: true,
                        classSeries: false,
                        homeworkSeries: false,
                        alcoholSeries: false,
                        cannabisSeries: false,
                        nicotineSeries: false,
                        tobaccoSeries: false,
                      ),
                    ),
                  ],
                ),
                DataRow(
                  selected: _classSeries,
                  onSelectChanged: (_) {
                    setState(() {
                      _classSeries = !_classSeries;
                    });
                  },
                  cells: <DataCell>[
                    DataCell(
                      Text('Class'),
                    ),
                    DataCell(
                      HistoryChart(
                        auraSeries: false,
                        medicationSeries: false,
                        sleepSeries: false,
                        wakeSeries: false,
                        wakeTweenSeries: false,
                        exerciseSeries: false,
                        breakfastSeries: false,
                        lunchSeries: false,
                        dinnerSeries: false,
                        classSeries: true,
                        homeworkSeries: false,
                        alcoholSeries: false,
                        cannabisSeries: false,
                        nicotineSeries: false,
                        tobaccoSeries: false,
                      ),
                    ),
                  ],
                ),
                DataRow(
                  selected: _homeworkSeries,
                  onSelectChanged: (_) {
                    setState(() {
                      _homeworkSeries = !_homeworkSeries;
                    });
                  },
                  cells: <DataCell>[
                    DataCell(
                      Text('Homework'),
                    ),
                    DataCell(
                      HistoryChart(
                        auraSeries: false,
                        medicationSeries: false,
                        sleepSeries: false,
                        wakeSeries: false,
                        wakeTweenSeries: false,
                        exerciseSeries: false,
                        breakfastSeries: false,
                        lunchSeries: false,
                        dinnerSeries: false,
                        classSeries: false,
                        homeworkSeries: true,
                        alcoholSeries: false,
                        cannabisSeries: false,
                        nicotineSeries: false,
                        tobaccoSeries: false,
                      ),
                    ),
                  ],
                ),
                DataRow(
                  selected: _alcoholSeries,
                  onSelectChanged: (_) {
                    setState(() {
                      _alcoholSeries = !_alcoholSeries;
                    });
                  },
                  cells: <DataCell>[
                    DataCell(
                      Text('Alcohol'),
                    ),
                    DataCell(
                      HistoryChart(
                        auraSeries: false,
                        medicationSeries: false,
                        sleepSeries: false,
                        wakeSeries: false,
                        wakeTweenSeries: false,
                        exerciseSeries: false,
                        breakfastSeries: false,
                        lunchSeries: false,
                        dinnerSeries: false,
                        classSeries: false,
                        homeworkSeries: false,
                        alcoholSeries: true,
                        cannabisSeries: false,
                        nicotineSeries: false,
                        tobaccoSeries: false,
                      ),
                    ),
                  ],
                ),
                DataRow(
                  selected: _cannabisSeries,
                  onSelectChanged: (_) {
                    setState(() {
                      _cannabisSeries = !_cannabisSeries;
                    });
                  },
                  cells: <DataCell>[
                    DataCell(
                      Text('Cannabis'),
                    ),
                    DataCell(
                      HistoryChart(
                        auraSeries: false,
                        medicationSeries: false,
                        sleepSeries: false,
                        wakeSeries: false,
                        wakeTweenSeries: false,
                        exerciseSeries: false,
                        breakfastSeries: false,
                        lunchSeries: false,
                        dinnerSeries: false,
                        classSeries: false,
                        homeworkSeries: false,
                        alcoholSeries: false,
                        cannabisSeries: true,
                        nicotineSeries: false,
                        tobaccoSeries: false,
                      ),
                    ),
                  ],
                ),
                DataRow(
                  selected: _nicotineSeries,
                  onSelectChanged: (_) {
                    setState(() {
                      _nicotineSeries = !_nicotineSeries;
                    });
                  },
                  cells: <DataCell>[
                    DataCell(
                      Text('Nicotine'),
                    ),
                    DataCell(
                      HistoryChart(
                        auraSeries: false,
                        medicationSeries: false,
                        sleepSeries: false,
                        wakeSeries: false,
                        wakeTweenSeries: false,
                        exerciseSeries: false,
                        breakfastSeries: false,
                        lunchSeries: false,
                        dinnerSeries: false,
                        classSeries: false,
                        homeworkSeries: false,
                        alcoholSeries: false,
                        cannabisSeries: false,
                        nicotineSeries: true,
                        tobaccoSeries: false,
                      ),
                    ),
                  ],
                ),
                DataRow(
                  selected: _tobaccoSeries,
                  onSelectChanged: (_) {
                    setState(() {
                      _tobaccoSeries = !_tobaccoSeries;
                    });
                  },
                  cells: <DataCell>[
                    DataCell(
                      Text('Tobacco'),
                    ),
                    DataCell(
                      HistoryChart(
                        auraSeries: false,
                        medicationSeries: false,
                        sleepSeries: false,
                        wakeSeries: false,
                        wakeTweenSeries: false,
                        exerciseSeries: false,
                        breakfastSeries: false,
                        lunchSeries: false,
                        dinnerSeries: false,
                        classSeries: false,
                        homeworkSeries: false,
                        alcoholSeries: false,
                        cannabisSeries: false,
                        nicotineSeries: false,
                        tobaccoSeries: true,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HistoryChart extends StatelessWidget {
  final bool auraSeries;
  final bool medicationSeries;
  final bool sleepSeries;
  final bool wakeSeries;
  final bool wakeTweenSeries;
  final bool exerciseSeries;
  final bool breakfastSeries;
  final bool lunchSeries;
  final bool dinnerSeries;
  final bool classSeries;
  final bool homeworkSeries;
  final bool alcoholSeries;
  final bool cannabisSeries;
  final bool nicotineSeries;
  final bool tobaccoSeries;

  HistoryChart({
    Key key,
    @required bool auraSeries,
    @required bool medicationSeries,
    @required bool sleepSeries,
    @required bool wakeSeries,
    @required bool wakeTweenSeries,
    @required bool exerciseSeries,
    @required bool breakfastSeries,
    @required bool lunchSeries,
    @required bool dinnerSeries,
    @required bool classSeries,
    @required bool homeworkSeries,
    @required bool alcoholSeries,
    @required bool cannabisSeries,
    @required bool nicotineSeries,
    @required bool tobaccoSeries,
  })  : assert(auraSeries != null),
        assert(medicationSeries != null),
        assert(sleepSeries != null),
        assert(wakeSeries != null),
        assert(wakeTweenSeries != null),
        assert(exerciseSeries != null),
        assert(breakfastSeries != null),
        assert(lunchSeries != null),
        assert(dinnerSeries != null),
        assert(classSeries != null),
        assert(homeworkSeries != null),
        assert(alcoholSeries != null),
        assert(cannabisSeries != null),
        assert(nicotineSeries != null),
        assert(tobaccoSeries != null),
        this.auraSeries = auraSeries,
        this.medicationSeries = medicationSeries,
        this.sleepSeries = sleepSeries,
        this.wakeSeries = wakeSeries,
        this.wakeTweenSeries = wakeTweenSeries,
        this.exerciseSeries = exerciseSeries,
        this.breakfastSeries = breakfastSeries,
        this.lunchSeries = lunchSeries,
        this.dinnerSeries = dinnerSeries,
        this.classSeries = classSeries,
        this.homeworkSeries = homeworkSeries,
        this.alcoholSeries = alcoholSeries,
        this.cannabisSeries = cannabisSeries,
        this.nicotineSeries = nicotineSeries,
        this.tobaccoSeries = tobaccoSeries,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection('surveys')
          .where('uid', isEqualTo: AppState.of(context).firebaseUser.value.uid)
          .orderBy('ts')
          .snapshots(),
      builder: (context, querySnapshot) {
        if (!querySnapshot.hasData) return Container();
        return TimeSeriesChart(
            <Series<dynamic, DateTime>>[
              medicationSeries
                  ? _buildSeries(
                      id: 'medication',
                      index: 1,
                      querySnapshot: querySnapshot.data,
                    )
                  : null,
              sleepSeries
                  ? _buildSeries(
                      id: 'sleep',
                      index: 2,
                      querySnapshot: querySnapshot.data,
                    )
                  : null,
              wakeTweenSeries
                  ? _buildSeries(
                      id: 'wakeTween',
                      index: 3,
                      querySnapshot: querySnapshot.data,
                    )
                  : null,
              wakeSeries
                  ? _buildSeries(
                      id: 'wake',
                      index: 4,
                      querySnapshot: querySnapshot.data,
                    )
                  : null,
              exerciseSeries
                  ? _buildSeries(
                      id: 'exercise',
                      index: 5,
                      querySnapshot: querySnapshot.data,
                    )
                  : null,
              breakfastSeries
                  ? _buildSeries(
                      id: 'breakfast',
                      index: 6,
                      querySnapshot: querySnapshot.data,
                    )
                  : null,
              lunchSeries
                  ? _buildSeries(
                      id: 'lunch',
                      index: 7,
                      querySnapshot: querySnapshot.data,
                    )
                  : null,
              dinnerSeries
                  ? _buildSeries(
                      id: 'dinner',
                      index: 8,
                      querySnapshot: querySnapshot.data,
                    )
                  : null,
              classSeries
                  ? _buildSeries(
                      id: 'class',
                      index: 9,
                      querySnapshot: querySnapshot.data,
                    )
                  : null,
              homeworkSeries
                  ? _buildSeries(
                      id: 'homework',
                      index: 10,
                      querySnapshot: querySnapshot.data,
                    )
                  : null,
              alcoholSeries
                  ? _buildSeries(
                      id: 'alcohol',
                      index: 11,
                      querySnapshot: querySnapshot.data,
                    )
                  : null,
              cannabisSeries
                  ? _buildSeries(
                      id: 'cannabis',
                      index: 12,
                      querySnapshot: querySnapshot.data,
                    )
                  : null,
              nicotineSeries
                  ? _buildSeries(
                      id: 'nicotine',
                      index: 13,
                      querySnapshot: querySnapshot.data,
                    )
                  : null,
              tobaccoSeries
                  ? _buildSeries(
                      id: 'tobacco',
                      index: 14,
                      querySnapshot: querySnapshot.data,
                    )
                  : null,
              auraSeries
                  ? (Series<HistorySeries, DateTime>(
                      id: 'aura',
                      colorFn: (_, __) {
                        return Color(
                          a: Colors.deepPurple.alpha,
                          r: Colors.deepPurple.red,
                          g: Colors.deepPurple.green,
                          b: Colors.deepPurple.blue,
                        );
                      },
                      domainFn: (HistorySeries series, _) {
                        return series.ts;
                      },
                      domainLowerBoundFn: (_, __) {
                        return null;
                      },
                      domainUpperBoundFn: (_, __) {
                        return null;
                      },
                      measureFn: (_, __) {
                        return null;
                      },
                      data: HistorySeriesAnnotation.fromAuraQuerySnapshot(
                        key: AppState.surveyQuestions[0],
                        querySnapshot: querySnapshot.data,
                      ),
                    )..setAttribute(rendererIdKey, 'aura'))
                  : null,
            ]..removeWhere(
                (value) {
                  return value == null;
                },
              ),
            customSeriesRenderers: [
              SymbolAnnotationRendererConfig(
                customRendererId: 'aura',
              ),
            ],
            domainAxis: DateTimeAxisSpec(
              renderSpec: SmallTickRendererSpec(
                labelStyle: TextStyleSpec(
                  fontSize: 10,
                  color: Color(
                    a: Colors.deepPurple.alpha,
                    r: Colors.deepPurple.red,
                    g: Colors.deepPurple.green,
                    b: Colors.deepPurple.blue,
                  ),
                ),
                lineStyle: LineStyleSpec(
                    color: Color(
                  a: Colors.deepPurple.alpha,
                  r: Colors.deepPurple.red,
                  g: Colors.deepPurple.green,
                  b: Colors.deepPurple.blue,
                )),
              ),
            ),
            primaryMeasureAxis: NumericAxisSpec(
              renderSpec: NoneRenderSpec(),
            ),
            animate: true,
            animationDuration: Duration(milliseconds: 300),
            dateTimeFactory: LocalDateTimeFactory());
      },
    );
  }

  Series<HistorySeries, DateTime> _buildSeries({
    @required String id,
    @required int index,
    @required QuerySnapshot querySnapshot,
  }) {
    return Series<HistorySeries, DateTime>(
      id: id,
      colorFn: (_, __) {
        return Color(
          a: Colors.deepPurple.alpha,
          r: Colors.deepPurple.red,
          g: Colors.deepPurple.green,
          b: Colors.deepPurple.blue,
        );
      },
      domainFn: (HistorySeries series, _) {
        return series.ts;
      },
      measureFn: (HistorySeries series, _) {
        return series.value;
      },
      data: HistorySeriesValue.fromQuerySnapshot(
        key: AppState.surveyQuestions[index],
        querySnapshot: querySnapshot,
      ),
    );
  }
}

class HistorySeries {
  final DateTime ts;
  final double value;

  HistorySeries({this.ts, this.value});
}

class HistorySeriesValue extends HistorySeries {
  HistorySeriesValue({
    @required DateTime ts,
    @required double value,
  })  : assert(ts != null),
        super(ts: ts, value: value);

  static List<HistorySeriesValue> fromQuerySnapshot({
    @required String key,
    @required QuerySnapshot querySnapshot,
  }) {
    final ts = querySnapshot.documents.map<DateTime>(
      (DocumentSnapshot documentSnapshot) {
        return documentSnapshot.data['ts'];
      },
    ).toList();
    final values = querySnapshot.documents.map<double>(
      (DocumentSnapshot documentSnapshot) {
        final surveyData = documentSnapshot.data['survey'][key];
        switch (key) {
          case 'Did you take your medication?':
          case 'Did you eat breakfast?':
          case 'Did you eat lunch?':
          case 'Did you eat dinner?':
            return surveyData['mode'] == null
                ? null
                : surveyData['mode'] ? 1 : 0;
          case 'When did you fall asleep last night?':
          case 'When did you wake up this morning?':
            final ts = surveyData['ts'] as Map;
            if (ts['yesterday'] == null ||
                ts['hours'] == null ||
                ts['minutes'] == null) return null;
            return Duration(
                  days: ts['yesterday'] ? 1 : 0,
                  hours: ts['hours'],
                  minutes: ts['minutes'],
                ).inMinutes /
                Duration(days: 2).inMinutes;
          case 'How many times did you wake up in-between sleeping?':
            return surveyData['times'] is int
                ? (surveyData['times'] as int).toDouble()
                : surveyData['times'];
          case 'How long did you exercise?':
          case 'How long did you spend in class?':
          case 'How long did you spend on homework?':
            final duration = surveyData['duration'] as Map;
            return Duration(
                  hours: duration['hours'],
                  minutes: duration['minutes'],
                ).inMinutes /
                Duration(days: 1).inMinutes;
          case 'How much alcohol did you drink?':
            final abvs = (surveyData['abv'] as List).cast<double>();
            final quantities = (surveyData['quantity'] as List).cast<double>();
            final sizes = (surveyData['size'] as List).cast<double>();
            assert(abvs.length == quantities.length);
            assert(quantities.length == sizes.length);
            return List.generate(
              abvs.length,
              (index) {
                return abvs[index] * quantities[index] * sizes[index];
              },
            ).reduce(
              (a, b) {
                return a + b;
              },
            );
          case 'How much cannabis did you consume?':
            return (surveyData['blunts'] +
                    surveyData['edibles'] +
                    surveyData['joints'])
                .toDouble();
          case 'How much nicotine did you vape?':
            return (surveyData['duration'] * surveyData['potency']).toDouble();
          case 'How much tobacco did you smoke?':
            return surveyData['cigarettes'].toDouble();
          default:
            throw UnimplementedError;
        }
      },
    ).toList();
    final maxValue = values.reduce(
      (a, b) {
        return max(a ?? double.negativeInfinity, b ?? double.negativeInfinity);
      },
    );
    assert(maxValue != double.negativeInfinity);
    final minValue = values.reduce(
      (a, b) {
        return min(a ?? double.infinity, b ?? double.infinity);
      },
    );
    assert(minValue != double.infinity);
    final normalizedValues = values.toSet().length == 1
        ? List<double>.filled(values.length, 1)
        : values.map<double>(
            (value) {
              final range = maxValue - minValue;
              return value == null
                  ? 0
                  : (value - minValue) / (range == 0 ? 1 : range);
            },
          ).toList();
    assert(ts.length == values.length);
    return List<HistorySeriesValue>.generate(
      ts.length,
      (index) {
        return HistorySeriesValue(
          ts: ts[index],
          value: normalizedValues[index],
        );
      },
    );
  }
}

class HistorySeriesAnnotation extends HistorySeries {
  HistorySeriesAnnotation({
    @required DateTime ts,
  })  : assert(ts != null),
        super(ts: ts);

  static List<HistorySeriesAnnotation> fromAuraQuerySnapshot({
    @required String key,
    @required QuerySnapshot querySnapshot,
  }) {
    final values = List<HistorySeriesAnnotation>();
    querySnapshot.documents.forEach(
      (DocumentSnapshot documentSnapshot) {
        (documentSnapshot.data['survey'][key]['ts'] as List).forEach(
          (value) {
            if (value != null)
              values.add(
                HistorySeriesAnnotation(
                  ts: value,
                ),
              );
          },
        );
      },
    );
    return values;
  }
}
