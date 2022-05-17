import 'package:NextNewsApp/screens/web_vew.dart';
import 'package:awesome_loader/awesome_loader.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

Widget ItemNews(articles,context)=>InkWell(
  onTap: () {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => webvew(
            articles['url'],
            articles['author']
          ),
        ));
  },
  child:   Padding(
    padding: const EdgeInsets.all(15),
    child: Row(
      children: [
        Container(
          height: 120,
          width: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(
                    '${articles['urlToImage']}'),
                fit: BoxFit.cover,

              )
          ),
        ),
        SizedBox(width: 10,),
        Expanded(
          child: Container(
            height: 120,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text( '${articles['title']}',style: TextStyle(
                      fontSize: 16,

                      fontWeight: FontWeight.bold
                  ), maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text('${articles['publishedAt']} ',style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600
                ),)
              ],
            ),
          ),
        )
      ],
    ),
  ),
);

Widget buildernewsitem(list)=>ConditionalBuilder(
  condition:list.length>0,
  builder:(context)=> ListView.separated(

      itemBuilder: (context,index)=>ItemNews(list[index],context),
      separatorBuilder:(context,index)=>Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
        child: Divider(height: 3,color: Colors.grey,),
      ),
      itemCount:list.length),
  fallback: (context)=> Center(
    child: AwesomeLoader(
      loaderType: AwesomeLoader.AwesomeLoader3,
      color: Colors.white,

    ),
  ),
);
