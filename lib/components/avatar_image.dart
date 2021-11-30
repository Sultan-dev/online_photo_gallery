import 'package:flutter/material.dart';

class AvatarImage extends StatelessWidget {
  const AvatarImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey,
        image: DecorationImage(
          image: AssetImage(
            'images/avatar.jpeg',
          ),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
