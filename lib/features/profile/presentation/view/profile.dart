import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_style.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColoes.primary,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              Icons.sunny,
              color: AppColoes.primary,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                CircleAvatar(
                    radius: 50,
                    child:
                        Image.asset(AppLocalStorage.getCachData(key: 'image'))),
                Positioned(
                    right: BorderSide.strokeAlignCenter,
                    bottom: BorderSide.strokeAlignCenter,
                    child: InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.camera_alt,
                          color: AppColoes.primary,
                          size: 20,
                        ))),
              ],
            ),
            const Gap(30),
            Divider(
              endIndent: 30,
              indent: 30,
              color: AppColoes.primary,
            ),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalStorage.getCachData(key: 'name'),
                  style: getBodyStyle(
                      color: AppColoes.primary, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppColoes.primary),
                      borderRadius: BorderRadius.circular(50)),
                  child: Icon(
                    Icons.edit,
                    color: AppColoes.primary,
                    size: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
