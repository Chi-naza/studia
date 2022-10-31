import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studia/configuration/themes/app_colors.dart';
import 'package:studia/configuration/themes/ui_parameters.dart';
import 'package:studia/utils/dimensions.dart';
import 'package:studia/widgets/answer_card.dart';

class QuestionNumberCard extends StatelessWidget {
  final int indexNum;
  final AnswerStatus? status;
  final VoidCallback? onTap; 
  
  const QuestionNumberCard({Key? key, required this.indexNum, this.status, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _backgroundColor = Theme.of(context).primaryColor;

    switch(status){
      case AnswerStatus.answered:
        _backgroundColor = Get.isDarkMode? Theme.of(context).cardColor : Theme.of(context).primaryColor;
        break;
      case AnswerStatus.notAnswered:
        _backgroundColor = Get.isDarkMode? Colors.red.withOpacity(0.5) : Theme.of(context).primaryColor.withOpacity(0.1);
        break;
      case AnswerStatus.wrong:
        _backgroundColor = wrongAnswerColor;
        break;
      case AnswerStatus.correct:
        _backgroundColor = correctAnswerColor;
        break;
      default:
        _backgroundColor = Theme.of(context).primaryColor.withOpacity(0.1);
    }

    return InkWell(
      onTap: onTap,
      borderRadius: UIParameters.cardBorderRadius,
      child: Ink(
        padding: EdgeInsets.all(Dimensions.height10),
        decoration: BoxDecoration(
          color: _backgroundColor,
          borderRadius: UIParameters.cardBorderRadius,
        ),
        child: Center(
          child: Text(
            '$indexNum',
            style: TextStyle(
              color: status == AnswerStatus.notAnswered? Theme.of(context).primaryColor : null,
            ),
          ),
        ),
      ),
    );
  }
  
}