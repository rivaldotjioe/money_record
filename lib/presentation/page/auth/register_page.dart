import 'package:d_info/d_info.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_record/config/app_asset.dart';
import 'package:money_record/config/app_color.dart';
import 'package:money_record/data/model/standard_response.dart';
import 'package:money_record/data/source/source_user.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final controllerName = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();

  register() async {
    if (formKey.currentState!.validate()) {
      StandardResponse? response = await SourceUser.register(
          controllerName.text, controllerEmail.text, controllerPassword.text);
      if (response!.success) {
        DInfo.dialogSuccess(context, 'Berhasil Register');
        DInfo.closeDialog(context);
      } else {
        DInfo.dialogError(context, response.message!);
        DInfo.closeDialog(context);
      }
    }
  }

  validatorNotNullField(value) {
    return value == '' ? 'Jangan Kosong !' : null;
  }

  @override
  Widget build(BuildContext context) {
    const textStyleDefault = TextStyle(color: Colors.white);
    return Scaffold(
      backgroundColor: AppColor.background,
      body: LayoutBuilder(builder: (context, constraint) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraint.maxHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DView.nothing(),
                Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(children: [
                      Image.asset(AppAsset.logo),
                      DView.spaceHeight(40),
                      TextFormField(
                        controller: controllerName,
                        validator: (value) => validatorNotNullField(value),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        style: textStyleDefault,
                        decoration: InputDecoration(
                            fillColor: AppColor.primary.withOpacity(0.5),
                            filled: true,
                            hintStyle: textStyleDefault,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none),
                            hintText: 'Nama',
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 16)),
                      ),
                      DView.spaceHeight(),
                      TextFormField(
                        controller: controllerEmail,
                        validator: (value) => validatorNotNullField(value),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        style: textStyleDefault,
                        decoration: InputDecoration(
                            fillColor: AppColor.primary.withOpacity(0.5),
                            filled: true,
                            hintStyle: textStyleDefault,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none),
                            hintText: 'Email',
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 16)),
                      ),
                      DView.spaceHeight(),
                      TextFormField(
                        controller: controllerPassword,
                        validator: (value) => validatorNotNullField(value),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        obscureText: true,
                        style: textStyleDefault,
                        decoration: InputDecoration(
                            fillColor: AppColor.primary.withOpacity(0.5),
                            filled: true,
                            hintStyle: textStyleDefault,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none),
                            hintText: 'Password',
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 16)),
                      ),
                      DView.spaceHeight(30),
                      Material(
                        color: AppColor.primary,
                        borderRadius: BorderRadius.circular(30),
                        child: InkWell(
                          onTap: () => register(),
                          borderRadius: BorderRadius.circular(30),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 16),
                            child: Text(
                              'REGISTER',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Sudah punya akun ? '),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                              color: AppColor.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
