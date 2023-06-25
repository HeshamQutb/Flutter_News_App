// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';

import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {

    },
    builder: (context, state) {

          var list =NewsCubit.get(context).business;

          return ConditionalBuilder(
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
    });
  }
}
