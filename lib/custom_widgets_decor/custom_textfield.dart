import 'package:flutter/material.dart';
import '../my_themes.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final TextInputType inputType;
  final Color? fillColor;
  final bool isPassword;
  final bool isIcon;
  final bool isShowSuffixIcon;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onSuffixTap;
  final IconData? suffixIconUrl;
  final String? label;

  CustomTextField({
    this.hintText = '',
    this.controller,
    this.inputType = TextInputType.text,
    this.onSuffixTap,
    this.fillColor,
    this.isShowSuffixIcon = false,
    this.onTap,
    this.isIcon = false,
    this.isPassword = false,
    this.suffixIconUrl,
    this.label,
    this.onChanged,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 80,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(10),
      //   color: AppColors.grey153,
      //
      //   boxShadow: [
      //     BoxShadow(
      //         color: Colors.grey.withOpacity(.2),
      //         spreadRadius: 0.5,
      //         blurRadius: 5,
      //         offset: const Offset(0, 4) // changes position of shadow
      //         ),
      //   ],
      // ),
      child: Center(
        child: TextFormField(
          controller: widget.controller,
          keyboardType: widget.inputType,
          autofocus: false,
          //onChanged: widget.isSearch ? widget.languageProvider.searchLanguage : null,
          obscureText: widget.isPassword ? _obscureText : false,
          // inputFormatters: widget.inputType == TextInputType.phone ? <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp('[0-9+]'))] : null,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(25.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(style: BorderStyle.none, width: 0),
            ),
            isDense: true,
            hintText: widget.hintText,

            filled: true,
            suffixIcon: widget.isShowSuffixIcon
                ? widget.isPassword
                    ? IconButton(
                        icon: Icon(
                            _obscureText
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: Theme.of(context).hintColor.withOpacity(0.3)),
                        onPressed: _toggle)
                    : widget.isIcon
                        ? IconButton(
                            onPressed: widget.onSuffixTap,
                            icon: Icon(
                              widget.suffixIconUrl,
                              color: Theme.of(context).textTheme.bodyText1?.color,
                            ),
                          )
                        : null
                : null,
            label: Text(widget.label!),
          ),
          onTap: widget.onTap,
          onChanged: widget.onChanged,
          cursorColor: AppColors.accentColor,
        ),
      ),
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
