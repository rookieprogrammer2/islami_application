import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_application/ui/utils/app_colors.dart';
import 'package:islami_application/ui/utils/app_theme.dart';
import 'package:islami_application/ui/screens/home/home_screen.dart';
import 'package:islami_application/models/contents_sceen_arguments.dart';
class Contents extends StatefulWidget {
  static const routeName = "content_screen";

  @override
  State<Contents> createState() => _ContentsState();
}

class _ContentsState extends State<Contents> {
  late ContentsScreenArguments arguments;

  String surahContents = "";

  void readFile () async {
    String file = await rootBundle.loadString(
        arguments.isQuran ? "assets/content/surat/${arguments.fileName}" :
    "assets/content/hadith/${arguments.fileName}");
    surahContents = file;
    List<String> fileLines = file.split("\n");
    for(int i = 0; i < fileLines.length; i++) {
      fileLines[i] += arguments.isQuran ? "(${i+1})" : "" ;
    }
    surahContents = fileLines.join();
    setState(() {});
    print(file);
  }

  @override
  Widget build(BuildContext context) {
    arguments = ModalRoute.of(context)!.settings.arguments as ContentsScreenArguments;
    if(surahContents.isEmpty) readFile();
    print(arguments.fileName);
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            'assets/images/background.png',
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            arguments.suraOrHadithName,
            style: AppTheme.appBarTextStyle,
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        body: surahContents.isEmpty ? const Center(
          child: CircularProgressIndicator(),) :
        Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 30.0, top: 90.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius:BorderRadius.circular(25),
              color: Colors.white,
            ),
            width: double.infinity,
            height: 500,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  surahContents,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 21,
                      color: AppColors.accent,

                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
