
import 'package:NextNewsApp/cubit/AppState.dart';
import 'package:NextNewsApp/cubit/DIO_halper.dart';
import 'package:NextNewsApp/screens/Technology.dart';
import 'package:NextNewsApp/screens/buisness.dart';
import 'package:NextNewsApp/screens/entertainment.dart';
import 'package:NextNewsApp/screens/health.dart';
import 'package:NextNewsApp/screens/scince.dart';
import 'package:NextNewsApp/screens/sports.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState>{
  AppCubit():super(appintails());
  static AppCubit get(context)=>BlocProvider.of(context);

  int currantindex=0;
  int titleapp=0;
  void changenavebottom(int index){
    currantindex=index;
    if(index==1){
      getsports();
    }
    if(index==2){
      getscince();
    }
    if(index==3){
      gettechnology();
    }
    if(index==4){
      getentertainment();
    }
    if(index==5){
      gethealth();
    }

    emit(changecurvedbottombar());
  }
  void titleappbarr(int index){
    titleapp=index;
    emit(changecurvedbottombar());
  }


List<Widget>Screens=[
  business(),
  Sports(),
  science(),
  Technology(),
  Entertainment(),
  Health()
];

List<String>titleappbar=[
    'Business',
    'Sports',
    'Science',
   'Technology',
    'Entertainment',
    'Health'];
//  List<dynamic>buisness;
// void getbuisness(){
//   emit(buisnesslodding());
//   Diohalper.getData(
//       url: 'v2/top-headlines',
//       query: {'country:eg',
//       'category:business',
//         'apiKey:b6c0e6b1be734336b88a91d23bc1d3b2'
//       },
//   ).then((value) {
//     buisness=value.data['articles'];
//     print(buisness.length);
//     emit(buisnessscassfull());
//   }).catchError((error){
//       print(error.toString());
//       emit(buisnesserror( error.toString()));
//   });
// }
List<dynamic>buisness=[];

  void getbusiness(){
    emit(loddingsbusiness());
    Diohalper.getData(url: 'v2/top-headlines',
      query: {'country':'eg',
        'category':'business',
        'apiKey':'b6c0e6b1be734336b88a91d23bc1d3b2'
      },
    ).then((value) {
      // print(value.data['articles'][0]['title'].toString());
      buisness=value.data['articles'];
      print(buisness.length);
      emit(getbusinessScsseful());

    }).catchError((error){
      print(error.toString());
      emit(getbusinessError(error.toString()));

    });
  }

  List<dynamic>sports=[];

  void getsports(){    emit(loddingssports());
    Diohalper.getData(url: 'v2/top-headlines',
      query: {'country':'eg',
        'category':'sports',
        'apiKey':'b6c0e6b1be734336b88a91d23bc1d3b2'
      },
    ).then((value) {
      // print(value.data['articles'][0]['title'].toString());
      sports=value.data['articles'];
      print(sports.length);
      emit(getsportsScsseful());

    }).catchError((error){
      print(error.toString());
      emit(getsportssError(error.toString()));

    });
  }
//
  List<dynamic>scince=[];

  void getscince(){
    emit(loddingsscince());
    Diohalper.getData(url: 'v2/top-headlines',
      query: {'country':'eg',
        'category':'science',
        'apiKey':'b6c0e6b1be734336b88a91d23bc1d3b2'
      },
    ).then((value) {
      // print(value.data['articles'][0]['title'].toString());
      scince=value.data['articles'];
      print(scince.length);
      emit(getscinceScsseful());

    }).catchError((error){
      print(error.toString());
      emit(getbusinessError(error.toString()));

    });
  }
//
  List<dynamic>health=[];

  void gethealth(){
    emit(loddingshealth());
    Diohalper.getData(url: 'v2/top-headlines',
      query: {'country':'eg',
        'category':'health',
        'apiKey':'b6c0e6b1be734336b88a91d23bc1d3b2'
      },
    ).then((value) {
      // print(value.data['articles'][0]['title'].toString());
      health=value.data['articles'];
      print(health.length);
      emit(getbusinessScsseful());

    }).catchError((error){
      print(error.toString());
      emit(gethealthError(error.toString()));

    });
  }
//
  List<dynamic>entertainment=[];

  void getentertainment(){
    emit(loddingentertainment());
    Diohalper.getData(url: 'v2/top-headlines',
      query: {'country':'eg',
        'category':'entertainment',
        'apiKey':'b6c0e6b1be734336b88a91d23bc1d3b2'
      },
    ).then((value) {
      // print(value.data['articles'][0]['title'].toString());
      entertainment=value.data['articles'];
      print(entertainment.length);
      emit(getentertainmentScsseful());

    }).catchError((error){
      print(error.toString());
      emit(getentertainmentError(error.toString()));

    });
  }
//
  List<dynamic>technology=[];
  void gettechnology(){
    emit(loddingtechnology());
    Diohalper.getData(url: 'v2/top-headlines',
      query: {'country':'eg',
        'category':'technology',
        'apiKey':'b6c0e6b1be734336b88a91d23bc1d3b2'
      },
    ).then((value) {
      // print(value.data['articles'][0]['title'].toString());
      technology=value.data['articles'];
      print(technology.length);
      emit(getetechnologyScsseful());

    }).catchError((error){
      print(error.toString());
      emit(gettechnologyError(error.toString()));

    });
  }

  List<dynamic>search=[];
  void getsearch(String value){
    emit(loddingsearch());

    Diohalper.getData(url: 'v2/everything',
      query: {
        'q':'$value',
        'apiKey':'b6c0e6b1be734336b88a91d23bc1d3b2'
      },
    ).then((value) {
      // print(value.data['articles'][0]['title'].toString());
      search=value.data['articles'];
      emit(getsearchScsseful());

    }).catchError((error){
      print(error.toString());
      emit(getsearchError(error.toString()));

    });
  }

}