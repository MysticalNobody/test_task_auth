import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:supercharged/supercharged.dart';
import 'package:test_task_auth/ui/widgets/app_number_button.dart';
import 'package:test_task_auth/ui/widgets/app_pin_button.dart';
import 'package:test_task_auth/ui/widgets/app_pin_dots.dart';

import '../../../l10n/generated/l10n.dart';
import '../../theme/theme.dart';
import 'pin_set_view_model.dart';

class PinSetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PinSetViewModel>.reactive(
      viewModelBuilder: () => PinSetViewModel(context),
      onModelReady: (model) => model.onReady(),
      builder: (context, PinSetViewModel model, child) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  Strings.current.need_create_pin_for_auth,
                  style: AppStyles.title,
                  textAlign: TextAlign.center,
                ),
                StreamBuilder<bool>(
                    stream: model.pinError,
                    builder: (context, snapshot) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            Strings.current.create_pin,
                            style: AppStyles.text,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 24),
                          PinDots(
                            count: model.pin.length,
                            color: (snapshot.data ?? false) ? AppColors.error : null,
                          ),
                          AnimatedCrossFade(
                            firstChild: Container(),
                            secondChild: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(height: 10),
                                Text(
                                  Strings.current.confirm_pin,
                                  style: AppStyles.text,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 24),
                                PinDots(
                                  count: model.pinConfirm.length,
                                  color:
                                      (snapshot.data ?? false) ? AppColors.error : null,
                                ),
                              ],
                            ),
                            crossFadeState: model.pin.length == model.pinLength
                                ? CrossFadeState.showSecond
                                : CrossFadeState.showFirst,
                            duration: 200.milliseconds,
                          ),
                        ],
                      );
                    }),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        AppNumberButton(
                          number: 1,
                          onTap: model.onPinTap,
                        ),
                        AppNumberButton(
                          number: 2,
                          text: 'A B C',
                          onTap: model.onPinTap,
                        ),
                        AppNumberButton(
                          number: 3,
                          text: 'D E F',
                          onTap: model.onPinTap,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        AppNumberButton(
                          number: 4,
                          text: 'G H I',
                          onTap: model.onPinTap,
                        ),
                        AppNumberButton(
                          number: 5,
                          text: 'J K L',
                          onTap: model.onPinTap,
                        ),
                        AppNumberButton(
                          number: 6,
                          text: 'M N O',
                          onTap: model.onPinTap,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        AppNumberButton(
                          number: 7,
                          text: 'P Q R S',
                          onTap: model.onPinTap,
                        ),
                        AppNumberButton(
                          number: 8,
                          text: 'T U V',
                          onTap: model.onPinTap,
                        ),
                        AppNumberButton(
                          number: 9,
                          text: 'W X Y Z',
                          onTap: model.onPinTap,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding:
                              const EdgeInsets.symmetric(vertical: 7.5, horizontal: 14),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * .175,
                            height: MediaQuery.of(context).size.width * .175,
                          ),
                        ),
                        AppNumberButton(
                          number: 0,
                          onTap: model.onPinTap,
                        ),
                        AppPinButton(
                          icon: Icons.close,
                          onTap: (_) => model.clearPin(),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
