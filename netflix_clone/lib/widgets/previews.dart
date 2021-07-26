import 'package:flutter/material.dart';
import 'package:netflix_clone/models/content_model.dart';

class PreViews extends StatelessWidget {
  
  final String title;
  final List<Content> contentList;

  const PreViews({
    Key? key,
    required this.title,
    required this.contentList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(),
      child: Column(
        children: [        
          ListView.builder(itemBuilder: (context,idx){
            return Container();
          }),
        ],
      ),
    );
  }
}
