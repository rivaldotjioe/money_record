import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:money_record/config/app_color.dart';
import 'package:money_record/config/app_format.dart';
import 'package:money_record/config/session.dart';
import 'package:money_record/presentation/page/auth/login_page.dart';
import 'package:money_record/presentation/page/home_page.dart';

import 'data/model/user.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting(AppFormat.DEFAULT_LOCALE).then((value) {
    runApp(const MyApp());
  });

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: AppColor.primary,
        colorScheme: ColorScheme.light().copyWith(
          primary: AppColor.primary,
          secondary: AppColor.secondary,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColor.background,
          foregroundColor: Colors.white,
        )
      ),
      home: FutureBuilder(builder: (context, AsyncSnapshot<User?> snapshot) {
        if(snapshot.data!=null && snapshot.data?.idUser != null) {
          return HomePage();
        }
        return LoginPage();
      }, future: Session.getUser(),),
    );
  }
}
