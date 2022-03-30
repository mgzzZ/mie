import 'package:flutter/material.dart';

///
/// Created by zgm on 2022/3/4
/// Describe:
///

class MEmptyWidget extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onTap;

  const MEmptyWidget({Key? key, this.child, this.onTap}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      width: double.infinity,
      height: double.infinity,
      child: GestureDetector(
        onTap: onTap,
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
