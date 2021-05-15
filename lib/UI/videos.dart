import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humming_assignment/UI/home.dart';


class Videos extends StatefulWidget {
  Videos({Key key}) : super(key: key);

  @override
  _VideosState createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              color: Colors.white,
              alignment: Alignment.center,
             height: 50,
             child: Text("Videos",style: TextStyle(fontSize: 20),),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height*.24,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                   "https://cdn.sanity.io/images/7g6d2cj1/production/81b67e7af332ce7e4b971bad24c892a114f06448-1000x667.jpg?q=70&auto=format"
                  ),
                  fit: BoxFit.cover
                )
              ),
              child: IconButton(icon: Icon(Icons.play_arrow_rounded,size: 80,color: Colors.white,),
              onPressed: (){},),

            ),
            Container(
              margin: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   text(text: NewsModelContent.newsmodel[0].headline,size: 15,fontWeight: FontWeight.w700),
                   SizedBox(height: 5,),
            text(text: "Date And Time Here",fontWeight: FontWeight.w300,size: 14,color: Colors.grey),
            SizedBox(height: 10,),
            text(text:  NewsModelContent.newsmodel[0].headline,fontWeight: FontWeight.w300,size: 16,color: Colors.grey),
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                child: Text("Information",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey.shade300,
                  elevation: 5
                  

                ),
                onPressed: (){},
              ),
            ),
            buildcontent()
            
                ],
              ),
            ),
           

          ],
        ),

      ),
    );
  }
  Widget text({String text,double size,Color color,FontWeight fontWeight}){
    return Text("$text",style: TextStyle(
      fontSize: size,
      color: color,
      fontWeight: fontWeight
    ),);
  }

  Widget buildcontent(){
     return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: NewsModelContent.newsmodel.length,
      itemBuilder: (context, index) {
        return Container(
          height: MediaQuery.of(context).size.height * .09,
          margin: EdgeInsets.only(top:30),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 15),
                width: MediaQuery.of(context).size.width * .4,
                height: MediaQuery.of(context).size.height * .09,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
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
                    // Text(NewsModelContent.newsmodel[index].description,
                    //     overflow: TextOverflow.ellipsis,
                    //     maxLines: 2,
                    //     style: TextStyle(
                    //         fontSize: 13, color: 
                    //         Colors.grey.shade600,
                    //         fontWeight: FontWeight.w400
                    //         )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          size: 18,
                          color: Colors.grey.shade600,
                        ),
                        Text(
                          "03-03-2021",
                          style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.w300,fontSize: 13),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: Colors.orange.shade900.withOpacity(0.9),
                          ),
                            
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 1),
                            child: Text(
                              "Info",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 12
                                  ),
                            )),
                        // Icon(Icons.bookmark_outline,size: 22,)
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
}