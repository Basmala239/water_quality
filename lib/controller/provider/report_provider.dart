import 'package:water_quality/model/experiment_model.dart';
import 'package:water_quality/model/repost_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ReportProvider extends ChangeNotifier{
  
  int totleDuration=0;
  double totleEff=0;
  double totleInf=0;
  void addExperimentToReport(ExperimentReoprt er){
    totleEff+=er.eff;
    totleInf+=er.inf;
    totleDuration+=er.duration;
    ReportModel.reportModelList.add(er);
    notifyListeners();

  }
  int totleDurationRes(){
    return totleDuration;
  }
  double efficiencyres(){
    return ((totleEff/totleInf)*100);
  }
  void empty(){
    ReportModel.reportModelList.clear();
    notifyListeners();
  }
  int lengthofExperimentReoprt(){
    return ReportModel.reportModelList.length;
  }
}