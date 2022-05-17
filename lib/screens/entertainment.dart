import 'package:NextNewsApp/const/constant.dart';
import 'package:NextNewsApp/cubit/AppCubit.dart';
import 'package:NextNewsApp/cubit/AppState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Entertainment extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
      listener: (context,state)=>{},
      builder: (context,state){
        var list=AppCubit.get(context).entertainment;
        return buildernewsitem(list);
      },
    );
  }
}
