import 'package:flutter/material.dart';
import 'package:islami_application/models/contents_sceen_arguments.dart';
import 'package:islami_application/ui/screens/contents/contents.dart';
import 'package:islami_application/ui/utils/app_colors.dart';
import 'package:islami_application/ui/utils/app_theme.dart';
import 'package:islami_application/ui/utils/constants.dart';

class HadithTab extends StatelessWidget {
  List<String> hadithNames = List.generate(50, (index) {
    return "${index+1} حديث رقم ";
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 3,
            child: Image.asset(
                "assets/images/59253-quran-basmala-islamic-kufic-arabic-calligraphy-icon.png",
            ),
        ),
        const Text(
          "رقم الحديث",
          style: AppTheme.SuraNameColumnTextStyle,
        ),
        const Divider(
          color: AppColors.primary,
          thickness: 2,
        ),
        Expanded(
          flex: 7,
          child: ListView.builder(
            itemCount: Constants.surasNames.length,
            itemBuilder: (_, index) {

              /// Continute working on arguments here -->
              return TextButton(
                onPressed: (){
                  Navigator.pushNamed(
                      arguments: ContentsScreenArguments(
                          fileName: "h${index+1}.txt",
                          isQuran: false,
                          suraOrHadithName: hadithNames[index]
                      ),
                      context,
                      Contents.routeName
                  );
                },
                child: Text(
                  hadithNames[index],
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
