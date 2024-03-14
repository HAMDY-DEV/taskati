import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utils/text_style.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({
    super.key,
  });

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  String? path;
  String name = '';

  @override
  void initState() {
    super.initState();

    name = AppLocalStorage.getCachData(key: 'name');
    path = AppLocalStorage.getCachData(key: 'image');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Gap(10),
        Column(
          children: [
            Text(
              'Hello,$name',
              style: getTextStyle(),
            ),
            const Text('Have A Nice Day.'),
          ],
        ),
        const Spacer(),
        CircleAvatar(
          radius: 25,
          backgroundImage: (path != null)
              ? FileImage(File(path!)) as ImageProvider
              : const AssetImage('assets/images/avatar.png'),
        ),
        const Gap(10),
      ],
    );
  }
}
