import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'who_are_you': 'Who are you?',
          'i_am_a_student': 'I am a student',
          'i_am_an_employer': 'I am an employer',
          'continue': 'Continue',
          'login_or_register': 'Log in or register',
          'country_region': 'Country/region',
          'phone_number': 'Phone number',
          'or': 'or',
          'use_email': 'Use email',
          'sign_in_with_google': 'Sign in with Google',
          'login_via_facebook': 'Sign in with Facebook'
        },
        'uk_UA': {
          'who_are_you': 'Хто ви?',
          'i_am_a_student': 'Я студент',
          'i_am_an_employer': 'Я роботодавець',
          'continue': 'Продовжити',
          'login_or_register': 'Увійдіть або зареєструйтеся',
          'country_region': 'Країна/регіон',
          'phone_number': 'Номер телефону',
          'or': 'або',
          'use_email': 'Використати email',
          'sign_in_with_google': 'Увійти через Google',
          'login_via_facebook': 'Увійти через Facebook'
        },
      };
}
