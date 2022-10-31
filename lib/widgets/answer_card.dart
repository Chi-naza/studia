import 'package:flutter/material.dart';
import 'package:studia/configuration/themes/app_colors.dart';
import 'package:studia/configuration/themes/ui_parameters.dart';
import 'package:studia/utils/dimensions.dart';

class AnswerCard extends StatelessWidget {
  final String answer;
  final bool isSelected;
  final VoidCallback onPressed;
  
  const AnswerCard({Key? key, required this.answer, this.isSelected = false, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Ink(
        padding: EdgeInsets.symmetric(vertical: Dimensions.height20, horizontal: Dimensions.width20*2),
        decoration: BoxDecoration(
          color: isSelected? answerSelectedColor() : Theme.of(context).cardColor,
          borderRadius: UIParameters.cardBorderRadius,
          border: Border.all(
            color: isSelected? answerSelectedColor() : answerBorderColor(),
          ),
        ),
        child: Text(
          answer,
          style: TextStyle(
            color: isSelected? onSurfaceTextColor : null,
            fontWeight: isSelected? FontWeight.w600 : null,
          ),
        ),
      ),
    );
  }

}


// Answer status enum
enum AnswerStatus {
  wrong,
  correct,
  answered,
  notAnswered
}



// Correct answer card widget
class CorrectAnswerCard extends StatelessWidget {
  final String answer;
  const CorrectAnswerCard({Key? key, required this.answer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: correctAnswerColor.withOpacity(0.1),
        borderRadius: UIParameters.cardBorderRadius,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: Dimensions.height20, horizontal: Dimensions.width10),
        child: Text(
          answer,
          style: const TextStyle(
            color: correctAnswerColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}


// Wrong answer card widget
class WrongAnswerCard extends StatelessWidget {
  final String answer;
  const WrongAnswerCard({Key? key, required this.answer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: wrongAnswerColor.withOpacity(0.1),
        borderRadius: UIParameters.cardBorderRadius,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: Dimensions.height20, horizontal: Dimensions.width10),
        child: Text(
          answer,
          style: const TextStyle(
            color: wrongAnswerColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}




// Not answered card widget
class NotAnsweredCard extends StatelessWidget {
  final String answer;
  const NotAnsweredCard({Key? key, required this.answer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: notAnsweredColor.withOpacity(0.1),
        borderRadius: UIParameters.cardBorderRadius,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: Dimensions.height20, horizontal: Dimensions.width10),
        child: Text(
          answer,
          style: const TextStyle(
            color: notAnsweredColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}