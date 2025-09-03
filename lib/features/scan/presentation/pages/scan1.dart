import 'package:flutter/material.dart';
import 'package:save_up/core/themes/app_pallete.dart';

class Scan1 extends StatefulWidget {
  const Scan1({super.key});

  @override
  State<Scan1> createState() => _Scan1State();
}

class _Scan1State extends State<Scan1> {
  @override
  void initState() {
    
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 200,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text('Modal BottomSheet'),
                ElevatedButton(
                  child: const Text('Close BottomSheet'),
                  onPressed: () => Navigator.pushNamed(context, '/home'),
                ),
              ],
            ),
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: AppPallete.baseBlack);
  }
}
