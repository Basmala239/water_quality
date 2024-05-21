import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water_quality/model/experiment_model.dart';
class ExperimentProvider extends ChangeNotifier{
  List codList=[50,'tu',50,'we',40,'th',60,'fr',22,'sa',50,'su',0,'mo'];
  List bodList=[60,'tu',60,'we',70,'th',30,'fr',22,'sa',40,'su',0,'mo'];
  void todayCOD(int rate){
    codList[12]=rate;
    notifyListeners();
  }
  void todayBOD(int rate){
    bodList[12]=rate;
    notifyListeners();
  }
  void addNewExperiment(ExperimentModel ex ){
    ExperimentModel.experimentList.add(ex);
    notifyListeners();
  }
  void empty( ){
    ExperimentModel.experimentList.clear();
    notifyListeners();
  }
  int legnthofExperimentList(){
    return ExperimentModel.experimentList.length;
  }
}


class RecentExperimentProvider extends ChangeNotifier{
  void addNewRecentExperiment(RecentExperiment ex ){
    RecentExperiment.recentExperimentList.add(ex);
    notifyListeners();
  }
  void empty(){
    RecentExperiment.recentExperimentList.clear();
    notifyListeners();
  }
  int legnthofrecentExperimentListt(){
    return RecentExperiment.recentExperimentList.length;
  }
}
