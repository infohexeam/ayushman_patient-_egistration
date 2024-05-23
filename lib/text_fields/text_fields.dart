import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../app_color/app_colors.dart';
import '../assets/icons.dart';

class AppTextFormField extends StatelessWidget {
  final String header;
  final int? maxLInes;
  final int? minLines;
  final int? maxLength;
  final double? width;
  final bool? readOnly;
  final bool? obscureText;
  final String? placeHolder;
  final String? errorText;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final TextInputType? textInputType;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;

  const AppTextFormField(
      {super.key,
      required this.controller,
      this.validator,
      this.maxLInes,
      this.readOnly,
      this.onChanged,
      this.width,
      this.obscureText,
      this.maxLength,
      this.minLines,
      this.errorText,
      this.placeHolder,
      required this.header,
      this.textInputType,
      this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      style: TextStyle(fontSize: 24.sp, color: AppColors.black),
      validator: validator,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      keyboardType: textInputType,
      smartDashesType: SmartDashesType.enabled,
      maxLines: maxLInes ?? 1,
      minLines: minLines ?? 1,
      obscureText: obscureText ?? false,
      maxLength: maxLength,
      decoration: InputDecoration(
        counterText: "",
        label: Text(header),
        alignLabelWithHint: true,
        errorText: (errorText ?? "").isEmpty ? null : errorText,
      ),
    );
  }
}

class AppDropDownFormField<T> extends StatelessWidget {
  final String header;
  final String? placeHolder;
  final String? errorText;
  final bool? validationNeeded;
  final double? width;
  final bool? readOnly;
  final String? Function(T) label;
  final T? value;
  final String? Function(T?)? validator;
  final void Function(T?)? onChange;
  final List<T> itemList;

  const AppDropDownFormField(
      {super.key,
      required this.header,
      required this.onChange,
      required this.value,
      required this.itemList,
      this.errorText,
      this.width,
      this.readOnly,
      this.placeHolder,
      required this.label,
      this.validationNeeded,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        itemHeight: null,
        isExpanded: true,
        style: TextStyle(fontSize: 24.sp, color: AppColors.black),
        decoration: InputDecoration(
          labelText: header,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 10.sp, vertical: 7.sp),
        ),
        items: itemList
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(
                    label(e) ?? "",
                    style: TextStyle(fontSize: 24.sp, color: AppColors.black),
                  ),
                ))
            .toList(),
        value: value,
        onChanged: onChange);
  }
}

class AppDatePickerFormField extends StatelessWidget {
  final String header;
  final String? placeHolder;
  final String? label;
  final bool? readOnly;
  final void Function()? readOnlyCallBack;
  final DateTime? initialDate;
  final Widget? icon;
  final DateTime? lastDate;
  final DateTime? startDate;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const AppDatePickerFormField(
      {super.key,
      required this.header,
      this.readOnly,
      this.readOnlyCallBack,
      this.placeHolder,
      this.icon,
      this.initialDate,
      this.lastDate,
      this.startDate,
      required this.controller,
      this.label,
      this.validator});

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat("d / MMM / yyyy");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: (readOnly ?? false)
              ? readOnlyCallBack
              : () async {
                  DateTime? date = await showDatePicker(
                      context: context,
                      firstDate: startDate ?? DateTime(1998),
                      lastDate: lastDate ?? DateTime.now(),
                      initialEntryMode: DatePickerEntryMode.calendarOnly,
                      helpText: label,
                      initialDate: initialDate ?? startDate ?? DateTime.now());

                  if (date != null) {
                    controller.text = dateFormat.format(date);
                  }
                },
          child: IgnorePointer(
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: controller,
              style: TextStyle(fontSize: 24.sp, color: AppColors.black),
              readOnly: readOnly ?? false,
              validator: validator,
              decoration: InputDecoration(
                labelText: header,
                floatingLabelStyle:
                    TextStyle(fontSize: 20.sp, color: AppColors.grey102),
                labelStyle:
                    TextStyle(fontSize: 20.sp, color: AppColors.grey102),
                suffixIconConstraints: BoxConstraints(
                  maxWidth: 65.sp,
                ),
                suffixIcon: Container(
                  padding: EdgeInsets.only(right: 13.sp),
                  child: icon ??
                      SvgPicture.asset(
                        AppIcons.calender,
                      ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
