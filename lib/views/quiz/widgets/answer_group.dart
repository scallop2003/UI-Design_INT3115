import 'package:flutter/material.dart';
import 'package:viet_chronicle/controllers/quiz_controller.dart';
import 'package:viet_chronicle/views/quiz/widgets/answer_button.dart';
import 'package:viet_chronicle/views/widgets/button/controller/vc_button_controller.dart';

class AnswerGroup extends StatefulWidget {
  final QuizController quizController;
  final int questionIndex;

  const AnswerGroup(
      {super.key, required this.quizController, required this.questionIndex});

  @override
  State<AnswerGroup> createState() => _AnswerGroupState();
}

class _AnswerGroupState extends State<AnswerGroup> {
  final VCButtonController btAnswerController = VCButtonController();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
            widget.quizController.questions[widget.questionIndex].answers.length, (index) {
          return Column(
            children: [
              Center(
                child: AnswerButton(
                  labelText: widget.quizController
                      .questions[widget.questionIndex].answers.keys
                      .toList()[index],
                  callback: () {
                    setState(() {
                      widget.quizController.questions[widget.questionIndex].choosenAnswer =
                        widget.quizController.questions[widget.questionIndex].answers.keys
                            .toList()[index];
                    });
                    // btAnswerController.setLock!(_answerState);
                  },
                  controller: btAnswerController,
                  selected: widget.quizController.questions[widget.questionIndex].choosenAnswer ==
                      widget.quizController.questions[widget.questionIndex].answers.keys
                          .toList()[index],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          );
        }),
      ),
    );
  }
}
