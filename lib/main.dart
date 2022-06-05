// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BodyPart? defendingBodyPart;
  BodyPart? attackingBodyPart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(213, 222, 240, 1),
      body: Column(
        children: [
          SizedBox(
            height: 59,
          ),
          Row(
            children: [
              SizedBox(
                width: 16,
              ),
              Expanded(child: Center(child: Text('You'))),
              SizedBox(
                width: 12,
              ),
              Expanded(child: Center(child: Text('Enemy'))),
              SizedBox(
                width: 16,
              ),
            ],
          ),
          SizedBox(
            height: 11,
          ),
          Row(
            children: [
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: Center(
                  child: Column(
                    children: [
                      Text('1'),
                      SizedBox(
                        height: 4,
                      ),
                      Text('1'),
                      SizedBox(
                        height: 4,
                      ),
                      Text('1'),
                      SizedBox(
                        height: 4,
                      ),
                      Text('1'),
                      SizedBox(
                        height: 4,
                      ),
                      Text('1'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Center(
                  child: Column(
                    children: [
                      Text('1'),
                      SizedBox(
                        height: 4,
                      ),
                      Text('1'),
                      SizedBox(
                        height: 4,
                      ),
                      Text('1'),
                      SizedBox(
                        height: 4,
                      ),
                      Text('1'),
                      SizedBox(
                        height: 4,
                      ),
                      Text('1'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              ],
          ),
          Expanded(child: SizedBox()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  children: [
                    Text('Defend'.toUpperCase()),
                    SizedBox(
                      height: 14,
                    ),
                    BodyPartButton(
                      bodyPart: BodyPart.head,
                      selected: defendingBodyPart == BodyPart.head,
                      bodyPartSetter: _selectDefendingBodyPart,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    BodyPartButton(
                      bodyPart: BodyPart.torso,
                      selected: defendingBodyPart == BodyPart.torso,
                      bodyPartSetter: _selectDefendingBodyPart,
                    ),
                     SizedBox(
                      height: 14,
                    ),
                    BodyPartButton(
                      bodyPart: BodyPart.legs,
                      selected: defendingBodyPart == BodyPart.legs,
                      bodyPartSetter: _selectDefendingBodyPart,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  children: [
                    Text('Attack'.toUpperCase()),
                    SizedBox(
                      height: 14,
                    ),
                    BodyPartButton(
                      bodyPart: BodyPart.head,
                      selected: attackingBodyPart == BodyPart.head,
                      bodyPartSetter: _selectAttackingBodyPart,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    BodyPartButton(
                      bodyPart: BodyPart.torso,
                      selected: attackingBodyPart == BodyPart.torso,
                      bodyPartSetter: _selectAttackingBodyPart,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    BodyPartButton(
                      bodyPart: BodyPart.legs,
                      selected: attackingBodyPart == BodyPart.legs,
                      bodyPartSetter: _selectAttackingBodyPart,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 16,
              ),
            ],
          ),
          SizedBox(
            height: 14,
          ),
          Row(
            children: [
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() {
                    defendingBodyPart = null;
                    attackingBodyPart = null;
                  }),
                  child: SizedBox(
                    height: 40,
                    child: ColoredBox(
                      color: (defendingBodyPart != null &&
                              attackingBodyPart != null)
                          ? Color.fromRGBO(0, 0, 0, 0.87)
                          : Color.fromRGBO(0, 0, 0, 0.38),
                      child: Center(
                          child: Text(
                        'Go'.toUpperCase(),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 16),
                      )),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }

  void _selectDefendingBodyPart(final BodyPart value) {
    setState(() {
      defendingBodyPart = value;
    });
  }

  void _selectAttackingBodyPart(final BodyPart value) {
    setState(() {
      attackingBodyPart = value;
    });
  }
}

class BodyPart {
  final String name;
  const BodyPart._(this.name);
  static const head = BodyPart._('Head');
  static const torso = BodyPart._('Torso');
  static const legs = BodyPart._('Legs');

  @override
  String toString() => 'BodyPart(name: $name)';
}

class BodyPartButton extends StatelessWidget {
  final BodyPart bodyPart;
  final bool selected;
  final ValueSetter<BodyPart> bodyPartSetter;
  const BodyPartButton({
    Key? key,
    required this.bodyPart,
    required this.selected,
    required this.bodyPartSetter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => bodyPartSetter(bodyPart),
      child: SizedBox(
        height: 40,
        child: ColoredBox(
          color: selected
              ? const Color.fromRGBO(28, 121, 206, 1)
              : const Color.fromRGBO(0, 0, 0, 0.38),
          child: Center(child: Text(bodyPart.name.toUpperCase())),
        ),
      ),
    );
  }
}
