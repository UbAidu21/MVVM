import 'package:flutter/material.dart';
import 'package:mvvm/resources/colors.dart';
import 'package:mvvm/resources/components/app_text.dart';

class RaoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPressed;

  RaoundButton({
    Key? key,
    required this.title,
    this.loading = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: 350,
        decoration: BoxDecoration(
          color: AppColors.btn_color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: loading
            ? Center(
                child: CircularProgressIndicator(color: AppColors.white_color))
            : Center(
                child: AppText(
                  title: title,
                  color: AppColors.white_color,
                  fontSize: 20,
                ),
              ),
      ),
    );
  }
}
