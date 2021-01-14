import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:test_task_auth/ui/widgets/app_number_button.dart';
import 'package:test_task_auth/ui/widgets/app_pin_button.dart';
import 'package:test_task_auth/ui/widgets/app_pin_dots.dart';

import '../../../l10n/generated/l10n.dart';
import '../../theme/theme.dart';
import 'pin_enter_view_model.dart';

class PinEnterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PinEnterViewModel>.reactive(
      viewModelBuilder: () => PinEnterViewModel(context),
      onModelReady: (model) => model.onReady(),
      builder: (context, PinEnterViewModel model, child) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  Strings.current.input_pin,
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
                          PinDots(
                            count: model.pin.length,
                            color: (snapshot.data ?? false) ? AppColors.error : null,
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
                        StreamBuilder<AppPinButtonState>(
                            stream: model.showBiometrics,
                            builder: (context, snapshot) {
                              return AppPinButton(
                                icon: Icons.fingerprint,
                                state: snapshot.data,
                                onTap: model.onBiometricsTap,
                              );
                            }),
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
