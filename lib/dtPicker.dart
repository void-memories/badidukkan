import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';


void pickDateTime(context,setAlarm){
  DatePicker.showTimePicker(context,
                              showTitleActions: true, onChanged: (date) {
                            print('change $date');
                          }, onConfirm: (date) {
                            print('confirm $date');
                            setAlarm(date);
                          }, currentTime: DateTime.now(), locale: LocaleType.en);
}