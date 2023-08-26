import 'package:flutter/material.dart';
import 'package:meal_app/utils/constants/data.dart';

 class Detail extends StatelessWidget {
   static const routeName = '/detail';
   const Detail({super.key});
 
   @override
   Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;

    final selectedMeal = Data().mealInfo.where(
      (elem) => elem.id == mealId
    );

     return Scaffold(
      appBar: AppBar(
          title: Text(mealId),
        ),
      body: Center(
        child: Text("Meal with Id: $mealId"),        
      )
     );
   }
 }