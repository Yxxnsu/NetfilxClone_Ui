import 'package:flutter/material.dart';
import 'package:netflix_clone/widgets/custom_app_bar.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {

  late ScrollController _scrollController;
  double _scrollOffset = 0.0;

  @override
    void initState() {
      _scrollController = ScrollController()
        ..addListener(() {
          setState(() {
            _scrollOffset = _scrollController.offset;
          });
        });
      super.initState();      
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;    
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[850],
        child: Icon(Icons.cast),
        onPressed: (){},
      ),
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width,50),
        child: CustomAppBar(scrollOffset: _scrollOffset,),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          
        ],
      )
    );
    
  }
}