import 'package:careflix/core/configuration/styles.dart';
import 'package:careflix/core/enum.dart';
import 'package:careflix/core/routing/route_path.dart';
import 'package:careflix/layers/view/auth/widgets/gradient_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../core/validators/validators.dart';
import '../../../generated/l10n.dart';
import '../lists_screen/widget/heading_widget.dart';

class SetUpProfileScreen extends StatefulWidget {
  const SetUpProfileScreen({super.key});

  @override
  State<SetUpProfileScreen> createState() => _SetUpProfileScreenState();
}

class _SetUpProfileScreenState extends State<SetUpProfileScreen> {
  TextEditingController _userFirstName = TextEditingController();
  TextEditingController _userLastName = TextEditingController();
  TextEditingController _dateOfBirth = TextEditingController();

  Gender gender = Gender.Male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    RoutePaths.LogIn, (route) => false);
              },
              icon: Icon(
                Icons.logout,
                color: Colors.red,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).welcome,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      S.of(context).setUpProfile,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                CommonSizes.vBiggestSpace,
                Form(
                    child: Column(
                  children: [
                    HeadingWidget(
                      title: S.of(context).firstName,
                      padding: 10,
                      textStyle: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 20),
                      child: TextFormField(
                        controller: _userFirstName,
                        keyboardType: TextInputType.text,
                        validator: (text) {
                          if (text != null) {
                            if (!Validators.isNotEmptyString(text)) {
                              return S.of(context).fill_all_fields;
                            }
                          }
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        style: TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                          hintText: S.of(context).firstName,
                        ).copyWith(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 13)),
                      ),
                    ),
                    CommonSizes.vSmallSpace,
                    HeadingWidget(
                      title: S.of(context).lastName,
                      padding: 10,
                      textStyle: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 20),
                      child: TextFormField(
                        controller: _userLastName,
                        keyboardType: TextInputType.text,
                        validator: (text) {
                          if (text != null) {
                            if (!Validators.isNotEmptyString(text)) {
                              return S.of(context).fill_all_fields;
                            }
                          }
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        style: TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                          hintText: S.of(context).lastName,
                        ).copyWith(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 13)),
                      ),
                    ),
                    CommonSizes.vSmallSpace,
                    HeadingWidget(
                      title: S.of(context).dateOfBirth,
                      padding: 10,
                      textStyle: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 20),
                      child: TextFormField(
                        controller: _dateOfBirth,
                        keyboardType: TextInputType.emailAddress,
                        validator: (text) {
                          if (text != null) {
                            if (!Validators.isNotEmptyString(text)) {
                              return S.of(context).fill_all_fields;
                            }
                          }
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        readOnly: true,
                        onTap: () => selectDate(),
                        style: TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                            hintText: S.of(context).dateOfBirth,
                            prefixIcon: Icon(Icons.date_range)),
                      ),
                    )
                  ],
                )),
                CommonSizes.vSmallSpace,
                HeadingWidget(
                  title: S.of(context).gender,
                  padding: 10,
                  textStyle: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              gender = Gender.Male;
                            });
                          },
                          child: Text(S.of(context).male,
                              style: TextStyle(color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                              textStyle: TextStyle(color: Colors.white),
                              backgroundColor: gender == Gender.Male
                                  ? Colors.blue
                                  : Colors.blue.withOpacity(0.4)),
                        ),
                      ),
                      CommonSizes.hSmallSpace,
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                gender = Gender.Female;
                              });
                            },
                            child: Text(
                              S.of(context).female,
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: gender == Gender.Female
                                    ? Colors.pink
                                    : Colors.pink.withOpacity(0.4))),
                      )
                    ],
                  ),
                ),
                CommonSizes.vLargeSpace,
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        RoutePaths.Home, (route) => false);
                  },
                  child: GradientButton(
                    title: S.of(context).save,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(1940),
        lastDate: DateTime.now(),
        initialDate: DateTime.now());

    if (picked != null) {
      _dateOfBirth.text = picked.toString().split(" ")[0];
    }
  }
}
