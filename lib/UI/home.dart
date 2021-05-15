import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humming_assignment/UI/profilepage.dart';
import 'package:humming_assignment/UI/videos.dart';
import 'package:humming_assignment/models/model.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentindex=0;
  PageController pageController=PageController(initialPage: 0);
  GlobalKey<ScaffoldState> scaffoldstatekey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavbar(),
      appBar: AppBar(
        backgroundColor: Color(0xff032613),
        // leading: Builder(
        //   builder: (context){
        //     return IconButton(
        //     icon: Icon(
        //       Icons.menu,
        //       color: Colors.white,
        //     ),
        //     onPressed: () {
        //       scaffoldstatekey.currentState.openDrawer();
        //     },
        //   );
        //   }
        // ),
      ),
      drawer: Container(
        width: MediaQuery.of(context).size.width*.75,
        child: Drawer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Container(
               margin: EdgeInsets.only(bottom: 30),
               color: Color(0xff032613),
               height: MediaQuery.of(context).size.height*.25,
             ),
             
              text("Home", 16),
              divider(1,Colors.grey),
              text("Videos", 16),
              divider(1.3, Colors.black),
              text("Profile", 16)
            ],
          ),
        )
      ),
      body: PageView(
        controller: pageController,
        children: [
          buildDailyNewsContent(),
          Videos(),
          Profile()

        ],
      ),
    );
  }

  Widget buildDailyNewsContent() {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: NewsModelContent.newsmodel.length,
      itemBuilder: (context, index) {
        return Container(
          height: MediaQuery.of(context).size.height * .14,
          margin: EdgeInsets.only(top: 30,left: 10,right: 10),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 20),
                width: MediaQuery.of(context).size.width * .3,
                height: MediaQuery.of(context).size.height * .3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(
                          NewsModelContent.newsmodel[index].imageUrl,
                        ),
                        fit: BoxFit.cover)),
              ),
              Expanded(
                child: Column(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      NewsModelContent.newsmodel[index].headline,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: GoogleFonts.crimsonPro(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16
                        )
                      ),
                    ),
                    Text(NewsModelContent.newsmodel[index].description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 13, color: 
                            Colors.grey.shade600,
                            fontWeight: FontWeight.w400
                            )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          size: 18,
                          color: Colors.grey.shade600,
                        ),
                        Text(
                          "03-03-2021",
                          style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.w300,fontSize: 14),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: Colors.orange.shade900.withOpacity(0.9),
                          ),
                            
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 1),
                            child: Text(
                              NewsModelContent.newsmodel[index].genre,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                        Icon(Icons.bookmark_outline,size: 22,)
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
  Widget bottomNavbar(){
    return BottomNavigationBar(
      selectedItemColor: Color(0xff032613),
      showUnselectedLabels: false,
      currentIndex: currentindex,
      selectedLabelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
      items: [
        
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home"
        ),
         BottomNavigationBarItem(
          icon: Icon(Icons.play_arrow_rounded),
          label: "Videos"
        ),
         BottomNavigationBarItem(
          icon: Icon(Icons.account_box_rounded),
          label: "Profile",
          
        ),
        
      ],
      onTap: (int index){
        setState(() {
           currentindex=index;
           pageController.animateToPage(index, duration: Duration(milliseconds: 400), curve:Curves.easeIn);
        });
       
      },
    );
  }

  Widget divider(double size,Color color){
    return Divider(
      height: size,
      color: color,
      indent: 10,
      endIndent: 10,
    );
  }
  Widget text(String name,double size){
    return Padding(
      padding: EdgeInsets.only(left: 40,bottom: 15,top: 15),
      child: Text(name,style: TextStyle(
        fontSize: size
      ),),
    );
  }
}

class NewsModelContent {
  static List<NewsModel> newsmodel = [
    NewsModel(
        description:
            "The Centre’s advisory to states to extend the interval between the first and second doses of Covishield vaccine to 12-16 weeks from the earlier 6-8 weeks has left many senior citizens confused.",
        headline: "The Centre’s advisory to states to extend the interva",
        genre: "Sports",
        imageUrl: "https://images.indianexpress.com/2021/05/Modi-16.jpg"),
    NewsModel(
        description:
            "The Centre’s advisory to states to extend the interval between the first and second doses of Covishield vaccine to 12-16 weeks from the earlier 6-8 weeks has left many senior citizens confused.",
        headline: "The Centre’s advisory to states to extend the interva",
        genre: "Sports",
        imageUrl: "https://ichef.bbci.co.uk/news/976/cpsprodpb/3EAE/production/_115764061_mediaitem115764060.jpg"),
    NewsModel(
        description:
            "The Centre’s advisory to states to extend the interval between the first and second doses of Covishield vaccine to 12-16 weeks from the earlier 6-8 weeks has left many senior citizens confused.",
        headline: "The Centre’s advisory to states to extend the interva",
        genre: "Sports",
        imageUrl: "https://images.indianexpress.com/2021/05/Modi-16.jpg"),
    NewsModel(
        description:
            "The Centre’s advisory to states to extend the interval between the first and second doses of Covishield vaccine to 12-16 weeks from the earlier 6-8 weeks has left many senior citizens confused.",
        headline: "The Centre’s advisory to states to extend the interva",
        genre: "Sports",
        imageUrl: "https://images.indianexpress.com/2021/05/Modi-16.jpg"),
    NewsModel(
        description:
            "The Centre’s advisory to states to extend the interval between the first and second doses of Covishield vaccine to 12-16 weeks from the earlier 6-8 weeks has left many senior citizens confused.",
        headline: "The Centre’s advisory to states to extend the interva",
        genre: "Sports",
        imageUrl: "https://images.indianexpress.com/2021/05/Modi-16.jpg"),
        NewsModel(
        description:
            "The Centre’s advisory to states to extend the interval between the first and second doses of Covishield vaccine to 12-16 weeks from the earlier 6-8 weeks has left many senior citizens confused.",
        headline: "The Centre’s advisory to states to extend the interva",
        genre: "Sports",
        imageUrl: "https://images.indianexpress.com/2021/05/Modi-16.jpg")
  ];
}
