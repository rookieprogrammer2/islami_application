import 'package:flutter/material.dart';
import 'package:islami_application/models/contents_sceen_arguments.dart';
import 'package:islami_application/ui/screens/contents/contents.dart';
import 'package:islami_application/ui/utils/app_colors.dart';
import 'package:islami_application/ui/utils/app_theme.dart';
import 'package:islami_application/ui/utils/constants.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 3,
            child: Image.asset(
                "assets/images/Screenshot.png",
            ),
        ),
        const Text(
          "أسم السوره",
          style: AppTheme.SuraNameColumnTextStyle,
        ),
        const Divider(
          color: AppColors.accent,
          thickness: 2,
        ),
        Expanded(
          flex: 7,
          child: ListView.builder(
            itemCount: Constants.surasNames.length,
            itemBuilder: (_, index) {
              /// Continute working on arguments here -->
              return TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                      arguments: ContentsScreenArguments(
                          fileName: "${index + 1}.txt",
                          isQuran: true,
                          suraOrHadithName: Constants.surasNames[index]),
                      context,
                      Contents.routeName);
                },
                child: Text(
                  Constants.surasNames[index],
                  textAlign: TextAlign.center,
                  style: AppTheme.SuraNameColumnTextStyle.copyWith(
                      fontWeight: FontWeight.w400),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
