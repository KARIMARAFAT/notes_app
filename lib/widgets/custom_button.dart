import 'package:flutter/material.dart';
import 'package:notes_app/constants/app_consts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.ontap});
  final Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        // بتاخد عر ض شاشة الموبايل
        width: MediaQuery.of(context).size.width,
        height: 55,

        decoration: BoxDecoration(
          color: AppConsts.kprimaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            'Add',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
