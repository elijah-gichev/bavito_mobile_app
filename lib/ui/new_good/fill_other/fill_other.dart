import 'package:bavito/resources/colors.dart';
import 'package:bavito/ui/new_good/controllers/aggregate_good_controller.dart';
import 'package:bavito/ui/new_good/widgets/step_description.dart';
import 'package:bavito/ui/widgets/fab.dart';
import 'package:bavito/ui/widgets/titled_text_field.dart';
import 'package:bavito/utils/size_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/src/provider.dart';

class FillOther extends StatelessWidget {
  final void Function(BuildContext context) onPressed;

  final titleTextController = TextEditingController();
  final scoreTextController = TextEditingController();
  final imgTextController = TextEditingController();

  FillOther({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        children: [
          const Spacer(
            flex: 2,
          ),
          const StepDescription(
            description: 'Заполните оставшуюся информацию',
          ),
          const Spacer(flex: 8),
          TitledTextField(
            onChanged: (value) {
              //
            },
            contoller: titleTextController,
            subTitle: 'Заголовок',
            hintText: 'Крутой товар',
          ),
          const Spacer(flex: 1),
          TitledTextField(
            onChanged: (value) {
              //
            },
            contoller: scoreTextController,
            subTitle: 'Ценность',
            hintText: '1..10',
            inputType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          const Spacer(flex: 1),
          TitledTextField(
            onChanged: (value) {
              //
            },
            contoller: imgTextController,
            subTitle: 'Ссылка на картинки',
            hintText: 'https://google.com',
          ),
          const Spacer(flex: 6),
          FAB(
            text: 'Создать',
            textColor: CustomColors.white,
            backgroundColor: CustomColors.green,
            buttonType: ButtonType.filled,
            buttonSize: ButtonSize.large,
            onTap: () {
              final title = titleTextController.text;
              final score = scoreTextController.text;
              final imgSrc = imgTextController.text;

              final aggregateController =
                  context.read<AggregateGoodController>();

              aggregateController.title = title;
              aggregateController.score = int.parse(score);
              aggregateController.imgSrc = imgSrc;

              //data has aggregated
            },
          ),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
}
