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
    return Column(
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
          height: 165,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: contentList.length,
            itemBuilder: (context, index){
              final Content content = contentList[index];
              return GestureDetector(
                onTap: () => {},
                child: Stack(
                  alignment: Alignment.center,
                  children: [

                    //TODO: Circle Image 만들기!
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(content.imageUrl),
                          fit:BoxFit.cover,                          
                        ),
                        shape: BoxShape.circle,
                        border: Border.all(color: content.color!, width: 4.0),
                      ),                      
                    ),
                    Container(                      
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black87,
                            Colors.black45,
                            Colors.transparent,
                          ],
                          stops: [0,0.25,1],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                        shape: BoxShape.circle,
                        border: Border.all(color: content.color!, width: 4.0),
                      ),                      
                    ),         
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: SizedBox(
                        height: 60,
                        child: Image.asset(content.titleImageUrl!),
                      )
                    )               
                  ],
                )
              );
            }
          ),
        )
      ],
    );
  }
}
