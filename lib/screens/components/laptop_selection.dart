import 'package:flutter/material.dart';

class LaptopSelection extends StatefulWidget {
  final List<String> itemsList;
  LaptopSelection({required this.itemsList});

  @override
  _LaptopSelectionState createState() => _LaptopSelectionState();
}

class _LaptopSelectionState extends State<LaptopSelection> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _filteredList = [];

  @override
  void initState() {
    super.initState();
    _filteredList.addAll(widget.itemsList);
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    String searchTerm = _searchController.text;
    List<String> tempList = [];

    if (searchTerm.isEmpty) {
      tempList.addAll(widget.itemsList);
    } else {
      widget.itemsList.forEach((item) {
        if (item.toLowerCase().contains(searchTerm.toLowerCase())) {
          tempList.add(item);
        }
      });
    }

    setState(() {
      _filteredList.clear();
      _filteredList.addAll(tempList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search...',
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _filteredList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(_filteredList[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
