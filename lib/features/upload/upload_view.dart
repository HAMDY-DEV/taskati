import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/functions/custom_dialogs.dart';
import 'package:taskati/core/functions/routing.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/widgets/custom_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/widgets/custom_text_form_field.dart';
import 'package:taskati/features/home/presentation/view/home_view.dart';

class UploadView extends StatefulWidget {
  const UploadView({super.key});

  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  GlobalKey key = GlobalKey<FormState>();
  String? path;
  String name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                if (name.isEmpty && path == null) {
                  showErrorDialogs(
                      context: context, text: 'Enter your name and imag');
                } else if (name.isNotEmpty && path == null) {
                  showErrorDialogs(context: context, text: 'Enter your  imag');
                } else if (name.isEmpty && path != null) {
                  showErrorDialogs(context: context, text: 'Enter your name');
                } else {
                  AppLocalStorage.cachData(key: 'name', value: name);
                  AppLocalStorage.cachData(key: 'image', value: path);
                  AppLocalStorage.cachData(key: 'isUpload', value: true);
                  navigateEithRplacment(context, const HomeView());
                }
              },
              child: const Text('Done'))
        ],
      ),
      body: Form(
        key: key,
        child: Padding(
          padding: const EdgeInsets.all(19.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: (path != null)
                      ? FileImage(File(path!)) as ImageProvider
                      : const AssetImage('assets/images/avatar.png'),
                ),
                const Gap(20),
                CustomButton(
                  text: 'Upload from Camera',
                  onPressed: () {
                    uploadFromCamera();
                  },
                ),
                CustomButton(
                  text: 'Upload from Gallery',
                  onPressed: () {
                    uploadFromGallery();
                  },
                ),
                const Gap(10),
                const Divider(
                  endIndent: 35,
                  indent: 35,
                ),
                const Gap(15),
                CustomTextFormField(
                  validator: (data) {
                    if (data == null) {
                      return 'Enter your name';
                    }
                    return null;
                  },
                  hint: 'Enter Your Name',
                  onChanged: (data) {
                    name = data;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void uploadFromCamera() async {
    final pickerImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickerImage != null) {
      setState(() {
        path = pickerImage.path;
      });
    }
  }

  void uploadFromGallery() async {
    final pickerImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickerImage != null) {
      setState(() {
        path = pickerImage.path;
      });
    }
  }
}
