// ignore_for_file: prefer_const_constructors

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget newsItemBuilder(article) => Padding(
  padding: const EdgeInsets.all(15.0),
  child: Row(
    children: [
      Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
              image: NetworkImage('${article['urlToImage']}'),
              fit: BoxFit.cover
          ),

        ),
      ),
      SizedBox(width: 10.0,),
      Expanded(
        child: Container(
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  '${article['title']}',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: 5,),
              Text(
                '${article['publishedAt']}',
                style: TextStyle(
                    color: Colors.grey
                ),
              )
            ],
          ),
        ),
      )
    ],
  ),
);


Widget articleBuilder(list) => ConditionalBuilder(
    condition: list.isNotEmpty,
    builder: (context)=> ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context,index) => newsItemBuilder(list[index]) ,
      separatorBuilder: (context,index) => Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Container(
          height: 1,
          width: double.infinity,
          color: Colors.grey,
        ),
      ),
      itemCount: list.length,
    ),
    fallback: (context)=>Center(child: CircularProgressIndicator())
);

