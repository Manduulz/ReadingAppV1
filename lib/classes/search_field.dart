import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0, left: 25),
      child: Container(
        height: 34,
        color: const Color(0xffE8EFF5),
        child: TextField(
          controller: _controller,
          decoration: const InputDecoration(
              labelText: 'Ном хайх',
              labelStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontFamily: 'InterTight',
                  color: Color.fromRGBO(0, 0, 0, 0.50)),
              iconColor: Color.fromRGBO(0, 0, 0, 0.50),
              suffixIcon: Icon(
                PhosphorIcons.magnifying_glass,
                size: 21,
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)))),
          onChanged: (value) {
            debugPrint('Search query : $value');
          },
        ),
      ),
    );
  }
}
