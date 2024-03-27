import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String titleappbar;
  final void Function()? onPressedIconFavorite;
  final void Function()? onPressedSearch;
  final void Function(String)? onChanged;
  final TextEditingController mycontroller;
  final IconData iconData;
   const CustomAppBar(
      {super.key,
      required this.titleappbar,
      this.onPressedSearch,
      required this.onPressedIconFavorite,
      this.onChanged,
      required this.mycontroller,
      this.iconData = Icons.favorite_border_outlined});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  const EdgeInsets.only(top: 20),
      child: Row(children: [
        Expanded(
          flex: 4,
            child: TextFormField(
          controller: mycontroller,
          onChanged: onChanged,
          decoration: InputDecoration(
              contentPadding:  const EdgeInsets.symmetric(vertical: 15),
              prefixIcon: IconButton(
                  icon:  const Icon(Icons.search), onPressed: onPressedSearch),
              hintText: titleappbar,
              hintStyle:  const TextStyle(fontSize: 18),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)),
              filled: true,
              fillColor: Colors.grey[200]),
        )),
         const SizedBox(width: 10),
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
            padding:  const EdgeInsets.symmetric(vertical: 3),
            child: IconButton(
                onPressed: onPressedIconFavorite,
                icon: Icon(
                  iconData,
                  size: 30,
                  color: Colors.grey[600],
                )),
          ),
        )
      ]),
    );
  }
}
