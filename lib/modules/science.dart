import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/components/components.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';


class ScienceScreen extends StatelessWidget {
  const ScienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {

        },
        builder: (context, state) {

          var list =NewsCubit.get(context).science;

          return ConditionalBuilder(
              condition: list.isNotEmpty,
              builder: (context)=> ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context,index) => newsItemBuilder(list[index]) ,
                separatorBuilder: (context,index) => Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey,
                ),
                itemCount: list.length,
              ),
              fallback: (context)=>Center(child: CircularProgressIndicator())
          );
        });
  }
}
