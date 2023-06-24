import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {

        },
        builder: (context, state)
        {
          var cubit =NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar (
              title: const Text(
                'News App',
              ),
              actions:  [
                IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.search)
                ),
              ],
            ),
            body: cubit.screen[cubit.currentIndex]  ,
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                onTap: (index)
                {
                cubit.navBarChange(index);
                },
                items: cubit.bottomItems
            ),
          );
        },
      ),
    );
  }
}
