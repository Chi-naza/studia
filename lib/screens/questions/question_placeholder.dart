import 'package:easy_separator/easy_separator.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:studia/utils/dimensions.dart';

class QuestionsPlaceHolder extends StatelessWidget {
  const QuestionsPlaceHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // creating a shimmer structure for lines
    var line =  Container(
      height: Dimensions.height10,
      color: Theme.of(context).scaffoldBackgroundColor,
      width: double.infinity,
    );

    // creating a shimmer structure for answer cards
    var answer =  Container(
      height: Dimensions.height30 + Dimensions.height20,
      color: Theme.of(context).scaffoldBackgroundColor,
      width: double.infinity,
    );

    return Shimmer.fromColors( 
      baseColor: Colors.white, 
      highlightColor: Colors.blueGrey.withOpacity(0.1),
      // Easy Separated Column helps to contruct the shimmer column items
      child: EasySeparatedColumn(
        // the space between the children in this list
        separatorBuilder: (context, index) => SizedBox(height: Dimensions.height20),
        children: [
          // Another easy Separated column as a child 
          EasySeparatedColumn(
            separatorBuilder: (context, index) => SizedBox(height: Dimensions.height9/2),
            children: [line, line, line],
          ),
          answer,
          answer,
          answer,
          answer
        ],
      ),
    );
  }
}