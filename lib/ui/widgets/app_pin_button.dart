import 'package:flutter/material.dart';
import 'package:test_task_auth/ui/theme/theme.dart';

enum AppPinButtonState { loading, active, error }

class AppPinButton extends StatelessWidget {
  const AppPinButton({
    @required this.icon,
    Key key,
    this.onTap,
    this.state = AppPinButtonState.active,
  }) : super(key: key);
  final void Function(AppPinButtonState) onTap;
  final IconData icon;
  final AppPinButtonState state;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => onTap(state),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 14),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * .175,
          height: MediaQuery.of(context).size.width * .175,
          child: Icon(
            icon,
            color: _getColor(state),
          ),
        ),
      ),
    );
  }

  Color _getColor(AppPinButtonState state) {
    switch (state) {
      case AppPinButtonState.loading:
        return AppColors.grey;
        break;
      case AppPinButtonState.active:
        return AppColors.primary;
        break;
      case AppPinButtonState.error:
        return AppColors.error;
        break;
      default:
        return AppColors.grey;
    }
  }
}
