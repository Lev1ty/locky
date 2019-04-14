import 'package:flutter/material.dart';
import 'package:locky/backend.dart';

final Future<void> Function(BuildContext) fake = (BuildContext context) async {
  final tsList = List<DateTime>.generate(
    7,
    (index) {
      return DateTime.now().subtract(
        Duration(
          days: 6 - index,
        ),
      );
    },
  );
  final surveys = <Map<String, Map<String, dynamic>>>[
    <String, Map<String, dynamic>>{
      'When did you have an aura?': <String, dynamic>{
        'ts': <DateTime>[
          DateTime.now().subtract(Duration(days: 6)),
          DateTime.now().subtract(Duration(days: 6, hours: 12)),
        ],
      },
      'Did you take your medication?': <String, dynamic>{
        'mode': true,
      },
      'When did you fall asleep last night?': <String, dynamic>{
        'ts': <String, dynamic>{
          'hours': 23,
          'minutes': 59,
          'yesterday': true,
        },
      },
      'How many times did you wake up in-between sleeping?': <String, dynamic>{
        'times': 1,
      },
      'When did you wake up this morning?': <String, dynamic>{
        'ts': <String, dynamic>{
          'hours': 10,
          'minutes': 30,
          'yesterday': false,
        },
      },
      'How long did you exercise?': <String, dynamic>{
        'duration': <String, int>{
          'hours': 1,
          'minutes': 0,
        },
      },
      'Did you eat breakfast?': <String, dynamic>{
        'mode': true,
      },
      'Did you eat lunch?': <String, dynamic>{
        'mode': true,
      },
      'Did you eat dinner?': <String, dynamic>{
        'mode': true,
      },
      'How long did you spend in class?': <String, dynamic>{
        'duration': <String, int>{
          'hours': 3,
          'minutes': 0,
        },
      },
      'How long did you spend on homework?': <String, dynamic>{
        'duration': <String, int>{
          'hours': 1,
          'minutes': 0,
        },
      },
      'How much alcohol did you drink?': <String, dynamic>{
        'abv': <double>[5],
        'size': <double>[300],
        'quantity': <double>[2],
      },
      'How much cannabis did you consume?': <String, dynamic>{
        'edibles': 0,
        'blunts': 0,
        'joints': 0,
      },
      'How much nicotine did you vape?': <String, dynamic>{
        'potency': 0,
        'duration': 0,
      },
      'How much tobacco did you smoke?': <String, dynamic>{
        'cigarettes': 0,
      },
    },
    <String, Map<String, dynamic>>{
      'When did you have an aura?': <String, dynamic>{
        'ts': <DateTime>[
          DateTime.now().subtract(Duration(days: 5, hours: 10)),
        ],
      },
      'Did you take your medication?': <String, dynamic>{
        'mode': true,
      },
      'When did you fall asleep last night?': <String, dynamic>{
        'ts': <String, dynamic>{
          'hours': 2,
          'minutes': 0,
          'yesterday': false,
        },
      },
      'How many times did you wake up in-between sleeping?': <String, dynamic>{
        'times': 0,
      },
      'When did you wake up this morning?': <String, dynamic>{
        'ts': <String, dynamic>{
          'hours': 14,
          'minutes': 0,
          'yesterday': false,
        },
      },
      'How long did you exercise?': <String, dynamic>{
        'duration': <String, int>{
          'hours': 0,
          'minutes': 0,
        },
      },
      'Did you eat breakfast?': <String, dynamic>{
        'mode': false,
      },
      'Did you eat lunch?': <String, dynamic>{
        'mode': true,
      },
      'Did you eat dinner?': <String, dynamic>{
        'mode': true,
      },
      'How long did you spend in class?': <String, dynamic>{
        'duration': <String, int>{
          'hours': 1,
          'minutes': 0,
        },
      },
      'How long did you spend on homework?': <String, dynamic>{
        'duration': <String, int>{
          'hours': 3,
          'minutes': 0,
        },
      },
      'How much alcohol did you drink?': <String, dynamic>{
        'abv': <double>[5],
        'size': <double>[300],
        'quantity': <double>[0],
      },
      'How much cannabis did you consume?': <String, dynamic>{
        'edibles': 0,
        'blunts': 0,
        'joints': 0,
      },
      'How much nicotine did you vape?': <String, dynamic>{
        'potency': 0,
        'duration': 0,
      },
      'How much tobacco did you smoke?': <String, dynamic>{
        'cigarettes': 0,
      },
    },
    <String, Map<String, dynamic>>{
      'When did you have an aura?': <String, dynamic>{
        'ts': <DateTime>[
          DateTime.now().subtract(Duration(days: 4, hours: 14)),
        ],
      },
      'Did you take your medication?': <String, dynamic>{
        'mode': false,
      },
      'When did you fall asleep last night?': <String, dynamic>{
        'ts': <String, dynamic>{
          'hours': 22,
          'minutes': 0,
          'yesterday': true,
        },
      },
      'How many times did you wake up in-between sleeping?': <String, dynamic>{
        'times': 3,
      },
      'When did you wake up this morning?': <String, dynamic>{
        'ts': <String, dynamic>{
          'hours': 8,
          'minutes': 0,
          'yesterday': false,
        },
      },
      'How long did you exercise?': <String, dynamic>{
        'duration': <String, int>{
          'hours': 0,
          'minutes': 30,
        },
      },
      'Did you eat breakfast?': <String, dynamic>{
        'mode': false,
      },
      'Did you eat lunch?': <String, dynamic>{
        'mode': false,
      },
      'Did you eat dinner?': <String, dynamic>{
        'mode': true,
      },
      'How long did you spend in class?': <String, dynamic>{
        'duration': <String, int>{
          'hours': 6,
          'minutes': 0,
        },
      },
      'How long did you spend on homework?': <String, dynamic>{
        'duration': <String, int>{
          'hours': 0,
          'minutes': 0,
        },
      },
      'How much alcohol did you drink?': <String, dynamic>{
        'abv': <double>[5],
        'size': <double>[300],
        'quantity': <double>[0],
      },
      'How much cannabis did you consume?': <String, dynamic>{
        'edibles': 0,
        'blunts': 0,
        'joints': 0,
      },
      'How much nicotine did you vape?': <String, dynamic>{
        'potency': 0,
        'duration': 0,
      },
      'How much tobacco did you smoke?': <String, dynamic>{
        'cigarettes': 0,
      },
    },
    <String, Map<String, dynamic>>{
      'When did you have an aura?': <String, dynamic>{
        'ts': <DateTime>[
          DateTime.now().subtract(Duration(days: 3, hours: 8)),
        ],
      },
      'Did you take your medication?': <String, dynamic>{
        'mode': true,
      },
      'When did you fall asleep last night?': <String, dynamic>{
        'ts': <String, dynamic>{
          'hours': 1,
          'minutes': 0,
          'yesterday': false,
        },
      },
      'How many times did you wake up in-between sleeping?': <String, dynamic>{
        'times': 0,
      },
      'When did you wake up this morning?': <String, dynamic>{
        'ts': <String, dynamic>{
          'hours': 6,
          'minutes': 0,
          'yesterday': false,
        },
      },
      'How long did you exercise?': <String, dynamic>{
        'duration': <String, int>{
          'hours': 0,
          'minutes': 0,
        },
      },
      'Did you eat breakfast?': <String, dynamic>{
        'mode': true,
      },
      'Did you eat lunch?': <String, dynamic>{
        'mode': false,
      },
      'Did you eat dinner?': <String, dynamic>{
        'mode': true,
      },
      'How long did you spend in class?': <String, dynamic>{
        'duration': <String, int>{
          'hours': 4,
          'minutes': 0,
        },
      },
      'How long did you spend on homework?': <String, dynamic>{
        'duration': <String, int>{
          'hours': 2,
          'minutes': 0,
        },
      },
      'How much alcohol did you drink?': <String, dynamic>{
        'abv': <double>[5],
        'size': <double>[300],
        'quantity': <double>[0],
      },
      'How much cannabis did you consume?': <String, dynamic>{
        'edibles': 0,
        'blunts': 0,
        'joints': 0,
      },
      'How much nicotine did you vape?': <String, dynamic>{
        'potency': 0,
        'duration': 0,
      },
      'How much tobacco did you smoke?': <String, dynamic>{
        'cigarettes': 0,
      },
    },
    <String, Map<String, dynamic>>{
      'When did you have an aura?': <String, dynamic>{
        'ts': <DateTime>[
          DateTime.now().subtract(Duration(days: 2, hours: 5)),
        ],
      },
      'Did you take your medication?': <String, dynamic>{
        'mode': true,
      },
      'When did you fall asleep last night?': <String, dynamic>{
        'ts': <String, dynamic>{
          'hours': 20,
          'minutes': 0,
          'yesterday': true,
        },
      },
      'How many times did you wake up in-between sleeping?': <String, dynamic>{
        'times': 0,
      },
      'When did you wake up this morning?': <String, dynamic>{
        'ts': <String, dynamic>{
          'hours': 5,
          'minutes': 0,
          'yesterday': false,
        },
      },
      'How long did you exercise?': <String, dynamic>{
        'duration': <String, int>{
          'hours': 8,
          'minutes': 0,
        },
      },
      'Did you eat breakfast?': <String, dynamic>{
        'mode': true,
      },
      'Did you eat lunch?': <String, dynamic>{
        'mode': true,
      },
      'Did you eat dinner?': <String, dynamic>{
        'mode': true,
      },
      'How long did you spend in class?': <String, dynamic>{
        'duration': <String, int>{
          'hours': 0,
          'minutes': 0,
        },
      },
      'How long did you spend on homework?': <String, dynamic>{
        'duration': <String, int>{
          'hours': 0,
          'minutes': 0,
        },
      },
      'How much alcohol did you drink?': <String, dynamic>{
        'abv': <double>[5],
        'size': <double>[300],
        'quantity': <double>[2],
      },
      'How much cannabis did you consume?': <String, dynamic>{
        'edibles': 0,
        'blunts': 0,
        'joints': 0,
      },
      'How much nicotine did you vape?': <String, dynamic>{
        'potency': 0,
        'duration': 0,
      },
      'How much tobacco did you smoke?': <String, dynamic>{
        'cigarettes': 0,
      },
    },
    <String, Map<String, dynamic>>{
      'When did you have an aura?': <String, dynamic>{
        'ts': <DateTime>[
          DateTime.now().subtract(Duration(days: 1, hours: 15)),
        ],
      },
      'Did you take your medication?': <String, dynamic>{
        'mode': true,
      },
      'When did you fall asleep last night?': <String, dynamic>{
        'ts': <String, dynamic>{
          'hours': 3,
          'minutes': 0,
          'yesterday': false,
        },
      },
      'How many times did you wake up in-between sleeping?': <String, dynamic>{
        'times': 0,
      },
      'When did you wake up this morning?': <String, dynamic>{
        'ts': <String, dynamic>{
          'hours': 12,
          'minutes': 0,
          'yesterday': false,
        },
      },
      'How long did you exercise?': <String, dynamic>{
        'duration': <String, int>{
          'hours': 1,
          'minutes': 0,
        },
      },
      'Did you eat breakfast?': <String, dynamic>{
        'mode': false,
      },
      'Did you eat lunch?': <String, dynamic>{
        'mode': true,
      },
      'Did you eat dinner?': <String, dynamic>{
        'mode': true,
      },
      'How long did you spend in class?': <String, dynamic>{
        'duration': <String, int>{
          'hours': 0,
          'minutes': 0,
        },
      },
      'How long did you spend on homework?': <String, dynamic>{
        'duration': <String, int>{
          'hours': 0,
          'minutes': 0,
        },
      },
      'How much alcohol did you drink?': <String, dynamic>{
        'abv': <double>[5],
        'size': <double>[300],
        'quantity': <double>[0],
      },
      'How much cannabis did you consume?': <String, dynamic>{
        'edibles': 0,
        'blunts': 0,
        'joints': 0,
      },
      'How much nicotine did you vape?': <String, dynamic>{
        'potency': 0,
        'duration': 0,
      },
      'How much tobacco did you smoke?': <String, dynamic>{
        'cigarettes': 0,
      },
    },
    <String, Map<String, dynamic>>{
      'When did you have an aura?': <String, dynamic>{
        'ts': <DateTime>[
          DateTime.now().subtract(Duration(hours: 15)),
        ],
      },
      'Did you take your medication?': <String, dynamic>{
        'mode': true,
      },
      'When did you fall asleep last night?': <String, dynamic>{
        'ts': <String, dynamic>{
          'hours': 2,
          'minutes': 0,
          'yesterday': false,
        },
      },
      'How many times did you wake up in-between sleeping?': <String, dynamic>{
        'times': 1,
      },
      'When did you wake up this morning?': <String, dynamic>{
        'ts': <String, dynamic>{
          'hours': 12,
          'minutes': 0,
          'yesterday': false,
        },
      },
      'How long did you exercise?': <String, dynamic>{
        'duration': <String, int>{
          'hours': 2,
          'minutes': 0,
        },
      },
      'Did you eat breakfast?': <String, dynamic>{
        'mode': true,
      },
      'Did you eat lunch?': <String, dynamic>{
        'mode': true,
      },
      'Did you eat dinner?': <String, dynamic>{
        'mode': true,
      },
      'How long did you spend in class?': <String, dynamic>{
        'duration': <String, int>{
          'hours': 0,
          'minutes': 0,
        },
      },
      'How long did you spend on homework?': <String, dynamic>{
        'duration': <String, int>{
          'hours': 0,
          'minutes': 0,
        },
      },
      'How much alcohol did you drink?': <String, dynamic>{
        'abv': <double>[5],
        'size': <double>[300],
        'quantity': <double>[0],
      },
      'How much cannabis did you consume?': <String, dynamic>{
        'edibles': 0,
        'blunts': 0,
        'joints': 0,
      },
      'How much nicotine did you vape?': <String, dynamic>{
        'potency': 0,
        'duration': 0,
      },
      'How much tobacco did you smoke?': <String, dynamic>{
        'cigarettes': 0,
      },
    },
  ];
  assert(tsList.length == surveys.length);
  assert(tsList.length == 7);
  for (int i = 0; i < 7; i++) {
    await Firestore.instance.collection('surveys').add(
      <String, dynamic>{
        'ts': tsList[i],
        'survey': surveys[i],
        'uid': AppState.of(context).firebaseUser.value.uid,
      },
    );
  }
};
