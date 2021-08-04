import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix_clone/models/content_model.dart';
import 'package:netflix_clone/widgets/vertical_icon_button.dart';
import 'package:netflix_clone/widgets/widgets.dart';
import 'package:video_player/video_player.dart';

class ContentHeader extends StatelessWidget {

  final Content featuredContent;
  
  const ContentHeader({
    Key? key,
    required this.featuredContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _ContentHeaderMobile(featuredContent: featuredContent),
      desktop: _ContentHeaderDesktop(featuredContent: featuredContent),
    );
    
  }
}

 Widget _playButton(){
    return Padding(
      padding: const EdgeInsets.all(0),
      child: ElevatedButton.icon(            
        icon: Icon(Icons.play_arrow,size: 30,color:Colors.black),
        label: Text(
          'Play',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,  
            color:Colors.black,          
          )
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.white,          
        ),
        onPressed: (){},
      ),
    );      
  }

class _ContentHeaderMobile extends StatelessWidget {

  final Content featuredContent;

  const _ContentHeaderMobile({
    Key? key,
    required this.featuredContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
    alignment: Alignment.center,
    children: [
      Container(
        height: 500.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(featuredContent.imageUrl),
            fit: BoxFit.cover,
          )
        ),         
      ),
      Container(
        height: 500.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.transparent],     
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,     
          )
        ),         
      ),
      Positioned(
        bottom: 110.0,
        child: SizedBox(
          width: 250,
          child: Image.asset(featuredContent.titleImageUrl!),
        ),
      ),
      
      //TODO: Postioned 꿀팁!
      Positioned(
        right: 0,
        left: 0,
        bottom: 40.0,
        child: Row(            
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            VerticalIconButton(
              icon: Icons.add,
              title: 'List',
              onTap: () => print('List'),
            ),
            _playButton(),
             VerticalIconButton(
              icon: Icons.add,
              title: 'Info',
              onTap: () => print('MY Info'),
            )
          ],
        ),
      )
    ],
  );
  }
}

class _ContentHeaderDesktop extends StatefulWidget {

  final Content featuredContent;

  const _ContentHeaderDesktop({
    Key? key,
    required this.featuredContent,
  }) : super(key: key);

  @override
  __ContentHeaderDesktopState createState() => __ContentHeaderDesktopState();
}

class __ContentHeaderDesktopState extends State<_ContentHeaderDesktop> {

  late VideoPlayerController _videoPlayerController;
  bool _isMuted = true;

  @override
  void initState() { 
    _videoPlayerController = VideoPlayerController.asset(widget.featuredContent.videoUrl!);
    _videoPlayerController.addListener(() {
      setState(() { });
    });
    _videoPlayerController.initialize().then((_) => setState((){}));
    _videoPlayerController.play();

    super.initState();

  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _videoPlayerController.value.isPlaying 
          ? _videoPlayerController.pause()
          : _videoPlayerController.play(),
      child: Stack(
      alignment: Alignment.bottomLeft,
      children: [
        AspectRatio(
          aspectRatio: _videoPlayerController.value.isInitialized 
          ? _videoPlayerController.value.aspectRatio
          : 2.344,
          child: _videoPlayerController.value.isInitialized 
            ? VideoPlayer(_videoPlayerController)
            : Image.asset(
              widget.featuredContent.imageUrl,
              fit: BoxFit.cover,
            ),          
        ),
        VideoProgressIndicator(_videoPlayerController, allowScrubbing: true),
        Container(
          height: 500.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.featuredContent.imageUrl),
              fit: BoxFit.cover,
            )
          ),         
        ),
        Container(
          height: 500.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.transparent],     
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,     
            )
          ),         
        ),
        Positioned(
          left: 60,
          right: 60 ,
          bottom: 150,          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 250,
                child: Image.asset(widget.featuredContent.titleImageUrl!),                
              ),
              const SizedBox(height: 15,),
              Text(
                widget.featuredContent.description!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      offset: Offset(2, 4),
                      blurRadius: 6,
                    ),
                  ],
                ),             
              ),
              const SizedBox(height: 20,),
              Row(                
                children: [
                  _playButton(),
                  const SizedBox(width: 16,),
                  ElevatedButton.icon(
                    onPressed: ()=> print('More Info'), 
                    icon: Icon(
                      Icons.info_outline,
                      color: Colors.black,
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,                      
                    ),
                    label: Text(
                      'More Info',
                      style: TextStyle(
                        fontSize: 16, 
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),                                        
                    ),
                  ),  
                  const SizedBox(width: 20,),
                  if(_videoPlayerController.value.isInitialized)
                    IconButton(
                      icon: Icon(
                        _isMuted ? Icons.volume_off : Icons.volume_up,   
                        color: Colors.white,                     
                      ),
                      onPressed: ()=> setState((){
                        _isMuted 
                          ? _videoPlayerController.setVolume(100)
                          : _videoPlayerController.setVolume(0);
                        _isMuted = _videoPlayerController.value.volume == 0;
                      }),                
                    )
                ],
              )
            ],
          )
        ),
      ],
      ),
    );
  }
}
