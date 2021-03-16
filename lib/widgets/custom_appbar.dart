import 'package:pinzi/widgets/custom_typography.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool? withLogo;
  final String? title;

  const CustomAppBar({
    Key? key,
    this.withLogo,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final canPop = Navigator.canPop(context);

    return AppBar(
      leading: canPop
          ? BackButton(
              color: Colors.black,
            )
          : null,
      title: getMain(
        this.withLogo,
        this.title,
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      actions: [],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

Widget getMain(withLogo, title) {
  if (withLogo == true) {
    return SizedBox(
      width: 32,
      height: 16,
      child: Icon(
        Icons.cast_connected,
        color: Colors.black,
      ),
    );
  } else if (title != null) {
    return CustomTypography(
      text: title,
      fontFamily: FontFamily.barlow_condensed,
      fontWeight: FontWeight.w600,
      fontSize: 16.0,
      color: Colors.black,
    );
  }

  return Text('Error');
}
