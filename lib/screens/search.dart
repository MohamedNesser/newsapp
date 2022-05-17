import 'package:NextNewsApp/const/constant.dart';
import 'package:NextNewsApp/cubit/AppCubit.dart';
import 'package:NextNewsApp/cubit/AppState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Searchscreen extends StatelessWidget {
 var textcontroler=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>AppCubit(),
      child: BlocConsumer<AppCubit,AppState>(
        listener: (context,state)=>{},
        builder: (context,state){
          var list=AppCubit.get(context).search;
   return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                        ,
                  ),
                  prefix: Icon(Icons.search_outlined),
                  labelText: 'Search',

                ),
                keyboardType: TextInputType.text,
                onChanged:(value){
                AppCubit.get(context).getsearch(value);
                } ,
                controller: textcontroler,
              validator: (String value){
                  if(value.isEmpty){
                    return'input your Search';
                  }
                  return null;
              },
              ),
            ),
             Expanded(child: buildernewsitem(list)),

          ],
        ),
      );      },
      ),
    );
  }
}
