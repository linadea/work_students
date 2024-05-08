import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'who_are_you': 'Who are you?',
          'i_am_a_student': 'I am a student',
          'i_am_an_employer': 'I am an employer',
          'continue': 'Continue',
        },
        'uk_UA': {
          'who_are_you': 'Хто ви?',
          'i_am_a_student': 'Я студент',
          'i_am_an_employer': 'Я роботодавець',
          'continue': 'Продовжити',
        },
      };
}
