import 'package:flutter/material.dart';
import 'package:netflix_clone/models/content_model.dart';

class ContentList extends StatelessWidget {
  final String title;
  final List<Content> contentList;
  final bool isOriginal;
  
  const ContentList({
    Key? key,
    required this.title,
    required this.contentList,
    this.isOriginal = false,    
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24,),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            height: isOriginal ? 500.0 : 220.0,
            child: ListView.builder(
              itemCount: contentList.length,
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16,),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
                final Content content = contentList[index];
                return GestureDetector(
                  onTap: ()=> {},
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.0),
                    width: isOriginal ? 200 : 130,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(content.imageUrl),
                        fit: BoxFit.cover,
                      )
                    ),
                  ),
                );
              }
            ),
          ),
        ],
      ),
    );    
  }
}
