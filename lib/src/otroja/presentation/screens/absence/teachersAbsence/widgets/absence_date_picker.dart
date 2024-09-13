import 'package:flutter/material.dart';

class AbsenceDatePicker extends StatefulWidget {
  final String? hintText;
  final String labelText;
  final Color containerColor;
  final double containerWidth;
  final double borderThickness;
  final Color borderColor;
  final String imagePath;
  final TextDirection textDirection;
  DateTime? selectedDate;

  AbsenceDatePicker({
    this.hintText = "",
    required this.labelText,
    required this.containerColor,
    required this.containerWidth,
    required this.borderThickness,
    required this.borderColor,
    required this.imagePath,
    required this.textDirection,
    required this.selectedDate,
  });

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<AbsenceDatePicker> {
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xff85313C), // لون الاختيار
              onPrimary: Colors.white, // لون النص عند الاختيار
              surface: Color.fromARGB(223, 239, 227, 211), // لون الخلفية
              onSurface: Colors.black, // لون النص عند عدم الاختيار
            ),
            dialogBackgroundColor:
                const Color.fromARGB(223, 239, 227, 211), // لون خلفية الحوار
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != widget.selectedDate)
      setState(() {
        widget.selectedDate = picked;
        print(widget.selectedDate.toString());
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Text(
            widget.labelText!,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.right,
          ),
        ),
        GestureDetector(
          onTap: () => _selectDate(context),
          child: Container(

            width: widget.containerWidth,
            height: 50,
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: widget.containerColor,
              border: Border.all(
                color: widget.borderColor,
                width: widget.borderThickness,
              ),
              borderRadius: BorderRadius.circular(18.0),
            ),
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                Image.asset(widget.imagePath),
                const SizedBox(
                  width: 100,
                ),
                widget.selectedDate == null
                    ? Text(
                        '${widget.hintText}',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 155, 151, 151),
                          fontSize: 16.0,
                        ),
                      )
                    : Text(
                        '${widget.selectedDate!.day}-${widget.selectedDate!.month}-${widget.selectedDate!.year}',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 16.0,
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
