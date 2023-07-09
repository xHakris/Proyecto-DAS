import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'hi', 'ta', 'ur'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? hiText = '',
    String? taText = '',
    String? urText = '',
  }) =>
      [enText, hiText, taText, urText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // CambioContrasena
  {
    's20e49ou': {
      'en': 'Atrás',
      'hi': 'पीछे',
      'ta': 'மீண்டும்',
      'ur': 'پیچھے',
    },
    '5slql49v': {
      'en': 'Volver',
      'hi': 'पीछे',
      'ta': 'மீண்டும்',
      'ur': 'پیچھے',
    },
    'fjhybvst': {
      'en':
          'Le enviaremos un correo electrónico con un enlace para restablecer su contraseña, ingrese el correo electrónico asociado con su cuenta a continuación.',
      'hi':
          'हम आपको आपका पासवर्ड रीसेट करने के लिए एक लिंक के साथ एक ईमेल भेजेंगे, कृपया नीचे अपने खाते से संबद्ध ईमेल दर्ज करें।',
      'ta':
          'உங்கள் கடவுச்சொல்லை மீட்டமைக்க இணைப்புடன் கூடிய மின்னஞ்சலை உங்களுக்கு அனுப்புவோம், உங்கள் கணக்குடன் தொடர்புடைய மின்னஞ்சலை கீழே உள்ளிடவும்.',
      'ur':
          'ہم آپ کو اپنا پاس ورڈ دوبارہ ترتیب دینے کے لیے ایک لنک کے ساتھ ایک ای میل بھیجیں گے، براہ کرم نیچے اپنے اکاؤنٹ سے وابستہ ای میل درج کریں۔',
    },
    'ujc5xipx': {
      'en': '',
      'hi': 'ईमेल पते',
      'ta': 'மின்னஞ்சல் முகவரிகள்',
      'ur': 'ای میل ایڈریسز',
    },
    'gegzfze4': {
      'en': 'Enter your email...',
      'hi': 'अपना ईमेल दर्ज करें...',
      'ta': 'மின்னஞ்சலை பதிவுசெய்...',
      'ur': 'اپنا ای میل درج کریں...',
    },
    '1njh17kf': {
      'en': 'Enviar enlace',
      'hi': 'लिंक भेजें',
      'ta': 'இணைப்பை அனுப்பவும்',
      'ur': 'لنک بھیجیں۔',
    },
    '9a4bm91z': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
      'ur': 'گھر',
    },
  },
  // Inicio_Estudiantes
  {
    '12tkp77z': {
      'en': 'Flujo de los Cursos',
      'hi': 'शुभ प्रभात',
      'ta': 'காலை வணக்கம்',
      'ur': 'صبح بخیر',
    },
    'j0lx26qq': {
      'en': 'Añadir Evento',
      'hi': 'कार्य बनाएँ',
      'ta': 'பணியை உருவாக்கவும்',
      'ur': 'ٹاسک بنائیں',
    },
    'qivbgraj': {
      'en': 'Mis Eventos',
      'hi': 'मेरा काम',
      'ta': 'எனது பணிகள்',
      'ur': 'میرے کام',
    },
    'uwyvo6wk': {
      'en': 'Due',
      'hi': 'देय',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    'xeqma55c': {
      'en': 'Issue #242952592',
      'hi': 'अंक #242952592',
      'ta': 'வெளியீடு #242952592',
      'ur': 'شمارہ نمبر 242952592',
    },
    'jflxt2qx': {
      'en': 'In Progress',
      'hi': 'चालू',
      'ta': 'செயல்பாட்டில் உள்ளது',
      'ur': 'کام جاری ہے',
    },
    'zi7hfryq': {
      'en': 'Andres Reynolds',
      'hi': 'एंड्रेस रेनॉल्ड्स',
      'ta': 'ஆண்ட்ரெஸ் ரெனால்ட்ஸ்',
      'ur': 'اینڈریس رینالڈز',
    },
    '8sjmfjjx': {
      'en': 'Due',
      'hi': 'देय',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    'uiqmsymo': {
      'en': 'Tuesday, 10:00am',
      'hi': 'मंगलवार, सुबह 10:00 बजे',
      'ta': 'செவ்வாய், காலை 10:00 மணி',
      'ur': 'منگل، صبح 10:00 بجے',
    },
    'iofpx15n': {
      'en': 'Not Started',
      'hi': 'शुरू नहीं',
      'ta': 'துவங்கவில்லை',
      'ur': 'شروع نہیں کیا',
    },
    '832adtr2': {
      'en': 'Start',
      'hi': 'शुरू',
      'ta': 'தொடங்கு',
      'ur': 'شروع کریں۔',
    },
    '1460lgka': {
      'en': 'Due',
      'hi': 'देय',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    'wm00imuu': {
      'en': 'In Progress',
      'hi': 'चालू',
      'ta': 'செயல்பாட்டில் உள்ளது',
      'ur': 'کام جاری ہے',
    },
    'c8gv1fmj': {
      'en': 'Due',
      'hi': 'देय',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    'd4gw9qw0': {
      'en': 'Issue #242952592',
      'hi': 'अंक #242952592',
      'ta': 'வெளியீடு #242952592',
      'ur': 'شمارہ نمبر 242952592',
    },
    'zdrf3ikg': {
      'en': 'In Progress',
      'hi': 'चालू',
      'ta': 'செயல்பாட்டில் உள்ளது',
      'ur': 'کام جاری ہے',
    },
    '6p1meot0': {
      'en': 'Andres Reynolds',
      'hi': 'एंड्रेस रेनॉल्ड्स',
      'ta': 'ஆண்ட்ரெஸ் ரெனால்ட்ஸ்',
      'ur': 'اینڈریس رینالڈز',
    },
    '86lis2jg': {
      'en': 'Due',
      'hi': 'देय',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    'rd23line': {
      'en': 'Tuesday, 10:00am',
      'hi': 'मंगलवार, सुबह 10:00 बजे',
      'ta': 'செவ்வாய், காலை 10:00 மணி',
      'ur': 'منگل، صبح 10:00 بجے',
    },
    'lqbva4ak': {
      'en': 'Complete',
      'hi': 'पूरा',
      'ta': 'முழுமை',
      'ur': 'مکمل',
    },
    'hkcnmvtg': {
      'en': 'Complete',
      'hi': 'पूरा',
      'ta': 'முழுமை',
      'ur': 'مکمل',
    },
    'htuk5fl0': {
      'en': 'Due',
      'hi': 'देय',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    'xe34smbh': {
      'en': 'My Tasks',
      'hi': 'मेरा काम',
      'ta': 'எனது பணிகள்',
      'ur': 'میرے کام',
    },
    '1rnio8vt': {
      'en': '(4)',
      'hi': '(4)',
      'ta': '(4)',
      'ur': '(4)',
    },
    'oopnhfx6': {
      'en': 'Due',
      'hi': 'देय',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    'i2oud4oy': {
      'en': 'Issue #242952592',
      'hi': 'अंक #242952592',
      'ta': 'வெளியீடு #242952592',
      'ur': 'شمارہ نمبر 242952592',
    },
    '6z27sxtu': {
      'en': 'In Progress',
      'hi': 'चालू',
      'ta': 'செயல்பாட்டில் உள்ளது',
      'ur': 'کام جاری ہے',
    },
    'kvvayf1a': {
      'en': 'Andres Reynolds',
      'hi': 'एंड्रेस रेनॉल्ड्स',
      'ta': 'ஆண்ட்ரெஸ் ரெனால்ட்ஸ்',
      'ur': 'اینڈریس رینالڈز',
    },
    'y2umcbi9': {
      'en': 'Due',
      'hi': 'देय',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    'ut18klg9': {
      'en': 'Tuesday, 10:00am',
      'hi': 'मंगलवार, सुबह 10:00 बजे',
      'ta': 'செவ்வாய், காலை 10:00 மணி',
      'ur': 'منگل، صبح 10:00 بجے',
    },
    'rktf6kep': {
      'en': 'Eventos no Iniciados',
      'hi': 'शुरू नहीं',
      'ta': 'துவங்கவில்லை',
      'ur': 'شروع نہیں کیا',
    },
    'mpiabjfr': {
      'en': 'Iniciar',
      'hi': 'शुरू',
      'ta': 'தொடங்கு',
      'ur': 'شروع کریں۔',
    },
    'i1j0llq5': {
      'en': 'Pendiente',
      'hi': 'देय',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    '89oepmke': {
      'en': 'Eventos en Progreso',
      'hi': 'चालू',
      'ta': 'செயல்பாட்டில் உள்ளது',
      'ur': 'کام جاری ہے',
    },
    'b8974iek': {
      'en': 'Pendiente',
      'hi': 'देय',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    'vpfyakh9': {
      'en': 'Issue #242952592',
      'hi': 'अंक #242952592',
      'ta': 'வெளியீடு #242952592',
      'ur': 'شمارہ نمبر 242952592',
    },
    '2jc6nxa6': {
      'en': 'In Progress',
      'hi': 'चालू',
      'ta': 'செயல்பாட்டில் உள்ளது',
      'ur': 'کام جاری ہے',
    },
    'z98yqioc': {
      'en': 'Andres Reynolds',
      'hi': 'एंड्रेस रेनॉल्ड्स',
      'ta': 'ஆண்ட்ரெஸ் ரெனால்ட்ஸ்',
      'ur': 'اینڈریس رینالڈز',
    },
    '6c511ygf': {
      'en': 'Due',
      'hi': 'देय',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    'z9zv51n7': {
      'en': 'Tuesday, 10:00am',
      'hi': 'मंगलवार, सुबह 10:00 बजे',
      'ta': 'செவ்வாய், காலை 10:00 மணி',
      'ur': 'منگل، صبح 10:00 بجے',
    },
    '310ik08p': {
      'en': 'Eventos Completados',
      'hi': 'पुरा होना।',
      'ta': 'நிறைவு',
      'ur': 'مکمل',
    },
    '6mv3j0ec': {
      'en': 'Tracker',
      'hi': 'ट्रैकर',
      'ta': 'டிராக்கர்',
      'ur': 'ٹریکر',
    },
  },
  // createTask_1_SelectProject
  {
    '1evyvanx': {
      'en': 'Crear tarea',
      'hi': 'कार्य बनाएँ',
      'ta': 'பணியை உருவாக்கவும்',
      'ur': 'ٹاسک بنائیں',
    },
    '5p3w7kqb': {
      'en': 'Don\'t see your project? Add one here.',
      'hi': 'आपका प्रोजेक्ट नहीं दिख रहा है? यहां एक जोड़ें।',
      'ta': 'உங்கள் திட்டம் பார்க்கவில்லையா? ஒன்றை இங்கே சேர்க்கவும்.',
      'ur': 'آپ کا پروجیکٹ نظر نہیں آرہا؟ یہاں ایک شامل کریں۔',
    },
    'atun5agk': {
      'en': 'Add Project',
      'hi': 'प्रोजेक्ट जोड़ें',
      'ta': 'திட்டத்தைச் சேர்க்கவும்',
      'ur': 'پروجیکٹ شامل کریں۔',
    },
    'nb0qs3fd': {
      'en': 'Last edited:',
      'hi': 'अंतिम संपादित:',
      'ta': 'கடைசியாக திருத்தப்பட்டது:',
      'ur': 'آخری ترمیم:',
    },
    'h0y2vck1': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    'ry8gdxku': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    'xtzbonrg': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    'd3cize38': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
  },
  // createTask
  {
    '5maeu8hf': {
      'en': 'Configuración Extra de Evento',
      'hi': 'कार्य बनाएँ',
      'ta': 'பணியை உருவாக்கவும்',
      'ur': 'ٹاسک بنائیں',
    },
    '5lkqpe83': {
      'en': 'Ciencia',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'qaejp72w': {
      'en': 'Salud',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'pj9brdmw': {
      'en': 'Innovación',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'b7xw0e5b': {
      'en': 'Selecciona el Área o Categoría',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '9oac8bkp': {
      'en': 'Search for an item...',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'o7t2czjb': {
      'en': '5-10 Horas',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'ywjuf8ue': {
      'en': '10-20 Horas',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'bghfmh4u': {
      'en': '20-30 Horas',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '0qyypp37': {
      'en': '30-40 Horas',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '7gwzrffj': {
      'en': 'Seleccione el Número de Horas',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'cpymel0o': {
      'en': 'Search for an item...',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'a2qpsica': {
      'en': 'Sin Nota de Aprobación ',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'ca5gmm02': {
      'en': 'Nota mínima 7',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'pygwdpp5': {
      'en': 'Seleccionar Nota Mínima',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'hefbluyr': {
      'en': 'Search for an item...',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    're4r1lkn': {
      'en': 'Not Started',
      'hi': 'शुरू नहीं',
      'ta': 'துவங்கவில்லை',
      'ur': 'شروع نہیں کیا',
    },
    'ptyt1h7n': {
      'en': 'In Progress',
      'hi': 'चालू',
      'ta': 'செயல்பாட்டில் உள்ளது',
      'ur': 'کام جاری ہے',
    },
    'gcvdijqn': {
      'en': 'Complete',
      'hi': 'पूरा',
      'ta': 'முழுமை',
      'ur': 'مکمل',
    },
    '9a99unmx': {
      'en': 'Selecciona el Estado',
      'hi': 'स्थिति का चयन करें',
      'ta': 'நிலையைத் தேர்ந்தெடுக்கவும்',
      'ur': 'اسٹیٹس کو منتخب کریں۔',
    },
    '0pml5dft': {
      'en': 'Guardar Configuración',
      'hi': 'कार्य बनाएँ',
      'ta': 'பணியை உருவாக்கவும்',
      'ur': 'ٹاسک بنائیں',
    },
    '3nx43hj1': {
      'en': 'Please add a task name.',
      'hi': 'कृपया कार्य का नाम जोड़ें।',
      'ta': 'பணியின் பெயரைச் சேர்க்கவும்.',
      'ur': 'براہ کرم ایک کام کا نام شامل کریں۔',
    },
    'tjxg3net': {
      'en': 'Please enter at least 3 letters.',
      'hi': 'कृपया कम से कम 3 अक्षर दर्ज करें।',
      'ta': 'குறைந்தது 3 எழுத்துக்களை உள்ளிடவும்.',
      'ur': 'براہ کرم کم از کم 3 حروف درج کریں۔',
    },
    '3khebw6t': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
      'ta': 'கீழ்தோன்றலில் இருந்து ஒரு விருப்பத்தைத் தேர்ந்தெடுக்கவும்',
      'ur': 'براہ کرم ڈراپ ڈاؤن سے ایک آپشن منتخب کریں۔',
    },
    '45sp2bki': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    'cm4f3q0t': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
      'ta': 'கீழ்தோன்றலில் இருந்து ஒரு விருப்பத்தைத் தேர்ந்தெடுக்கவும்',
      'ur': 'براہ کرم ڈراپ ڈاؤن سے ایک آپشن منتخب کریں۔',
    },
  },
  // taskDetails
  {
    'hb364kq4': {
      'en': 'Due',
      'hi': 'देय',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    'q4ikqgkd': {
      'en': 'Team Members',
      'hi': 'टीम के सदस्य',
      'ta': 'குழு உறுப்பினர்கள்',
      'ur': 'ٹیم کے افراد',
    },
    'qrkfqya2': {
      'en': 'Notes & Activity',
      'hi': 'नोट्स और गतिविधि',
      'ta': 'குறிப்புகள் & செயல்பாடு',
      'ur': 'نوٹس اور سرگرمی',
    },
    '46h6mjof': {
      'en': 'Mark as Complete',
      'hi': 'पूर्ण के रूप में चिह्नित करें',
      'ta': 'முழுமையானதாகக் குறிக்கவும்',
      'ur': 'مکمل کے بطور نشان زد کریں۔',
    },
    'xvvip759': {
      'en': 'IniciarEvento',
      'hi': 'कार्य प्रारंभ करें',
      'ta': 'பணியைத் தொடங்குங்கள்',
      'ur': 'کام شروع کریں۔',
    },
    'q5i02gt3': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
      'ur': 'گھر',
    },
  },
  // addTeamMembers
  {
    'dzbojo7r': {
      'en': 'Invite User',
      'hi': 'उपयोगकर्ता को आमंत्रित करें',
      'ta': 'பயனரை அழைக்கவும்',
      'ur': 'صارف کو مدعو کریں۔',
    },
    '5ilq7vbh': {
      'en': 'Full Name',
      'hi': 'पूरा नाम',
      'ta': 'முழு பெயர்',
      'ur': 'پورا نام',
    },
    '733r7kk8': {
      'en': 'Email',
      'hi': 'ईमेल',
      'ta': 'மின்னஞ்சல்',
      'ur': 'ای میل',
    },
    '64z5ta3b': {
      'en': 'Title or Role',
      'hi': 'शीर्षक या भूमिका',
      'ta': 'தலைப்பு அல்லது பாத்திரம்',
      'ur': 'عنوان یا کردار',
    },
    '39qfddvg': {
      'en': 'Team 1',
      'hi': 'टीम 1',
      'ta': 'அணி 1',
      'ur': 'ٹیم 1',
    },
    '0rrub9lg': {
      'en': 'Team 2',
      'hi': 'टीम 2',
      'ta': 'அணி 2',
      'ur': 'ٹیم 2',
    },
    '23fglgb8': {
      'en': 'Team 3',
      'hi': 'टीम 3',
      'ta': 'அணி 3',
      'ur': 'ٹیم 3',
    },
    'd6ul4ero': {
      'en': 'Select Team',
      'hi': 'टीम का चयन',
      'ta': 'குழுவைத் தேர்ந்தெடுக்கவும்',
      'ur': 'ٹیم منتخب کریں۔',
    },
    'oehnkpb9': {
      'en': 'Enter description here..',
      'hi': 'यहां विवरण दर्ज करें..',
      'ta': 'விளக்கத்தை இங்கே உள்ளிடவும்..',
      'ur': 'یہاں تفصیل درج کریں..',
    },
    'c38hkcs1': {
      'en': 'Create & Invite User',
      'hi': 'उपयोगकर्ता बनाएं और आमंत्रित करें',
      'ta': 'பயனரை உருவாக்கி அழைக்கவும்',
      'ur': 'صارف بنائیں اور مدعو کریں۔',
    },
    '41umybiv': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    'i5wagnfq': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    'h5euxn0m': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    'ag9dglwf': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
  },
  // teamMemberDetails
  {
    'ukmpqe9t': {
      'en': 'Team Name',
      'hi': 'टीम का नाम',
      'ta': 'குழு பெயர்',
      'ur': 'گروہ کا نام',
    },
    'rq31lxfx': {
      'en': ' - ',
      'hi': '-',
      'ta': '-',
      'ur': '-',
    },
    '8lhfh12w': {
      'en': '12 Tasks',
      'hi': '12 कार्य',
      'ta': '12 பணிகள்',
      'ur': '12 کام',
    },
    'j2ieipip': {
      'en': 'Biografía del equipo',
      'hi': 'टीम बायो',
      'ta': 'டீம் பயோ',
      'ur': 'ٹیم بائیو',
    },
    '9s048496': {
      'en': 'Eventos',
      'hi': 'कार्य',
      'ta': 'பணிகள்',
      'ur': 'کام',
    },
    '3rwjcoju': {
      'en': 'Due',
      'hi': 'देय',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    'znm2flgb': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
      'ur': 'گھر',
    },
  },
  // EventosAdmin
  {
    'qcd4z131': {
      'en': 'Eventos',
      'hi': 'परियोजनाओं',
      'ta': 'திட்டங்கள்',
      'ur': 'پروجیکٹس',
    },
    '0e5jbrkh': {
      'en': 'Una lista de sus eventos a continuación.',
      'hi': 'नीचे अपनी परियोजनाओं की एक सूची।',
      'ta': 'உங்கள் திட்டங்களின் பட்டியல் கீழே.',
      'ur': 'ذیل میں آپ کے منصوبوں کی فہرست۔',
    },
    '5mru78lw': {
      'en': 'Crear Evento',
      'hi': 'प्रोजेक्ट बनाएं',
      'ta': 'திட்டத்தை உருவாக்கவும்',
      'ur': 'پروجیکٹ بنائیں',
    },
    'hmxr55qt': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
      'ur': 'گھر',
    },
  },
  // Web_MiEquipo
  {
    'vf4ee69k': {
      'en': 'My Team',
      'hi': 'मेरी टीम',
      'ta': 'என் அணி',
      'ur': 'میری ٹیم',
    },
    'cqt7v5sb': {
      'en': 'Mi Curso',
      'hi': 'मेरी टीम',
      'ta': 'என் அணி',
      'ur': 'میری ٹیم',
    },
    'mop2evm0': {
      'en': 'Buscar Miembros...',
      'hi': 'सदस्यों को खोजें...',
      'ta': 'உறுப்பினர்களைத் தேடு...',
      'ur': 'اراکین کو تلاش کریں...',
    },
    'yncaesur': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '63wkxdr4': {
      'en': 'Buscar miembros',
      'hi': 'सदस्य खोजें',
      'ta': 'உறுப்பினர்களைக் கண்டறியவும்',
      'ur': 'ممبرز تلاش کریں۔',
    },
    'nyb9lczy': {
      'en': 'Creado en',
      'hi': 'पर बनाया',
      'ta': 'அன்று உருவாக்கப்பட்ட',
      'ur': 'پر بنایا',
    },
    'h2tjjlou': {
      'en': 'My Team',
      'hi': 'मेरी टीम',
      'ta': 'என் அணி',
      'ur': 'میری ٹیم',
    },
  },
  // Main_projects
  {
    '3drc3684': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
      'ur': 'گھر',
    },
  },
  // Perfil
  {
    '5n51xmhd': {
      'en': 'Cambiar al modo oscuro',
      'hi': 'डार्क मोड पर स्विच करें',
      'ta': 'டார்க் பயன்முறைக்கு மாறவும்',
      'ur': 'ڈارک موڈ پر سوئچ کریں۔',
    },
    'w3vpe9rl': {
      'en': 'Cambiar al modo de luz',
      'hi': 'लाइट मोड पर स्विच करें',
      'ta': 'லைட் பயன்முறைக்கு மாறவும்',
      'ur': 'لائٹ موڈ پر سوئچ کریں۔',
    },
    '05v307ij': {
      'en': 'Configuraciones de la cuenta',
      'hi': 'अकाउंट सेटिंग',
      'ta': 'கணக்கு அமைப்புகள்',
      'ur': 'اکاؤنٹ کی ترتیبات',
    },
    'o1pcrlaz': {
      'en': 'Cambiar la contraseña',
      'hi': 'पासवर्ड बदलें',
      'ta': 'கடவுச்சொல்லை மாற்று',
      'ur': 'پاس ورڈ تبدیل کریں',
    },
    'alhgf413': {
      'en': 'Editar perfil',
      'hi': 'प्रोफ़ाइल संपादित करें',
      'ta': 'சுயவிவரத்தைத் திருத்து',
      'ur': 'پروفائل میں ترمیم کریں',
    },
    'w4vsr6hu': {
      'en': 'Cerrar sesión',
      'hi': 'लॉग आउट',
      'ta': 'வெளியேறு',
      'ur': 'لاگ آوٹ',
    },
    '3e1n01mf': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
      'ur': 'گھر',
    },
  },
  // createProject
  {
    'zhq7wtzw': {
      'en': 'Crear Evento',
      'hi': 'प्रोजेक्ट बनाएं',
      'ta': 'திட்டத்தை உருவாக்கவும்',
      'ur': 'پروجیکٹ بنائیں',
    },
    '9duf9kbf': {
      'en': 'Nombre del proyecto',
      'hi': 'परियोजना का नाम',
      'ta': 'திட்டத்தின் பெயர்',
      'ur': 'پراجیکٹ کا نام',
    },
    'j3scp78v': {
      'en': 'Introduce la descripción aquí...',
      'hi': 'यहां विवरण दर्ज करें...',
      'ta': 'விளக்கத்தை இங்கே உள்ளிடவும்...',
      'ur': 'یہاں تفصیل درج کریں...',
    },
    'ja4yfzm3': {
      'en': 'Cursos',
      'hi': 'कर्सोस',
      'ta': 'கர்சோஸ்',
      'ur': 'کرسوس',
    },
    'i8s3cnuf': {
      'en': 'Congresos',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '8zn4kxqa': {
      'en': 'Webinars',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'inlssi70': {
      'en': 'Conferencias',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '1n27e4de': {
      'en': 'Socializaciones',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'kdkesjiu': {
      'en': 'Selecciona el Tipo de Curso',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'aqj8lp9r': {
      'en': 'Search for an item...',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '0x8ejlwx': {
      'en': 'Software',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'plyfa1ll': {
      'en': 'Telecomunicaciones',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '0vjscljd': {
      'en': 'Tecnologías de la Información',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '8lukukje': {
      'en': 'FISEI',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'rnid91ij': {
      'en': 'Publico General',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    't0bot3o1': {
      'en': 'Selecciona la Carrera',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'r4agpqmo': {
      'en': 'Search for an item...',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '8q12vg70': {
      'en': 'De Pago',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '3h6xkup4': {
      'en': 'Gratuito',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'yt3xsd25': {
      'en': 'Selecciona el Servicio',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'gz1tuukk': {
      'en': 'Search for an item...',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'gql7sgl9': {
      'en': 'Crear Evento',
      'hi': 'प्रोजेक्ट बनाएं',
      'ta': 'திட்டத்தை உருவாக்கவும்',
      'ur': 'پروجیکٹ بنائیں',
    },
    'abj4bb18': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    'yyhmrk0i': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    'yepouzyh': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    'qckve3hq': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
  },
  // projectDetailsPage
  {
    '03c7gtcz': {
      'en': 'Asignar Ayudantes Responsables',
      'hi': 'सभी को देखें',
      'ta': 'அனைத்தையும் காட்டு',
      'ur': 'سب دیکھیں',
    },
    'vdyl48dm': {
      'en': 'Completed Tasks',
      'hi': 'पूर्ण कार्य',
      'ta': 'முடிக்கப்பட்ட பணிகள்',
      'ur': 'مکمل شدہ کام',
    },
    'f24x8bkt': {
      'en': 'Number of Tasks',
      'hi': 'कार्यों की संख्या',
      'ta': 'பணிகளின் எண்ணிக்கை',
      'ur': 'کاموں کی تعداد',
    },
    '8i8307mb': {
      'en': 'En Progreso',
      'hi': 'चालू',
      'ta': 'செயல்பாட்டில் உள்ளது',
      'ur': 'کام جاری ہے',
    },
    'mfp5v5yt': {
      'en': 'Pendiente',
      'hi': 'देय',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    'x63goi6j': {
      'en': 'Issue #242952592',
      'hi': 'अंक #242952592',
      'ta': 'வெளியீடு #242952592',
      'ur': 'شمارہ نمبر 242952592',
    },
    '3ihf4pre': {
      'en': 'In Progress',
      'hi': 'चालू',
      'ta': 'செயல்பாட்டில் உள்ளது',
      'ur': 'کام جاری ہے',
    },
    'frnfsszo': {
      'en': 'Andres Reynolds',
      'hi': 'एंड्रेस रेनॉल्ड्स',
      'ta': 'ஆண்ட்ரெஸ் ரெனால்ட்ஸ்',
      'ur': 'اینڈریس رینالڈز',
    },
    'sg458n0n': {
      'en': 'Due',
      'hi': 'देय',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    '6hgcr887': {
      'en': 'Tuesday, 10:00am',
      'hi': 'मंगलवार, सुबह 10:00 बजे',
      'ta': 'செவ்வாய், காலை 10:00 மணி',
      'ur': 'منگل، صبح 10:00 بجے',
    },
    '1870f5uq': {
      'en': 'Completedo',
      'hi': 'पुरा होना।',
      'ta': 'நிறைவு',
      'ur': 'مکمل',
    },
    'xo4dmszc': {
      'en': 'Complete',
      'hi': 'पूरा',
      'ta': 'முழுமை',
      'ur': 'مکمل',
    },
    '24rs6kdw': {
      'en': 'Completado',
      'hi': 'पर पूर्ण',
      'ta': 'அன்று நிறைவடைந்தது',
      'ur': 'پر مکمل ہوا۔',
    },
    '4cmr54lc': {
      'en': 'Actividad',
      'hi': 'गतिविधि',
      'ta': 'செயல்பாடு',
      'ur': 'سرگرمی',
    },
    'alg6xfua': {
      'en': 'Tiempo actual',
      'hi': 'वर्तमान समय',
      'ta': 'தற்போதைய நேரம்',
      'ur': 'موجودہ وقت',
    },
    'y1upl145': {
      'en': 'Regresar',
      'hi': 'पीछे',
      'ta': 'மீண்டும்',
      'ur': 'پیچھے',
    },
    '5kom1132': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
      'ur': 'گھر',
    },
  },
  // searchMembers
  {
    'i5eebch9': {
      'en': 'Agregar Miembros',
      'hi': 'सदस्यों को जोड़ें',
      'ta': 'உறுப்பினர்களைச் சேர்க்கவும்',
      'ur': 'ممبرز کو شامل کریں۔',
    },
    'bn37syph': {
      'en': 'Buscar Miembros',
      'hi': 'सदस्यों को खोजें...',
      'ta': 'உறுப்பினர்களைத் தேடு...',
      'ur': 'اراکین کو تلاش کریں...',
    },
    'ux02ixql': {
      'en': 'Buscar Miembros',
      'hi': 'सदस्य खोजें',
      'ta': 'உறுப்பினர்களைத் தேடுங்கள்',
      'ur': 'ممبرز تلاش کریں۔',
    },
    'kmiq19hs': {
      'en': 'Assign',
      'hi': 'सौंपना',
      'ta': 'ஒதுக்க',
      'ur': 'تفویض',
    },
    'ag17xw1c': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
      'ur': 'گھر',
    },
  },
  // EditarPerfil
  {
    'evdej962': {
      'en': 'Cambiar foto',
      'hi': 'छवि बदलो',
      'ta': 'புகைப்படத்தை மாற்று',
      'ur': 'تصویر تبدیل کریں',
    },
    't7tz85hw': {
      'en': 'Nombre Completo',
      'hi': 'अप का नाम',
      'ta': 'உங்கள் பெயர்',
      'ur': 'تمھارا نام',
    },
    'p7ef0qd8': {
      'en': 'Rol',
      'hi': 'शीर्षक या भूमिका',
      'ta': 'தலைப்பு அல்லது பாத்திரம்',
      'ur': 'عنوان یا کردار',
    },
    '5vmz78yy': {
      'en': 'Correo electrónico asociado a esta cuenta:',
      'hi': 'इस खाते से संबद्ध ईमेल:',
      'ta': 'இந்தக் கணக்குடன் தொடர்புடைய மின்னஞ்சல்:',
      'ur': 'اس اکاؤنٹ سے وابستہ ای میل:',
    },
    '4cj4t3x4': {
      'en': 'Guardar cambios',
      'hi': 'परिवर्तनों को सुरक्षित करें',
      'ta': 'மாற்றங்களை சேமியுங்கள்',
      'ur': 'تبدیلیاں محفوظ کرو',
    },
    'pt9elxe4': {
      'en': 'Editar Perfil',
      'hi': 'प्रोफ़ाइल संपादित करें',
      'ta': 'சுயவிவரத்தைத் திருத்து',
      'ur': 'پروفائل میں ترمیم کریں',
    },
  },
  // teamMembers
  {
    'cr7ls6ar': {
      'en': 'Agregar Miembros',
      'hi': 'सदस्यों को जोड़ें',
      'ta': 'உறுப்பினர்களைச் சேர்க்கவும்',
      'ur': 'ممبرز کو شامل کریں۔',
    },
    'gxfshi24': {
      'en': 'Miembros en el Evento',
      'hi': 'परियोजना में सदस्य',
      'ta': 'திட்டத்தில் உறுப்பினர்கள்',
      'ur': 'پروجیکٹ میں ممبران',
    },
    'prexm7ph': {
      'en': 'Remove',
      'hi': 'निकालना',
      'ta': 'அகற்று',
      'ur': 'دور',
    },
    'gjanmvum': {
      'en': 'UserName',
      'hi': 'उपयोगकर्ता नाम',
      'ta': 'பயனர்பெயர்',
      'ur': 'صارف کا نام',
    },
    '8dw4hlie': {
      'en': 'Remove',
      'hi': 'निकालना',
      'ta': 'அகற்று',
      'ur': 'دور',
    },
    'eq219wh6': {
      'en': 'UserName',
      'hi': 'उपयोगकर्ता नाम',
      'ta': 'பயனர்பெயர்',
      'ur': 'صارف کا نام',
    },
    'cjsbj4wg': {
      'en': 'Remove',
      'hi': 'निकालना',
      'ta': 'அகற்று',
      'ur': 'دور',
    },
    '78fdfkdh': {
      'en': 'Agregar Miembros',
      'hi': 'सदस्यों को जोड़ें',
      'ta': 'உறுப்பினர்களைச் சேர்க்கவும்',
      'ur': 'ممبرز کو شامل کریں۔',
    },
    'rzrf0zsp': {
      'en': 'Assign',
      'hi': 'सौंपना',
      'ta': 'ஒதுக்க',
      'ur': 'تفویض',
    },
    'aygq6hhd': {
      'en': 'user@domainname.com',
      'hi': 'user@domainname.com',
      'ta': 'user@domainame.com',
      'ur': 'user@domainname.com',
    },
    '70d3gp3g': {
      'en': 'View',
      'hi': 'देखना',
      'ta': 'காண்க',
      'ur': 'دیکھیں',
    },
    'i5shsgmr': {
      'en': 'Username',
      'hi': 'उपयोगकर्ता नाम',
      'ta': 'பயனர் பெயர்',
      'ur': 'صارف نام',
    },
    '5uym93b4': {
      'en': 'user@domainname.com',
      'hi': 'user@domainname.com',
      'ta': 'user@domainame.com',
      'ur': 'user@domainname.com',
    },
    '8ohfceuq': {
      'en': 'View',
      'hi': 'देखना',
      'ta': 'காண்க',
      'ur': 'دیکھیں',
    },
    'cf2slli6': {
      'en': 'Username',
      'hi': 'उपयोगकर्ता नाम',
      'ta': 'பயனர் பெயர்',
      'ur': 'صارف نام',
    },
    'dcpf109l': {
      'en': 'user@domainname.com',
      'hi': 'user@domainname.com',
      'ta': 'user@domainame.com',
      'ur': 'user@domainname.com',
    },
    'ntjxiluh': {
      'en': 'View',
      'hi': 'देखना',
      'ta': 'காண்க',
      'ur': 'دیکھیں',
    },
    '70m6fdii': {
      'en': 'user@domainname.com',
      'hi': 'user@domainname.com',
      'ta': 'user@domainame.com',
      'ur': 'user@domainname.com',
    },
    'vlair7ur': {
      'en': 'View',
      'hi': 'देखना',
      'ta': 'காண்க',
      'ur': 'دیکھیں',
    },
    '76xe81xi': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
      'ur': 'گھر',
    },
  },
  // editProject
  {
    '7wmlszlo': {
      'en': 'Editar Evento',
      'hi': 'प्रोजेक्ट संपादित करें',
      'ta': 'திட்டத்தை திருத்து',
      'ur': 'پروجیکٹ میں ترمیم کریں۔',
    },
    'wwzsnwbn': {
      'en': 'Project Name',
      'hi': 'परियोजना का नाम',
      'ta': 'திட்டத்தின் பெயர்',
      'ur': 'پراجیکٹ کا نام',
    },
    'hyz5515g': {
      'en': 'Enter description here...',
      'hi': 'यहां विवरण दर्ज करें...',
      'ta': 'விளக்கத்தை இங்கே உள்ளிடவும்...',
      'ur': 'یہاں تفصیل درج کریں...',
    },
    'cd6s1067': {
      'en': 'Cursos',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'pxzs47y3': {
      'en': 'Congresos',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'vaxtfk4z': {
      'en': 'Webinars',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'cplpmq3i': {
      'en': 'Conferencias',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'tu2pegw0': {
      'en': 'Socializaciones',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '0mq7dqmq': {
      'en': 'Please select...',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '0k7zxjbi': {
      'en': 'Search for an item...',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '0tppioaa': {
      'en': 'Software',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'hyqmn5hy': {
      'en': 'Telecomunicaciones',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '9pfgnukv': {
      'en': 'Tecnologías de la Información',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'ti79qifj': {
      'en': 'FISEI',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'mf1igxlc': {
      'en': 'Publico General',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'qf91on0w': {
      'en': 'Please select...',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '1r3qizn0': {
      'en': 'Search for an item...',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'hgovkw7p': {
      'en': 'De Pago',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'n4qhhc1s': {
      'en': 'Gratuito',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'texj70gx': {
      'en': 'Please select...',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'g3pipl7i': {
      'en': 'Search for an item...',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '57dpf0bb': {
      'en': 'Guardar Cambios',
      'hi': 'परिवर्तनों को सुरक्षित करें',
      'ta': 'மாற்றங்களை சேமியுங்கள்',
      'ur': 'تبدیلیاں محفوظ کرو',
    },
    'lp17x1az': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    'ly4njc2q': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    'wqm2ux47': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    'cgdvh4bx': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
  },
  // AsignarResponsables
  {
    'tv6z92fh': {
      'en': 'Asinar responsables para un evento',
      'hi': 'मेरी टीम',
      'ta': 'என் அணி',
      'ur': 'میری ٹیم',
    },
    '29dftuvm': {
      'en': 'Mi Evento',
      'hi': 'मेरी टीम',
      'ta': 'என் அணி',
      'ur': 'میری ٹیم',
    },
    '6js8p4ap': {
      'en': 'Buscar usuario',
      'hi': 'सदस्यों को खोजें...',
      'ta': 'உறுப்பினர்களைத் தேடு...',
      'ur': 'اراکین کو تلاش کریں...',
    },
    '7ce2tr39': {
      'en': 'Usuarios disponibles',
      'hi': 'सदस्य खोजें',
      'ta': 'உறுப்பினர்களைக் கண்டறியவும்',
      'ur': 'ممبرز تلاش کریں۔',
    },
    'dinoq7t9': {
      'en': 'Created on',
      'hi': 'पर बनाया',
      'ta': 'அன்று உருவாக்கப்பட்ட',
      'ur': 'پر بنایا',
    },
    'bz6mh5tg': {
      'en': 'My Team',
      'hi': 'मेरी टीम',
      'ta': 'என் அணி',
      'ur': 'میری ٹیم',
    },
  },
  // Principal
  {
    'v1971vw7': {
      'en': 'Iniciar Sesion',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'wzz1fhz0': {
      'en': 'Registrarse',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'z0xvzxg0': {
      'en': 'Excelencia Educativa\nFormando Lideres',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'tm4r4ys9': {
      'en':
          'La educación es un proceso fundamental de la formación de las\npersonas y en el desarrollo de las sociedades. A través de la \neducación, se adquieren conocimientos, habilidades y valores que \npermiten a las personas desarrollarse personal y profesionalmente,\ncontribuir al progreso y bienestar en su entorno',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'iopkgud2': {
      'en': 'Home',
      'hi': '',
      'ta': '',
      'ur': '',
    },
  },
  // drawerNav
  {
    'j81no67g': {
      'en': 'View',
      'hi': 'देखना',
      'ta': 'காண்க',
      'ur': 'دیکھیں',
    },
    '1281zly2': {
      'en': '345',
      'hi': '345',
      'ta': '345',
      'ur': '345',
    },
    'ikdzucnf': {
      'en': 'Following',
      'hi': 'अगले',
      'ta': 'தொடர்ந்து',
      'ur': 'درج ذیل',
    },
    '0mvvm3zs': {
      'en': '345',
      'hi': '345',
      'ta': '345',
      'ur': '345',
    },
    'ka33pk44': {
      'en': 'Followers',
      'hi': 'समर्थक',
      'ta': 'பின்பற்றுபவர்கள்',
      'ur': 'پیروکار',
    },
    'xnmol3vm': {
      'en': 'Tracker',
      'hi': 'ट्रैकर',
      'ta': 'டிராக்கர்',
      'ur': 'ٹریکر',
    },
    'tgp9100p': {
      'en': 'Projects',
      'hi': 'परियोजनाओं',
      'ta': 'திட்டங்கள்',
      'ur': 'پروجیکٹس',
    },
    'gvsvhzns': {
      'en': 'Team',
      'hi': 'टीम',
      'ta': 'குழு',
      'ur': 'ٹیم',
    },
    'r33amlko': {
      'en': 'About',
      'hi': 'के बारे में',
      'ta': 'பற்றி',
      'ur': 'کے بارے میں',
    },
    'hfpu6vi1': {
      'en': 'Rate App',
      'hi': 'एप्प का मूल्यांकन',
      'ta': 'பயன்பாட்டை மதிப்பிடவும்',
      'ur': 'ایپ کی درجہ بندی کریں۔',
    },
    'of8ozb94': {
      'en': 'Log Out',
      'hi': 'लॉग आउट',
      'ta': 'வெளியேறு',
      'ur': 'لاگ آوٹ',
    },
  },
  // addTeam
  {
    'uap9xd08': {
      'en': 'Asignar miembro',
      'hi': 'सदस्य नियुक्त करें',
      'ta': 'உறுப்பினரை நியமிக்கவும்',
      'ur': 'ممبر تفویض کریں۔',
    },
    'v3df17c1': {
      'en':
          'Encuentre miembros buscando a continuación para agregarlos a este evento.',
      'hi': 'सदस्यों को इस कार्य में जोड़ने के लिए नीचे खोज कर उन्हें खोजें।',
      'ta':
          'இந்தப் பணியில் உறுப்பினர்களைச் சேர்க்க, கீழே தேடுவதன் மூலம் உறுப்பினர்களைக் கண்டறியவும்.',
      'ur': 'ممبران کو اس کام میں شامل کرنے کے لیے نیچے تلاش کرکے تلاش کریں۔',
    },
    '4gubn0rd': {
      'en': 'Buscar miembros...',
      'hi': 'सदस्यों को खोजें...',
      'ta': 'உறுப்பினர்களைத் தேடு...',
      'ur': 'اراکین کو تلاش کریں...',
    },
    'k3vvd9ha': {
      'en': 'Assign',
      'hi': 'सौंपना',
      'ta': 'ஒதுக்க',
      'ur': 'تفویض',
    },
    'gts4h2ob': {
      'en': 'user@domainname.com',
      'hi': 'user@domainname.com',
      'ta': 'user@domainame.com',
      'ur': 'user@domainname.com',
    },
    '5fcmvseb': {
      'en': 'View',
      'hi': 'देखना',
      'ta': 'காண்க',
      'ur': 'دیکھیں',
    },
    'ipj4b3o2': {
      'en': 'Username',
      'hi': 'उपयोगकर्ता नाम',
      'ta': 'பயனர் பெயர்',
      'ur': 'صارف نام',
    },
    'hwbisz08': {
      'en': 'user@domainname.com',
      'hi': 'user@domainname.com',
      'ta': 'user@domainame.com',
      'ur': 'user@domainname.com',
    },
    '3t1qpdde': {
      'en': 'View',
      'hi': 'देखना',
      'ta': 'காண்க',
      'ur': 'دیکھیں',
    },
    'hpq0skds': {
      'en': 'Username',
      'hi': 'उपयोगकर्ता नाम',
      'ta': 'பயனர் பெயர்',
      'ur': 'صارف نام',
    },
    'zf4p0iqk': {
      'en': 'user@domainname.com',
      'hi': 'user@domainname.com',
      'ta': 'user@domainame.com',
      'ur': 'user@domainname.com',
    },
    'gvttx09d': {
      'en': 'View',
      'hi': 'देखना',
      'ta': 'காண்க',
      'ur': 'دیکھیں',
    },
    'jy6ian12': {
      'en': 'user@domainname.com',
      'hi': 'user@domainname.com',
      'ta': 'user@domainame.com',
      'ur': 'user@domainname.com',
    },
    'm88gl572': {
      'en': 'View',
      'hi': 'देखना',
      'ta': 'காண்க',
      'ur': 'دیکھیں',
    },
  },
  // createNote
  {
    'i9im6f7s': {
      'en': 'Create Note',
      'hi': 'नोट बनाएँ',
      'ta': 'குறிப்பை உருவாக்கவும்',
      'ur': 'نوٹ بنائیں',
    },
    'y8jieyz4': {
      'en': 'Create a note to keep your team in the loop.',
      'hi': 'अपनी टीम को लूप में रखने के लिए एक नोट बनाएं।',
      'ta': 'உங்கள் குழுவை லூப்பில் வைத்திருக்க ஒரு குறிப்பை உருவாக்கவும்.',
      'ur': 'اپنی ٹیم کو لوپ میں رکھنے کے لیے ایک نوٹ بنائیں۔',
    },
    'sq20csss': {
      'en': 'Enter your note here...',
      'hi': 'अपना नोट यहां दर्ज करें...',
      'ta': 'உங்கள் குறிப்பை இங்கே உள்ளிடவும்...',
      'ur': 'اپنا نوٹ یہاں درج کریں...',
    },
    'clj48a46': {
      'en': 'Create Note',
      'hi': 'नोट बनाएँ',
      'ta': 'குறிப்பை உருவாக்கவும்',
      'ur': 'نوٹ بنائیں',
    },
  },
  // emptyTasks
  {
    'sgsn2bcw': {
      'en': 'No hay cursos',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'j1t4bzzx': {
      'en':
          'Parece que aún no tienes ningun curso asignado, ve hasta la seccion de cursos y registrate a uno',
      'hi': '',
      'ta': '',
      'ur': '',
    },
  },
  // TaskComponent
  {
    'uuuaezib': {
      'en': 'Completado',
      'hi': 'पुरा होना।',
      'ta': 'நிறைவு',
      'ur': 'مکمل',
    },
  },
  // WebNav
  {
    'nf1dqsbp': {
      'en': '3',
      'hi': '3',
      'ta': '3',
      'ur': '3',
    },
  },
  // changePhoto
  {
    'rveosbw6': {
      'en': 'Change Photo',
      'hi': 'छवि बदलो',
      'ta': 'புகைப்படத்தை மாற்று',
      'ur': 'تصویر تبدیل کریں',
    },
    'xkv4rj30': {
      'en':
          'Upload a new photo below in order to change your avatar seen by others.',
      'hi':
          'दूसरों द्वारा देखे गए अपने अवतार को बदलने के लिए नीचे एक नया फोटो अपलोड करें।',
      'ta':
          'மற்றவர்கள் பார்க்கும் உங்கள் அவதாரத்தை மாற்ற, கீழே ஒரு புதிய புகைப்படத்தைப் பதிவேற்றவும்.',
      'ur':
          'دوسروں کے ذریعے نظر آنے والے اپنے اوتار کو تبدیل کرنے کے لیے نیچے ایک نئی تصویر اپ لوڈ کریں۔',
    },
    '9jqfzztm': {
      'en': 'Upload Image',
      'hi': 'तस्विर अपलोड करना',
      'ta': 'படத்தை பதிவேற்றம் செய்யவும்',
      'ur': 'تصویر انٹرنیٹ پر ڈالنا',
    },
    'tnhsrx4j': {
      'en': 'Save Changes',
      'hi': 'परिवर्तनों को सुरक्षित करें',
      'ta': 'மாற்றங்களை சேமியுங்கள்',
      'ur': 'تبدیلیاں محفوظ کرو',
    },
  },
  // modal_Project
  {
    '4r29z75b': {
      'en': 'Ver todo',
      'hi': 'सभी को देखें',
      'ta': 'அனைத்தையும் காட்டு',
      'ur': 'سب دیکھیں',
    },
    't5thu3gr': {
      'en': 'Completed Tasks',
      'hi': 'पूर्ण कार्य',
      'ta': 'முடிக்கப்பட்ட பணிகள்',
      'ur': 'مکمل شدہ کام',
    },
    'fycpdliq': {
      'en': 'Number of Tasks',
      'hi': 'कार्यों की संख्या',
      'ta': 'பணிகளின் எண்ணிக்கை',
      'ur': 'کاموں کی تعداد',
    },
    't39dexai': {
      'en': 'Cursos en Progreso',
      'hi': 'चालू',
      'ta': 'செயல்பாட்டில் உள்ளது',
      'ur': 'کام جاری ہے',
    },
    'uu14cs8r': {
      'en': 'Due',
      'hi': 'देय',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    'ph74cymq': {
      'en': 'Issue #242952592',
      'hi': 'अंक #242952592',
      'ta': 'வெளியீடு #242952592',
      'ur': 'شمارہ نمبر 242952592',
    },
    'fe9x22ad': {
      'en': 'In Progress',
      'hi': 'चालू',
      'ta': 'செயல்பாட்டில் உள்ளது',
      'ur': 'کام جاری ہے',
    },
    't725c9h5': {
      'en': 'Andres Reynolds',
      'hi': 'एंड्रेस रेनॉल्ड्स',
      'ta': 'ஆண்ட்ரெஸ் ரெனால்ட்ஸ்',
      'ur': 'اینڈریس رینالڈز',
    },
    '2rn0rm7g': {
      'en': 'Due',
      'hi': 'देय',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    '28tyqcfc': {
      'en': 'Tuesday, 10:00am',
      'hi': 'मंगलवार, सुबह 10:00 बजे',
      'ta': 'செவ்வாய், காலை 10:00 மணி',
      'ur': 'منگل، صبح 10:00 بجے',
    },
    'gd3bhzsf': {
      'en': 'Cursos Completados',
      'hi': 'पुरा होना।',
      'ta': 'நிறைவு',
      'ur': 'مکمل',
    },
    'y686s4b1': {
      'en': 'Complete',
      'hi': 'पूरा',
      'ta': 'முழுமை',
      'ur': 'مکمل',
    },
    'lcgypwk6': {
      'en': 'Completed on',
      'hi': 'पर पूर्ण',
      'ta': 'அன்று நிறைவடைந்தது',
      'ur': 'پر مکمل ہوا۔',
    },
    'dy7qxdlp': {
      'en': 'Eventos',
      'hi': 'गतिविधि',
      'ta': 'செயல்பாடு',
      'ur': 'سرگرمی',
    },
    '99rgc554': {
      'en': 'Current Time',
      'hi': 'वर्तमान समय',
      'ta': 'தற்போதைய நேரம்',
      'ur': 'موجودہ وقت',
    },
  },
  // modal_TaskDetails
  {
    'zerfwzgz': {
      'en': 'Mark as Complete',
      'hi': 'पूर्ण के रूप में चिह्नित करें',
      'ta': 'முழுமையானதாகக் குறிக்கவும்',
      'ur': 'مکمل کے بطور نشان زد کریں۔',
    },
    'fki0wi86': {
      'en': 'Begin Task',
      'hi': 'कार्य प्रारंभ करें',
      'ta': 'பணியைத் தொடங்குங்கள்',
      'ur': 'کام شروع کریں۔',
    },
    'pj3j661s': {
      'en': 'Due',
      'hi': 'देय',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    'qwc3ia6n': {
      'en': ', ',
      'hi': ',',
      'ta': ',',
      'ur': '،',
    },
    '5bz5zdwp': {
      'en': 'Team Members',
      'hi': 'टीम के सदस्य',
      'ta': 'குழு உறுப்பினர்கள்',
      'ur': 'ٹیم کے افراد',
    },
    'hc3gs7ga': {
      'en': 'Activity',
      'hi': 'गतिविधि',
      'ta': 'செயல்பாடு',
      'ur': 'سرگرمی',
    },
    'ru97sguf': {
      'en': 'Leave update here...',
      'hi': 'अपडेट यहां छोड़ें...',
      'ta': 'புதுப்பிப்பை இங்கே விடுங்கள்...',
      'ur': 'یہاں اپ ڈیٹ چھوڑیں...',
    },
    '5xomb4rp': {
      'en': 'Submit',
      'hi': 'जमा करना',
      'ta': 'சமர்ப்பிக்கவும்',
      'ur': 'جمع کرائیں',
    },
  },
  // modal_UserProfile
  {
    'xbcjin31': {
      'en': 'Team Name',
      'hi': 'टीम का नाम',
      'ta': 'குழு பெயர்',
      'ur': 'گروہ کا نام',
    },
    's2rahhu0': {
      'en': ' - ',
      'hi': '-',
      'ta': '-',
      'ur': '-',
    },
    'f87wic4n': {
      'en': '12 Tasks',
      'hi': '12 कार्य',
      'ta': '12 பணிகள்',
      'ur': '12 کام',
    },
    '1r4s70n4': {
      'en': 'Team Bio',
      'hi': 'टीम बायो',
      'ta': 'டீம் பயோ',
      'ur': 'ٹیم بائیو',
    },
    'ai2tvk8r': {
      'en': 'Tasks',
      'hi': 'कार्य',
      'ta': 'பணிகள்',
      'ur': 'کام',
    },
    'k2fas9o8': {
      'en': 'Due',
      'hi': 'देय',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
  },
  // modal_TaskCreate_1
  {
    'na5pbjsl': {
      'en': 'ElegirCurso',
      'hi': 'प्रोजेक्ट चुनें',
      'ta': 'திட்டத்தை தேர்வு செய்யவும்',
      'ur': 'پروجیکٹ کا انتخاب کریں۔',
    },
    '7lc6cya0': {
      'en': '¿No ves tu curso? Añada uno aquí.',
      'hi': 'आपका प्रोजेक्ट नहीं दिख रहा है? यहां एक जोड़ें।',
      'ta': 'உங்கள் திட்டம் பார்க்கவில்லையா? ஒன்றை இங்கே சேர்க்கவும்.',
      'ur': 'آپ کا پروجیکٹ نظر نہیں آرہا؟ یہاں ایک شامل کریں۔',
    },
    'wyow03qm': {
      'en': 'Añadir Curso',
      'hi': 'प्रोजेक्ट जोड़ें',
      'ta': 'திட்டத்தைச் சேர்க்கவும்',
      'ur': 'پروجیکٹ شامل کریں۔',
    },
    '0advwx1u': {
      'en': 'Última edición',
      'hi': 'अंतिम संपादित:',
      'ta': 'கடைசியாக திருத்தப்பட்டது:',
      'ur': 'آخری ترمیم:',
    },
    'ksmhvpjh': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    '2icxeqf5': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    'bthhoi83': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    '9g6shlpz': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
  },
  // modal_CreateProject
  {
    'a0rw459k': {
      'en': 'CREAR EVENTO',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'qv2q4c0h': {
      'en': 'Nombre del proyecto',
      'hi': 'परियोजना का नाम',
      'ta': 'திட்டத்தின் பெயர்',
      'ur': 'پراجیکٹ کا نام',
    },
    'xc81b6l7': {
      'en': 'Introduce la descripción aquí...',
      'hi': 'यहां विवरण दर्ज करें...',
      'ta': 'விளக்கத்தை இங்கே உள்ளிடவும்...',
      'ur': 'یہاں تفصیل درج کریں...',
    },
    'epxiawv7': {
      'en': 'Cursos',
      'hi': 'कर्सोस',
      'ta': 'கர்சோஸ்',
      'ur': 'کرسوس',
    },
    'hnle8r00': {
      'en': 'Congresos',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'oxug4ued': {
      'en': 'Webinars',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '8456eoxc': {
      'en': 'Conferencias',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '6j17dwan': {
      'en': 'Socializaciones',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'zqhmh8ml': {
      'en': 'Selecciona el Tipo de Curso',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '9d7mgicb': {
      'en': 'Search for an item...',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'd3uvtt3s': {
      'en': 'Software',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '26a36cpo': {
      'en': 'Telecomunicaciones',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'u7o7uh4g': {
      'en': 'Tecnologías de la Información',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '8lv8o1s1': {
      'en': 'FISEI',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'tvuvvkar': {
      'en': 'Publico General',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'b48k7o2c': {
      'en': 'Selecciona la Carrera',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'xce455b2': {
      'en': 'Search for an item...',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'j0j5q2kh': {
      'en': 'De Pago',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'px82n1ld': {
      'en': 'Gratuito',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'jmej2vkt': {
      'en': 'Selecciona el Servicio',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'rbyzh7bo': {
      'en': 'Search for an item...',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'p9mvmaob': {
      'en': 'Crear Evento',
      'hi': 'प्रोजेक्ट बनाएं',
      'ta': 'திட்டத்தை உருவாக்கவும்',
      'ur': 'پروجیکٹ بنائیں',
    },
    'zzv8enkj': {
      'en': 'Please enter a project name.',
      'hi': 'कृपया एक परियोजना का नाम दर्ज करें।',
      'ta': 'திட்டப் பெயரை உள்ளிடவும்.',
      'ur': 'براہ کرم پروجیکٹ کا نام درج کریں۔',
    },
    '536ycszy': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
      'ta': 'கீழ்தோன்றலில் இருந்து ஒரு விருப்பத்தைத் தேர்ந்தெடுக்கவும்',
      'ur': 'براہ کرم ڈراپ ڈاؤن سے ایک آپشن منتخب کریں۔',
    },
    'e68qg04m': {
      'en': 'Please enter a short description.',
      'hi': 'कृपया संक्षिप्त विवरण दर्ज करें।',
      'ta': 'தயவுசெய்து ஒரு சிறிய விளக்கத்தை உள்ளிடவும்.',
      'ur': 'براہ کرم ایک مختصر تفصیل درج کریں۔',
    },
    'csybxpz6': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
      'ta': 'கீழ்தோன்றலில் இருந்து ஒரு விருப்பத்தைத் தேர்ந்தெடுக்கவும்',
      'ur': 'براہ کرم ڈراپ ڈاؤن سے ایک آپشن منتخب کریں۔',
    },
  },
  // modal_TaskCreate_2
  {
    'fkb8cli1': {
      'en': 'Nombre de la tarea',
      'hi': 'कार्य का नाम',
      'ta': 'பணியின் பெயர்',
      'ur': 'ٹاسک کا نام',
    },
    '5qwd78rp': {
      'en': 'Introduce la descripción aquí...',
      'hi': 'यहां विवरण दर्ज करें...',
      'ta': 'விளக்கத்தை இங்கே உள்ளிடவும்...',
      'ur': 'یہاں تفصیل درج کریں...',
    },
    'o1qo2qg3': {
      'en': 'Not Started',
      'hi': 'शुरू नहीं',
      'ta': 'துவங்கவில்லை',
      'ur': 'شروع نہیں کیا',
    },
    '3xt3njp6': {
      'en': 'In Progress',
      'hi': 'चालू',
      'ta': 'செயல்பாட்டில் உள்ளது',
      'ur': 'کام جاری ہے',
    },
    'u0g3xflr': {
      'en': 'Complete',
      'hi': 'पूरा',
      'ta': 'முழுமை',
      'ur': 'مکمل',
    },
    'c2dtsnbb': {
      'en': 'Seleccionar estado',
      'hi': 'स्थिति का चयन करें',
      'ta': 'நிலையைத் தேர்ந்தெடுக்கவும்',
      'ur': 'اسٹیٹس کو منتخب کریں۔',
    },
    'udw09bms': {
      'en': 'Create Task',
      'hi': 'कार्य बनाएँ',
      'ta': 'பணியை உருவாக்கவும்',
      'ur': 'ٹاسک بنائیں',
    },
    'dgd9bazz': {
      'en': 'Please add a task name.',
      'hi': 'कृपया कार्य का नाम जोड़ें।',
      'ta': 'பணியின் பெயரைச் சேர்க்கவும்.',
      'ur': 'براہ کرم ایک کام کا نام شامل کریں۔',
    },
    '510sc51m': {
      'en': 'Please enter at least 3 letters.',
      'hi': 'कृपया कम से कम 3 अक्षर दर्ज करें।',
      'ta': 'குறைந்தது 3 எழுத்துக்களை உள்ளிடவும்.',
      'ur': 'براہ کرم کم از کم 3 حروف درج کریں۔',
    },
    'grveqhde': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
      'ta': 'கீழ்தோன்றலில் இருந்து ஒரு விருப்பத்தைத் தேர்ந்தெடுக்கவும்',
      'ur': 'براہ کرم ڈراپ ڈاؤن سے ایک آپشن منتخب کریں۔',
    },
    'jid8c04u': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    'r242ro2z': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
      'ta': 'கீழ்தோன்றலில் இருந்து ஒரு விருப்பத்தைத் தேர்ந்தெடுக்கவும்',
      'ur': 'براہ کرم ڈراپ ڈاؤن سے ایک آپشن منتخب کریں۔',
    },
  },
  // modal_Activity
  {
    '2issmdet': {
      'en': 'Notificación',
      'hi': 'सूचनाएं',
      'ta': 'அறிவிப்புகள்',
      'ur': 'اطلاعات',
    },
    '4z8dhmym': {
      'en': 'Project:',
      'hi': 'परियोजना:',
      'ta': 'திட்டம்:',
      'ur': 'پروجیکٹ:',
    },
  },
  // modal_addMembers
  {
    'qgce8yzt': {
      'en': 'Agregar Participante al Curso',
      'hi': 'प्रोजेक्ट में सदस्यों को जोड़ें',
      'ta': 'திட்டத்தில் உறுப்பினர்களைச் சேர்க்கவும்',
      'ur': 'ممبران کو پروجیکٹ میں شامل کریں۔',
    },
    'ncylrws1': {
      'en': 'Participantes en Curso',
      'hi': 'परियोजना में सदस्य',
      'ta': 'திட்டத்தில் உறுப்பினர்கள்',
      'ur': 'پروجیکٹ میں ممبران',
    },
    'ddkg34qk': {
      'en': 'Remove',
      'hi': 'निकालना',
      'ta': 'அகற்று',
      'ur': 'دور',
    },
    'gw54o3ei': {
      'en': 'UserName',
      'hi': 'उपयोगकर्ता नाम',
      'ta': 'பயனர்பெயர்',
      'ur': 'صارف کا نام',
    },
    '5ybblr1d': {
      'en': 'Remove',
      'hi': 'निकालना',
      'ta': 'அகற்று',
      'ur': 'دور',
    },
    'epngmu69': {
      'en': 'UserName',
      'hi': 'उपयोगकर्ता नाम',
      'ta': 'பயனர்பெயர்',
      'ur': 'صارف کا نام',
    },
    '1qnvp80y': {
      'en': 'Remove',
      'hi': 'निकालना',
      'ta': 'அகற்று',
      'ur': 'دور',
    },
    'rxgjnrtl': {
      'en': 'Agregar Participantes',
      'hi': 'सदस्यों को जोड़ें',
      'ta': 'உறுப்பினர்களைச் சேர்க்கவும்',
      'ur': 'ممبرز کو شامل کریں۔',
    },
    'c69xi1a4': {
      'en': 'Asignar',
      'hi': 'सौंपना',
      'ta': 'ஒதுக்க',
      'ur': 'تفویض',
    },
    'ac5i8pip': {
      'en': 'user@domainname.com',
      'hi': 'user@domainname.com',
      'ta': 'user@domainame.com',
      'ur': 'user@domainname.com',
    },
    'bixtd6lt': {
      'en': 'View',
      'hi': 'देखना',
      'ta': 'காண்க',
      'ur': 'دیکھیں',
    },
    's1ekanj3': {
      'en': 'Username',
      'hi': 'उपयोगकर्ता नाम',
      'ta': 'பயனர் பெயர்',
      'ur': 'صارف نام',
    },
    'xtjlfcyr': {
      'en': 'user@domainname.com',
      'hi': 'user@domainname.com',
      'ta': 'user@domainame.com',
      'ur': 'user@domainname.com',
    },
    '9rm7l3fs': {
      'en': 'View',
      'hi': 'देखना',
      'ta': 'காண்க',
      'ur': 'دیکھیں',
    },
    'chsej9xj': {
      'en': 'Username',
      'hi': 'उपयोगकर्ता नाम',
      'ta': 'பயனர் பெயர்',
      'ur': 'صارف نام',
    },
    'a1tcbxkr': {
      'en': 'user@domainname.com',
      'hi': 'user@domainname.com',
      'ta': 'user@domainame.com',
      'ur': 'user@domainname.com',
    },
    'y6o0uvra': {
      'en': 'View',
      'hi': 'देखना',
      'ta': 'காண்க',
      'ur': 'دیکھیں',
    },
    'fb7aygmy': {
      'en': 'user@domainname.com',
      'hi': 'user@domainname.com',
      'ta': 'user@domainame.com',
      'ur': 'user@domainname.com',
    },
    'ug774jqi': {
      'en': 'View',
      'hi': 'देखना',
      'ta': 'காண்க',
      'ur': 'دیکھیں',
    },
  },
  // componenteRegistro
  {
    'dfky09lq': {
      'en': 'Empezar',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'bg4zuhgs': {
      'en': 'Cree una cuenta utilizando el siguiente formulario.',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'pwmnd6hp': {
      'en': 'Correo electrónico',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'jodso74l': {
      'en': 'Contraseña',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'zgp1e3qo': {
      'en': 'Repita la contraseña',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '1cliie08': {
      'en': 'Registrarse',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'cn6z6rxs': {
      'en': '¿Ya tienes una cuenta?',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'uhcuimmi': {
      'en': 'Iniciar sesión',
      'hi': '',
      'ta': '',
      'ur': '',
    },
  },
  // componenteInicioSesion
  {
    'gwgw87mm': {
      'en': '¡Bienvenido!',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'ynyso1si': {
      'en': 'Utilice el siguiente formulario para acceder a su cuenta.',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'mi9w2fkg': {
      'en': 'ejemplo@gmail.com',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'ct6ifb6k': {
      'en': 'Contraseña',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '5ylldzlj': {
      'en': '¿Has olvidado tu contraseña?',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'fgwdsrhq': {
      'en': 'Iniciar sesión',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'x28theyf': {
      'en': '¿No tienes una cuenta?',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'csr1atya': {
      'en': 'Crear una cuenta',
      'hi': '',
      'ta': '',
      'ur': '',
    },
  },
  // Miscellaneous
  {
    'tuf7ywhd': {
      'en': 'Label',
      'hi': 'लेबल',
      'ta': 'லேபிள்',
      'ur': 'لیبل',
    },
    'z2zi1qq5': {
      'en': 'Button',
      'hi': 'बटन',
      'ta': 'பொத்தானை',
      'ur': 'بٹن',
    },
    'qm71wpil': {
      'en': 'Button',
      'hi': 'बटन',
      'ta': 'பொத்தானை',
      'ur': 'بٹن',
    },
    'fi5o91qd': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'skzc79wn': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '0rnqst8h': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'nh43oztv': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'i4m03gv7': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '9h5b120r': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '2xxt8j1o': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    't7udujpl': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'zbbv93d3': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'cql4rcil': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    't9vh67yu': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'ac2c7a8c': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '43t0g3v5': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'hxsgfsan': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'zuih46g4': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '8oo00kio': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'f4h7j5e1': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'dka0mr3o': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'a9x09f52': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'gn6bmhck': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'b9gx9zp0': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '3ogdlxsd': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'uxmsgxy2': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
  },
].reduce((a, b) => a..addAll(b));
