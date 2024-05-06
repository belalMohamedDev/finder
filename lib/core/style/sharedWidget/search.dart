import 'package:finder/core/language/lang_keys.dart';
import 'package:flutter/material.dart';


Widget searchBar(context,
    {required Function function,
    required Function clear,
    required TextEditingController search}) {
  double w = MediaQuery.of(context).size.width;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(99),
            ),
            elevation: 2,
            child: Container(
              alignment: Alignment.center,
              height: w / 8.5,
              width: w / 1.36,
              padding: EdgeInsets.symmetric(horizontal: w / 60),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(99),
              ),
              child: TextFormField(
                maxLines: 1,
                controller: search,
                onChanged: (value) => function(value),
                decoration: InputDecoration(
                  hoverColor: Colors.transparent,
                  fillColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  filled: true,

                  hintStyle: TextStyle(
                      color: Colors.black.withOpacity(.4),
                      fontWeight: FontWeight.w600,
                      fontSize: w / 22),
                  prefixIcon:
                      Icon(Icons.search, color: Colors.black.withOpacity(.6)),
                  labelText: LangKeys.searchAnything,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 2,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  //tooltip: 'Settings',
                  icon: Icon(Icons.delete,
                      size: 20, color: Colors.black.withOpacity(.6)),
                  onPressed: () => clear()),
            ),
          ),
        ],
      ),
    ],
  );
}
