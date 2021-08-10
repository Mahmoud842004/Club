import 'package:club/services/responsive_addaptive.dart';
import 'package:flutter/cupertino.dart';
import 'package:easy_localization/easy_localization.dart';

Future<String> showtime({required DateTime time,required BuildContext context}) async{
  DateTime now = DateTime.now();
  if (time.year < now.year) {
   var result =  await ResponsiveAddaptive.translate(context, (now.year - time.year).toString());
    return '$result ${showtheperiodictime(context: context, periodictime:'y')}';
  } else if (time.month < now.month) {
    var result =  await ResponsiveAddaptive.translate(context, (now.month - time.month).toString());
    return '$result ${showtheperiodictime(context: context, periodictime:'M')}';
  } else if (time.day < now.day) {
    var result =  await ResponsiveAddaptive.translate(context, (now.day - time.day).toString());
    return '$result ${showtheperiodictime(context: context, periodictime:'d')}';
  } else if (time.hour < now.hour) {
    var result =  await ResponsiveAddaptive.translate(context, (now.hour - time.hour).toString());
    return '$result ${showtheperiodictime(context: context, periodictime:'h')}';
  } else if (time.minute < now.minute) {
    var result =  await ResponsiveAddaptive.translate(context, (now.minute - time.minute).toString());
    return '$result ${showtheperiodictime(context: context, periodictime:'m')}';
  } else {
    var result =  await ResponsiveAddaptive.translate(context, (now.second - time.second).toString());
    return '$result ${showtheperiodictime(context: context, periodictime:'s')}';
  }
}

String showtheperiodictime({required BuildContext context,required String periodictime}){
  if (periodictime=='y') {
    return context.locale==Locale('ar')?'ع':'y';
  } else if (periodictime=='M') {
    return context.locale==Locale('ar')?'ش':'M';
  } else if (periodictime=='d') {
    return context.locale==Locale('ar')?'ي':'d';
  } else if (periodictime=='h') {
    return context.locale==Locale('ar')?'س':'h';
  } else if (periodictime=='m') {
    return context.locale==Locale('ar')?'د':'m';
  } else {
    return context.locale==Locale('ar')?'ث':'s';
  }
}
