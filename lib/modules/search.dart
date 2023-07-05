import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

import '../shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});


  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var list =NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: searchController,
                  onChanged: (value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Search Must Not be Empty!';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      label: Text('Search'),
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder()
                  ),
                ),
                Expanded(child: articleBuilder(list, context,isSearch: true)),
              ],
            ),
          ),

        );
      },
    );
  }
}
