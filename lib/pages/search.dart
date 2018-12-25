import 'package:flutter/material.dart';
import '../widgets/search/input_navigation_bar.dart';

class Search extends StatefulWidget {
  static String tag = 'search_page';

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  _handleBack() {

  }

  _handleContentChange(String text) {

  }

  _handleScan() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        title: InputNavigationBar(
          onBack: () => Navigator.of(context).pop(),
          onChanged: _handleContentChange,
          onScan: _handleScan,
        ),
        leading: null,
        automaticallyImplyLeading: false,
        elevation: 1,
        titleSpacing: 0,
      ),
    );
  }
}
