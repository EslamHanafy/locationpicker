import 'dart:async';

import 'package:flutter/material.dart';

/// Custom Search input field, showing the search and clear icons.
class SearchInput extends StatefulWidget {
  final ValueChanged<String> onSearchInput;
  final String searchHint;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;

  SearchInput({
    required this.onSearchInput,
    required this.searchHint,
    this.hintStyle,
    this.textStyle,
  });

  @override
  State<StatefulWidget> createState() => SearchInputState();
}

class SearchInputState extends State<SearchInput> {
  TextEditingController editController = TextEditingController();

  Timer? debouncer;

  bool hasSearchEntry = false;

  SearchInputState();

  @override
  void initState() {
    super.initState();
    this.editController.addListener(this.onSearchInputChange);
  }

  @override
  void dispose() {
    this.editController.removeListener(this.onSearchInputChange);
    this.editController.dispose();

    super.dispose();
  }

  void onSearchInputChange() {
    if (this.editController.text.isEmpty) {
      this.debouncer?.cancel();
      widget.onSearchInput(this.editController.text);
      return;
    }

    if (this.debouncer?.isActive ?? false) {
      this.debouncer!.cancel();
    }

    this.debouncer = Timer(Duration(milliseconds: 1500), () {
      widget.onSearchInput(this.editController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 40,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.search, color: Colors.black),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              textAlignVertical: TextAlignVertical.top,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 8),
                hintText: widget.searchHint,
                hintStyle: widget.hintStyle,
                border: InputBorder.none,
              ),
              style: widget.textStyle,
              controller: this.editController,
              onChanged: (value) {
                setState(() {
                  this.hasSearchEntry = value.isNotEmpty;
                });
              },
            ),
          ),
          SizedBox(width: 8),
          if (this.hasSearchEntry)
            GestureDetector(
              child: Icon(Icons.clear),
              onTap: () {
                this.editController.clear();
                setState(() {
                  this.hasSearchEntry = false;
                });
              },
            ),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).canvasColor,
      ),
    );
  }
}
