import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

class ButtomSwitch extends StatefulWidget {
  const ButtomSwitch({Key? key}) : super(key: key);

  @override
  _ButtomSwitchState createState() => _ButtomSwitchState();
}

class _ButtomSwitchState extends State<ButtomSwitch> {
  final controller = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Spacer(),
          Text('All Day'),
          SizedBox(
            width: 10,
          ),
          AdvancedSwitch(
            width: 40,
            height: 20,
            controller: controller,
            borderRadius: BorderRadius.circular(18),
          ),
        ],
      ),
    );
  }
}
