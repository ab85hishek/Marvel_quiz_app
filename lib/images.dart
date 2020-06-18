import 'package:flutter/material.dart';

class ShowImage extends StatelessWidget {
  final String imageAddress;
  ShowImage(this.imageAddress);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(0) ,
      child: Image(
        image: NetworkImage(imageAddress),
        alignment: Alignment.center,
        width: double.infinity,
        height: 300,
        
      ),
    );
  }
}
