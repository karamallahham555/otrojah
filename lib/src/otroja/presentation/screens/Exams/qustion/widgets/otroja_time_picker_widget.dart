import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtrojaTimePickerWidget extends StatefulWidget {
  final String hintText;
  final String labelText;
  final double containerWidth;
  final double borderThickness;
  final Color borderColor;
  final String imagePath;
  final TextDirection textDirection;
  final Function(TimeOfDay) onTimeSelected;

  const OtrojaTimePickerWidget({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.containerWidth,
    required this.borderThickness,
    required this.borderColor,
    required this.imagePath,
    required this.textDirection,
    required this.onTimeSelected,
  }) : super(key: key);

  @override
  _OtrojaTimePickerWidgetState createState() => _OtrojaTimePickerWidgetState();
}

class _OtrojaTimePickerWidgetState extends State<OtrojaTimePickerWidget> {
  TimeOfDay? selectedTime;

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: const Color(0xFF85313C),
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF85313C), // Selected time color
              onPrimary: Colors.white, // Text color on selected time
            ),
            timePickerTheme: TimePickerThemeData(
              dialHandColor: const Color(0xFF85313C), // Hand of the clock color
              hourMinuteTextColor: const Color(0xFF85313C), // Hour and minute text color
              hourMinuteColor: Colors.white, // Background of hour and minute
              dayPeriodTextColor: Colors.white, // AM/PM text color
              dayPeriodColor: const Color(0xFF85313C), // AM/PM background
            ),
            buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            dialogBackgroundColor: const Color.fromARGB(223, 239, 227, 211),
          ),
          child: child ?? const SizedBox.shrink(), // Ensure child is non-null
        );
      },
    );

    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
      widget.onTimeSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15.0, right: 15),
          child: Text(
            widget.labelText,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 18.sp, // Adjust font size to match design
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        GestureDetector(
          onTap: () => _selectTime(context),
          child: Container(
            width: widget.containerWidth,
            height: 50.h, // Adjust height as per design
            padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.0.h),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: widget.borderColor, // Use the provided border color
                width: widget.borderThickness,
              ),
              borderRadius: BorderRadius.circular(18.0),
            ),
            child: Row(
              textDirection: widget.textDirection,
              children: [
                const Icon(
                  Icons.hourglass_bottom,
                  color: Color(0xFFE6E6E6),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Text(
                    selectedTime == null
                        ? widget.hintText
                        : selectedTime!.format(context),
                    style: TextStyle(
                      color: selectedTime == null ? const Color(0xFFC2C0C0) : Colors.black,
                      fontSize: 16.sp,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}