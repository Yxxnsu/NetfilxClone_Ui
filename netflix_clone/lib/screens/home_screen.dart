import 'package:flutter/material.dart';
import 'package:netflix_clone/data/data.dart';
import 'package:netflix_clone/widgets/content_list.dart';
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

      //TODO: Scroller AddListener
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

      //TODO: AppBar 덮어쓰기!
      extendBodyBehindAppBar: true, 
    
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[850],
        child: Icon(Icons.cast),
        onPressed: (){},
      ),

      //TODO: AppBar 사이즈 설정!
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
                key: PageStorageKey('previews'),
                title: 'Previous',
                contentList: previews,                
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              key: PageStorageKey('myList'),
              title: 'My List',
              contentList: myList,              
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              key: PageStorageKey('originals'),
              title: 'Netflix Originals',
              contentList: originals,     
              isOriginal: true,            
            ),
          ),
          SliverPadding(
            key: PageStorageKey('trending'),
            padding: EdgeInsets.only(bottom: 20),
            sliver: SliverToBoxAdapter(
              child: ContentList(
                title: 'Trending',
                contentList: trending,                         
              ),
            ),
          )
        ],
      )
    );
    
  }
}