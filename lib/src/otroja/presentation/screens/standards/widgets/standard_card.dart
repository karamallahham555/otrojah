import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class StandardCard extends StatelessWidget {
  final String activityTitle;
  final int activityOtroja;
  final bool isAdd;
  final bool isInList; // Add this flag
  final Function onAdd; // Add a callback for add button
  final Function remove; // Add a callback for add button

  StandardCard({
    super.key,
    required this.activityTitle,
    required this.activityOtroja,
    required this.isAdd,
    required this.isInList, // Pass the flag
    required this.onAdd, // Pass the callback
    required this.remove, // Pass the callback
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xff85313C), width: 2.w),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: const Color.fromARGB(223, 245, 236, 224),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                    decoration: const BoxDecoration(
                      color: Color(0xff85313C),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(9),
                      ),
                    ),
                    child: Text(
                      '% $activityOtroja',
                      style: TextStyle(
                          color: Colors.white,
                          fontStyle: FontStyle.normal,
                          fontSize: 18.sp),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          activityTitle,
                          style: TextStyle(
                              color: Colors.black,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if(isAdd)
              Container(
                color: const Color.fromARGB(223, 245, 236, 224),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          height: 38,
                          child: OutlinedButton(
                            onPressed: () => onAdd(), // Call the onAdd callback
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                color: isInList ? Colors.green : const Color(0xFF85313C),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Icon(
                              Icons.add,
                              color: isInList ? Colors.green : const Color(0xFF85313C),
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 41,
                            child: OutlinedButton(
                              onPressed:()=>remove(),
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                  color: Color(0xFF85313C),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Icon(
                                Icons.remove_circle,
                                color: Color(0xFF85313C),
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
