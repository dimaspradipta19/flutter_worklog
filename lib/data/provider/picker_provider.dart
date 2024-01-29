import 'package:flutter/material.dart';

class PickerProvider extends ChangeNotifier {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeStartController = TextEditingController();
  final TextEditingController _timeEndController = TextEditingController();

  TextEditingController get timeStartController => _timeStartController;
  TextEditingController get timeEndController => _timeEndController;
  TextEditingController get dateController => _dateController;

  Future<void> displayTimePicker(BuildContext context) async {
    var timeStart =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (timeStart != null) {
      // Format hours with leading zeros if necessary
      String hours = timeStart.hour.toString().padLeft(2, '0');
      String minutes = timeStart.minute.toString().padLeft(2, '0');

      _timeStartController.text = "$hours:$minutes:00";
      notifyListeners();
    }
  }

  Future<void> displayTimePickerEnd(BuildContext context) async {
    var timeEnd =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (timeEnd != null) {
      String hours = timeEnd.hour.toString().padLeft(2, '0');
      String minutes = timeEnd.minute.toString().padLeft(2, '0');

      _timeEndController.text = "$hours:$minutes:00";
      notifyListeners();
    }
  }

  Future<void> selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(
          const Duration(days: 1),
        ),
        lastDate: DateTime.now());

    if (picked != null) {
      _dateController.text = picked.toString().split(" ")[0];
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _timeStartController.dispose();
    _timeEndController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  void clear() {
    _timeStartController.clear();
    _timeEndController.clear();
    _dateController.clear();
  }
}
