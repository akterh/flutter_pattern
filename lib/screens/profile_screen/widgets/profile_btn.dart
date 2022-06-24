import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  final bool? isClickable;
  final String? titleText;
  final String? txtData;
  final VoidCallback? onPressed;

  const ProfileButton(
      {Key? key,
      this.isClickable,
      this.titleText,
      this.txtData,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isClickable == true ? onPressed : null,
      style: TextButton.styleFrom(backgroundColor: Colors.grey[300]),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titleText ?? "",
                      style: const TextStyle(
                          color: Color(0xff353B50),
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          letterSpacing: -0.2),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      txtData ?? "",
                      style: const TextStyle(
                        fontFamily: 'SFProDisplayRegular ',
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        letterSpacing: -0.4,
                        color: Color(0xff371D32),
                      ),
                    ),
                  ]),
            ),
            isClickable == true
                ? const SizedBox(
                    width: 16,
                    child: Icon(Icons.keyboard_arrow_right,
                        color: Color(0xFF353B50)),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
