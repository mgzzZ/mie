import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

///
/// Created by zgm on 2022/3/4
/// Describe:小icon 修改颜色 大小  svg icons url
///

enum _IconType { image, icons, svg }

class MIcon extends StatelessWidget {
  final Color? color;
  final MIconSize? size;
  final String? url;
  final IconData? icon;

  MIcon({
    Key? key,
    this.color,
    this.size,
    this.url,
    this.icon,
  })  : assert(url != null),
        _iconType = _IconType.image,
        super(key: key);

  const MIcon.svg({
    Key? key,
    this.color,
    this.size,
    this.url,
    this.icon,
  })  : _iconType = _IconType.svg,
        super(key: key);
  const MIcon.icons({
    Key? key,
    this.color,
    this.size,
    this.url,
    this.icon,
  })  : assert(icon != null),
        _iconType = _IconType.icons,
        super(key: key);
  final _IconType _iconType;
  @override
  Widget build(BuildContext context) {
    double _size = size?.value ?? MIconSize.normal().value;

    switch (_iconType) {
      case _IconType.image:
        return Container(
            width: _size,
            height: _size,
            child: Image.asset(
              url!,
              width: _size,
              height: _size,
            ));
      case _IconType.svg:
        return SvgPicture.asset(
          url!,
          color: color,
          width: _size,
          height: _size,
        );
      case _IconType.icons:
        return Icon(
          icon,
          size: _size,
          color: color,
        );
      default:
        return Container();
    }
  }
}

class MIconSize {
  final double value;
  MIconSize(this.value);

  // 小
  static MIconSize small() {
    return MIconSize(16);
  }

  //普通
  static MIconSize normal() {
    return MIconSize(20);
  }

  // 大
  static MIconSize big() {
    return MIconSize(24);
  }
}
