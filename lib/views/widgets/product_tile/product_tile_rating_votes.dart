import 'package:flutter/material.dart';
class RatingVotes extends StatelessWidget {
  const RatingVotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '(126)',
      style: TextStyle(fontSize: 10),
      maxLines: 1,
    );
  }
}
class StylizedStar extends StatelessWidget {
  const StylizedStar(this.star, {Key? key}) : super(key: key);

  final IconData star;
  final double size = 16;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 13,
      child: Stack(
        children: [
          Icon(
            star,
            color: Colors.orangeAccent,
            size: size,
          ),
          Icon(
            Icons.star_border_outlined,
            color: Colors.orange,
            size: size,
          ),
        ],
      ),
    );
  }
}