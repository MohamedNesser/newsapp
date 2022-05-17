import 'package:NextNewsApp/cubit/AppCubit.dart';
import 'package:NextNewsApp/cubit/AppState.dart';
import 'package:NextNewsApp/screens/search.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class homepage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>AppCubit()..getbusiness()..getsports(),
      child: BlocConsumer<AppCubit,AppState>(
       listener: (context,state){},
        builder: (context,state){
         var cubit=AppCubit.get(context);
         return Scaffold(
            appBar: AppBar(centerTitle: true,
          actions: [
            IconButton(icon:Icon(Icons.search_outlined,size: 25,color: Colors.white,)
                , onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>
              Searchscreen()));
                })

          ],
              title: Text(cubit.titleappbar[cubit.currantindex],style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),),
            ),
            bottomNavigationBar: CurvedNavigationBar(
              color: Colors.deepOrangeAccent,
              backgroundColor: Colors.red,
              items: <Widget>[
                Icon(Icons.business_sharp, size: 20,color: Colors.white,
                ),
                Icon(Icons.sports_soccer_rounded, size: 20,color: Colors.white),
                Icon(Icons.science, size: 20,color: Colors.white),
                Icon(Icons.computer_outlined, size: 20,color: Colors.white,),
                Icon(Icons.local_activity_rounded, size: 20,color: Colors.white),
                Icon(Icons.person, size: 20,color: Colors.white),

              ],
              onTap: (index) {
              cubit.changenavebottom(index);
              },
            ),
           body: Container(color:Colors.deepOrangeAccent,child: cubit.Screens[cubit.currantindex]),
          );
        },

      ),
    );
  }
}
