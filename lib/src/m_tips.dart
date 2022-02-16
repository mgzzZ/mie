import 'package:flutter/material.dart';

///
/// Created by zgm on 2022/2/16
/// Describe:
///

class MTips extends StatelessWidget {
  final Widget? child;
  final double topPadding;
  final double rightPadding;

  ///count 为0的时候 小红点消失
  final int? count;
  const MTips({Key? key, this.child, this.topPadding = -4, this.rightPadding = -4, this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (child == null) {
      return ClipOval(
        child: Container(
          width: 4,
          height: 4,
          color: Colors.red,
        ),
      );
    }
    return Stack(
      alignment: Alignment.topRight,
      clipBehavior: Clip.none,
      children: [
        child ?? Container(),
        Positioned(
            top: topPadding,
            right: rightPadding,
            child: Container(
              constraints: const BoxConstraints(minWidth: 12),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: const BorderRadius.all(Radius.circular(6)),
              ),
              height: 12,
              child: count != null && count! > 0
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 2, right: 2),
                        child: Text(
                          count! > 99 ? '99+' : count.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 10, color: Colors.white),
                        ),
                      ),
                    )
                  : Container(),
            ))
      ],
    );
  }
}
