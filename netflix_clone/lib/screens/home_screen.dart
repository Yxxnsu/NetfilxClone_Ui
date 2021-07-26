import 'package:flutter/material.dart';
import 'package:netflix_clone/data/data.dart';
import 'package:netflix_clone/widgets/custom_app_bar.dart';
import 'package:netflix_clone/widgets/content_header.dart';
import 'package:netflix_clone/widgets/previews.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<HomeScreen> {

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
      extendBodyBehindAppBar: true, //AppBar 포함해서 표시.
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
          SliverToBoxAdapter(
            child: ContentHeader(featuredContent: sintelContent),                                  
          ),
          SliverPadding(
            padding: EdgeInsets.only(top:20),
            sliver: SliverToBoxAdapter(
              child: PreViews(
                title: 'Previous',
                contentList: previews,                
              ),
            ),
          ),
        ],
      )
    );
    
  }
}