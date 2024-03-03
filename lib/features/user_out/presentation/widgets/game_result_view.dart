import 'package:flutter/material.dart';
import 'package:flutter_podstawy_utilities/colors/my_colors.dart';
import 'package:flutter_podstawy_utilities/constants/dimens.dart';

class GameResultView extends StatelessWidget {
  final VoidCallback action;
  final String screenTitle;
  final String actionTitle;
  final Color backgroundColor;

  const GameResultView(
      {required this.action,
      required this.screenTitle,
      required this.actionTitle,
      required this.backgroundColor,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: Dimens.mediumMargin, horizontal: Dimens.smallMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTitle(context),
            _buildActionButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Center(
      child: Text(screenTitle,
          style: Theme.of(context)
              .textTheme
              .displaySmall
              ?.copyWith(color: MyColors.white, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildActionButton() {
    return ElevatedButton(
        onPressed: action,
        style: ElevatedButton.styleFrom(backgroundColor: MyColors.ufoGreen),
        child: Text(actionTitle));
  }
}