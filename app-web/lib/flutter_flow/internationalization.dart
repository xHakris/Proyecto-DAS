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
  // createTask
  {
    '5maeu8hf': {
      'en': 'Configuración Extra del Evento',
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
  // Eventos
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
  // Personal
  {
    '9f1jrkev': {
      'en': 'Panel Administrativo',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'pedkzfw8': {
      'en': 'Personal encargado de la FISEI',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'sm4g0kte': {
      'en': 'Rol :',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'mydv9j7u': {
      'en': 'Estado de la cuenta : ',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'jvlqexk4': {
      'en': 'Habilitar',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'czfbldfu': {
      'en': 'Deshabilitar',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'h2tjjlou': {
      'en': 'My Team',
      'hi': 'मेरी टीम',
      'ta': 'என் அணி',
      'ur': 'میری ٹیم',
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
          'La educación es un proceso fundamental de la formación de las\npersonas y en el desarrollo de las sociedades. A través de la \neducación, se adquieren conocimientos, habilidades y valores que \npermiten a las personas desarrollarse personal y profesionalmente,\ncontribuir al progreso y bienestar en su entorno educativo',
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
      'en': 'Cambiar foto',
      'hi': 'छवि बदलो',
      'ta': 'புகைப்படத்தை மாற்று',
      'ur': 'تصویر تبدیل کریں',
    },
    'xkv4rj30': {
      'en':
          'Cargue una nueva foto a continuación para cambiar su avatar visto por otros.',
      'hi':
          'दूसरों द्वारा देखे गए अपने अवतार को बदलने के लिए नीचे एक नया फोटो अपलोड करें।',
      'ta':
          'மற்றவர்கள் பார்க்கும் உங்கள் அவதாரத்தை மாற்ற, கீழே ஒரு புதிய புகைப்படத்தைப் பதிவேற்றவும்.',
      'ur':
          'دوسروں کے ذریعے نظر آنے والے اپنے اوتار کو تبدیل کرنے کے لیے نیچے ایک نئی تصویر اپ لوڈ کریں۔',
    },
    '9jqfzztm': {
      'en': 'Cargar imagen',
      'hi': 'तस्विर अपलोड करना',
      'ta': 'படத்தை பதிவேற்றம் செய்யவும்',
      'ur': 'تصویر انٹرنیٹ پر ڈالنا',
    },
    'tnhsrx4j': {
      'en': 'Guardar cambios',
      'hi': 'परिवर्तनों को सुरक्षित करें',
      'ta': 'மாற்றங்களை சேமியுங்கள்',
      'ur': 'تبدیلیاں محفوظ کرو',
    },
  },
  // modal_Project
  {
    '4r29z75b': {
      'en': 'Asignar',
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
    'gd3bhzsf': {
      'en': 'Cursos Completados',
      'hi': 'पुरा होना।',
      'ta': 'நிறைவு',
      'ur': 'مکمل',
    },
    'dy7qxdlp': {
      'en': 'Eventos',
      'hi': 'गतिविधि',
      'ta': 'செயல்பாடு',
      'ur': 'سرگرمی',
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
  // modal_CreateProject
  {
    't2ybiuyb': {
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
      'en': 'Agregar, Eliminar Apoyo',
      'hi': 'प्रोजेक्ट में सदस्यों को जोड़ें',
      'ta': 'திட்டத்தில் உறுப்பினர்களைச் சேர்க்கவும்',
      'ur': 'ممبران کو پروجیکٹ میں شامل کریں۔',
    },
    'ncylrws1': {
      'en': 'Apoyo en Curso',
      'hi': 'परियोजना में सदस्य',
      'ta': 'திட்டத்தில் உறுப்பினர்கள்',
      'ur': 'پروجیکٹ میں ممبران',
    },
    'ddkg34qk': {
      'en': 'Eliminar',
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
    'tiaul5f8': {
      'en': 'Asignar miembro',
      'hi': 'सदस्य नियुक्त करें',
      'ta': 'உறுப்பினரை நியமிக்கவும்',
      'ur': 'ممبر تفویض کریں۔',
    },
    'fgja67xl': {
      'en':
          'Encuentre miembros buscando a continuación para agregarlos a este evento.',
      'hi': 'सदस्यों को इस कार्य में जोड़ने के लिए नीचे खोज कर उन्हें खोजें।',
      'ta':
          'இந்தப் பணியில் உறுப்பினர்களைச் சேர்க்க, கீழே தேடுவதன் மூலம் உறுப்பினர்களைக் கண்டறியவும்.',
      'ur': 'ممبران کو اس کام میں شامل کرنے کے لیے نیچے تلاش کرکے تلاش کریں۔',
    },
    'jry3yomc': {
      'en': 'Buscar miembros...',
      'hi': 'सदस्यों को खोजें...',
      'ta': 'உறுப்பினர்களைத் தேடு...',
      'ur': 'اراکین کو تلاش کریں...',
    },
    'g74ac7o5': {
      'en': 'Assign',
      'hi': 'सौंपना',
      'ta': 'ஒதுக்க',
      'ur': 'تفویض',
    },
    '7y4qapan': {
      'en': 'user@domainname.com',
      'hi': 'user@domainname.com',
      'ta': 'user@domainame.com',
      'ur': 'user@domainname.com',
    },
    '5r6tdblc': {
      'en': 'View',
      'hi': 'देखना',
      'ta': 'காண்க',
      'ur': 'دیکھیں',
    },
    'wkq7jd41': {
      'en': 'Username',
      'hi': 'उपयोगकर्ता नाम',
      'ta': 'பயனர் பெயர்',
      'ur': 'صارف نام',
    },
    'mrinx3lp': {
      'en': 'user@domainname.com',
      'hi': 'user@domainname.com',
      'ta': 'user@domainame.com',
      'ur': 'user@domainname.com',
    },
    '0a5e2c86': {
      'en': 'View',
      'hi': 'देखना',
      'ta': 'காண்க',
      'ur': 'دیکھیں',
    },
    'py2znfed': {
      'en': 'Username',
      'hi': 'उपयोगकर्ता नाम',
      'ta': 'பயனர் பெயர்',
      'ur': 'صارف نام',
    },
    'nmua3moh': {
      'en': 'user@domainname.com',
      'hi': 'user@domainname.com',
      'ta': 'user@domainame.com',
      'ur': 'user@domainname.com',
    },
    'jvmpau55': {
      'en': 'View',
      'hi': 'देखना',
      'ta': 'காண்க',
      'ur': 'دیکھیں',
    },
    'r5ms0xcd': {
      'en': 'user@domainname.com',
      'hi': 'user@domainname.com',
      'ta': 'user@domainame.com',
      'ur': 'user@domainname.com',
    },
    'eo9hmq55': {
      'en': 'View',
      'hi': 'देखना',
      'ta': 'காண்க',
      'ur': 'دیکھیں',
    },
  },
  // componenteRegistro
  {
    '3fehxh6c': {
      'en': 'Empezar',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '1wb6s3tl': {
      'en': 'Cree una cuenta utilizando el siguiente formulario.',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'l20nyzoj': {
      'en': 'Correo electrónico',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'e7xd8bo6': {
      'en': 'Contraseña',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'ohqb3ckl': {
      'en': 'Confirmar contraseña',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '1jka4w0d': {
      'en': 'Registrarse',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'f8cuhl2x': {
      'en': '¿Ya tienes una cuenta?',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'utjgpfgt': {
      'en': 'Iniciar sesión',
      'hi': '',
      'ta': '',
      'ur': '',
    },
  },
  // componenteInicioSesion
  {
    'deq6vktp': {
      'en': '¡Bienvenido!',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'zcuw5n11': {
      'en': 'Utilice el siguiente formulario para acceder a su cuenta.',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'ui36p7cp': {
      'en': 'correo',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'c1alfrz0': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'zeo2cv3g': {
      'en': 'Contraseña',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '04twgdlc': {
      'en': '¿Has olvidado tu contraseña?',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'j8osv6zr': {
      'en': 'Iniciar sesión',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'pzoxvukb': {
      'en': '¿No tienes una cuenta?',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'n1cp1b41': {
      'en': 'Crear una cuenta',
      'hi': '',
      'ta': '',
      'ur': '',
    },
  },
  // componenteRestablecerContrasena
  {
    'e56orydd': {
      'en':
          'Le enviaremos un correo electrónico con un enlace para restablecer su contraseña, ingrese el correo electrónico asociado con su cuenta a continuación.',
      'hi':
          'हम आपको आपका पासवर्ड रीसेट करने के लिए एक लिंक के साथ एक ईमेल भेजेंगे, कृपया नीचे अपने खाते से संबद्ध ईमेल दर्ज करें।',
      'ta':
          'உங்கள் கடவுச்சொல்லை மீட்டமைக்க இணைப்புடன் கூடிய மின்னஞ்சலை உங்களுக்கு அனுப்புவோம், உங்கள் கணக்குடன் தொடர்புடைய மின்னஞ்சலை கீழே உள்ளிடவும்.',
      'ur':
          'ہم آپ کو اپنا پاس ورڈ دوبارہ ترتیب دینے کے لیے ایک لنک کے ساتھ ایک ای میل بھیجیں گے، براہ کرم نیچے اپنے اکاؤنٹ سے وابستہ ای میل درج کریں۔',
    },
    'hmqxatrj': {
      'en': '',
      'hi': 'ईमेल पते',
      'ta': 'மின்னஞ்சல் முகவரிகள்',
      'ur': 'ای میل ایڈریسز',
    },
    'e2gts7yu': {
      'en': 'Enter your email...',
      'hi': 'अपना ईमेल दर्ज करें...',
      'ta': 'மின்னஞ்சலை பதிவுசெய்...',
      'ur': 'اپنا ای میل درج کریں...',
    },
    'v4utr8ss': {
      'en': 'Enviar enlace',
      'hi': 'लिंक भेजें',
      'ta': 'இணைப்பை அனுப்பவும்',
      'ur': 'لنک بھیجیں۔',
    },
  },
  // editarPerfilC
  {
    '0pk9kv6c': {
      'en': 'Cambiar foto',
      'hi': 'छवि बदलो',
      'ta': 'புகைப்படத்தை மாற்று',
      'ur': 'تصویر تبدیل کریں',
    },
    'jbapiwct': {
      'en': 'Nombre Completo',
      'hi': 'अप का नाम',
      'ta': 'உங்கள் பெயர்',
      'ur': 'تمھارا نام',
    },
    '5jxjnv6c': {
      'en': 'Rol',
      'hi': 'शीर्षक या भूमिका',
      'ta': 'தலைப்பு அல்லது பாத்திரம்',
      'ur': 'عنوان یا کردار',
    },
    'oyj6xa4y': {
      'en': 'Correo electrónico asociado a esta cuenta:',
      'hi': 'इस खाते से संबद्ध ईमेल:',
      'ta': 'இந்தக் கணக்குடன் தொடர்புடைய மின்னஞ்சல்:',
      'ur': 'اس اکاؤنٹ سے وابستہ ای میل:',
    },
    'w652obpr': {
      'en': 'Guardar cambios',
      'hi': 'परिवर्तनों को सुरक्षित करें',
      'ta': 'மாற்றங்களை சேமியுங்கள்',
      'ur': 'تبدیلیاں محفوظ کرو',
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
