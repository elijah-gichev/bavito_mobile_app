import 'package:bavito/resources/colors.dart';
import 'package:bavito/ui/new_good/big_text_field.dart';
import 'package:bavito/ui/new_good/fill_routing_controller.dart';
import 'package:bavito/ui/new_good/step_description.dart';
import 'package:bavito/ui/widgets/fab.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class FillDescription extends StatefulWidget {
  const FillDescription({Key? key}) : super(key: key);

  @override
  State<FillDescription> createState() => _FillDescriptionState();
}

class _FillDescriptionState extends State<FillDescription> {
  late final TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 2,
            ),
            const StepDescription(
              description:
                  'Описание товара следует делать максимально исчерпывающим)',
            ),
            const Spacer(
              flex: 8,
            ),
            BigTextField(
              textEditingController: textEditingController,
            ),
            const Spacer(
              flex: 1,
            ),
            FAB(
              text: 'Следующий шаг',
              textColor: CustomColors.white,
              backgroundColor: CustomColors.green,
              buttonType: ButtonType.filled,
              buttonSize: ButtonSize.large,
              onTap: () {
                context.read<FillRoutingController>().nextStep();
              },
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
