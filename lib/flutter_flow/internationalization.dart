import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['fr', 'ar'];

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
    String? frText = '',
    String? arText = '',
  }) =>
      [frText, arText][languageIndex] ?? '';

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
  // AddUser
  {
    'e7fkaiyw': {
      'fr': 'إضافة مستخدم',
      'ar': '',
    },
    '2v2oyeu4': {
      'fr': 'عنوان البريد الإلكتروني',
      'ar': '',
    },
    'gmfggtdp': {
      'fr': 'عنوان البريد الإلكتروني',
      'ar': '',
    },
    'thm4ed8h': {
      'fr': 'اسم المستخدم',
      'ar': '',
    },
    'nf6mbvhz': {
      'fr': 'اسم المستخدم',
      'ar': '',
    },
    'nlyilbki': {
      'fr': 'كلمة المرور',
      'ar': '',
    },
    'qnwn62pg': {
      'fr': 'كلمة المرور',
      'ar': '',
    },
    'vug8kabs': {
      'fr': 'تأكيد كلمة المرور',
      'ar': '',
    },
    'blj30c7h': {
      'fr': 'تأكيد كلمة المرور',
      'ar': '',
    },
    'ydfipmuy': {
      'fr': 'مسؤول',
      'ar': '',
    },
    'hnapg5ll': {
      'fr': 'مراقب',
      'ar': '',
    },
    'qzoxszh7': {
      'fr': 'الرجاء تحديد الدور ...',
      'ar': '',
    },
    'cxxzdp88': {
      'fr': 'Search for an item...',
      'ar': '',
    },
    '3f476f7a': {
      'fr': 'عودة',
      'ar': '',
    },
    'u39d9oko': {
      'fr': 'اضافة',
      'ar': '',
    },
    '5sgq9xpl': {
      'fr': 'Home',
      'ar': '',
    },
  },
  // Login
  {
    'cduvuk3f': {
      'fr': 'تسجيل الدخول',
      'ar': '',
    },
    '9zk4kwdh': {
      'fr': ' البريد الإلكتروني',
      'ar': '',
    },
    '8i63iic7': {
      'fr': ' البريد الإلكتروني',
      'ar': '',
    },
    '4zdm9cbb': {
      'fr': 'كلمة المرور',
      'ar': '',
    },
    'x22s542e': {
      'fr': 'كلمة المرور',
      'ar': '',
    },
    'qcj4m7i2': {
      'fr': 'تسجيل الدخول',
      'ar': '',
    },
    'zsn0op1o': {
      'fr': 'إعادة تعيين الآن',
      'ar': '',
    },
    'e7dnkt57': {
      'fr': 'هل نسيت كلمة السر ؟',
      'ar': '',
    },
    'tt9w9fsk': {
      'fr': 'Home',
      'ar': '',
    },
  },
  // EditProfile
  {
    'ur92kb77': {
      'fr': 'تغيير الصورة',
      'ar': '',
    },
    'k55a2qlr': {
      'fr': 'اسم المستخدم',
      'ar': '',
    },
    'it0j3pyy': {
      'fr': 'اسم المستخدم',
      'ar': '',
    },
    '5mwp96el': {
      'fr': 'رقم الهاتف',
      'ar': '',
    },
    'g3okhtvy': {
      'fr': 'رقم الهاتف',
      'ar': '',
    },
    'el3tmuxc': {
      'fr': 'تعديل',
      'ar': '',
    },
    'cxma5nab': {
      'fr': 'عودة',
      'ar': '',
    },
    'wn6zp1xp': {
      'fr': 'تعديل الملف الشخصي',
      'ar': '',
    },
  },
  // CodePin
  {
    'u2c26304': {
      'fr': 'يجب أن يكون رمز المرور صحيحا لتسجيل الدخول',
      'ar': '',
    },
    '2mj3jdnk': {
      'fr': 'التالي',
      'ar': '',
    },
    '51ecekeb': {
      'fr': 'العودة',
      'ar': '',
    },
    'tygzf86z': {
      'fr': 'Home',
      'ar': '',
    },
  },
  // forgotPassword
  {
    'om1s0itm': {
      'fr': 'هل نسيت كلمة السر',
      'ar': '',
    },
    '2zdjpgmq': {
      'fr':
          'سنرسل إليك بريدًا إلكترونيًا يحتوي على رابط لإعادة تعيين كلمة المرور الخاصة بك، يرجى إدخال البريد الإلكتروني المرتبط بحسابك أدناه.',
      'ar': '',
    },
    'sgvflwzs': {
      'fr': 'بريدك الإلكتروني',
      'ar': '',
    },
    'hv55lx7k': {
      'fr': 'أدخل بريدك الإلكتروني ليصلك الرابط...',
      'ar': '',
    },
    '5b77v67u': {
      'fr': 'أرسل رابط إعادة الضبط',
      'ar': '',
    },
    'xngg0soe': {
      'fr': 'Home',
      'ar': '',
    },
  },
  // AddCodePin
  {
    'xev2y9hn': {
      'fr': 'إضافة رمز المرور',
      'ar': '',
    },
    'w1jrqone': {
      'fr': 'يجب عليك إضافة رمز جديد لجعل تسجيل الدخول آمنًا',
      'ar': '',
    },
    'lrko8hon': {
      'fr': 'التالي',
      'ar': '',
    },
    'ygxaay7j': {
      'fr': 'Home',
      'ar': '',
    },
  },
  // Dashbord
  {
    'jwl7wtcq': {
      'fr': 'احصائيات العملاء',
      'ar': '',
    },
    'dtylb1ef': {
      'fr': 'لوحة القيادة',
      'ar': '',
    },
    'jf8suy2k': {
      'fr': 'احصائيات المشرفين',
      'ar': '',
    },
    'j6c1obo2': {
      'fr': 'اضافة رسالة .. ',
      'ar': '',
    },
    '1rkb3sz2': {
      'fr': 'تاريخ لوحة القيادة',
      'ar': '',
    },
    'hj8dqqqp': {
      'fr': '•',
      'ar': '',
    },
  },
  // Clients
  {
    'k0uu80l4': {
      'fr': 'البحث ببطاقة الهوية الوطنية',
      'ar': '',
    },
    'uklc87zt': {
      'fr': 'إضافة العميل',
      'ar': '',
    },
    'wa2t8v1x': {
      'fr': ' العملاء',
      'ar': '',
    },
    'h0qmslj9': {
      'fr': 'الاسم و اللقب',
      'ar': '',
    },
    'ufeuh7mo': {
      'fr': 'رقم ب.ت',
      'ar': '',
    },
    'c8410p7j': {
      'fr': 'العنوان',
      'ar': '',
    },
    'm3g0as6x': {
      'fr': 'المهنة',
      'ar': '',
    },
    'lg3wlrfr': {
      'fr': 'مبلغ العمولة',
      'ar': '',
    },
    'a2fusokb': {
      'fr': 'مبلغ الاشتراك',
      'ar': '',
    },
    '9atfpaad': {
      'fr': 'طباعة الوصل',
      'ar': '',
    },
    'n77w2kag': {
      'fr': 'Design & Education',
      'ar': '',
    },
    'z40t3yxl': {
      'fr': 'الاشتراك',
      'ar': '',
    },
    '8ybm89rt': {
      'fr': 'العمولة',
      'ar': '',
    },
    'o4xtwqz4': {
      'fr': 'Custom Name',
      'ar': '',
    },
    '8wbxlnnz': {
      'fr': 'Design & Education',
      'ar': '',
    },
    'x78mxbxy': {
      'fr': 'Design & Education',
      'ar': '',
    },
    'n2jkih1z': {
      'fr': 'Active',
      'ar': '',
    },
    '9eajhjq1': {
      'fr': 'Custom Name',
      'ar': '',
    },
    'c2crj2bc': {
      'fr': 'Design & Education',
      'ar': '',
    },
    'p5zm3efu': {
      'fr': 'Design & Education',
      'ar': '',
    },
    'baxpgvrj': {
      'fr': 'Active',
      'ar': '',
    },
    'qq5qp8m6': {
      'fr': 'Custom Name',
      'ar': '',
    },
    '6s9vdd6c': {
      'fr': 'Development & No Code',
      'ar': '',
    },
    'm627f084': {
      'fr': 'Development & No Code',
      'ar': '',
    },
    'u9mafqts': {
      'fr': 'Active',
      'ar': '',
    },
    '157qia10': {
      'fr': 'Custom Name',
      'ar': '',
    },
    'gu0oaiud': {
      'fr': 'Development & No Code',
      'ar': '',
    },
    'bp6qw3xt': {
      'fr': 'Development & No Code',
      'ar': '',
    },
    '6liy7rbc': {
      'fr': 'Active',
      'ar': '',
    },
    '97g6tp38': {
      'fr': ' العملاء',
      'ar': '',
    },
    'uiyx1t4h': {
      'fr': 'الاسم و اللقب',
      'ar': '',
    },
    'uj7y49gt': {
      'fr': 'رقم ب.ت',
      'ar': '',
    },
    'j1gmyv7r': {
      'fr': 'العنوان',
      'ar': '',
    },
    'sbe35gfl': {
      'fr': 'المهنة',
      'ar': '',
    },
    '3qxfgvb8': {
      'fr': 'مبلغ العمولة',
      'ar': '',
    },
    'qirl67l6': {
      'fr': 'مبلغ الاشتراك',
      'ar': '',
    },
    'jw6ghnvc': {
      'fr': 'Design & Education',
      'ar': '',
    },
    'qkskn9qg': {
      'fr': 'Custom Name',
      'ar': '',
    },
    'pb8thpr6': {
      'fr': 'Design & Education',
      'ar': '',
    },
    'f4fdiyna': {
      'fr': 'Design & Education',
      'ar': '',
    },
    'tlaeb6yi': {
      'fr': 'Active',
      'ar': '',
    },
    'g54bwprn': {
      'fr': 'Custom Name',
      'ar': '',
    },
    'bvfs0t7d': {
      'fr': 'Design & Education',
      'ar': '',
    },
    'srf26nmp': {
      'fr': 'Design & Education',
      'ar': '',
    },
    '8te3nfoc': {
      'fr': 'Active',
      'ar': '',
    },
    'nxgyhqfk': {
      'fr': 'Custom Name',
      'ar': '',
    },
    'afwd3qsa': {
      'fr': 'Development & No Code',
      'ar': '',
    },
    '0lycvz06': {
      'fr': 'Development & No Code',
      'ar': '',
    },
    'v3qbo9tz': {
      'fr': 'Active',
      'ar': '',
    },
    'clgfr14n': {
      'fr': 'Custom Name',
      'ar': '',
    },
    'imn9a6zr': {
      'fr': 'Development & No Code',
      'ar': '',
    },
    'zxxgbke3': {
      'fr': 'Development & No Code',
      'ar': '',
    },
    'yi2hbw2i': {
      'fr': 'Active',
      'ar': '',
    },
    'n3k5j0rg': {
      'fr': '•',
      'ar': '',
    },
  },
  // DepotWithdrawal
  {
    '2xx3xf7w': {
      'fr': 'المداخيل',
      'ar': '',
    },
    'cbivh4w6': {
      'fr': 'اضافة مداخيل',
      'ar': '',
    },
    'mfnc0guy': {
      'fr': 'عدد تحويلات الودائع',
      'ar': '',
    },
    'o5xue3m1': {
      'fr': 'مجموع الودائع',
      'ar': '',
    },
    'itpe74ya': {
      'fr': 'اضافة الوثيقة',
      'ar': '',
    },
    '6lp0yzmr': {
      'fr': ' الوثيقة',
      'ar': '',
    },
    'f846zsii': {
      'fr': 'المصاريف',
      'ar': '',
    },
    'zexh1ht4': {
      'fr': 'اضافة مصاريف',
      'ar': '',
    },
    '2vodlxer': {
      'fr': 'عدد عمليات السحب',
      'ar': '',
    },
    '5f035eml': {
      'fr': '15/26',
      'ar': '',
    },
    'j0ghsdo9': {
      'fr': 'إجمالي المصاريف',
      'ar': '',
    },
    '5tspx2oq': {
      'fr': 'اضافة الوثيقة',
      'ar': '',
    },
    '0kg906sp': {
      'fr': ' الوثيقة',
      'ar': '',
    },
    'bl5gqnjl': {
      'fr': 'الحساب الشهري',
      'ar': '',
    },
    '6r95r0o6': {
      'fr': 'جانفي',
      'ar': '',
    },
    'njctnib7': {
      'fr': 'فيفري',
      'ar': '',
    },
    '799cmz3y': {
      'fr': 'مارس',
      'ar': '',
    },
    'hprrqblh': {
      'fr': 'أفريل',
      'ar': '',
    },
    'h8vi0305': {
      'fr': 'ماي',
      'ar': '',
    },
    'dvnm6jqz': {
      'fr': 'جوان',
      'ar': '',
    },
    'ka4wdv7n': {
      'fr': 'جويلية',
      'ar': '',
    },
    '39x7dbfq': {
      'fr': 'أوت',
      'ar': '',
    },
    '06el8sox': {
      'fr': 'سبتمبر',
      'ar': '',
    },
    'u17d9s4j': {
      'fr': 'أكتوبر',
      'ar': '',
    },
    'dkjufxa5': {
      'fr': 'نوفمبر',
      'ar': '',
    },
    'qrntf3tc': {
      'fr': 'ديسمبر',
      'ar': '',
    },
    'k1f33mac': {
      'fr': 'اختر الشهر',
      'ar': '',
    },
    'a4f0gfqi': {
      'fr': 'Search for an item...',
      'ar': '',
    },
    'ezppgj79': {
      'fr': '2020',
      'ar': '',
    },
    'rg9ne0i5': {
      'fr': '2021',
      'ar': '',
    },
    'pfzkq22l': {
      'fr': '2022',
      'ar': '',
    },
    'y66kidto': {
      'fr': '2023',
      'ar': '',
    },
    'chtdl406': {
      'fr': '2024',
      'ar': '',
    },
    'grvgbtrs': {
      'fr': '2025',
      'ar': '',
    },
    '125hz6a8': {
      'fr': '2026',
      'ar': '',
    },
    'htiml77v': {
      'fr': '2027',
      'ar': '',
    },
    'hhwf3lj5': {
      'fr': '2028',
      'ar': '',
    },
    '0xusp1eq': {
      'fr': '2029',
      'ar': '',
    },
    'kuw7u7kh': {
      'fr': '2030',
      'ar': '',
    },
    '7zupljf9': {
      'fr': 'اختر السنة',
      'ar': '',
    },
    'ld59klnk': {
      'fr': 'Search for an item...',
      'ar': '',
    },
    'vs2hceta': {
      'fr': 'تفعيل',
      'ar': '',
    },
    '4zviwacv': {
      'fr': 'الحساب السنوي',
      'ar': '',
    },
    'ljtlojy4': {
      'fr': '2020',
      'ar': '',
    },
    'j0l7bc9c': {
      'fr': '2021',
      'ar': '',
    },
    'aojexuen': {
      'fr': '2022',
      'ar': '',
    },
    'zdtmha9z': {
      'fr': '2023',
      'ar': '',
    },
    '68w0wrvz': {
      'fr': '2024',
      'ar': '',
    },
    'lobdinev': {
      'fr': '2025',
      'ar': '',
    },
    'il32unkj': {
      'fr': '2026',
      'ar': '',
    },
    '6lafru47': {
      'fr': '2027',
      'ar': '',
    },
    'cwzlsrll': {
      'fr': '2028',
      'ar': '',
    },
    '5likkxys': {
      'fr': '2029',
      'ar': '',
    },
    'nq8e0asm': {
      'fr': '2030',
      'ar': '',
    },
    '6wnb4aer': {
      'fr': 'اختر السنة',
      'ar': '',
    },
    '2s11lxcw': {
      'fr': 'Search for an item...',
      'ar': '',
    },
    'h5s7bpk4': {
      'fr': 'تفعيل',
      'ar': '',
    },
    'ytv0bwlp': {
      'fr': '•',
      'ar': '',
    },
  },
  // ConfirmCodePin
  {
    'fsw2d1bz': {
      'fr': 'تأكيد رمز المرور',
      'ar': '',
    },
    'cwj5rifo': {
      'fr': 'التالي',
      'ar': '',
    },
    'h6bll0le': {
      'fr': 'Home',
      'ar': '',
    },
  },
  // addClient
  {
    '2xh41044': {
      'fr': 'إضافة عميل',
      'ar': '',
    },
    'ao9f6net': {
      'fr': 'اسم العميل',
      'ar': '',
    },
    'suhx2sxg': {
      'fr': 'اسم العميل',
      'ar': '',
    },
    'rr9oryud': {
      'fr': 'رقم بطاقة الهوية الوطنية',
      'ar': '',
    },
    'jbz8ktaf': {
      'fr': 'رقم بطاقة الهوية الوطنية',
      'ar': '',
    },
    'p27fuz9x': {
      'fr': 'الوظيفة',
      'ar': '',
    },
    'sq3vltrs': {
      'fr': 'الوظيفة',
      'ar': '',
    },
    '8q0f6skx': {
      'fr': 'العنوان',
      'ar': '',
    },
    '17hn1pmr': {
      'fr': 'العنوان',
      'ar': '',
    },
    'jd5bc3m9': {
      'fr': 'مبلغ القرض',
      'ar': '',
    },
    'cvbch0fe': {
      'fr': 'مبلغ القرض',
      'ar': '',
    },
    'paltop3p': {
      'fr': 'مبلغ الاشتراك',
      'ar': '',
    },
    '6ixb1k7a': {
      'fr': 'مبلغ الاشتراك',
      'ar': '',
    },
    'qtpym5qw': {
      'fr': 'عودة',
      'ar': '',
    },
    '5vin5b6e': {
      'fr': 'اضافة',
      'ar': '',
    },
    'zjiv35p9': {
      'fr': 'Home',
      'ar': '',
    },
  },
  // MonthResult
  {
    'fuxi5kw0': {
      'fr': 'الحساب الشهري',
      'ar': '',
    },
    '75nikf8o': {
      'fr': 'طباعة',
      'ar': '',
    },
    'vjfzblce': {
      'fr': 'المداخيل',
      'ar': '',
    },
    'qxsj6ya6': {
      'fr': '15/26',
      'ar': '',
    },
    'x3ksg86n': {
      'fr': 'Route progress',
      'ar': '',
    },
    'bwdukukq': {
      'fr': '12',
      'ar': '',
    },
    'n36t7pln': {
      'fr': 'Tasks to be completed',
      'ar': '',
    },
    'aqjqxdrm': {
      'fr': 'Task Type',
      'ar': '',
    },
    '4cimr5je': {
      'fr':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'ar': '',
    },
    '7iy48xh1': {
      'fr': 'Due',
      'ar': '',
    },
    'qn9hrp5p': {
      'fr': 'Today, 5:30pm',
      'ar': '',
    },
    'x9pobkp7': {
      'fr': 'Update',
      'ar': '',
    },
    '90903bs5': {
      'fr': '1',
      'ar': '',
    },
    'vkxvftt1': {
      'fr': 'المصاريف',
      'ar': '',
    },
    'hc3wi45y': {
      'fr': '15/26',
      'ar': '',
    },
    'qt63xt87': {
      'fr': 'Route progress',
      'ar': '',
    },
    'ighw8m28': {
      'fr': '12',
      'ar': '',
    },
    'a6gtu4uv': {
      'fr': 'Tasks to be completed',
      'ar': '',
    },
    'fcrfa9el': {
      'fr': 'Task Type',
      'ar': '',
    },
    'vgr5p59f': {
      'fr':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'ar': '',
    },
    'q96vzohk': {
      'fr': 'Due',
      'ar': '',
    },
    '1bsgy6p9': {
      'fr': 'Today, 5:30pm',
      'ar': '',
    },
    'wnau7kmg': {
      'fr': 'Update',
      'ar': '',
    },
    'z4lss5ir': {
      'fr': '1',
      'ar': '',
    },
    'hwtgkytc': {
      'fr': '•',
      'ar': '',
    },
  },
  // YearResult
  {
    'r4th32rt': {
      'fr': 'الحساب السنوي',
      'ar': '',
    },
    'l8wy633o': {
      'fr': 'طباعة',
      'ar': '',
    },
    '9pb2c7r8': {
      'fr': 'المداخيل',
      'ar': '',
    },
    'xvoko0yh': {
      'fr': '15/26',
      'ar': '',
    },
    'v1ic1d4k': {
      'fr': 'Route progress',
      'ar': '',
    },
    'xz17nflc': {
      'fr': '12',
      'ar': '',
    },
    '0ak7t8rc': {
      'fr': 'Tasks to be completed',
      'ar': '',
    },
    '497gpcsz': {
      'fr': 'Task Type',
      'ar': '',
    },
    '3ntxsz06': {
      'fr':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'ar': '',
    },
    'n6l4mtna': {
      'fr': 'Due',
      'ar': '',
    },
    '3i2gwikw': {
      'fr': 'Today, 5:30pm',
      'ar': '',
    },
    'u4u9n3cf': {
      'fr': 'Update',
      'ar': '',
    },
    'q6f736wl': {
      'fr': '1',
      'ar': '',
    },
    '52ezw8f0': {
      'fr': 'المصاريف',
      'ar': '',
    },
    'tan79zij': {
      'fr': '15/26',
      'ar': '',
    },
    'hqadgfxx': {
      'fr': 'Route progress',
      'ar': '',
    },
    'ub8pcekw': {
      'fr': '12',
      'ar': '',
    },
    '6d8kqjws': {
      'fr': 'Tasks to be completed',
      'ar': '',
    },
    'dm192q3v': {
      'fr': 'Task Type',
      'ar': '',
    },
    'gg0b3yzz': {
      'fr':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'ar': '',
    },
    'lx67kcjn': {
      'fr': 'Due',
      'ar': '',
    },
    'uebt8nt0': {
      'fr': 'Today, 5:30pm',
      'ar': '',
    },
    'dxss1495': {
      'fr': 'Update',
      'ar': '',
    },
    'hreqx2al': {
      'fr': '1',
      'ar': '',
    },
    'njt1u0bq': {
      'fr': '•',
      'ar': '',
    },
  },
  // Credits
  {
    'y3z6mhx2': {
      'fr': 'المبالغ المودعة الشهرية',
      'ar': '',
    },
    '7qnropwi': {
      'fr': 'جانفي',
      'ar': '',
    },
    'j6x04io9': {
      'fr': 'فيفري',
      'ar': '',
    },
    '6f245xnf': {
      'fr': 'مارس',
      'ar': '',
    },
    'a2qcgrg7': {
      'fr': 'أفريل',
      'ar': '',
    },
    't9u666zc': {
      'fr': 'ماي',
      'ar': '',
    },
    'ecqgai0b': {
      'fr': 'جوان',
      'ar': '',
    },
    'ut4wy8in': {
      'fr': 'جويلية',
      'ar': '',
    },
    'i57sb1j6': {
      'fr': 'أوت',
      'ar': '',
    },
    'co4tzxbz': {
      'fr': 'سبتمبر',
      'ar': '',
    },
    'wkhatngd': {
      'fr': 'أكتوبر',
      'ar': '',
    },
    'tnsd86ta': {
      'fr': 'نوفمبر',
      'ar': '',
    },
    'ahtd4hvd': {
      'fr': 'ديسمبر',
      'ar': '',
    },
    'i0bxdrw5': {
      'fr': 'اختر الشهر',
      'ar': '',
    },
    't7ewmp3z': {
      'fr': 'Search for an item...',
      'ar': '',
    },
    'a3zfpsvr': {
      'fr': '2020',
      'ar': '',
    },
    'lbrv0gm2': {
      'fr': '2021',
      'ar': '',
    },
    '7njfn5ae': {
      'fr': '2022',
      'ar': '',
    },
    '90gjworu': {
      'fr': '2023',
      'ar': '',
    },
    'm4sk9ith': {
      'fr': '2024',
      'ar': '',
    },
    '90t4xveh': {
      'fr': '2025',
      'ar': '',
    },
    'w2xgnhb8': {
      'fr': '2026',
      'ar': '',
    },
    'm4shf18i': {
      'fr': '2027',
      'ar': '',
    },
    'mm0udgng': {
      'fr': '2028',
      'ar': '',
    },
    'jwljrw53': {
      'fr': '2029',
      'ar': '',
    },
    'z9jemyf4': {
      'fr': '2030',
      'ar': '',
    },
    '0s5im01d': {
      'fr': 'اختر السنة',
      'ar': '',
    },
    'h6z5b7qa': {
      'fr': 'Search for an item...',
      'ar': '',
    },
    'quy8re2f': {
      'fr': 'تفعيل',
      'ar': '',
    },
    '4tap5mb1': {
      'fr': 'المبالغ المودعة السنوية',
      'ar': '',
    },
    'j03etsdr': {
      'fr': '2020',
      'ar': '',
    },
    'gyyngh65': {
      'fr': '2021',
      'ar': '',
    },
    'brwogddc': {
      'fr': '2022',
      'ar': '',
    },
    'enwksc4x': {
      'fr': '2023',
      'ar': '',
    },
    'qzm87gjn': {
      'fr': '2024',
      'ar': '',
    },
    'egrspei4': {
      'fr': '2025',
      'ar': '',
    },
    'qoy1ks1f': {
      'fr': '2026',
      'ar': '',
    },
    'rwsu1a7p': {
      'fr': '2027',
      'ar': '',
    },
    'bh4c0vkr': {
      'fr': '2028',
      'ar': '',
    },
    'v5sh2b5f': {
      'fr': '2029',
      'ar': '',
    },
    '1us2d9a2': {
      'fr': '2030',
      'ar': '',
    },
    'inhki6at': {
      'fr': 'اختر السنة',
      'ar': '',
    },
    '8mpu850l': {
      'fr': 'Search for an item...',
      'ar': '',
    },
    '2c67bmbk': {
      'fr': 'تفعيل',
      'ar': '',
    },
    'ubll5ws4': {
      'fr': 'أرشيف المبالغ المودعة',
      'ar': '',
    },
    'agmztd92': {
      'fr': 'اضافة المبالغ المودعة',
      'ar': '',
    },
    'mv7lygru': {
      'fr': '15/26',
      'ar': '',
    },
    'dykxhi4b': {
      'fr': 'Route progress',
      'ar': '',
    },
    '6kvcbhs8': {
      'fr': '12',
      'ar': '',
    },
    '01c4wlkn': {
      'fr': 'Tasks to be completed',
      'ar': '',
    },
    'kdnw49xr': {
      'fr': '15/26',
      'ar': '',
    },
    'ivn0t9m5': {
      'fr': 'Route progress',
      'ar': '',
    },
    'vxuwx6n6': {
      'fr': 'المعرف',
      'ar': '',
    },
    'utx96l2o': {
      'fr': 'المبالغ المودع',
      'ar': '',
    },
    'zn29yjwd': {
      'fr': 'التاريخ',
      'ar': '',
    },
    'js6ntpim': {
      'fr': 'اضافة الوثيقة',
      'ar': '',
    },
    'vq2oj1l6': {
      'fr': ' الوثيقة',
      'ar': '',
    },
    '5swt0oad': {
      'fr': 'Task Type',
      'ar': '',
    },
    'h8npoxdu': {
      'fr':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'ar': '',
    },
    'gid5jomy': {
      'fr': 'Due',
      'ar': '',
    },
    'n202zhm5': {
      'fr': 'Today, 5:30pm',
      'ar': '',
    },
    'kwhzu6ua': {
      'fr': 'Update',
      'ar': '',
    },
    '0yciiwud': {
      'fr': '1',
      'ar': '',
    },
    'v9fgcee5': {
      'fr': '•',
      'ar': '',
    },
  },
  // BankTransfert
  {
    'l8apepqj': {
      'fr': 'التحويل البنكي الشهري',
      'ar': '',
    },
    '2g5t3tmq': {
      'fr': 'جانفي',
      'ar': '',
    },
    '2rlypbjw': {
      'fr': 'فيفري',
      'ar': '',
    },
    'f509yppb': {
      'fr': 'مارس',
      'ar': '',
    },
    '6g4ykrq1': {
      'fr': 'أفريل',
      'ar': '',
    },
    'b25a4ny4': {
      'fr': 'ماي',
      'ar': '',
    },
    'mz51ioiu': {
      'fr': 'جوان',
      'ar': '',
    },
    'ipkeu64c': {
      'fr': 'جويلية',
      'ar': '',
    },
    'b2hbphax': {
      'fr': 'أوت',
      'ar': '',
    },
    'e9eu4av4': {
      'fr': 'سبتمبر',
      'ar': '',
    },
    'w442zxdu': {
      'fr': 'أكتوبر',
      'ar': '',
    },
    'ro49calh': {
      'fr': 'نوفمبر',
      'ar': '',
    },
    'x0gq25kq': {
      'fr': 'ديسمبر',
      'ar': '',
    },
    '1aod2hpd': {
      'fr': 'اختر الشهر',
      'ar': '',
    },
    'b20o1bbc': {
      'fr': 'Search for an item...',
      'ar': '',
    },
    'z754xz6d': {
      'fr': '2020',
      'ar': '',
    },
    'of204mff': {
      'fr': '2021',
      'ar': '',
    },
    'dkhdvg18': {
      'fr': '2022',
      'ar': '',
    },
    'cl8euxfy': {
      'fr': '2023',
      'ar': '',
    },
    'gxhp6p2z': {
      'fr': '2024',
      'ar': '',
    },
    'lv0nyu7k': {
      'fr': '2025',
      'ar': '',
    },
    '0796x7ak': {
      'fr': '2026',
      'ar': '',
    },
    '1ah74ume': {
      'fr': '2027',
      'ar': '',
    },
    'nt4nlmzg': {
      'fr': '2028',
      'ar': '',
    },
    't21zozql': {
      'fr': '2029',
      'ar': '',
    },
    'fty2oqcj': {
      'fr': '2030',
      'ar': '',
    },
    'd0991ml6': {
      'fr': 'اختر السنة',
      'ar': '',
    },
    't0s6c46g': {
      'fr': 'Search for an item...',
      'ar': '',
    },
    'd7jdb0qc': {
      'fr': 'تفعيل',
      'ar': '',
    },
    '6h23wngj': {
      'fr': 'التحويل البنكي السنوي',
      'ar': '',
    },
    'mrjsfap5': {
      'fr': '2020',
      'ar': '',
    },
    'nbsuv8z8': {
      'fr': '2021',
      'ar': '',
    },
    'un915635': {
      'fr': '2022',
      'ar': '',
    },
    'jenlmd5n': {
      'fr': '2023',
      'ar': '',
    },
    's04fshln': {
      'fr': '2024',
      'ar': '',
    },
    'dyg7fdpw': {
      'fr': '2025',
      'ar': '',
    },
    'm61kbo70': {
      'fr': '2026',
      'ar': '',
    },
    'yhpmhw3y': {
      'fr': '2027',
      'ar': '',
    },
    'vbk57wsx': {
      'fr': '2028',
      'ar': '',
    },
    'bdbjfsho': {
      'fr': '2029',
      'ar': '',
    },
    '1uwtfnce': {
      'fr': '2030',
      'ar': '',
    },
    'ym074pss': {
      'fr': 'اختر السنة',
      'ar': '',
    },
    'tvcqd92k': {
      'fr': 'Search for an item...',
      'ar': '',
    },
    'zgkvt6y1': {
      'fr': 'تفعيل',
      'ar': '',
    },
    '0uh7wc87': {
      'fr': 'أرشيف التحويل البنكي',
      'ar': '',
    },
    's47e2755': {
      'fr': 'اضافة تحويل البنكي',
      'ar': '',
    },
    'z548mtdk': {
      'fr': '15/26',
      'ar': '',
    },
    'h3g2ec7l': {
      'fr': 'Route progress',
      'ar': '',
    },
    'qkms0uwg': {
      'fr': '12',
      'ar': '',
    },
    'qdwdxtiy': {
      'fr': 'Tasks to be completed',
      'ar': '',
    },
    'mcvsik9q': {
      'fr': '15/26',
      'ar': '',
    },
    'vaqg7rtl': {
      'fr': 'Route progress',
      'ar': '',
    },
    'ptmbcquk': {
      'fr': 'اضافة الوثيقة',
      'ar': '',
    },
    '89kkapbw': {
      'fr': ' الوثيقة',
      'ar': '',
    },
    'v274rhs3': {
      'fr': 'المبلغ المستخلص',
      'ar': '',
    },
    'jlks40c1': {
      'fr': 'الفائض',
      'ar': '',
    },
    '17nszfag': {
      'fr': 'المبلغ المحال',
      'ar': '',
    },
    'eoo864iv': {
      'fr': 'Task Type',
      'ar': '',
    },
    'ambxg9d4': {
      'fr':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'ar': '',
    },
    '2ky54d1b': {
      'fr': 'Due',
      'ar': '',
    },
    'ttm9gcya': {
      'fr': 'Today, 5:30pm',
      'ar': '',
    },
    'ip73u0iw': {
      'fr': 'Update',
      'ar': '',
    },
    'm8mpkk2h': {
      'fr': '1',
      'ar': '',
    },
    '47xr5tyi': {
      'fr': '•',
      'ar': '',
    },
  },
  // MonthBankTransfert
  {
    'rcrj2s9f': {
      'fr': 'التحويل البنكي الشهري',
      'ar': '',
    },
    'jlz7ui2f': {
      'fr': 'طباعة',
      'ar': '',
    },
    'acy8br48': {
      'fr': 'اضافة تحويل البنكي',
      'ar': '',
    },
    'o3dglkqq': {
      'fr': '15/26',
      'ar': '',
    },
    'vbqf0wg1': {
      'fr': 'Route progress',
      'ar': '',
    },
    'k09lp1as': {
      'fr': '12',
      'ar': '',
    },
    '43r54vhu': {
      'fr': 'Tasks to be completed',
      'ar': '',
    },
    '8u0h08dz': {
      'fr': '15/26',
      'ar': '',
    },
    'cjr8zhrz': {
      'fr': 'Route progress',
      'ar': '',
    },
    '7rihfsmo': {
      'fr': 'المبلغ المستخلص',
      'ar': '',
    },
    'l3y03nb4': {
      'fr': 'الفائض',
      'ar': '',
    },
    'usj15nl9': {
      'fr': 'المبلغ المحال',
      'ar': '',
    },
    'to2z3g3d': {
      'fr': 'Task Type',
      'ar': '',
    },
    'xumnq4mi': {
      'fr':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'ar': '',
    },
    'mr4lucgv': {
      'fr': 'Due',
      'ar': '',
    },
    'yf8csdt3': {
      'fr': 'Today, 5:30pm',
      'ar': '',
    },
    'fe6oxbwf': {
      'fr': 'Update',
      'ar': '',
    },
    'kfesbrfy': {
      'fr': '1',
      'ar': '',
    },
    'tqcmqtl6': {
      'fr': '•',
      'ar': '',
    },
  },
  // YearlyBankTransfert
  {
    'fi155gmn': {
      'fr': 'التحويل البنكي السنوي',
      'ar': '',
    },
    'n1bnywyv': {
      'fr': 'طباعة',
      'ar': '',
    },
    'lvrwubrx': {
      'fr': 'اضافة تحويل البنكي',
      'ar': '',
    },
    '5i8ralq7': {
      'fr': '15/26',
      'ar': '',
    },
    'zti6uoxx': {
      'fr': 'Route progress',
      'ar': '',
    },
    '5miym1mu': {
      'fr': '12',
      'ar': '',
    },
    'rmkhoop5': {
      'fr': 'Tasks to be completed',
      'ar': '',
    },
    '5kvromn9': {
      'fr': '15/26',
      'ar': '',
    },
    'q3drouyc': {
      'fr': 'Route progress',
      'ar': '',
    },
    '4h47evi3': {
      'fr': 'المبلغ المستخلص',
      'ar': '',
    },
    '3z000782': {
      'fr': 'الفائض',
      'ar': '',
    },
    'oxdo6owv': {
      'fr': 'المبلغ المحال',
      'ar': '',
    },
    '8oko1qei': {
      'fr': 'Task Type',
      'ar': '',
    },
    '9ni9j824': {
      'fr':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'ar': '',
    },
    'lnt7tjte': {
      'fr': 'Due',
      'ar': '',
    },
    'p1l0t1z1': {
      'fr': 'Today, 5:30pm',
      'ar': '',
    },
    'npf1vgwe': {
      'fr': 'Update',
      'ar': '',
    },
    'tb6hqiwp': {
      'fr': '1',
      'ar': '',
    },
    'jp5qrbi2': {
      'fr': '•',
      'ar': '',
    },
  },
  // MonthCreditDepot
  {
    '0f5qn31p': {
      'fr': 'التحويل البنكي الشهري',
      'ar': '',
    },
    'a8ls48e3': {
      'fr': 'طباعة',
      'ar': '',
    },
    'm266owqh': {
      'fr': 'اضافة تحويل البنكي',
      'ar': '',
    },
    'q8cj831i': {
      'fr': '15/26',
      'ar': '',
    },
    '6cp4zn1q': {
      'fr': 'Route progress',
      'ar': '',
    },
    '4g7g6lym': {
      'fr': '12',
      'ar': '',
    },
    '0qscybfq': {
      'fr': 'Tasks to be completed',
      'ar': '',
    },
    'ccayi8dg': {
      'fr': '15/26',
      'ar': '',
    },
    'pcqqewso': {
      'fr': 'Route progress',
      'ar': '',
    },
    'v50veiwz': {
      'fr': 'المعرف',
      'ar': '',
    },
    '131zqpvk': {
      'fr': 'المبالغ المودع',
      'ar': '',
    },
    '7sr2e96o': {
      'fr': 'التاريخ',
      'ar': '',
    },
    'nh2zbczm': {
      'fr': 'Task Type',
      'ar': '',
    },
    'shld8glg': {
      'fr':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'ar': '',
    },
    'zhnz9682': {
      'fr': 'Due',
      'ar': '',
    },
    'm824vrb4': {
      'fr': 'Today, 5:30pm',
      'ar': '',
    },
    '96x0o39s': {
      'fr': 'Update',
      'ar': '',
    },
    'tc015dgr': {
      'fr': '1',
      'ar': '',
    },
    'ammshczx': {
      'fr': '•',
      'ar': '',
    },
  },
  // YearCreditDepot
  {
    'zvnc6sed': {
      'fr': 'التحويل البنكي السنوي',
      'ar': '',
    },
    '4655j0w3': {
      'fr': 'طباعة',
      'ar': '',
    },
    'zuwz03l3': {
      'fr': 'اضافة تحويل البنكي',
      'ar': '',
    },
    'f9u9ot72': {
      'fr': '15/26',
      'ar': '',
    },
    'sm1rxq3x': {
      'fr': 'Route progress',
      'ar': '',
    },
    'se7mciow': {
      'fr': '12',
      'ar': '',
    },
    'km8yl87k': {
      'fr': 'Tasks to be completed',
      'ar': '',
    },
    'wllf1jhb': {
      'fr': '15/26',
      'ar': '',
    },
    'xtc5c59x': {
      'fr': 'Route progress',
      'ar': '',
    },
    '6n7htn1t': {
      'fr': 'المعرف',
      'ar': '',
    },
    'ke6zrx72': {
      'fr': 'المبالغ المودع',
      'ar': '',
    },
    '4zcfnn3s': {
      'fr': 'التاريخ',
      'ar': '',
    },
    '1k1uqblr': {
      'fr': 'Task Type',
      'ar': '',
    },
    'x7mkfpt3': {
      'fr':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'ar': '',
    },
    '408rip6g': {
      'fr': 'Due',
      'ar': '',
    },
    '03dvrltc': {
      'fr': 'Today, 5:30pm',
      'ar': '',
    },
    'jezae20v': {
      'fr': 'Update',
      'ar': '',
    },
    'kgaqm3ef': {
      'fr': '1',
      'ar': '',
    },
    'hw9r1fes': {
      'fr': '•',
      'ar': '',
    },
  },
  // Profile
  {
    'evifrllt': {
      'fr': 'إعدادات',
      'ar': '',
    },
    'p20nbgnu': {
      'fr': 'التبديل إلى الوضع الداكن',
      'ar': '',
    },
    't32nbm73': {
      'fr': 'التبديل إلى وضع الضوء',
      'ar': '',
    },
    'pf7mivql': {
      'fr': 'تعديل الملف الشخصي',
      'ar': '',
    },
    'fym8r2gx': {
      'fr': 'تغيير رمز المرور',
      'ar': '',
    },
    'urx86sx3': {
      'fr': 'تسجيل خروج',
      'ar': '',
    },
    'mx511o14': {
      'fr': 'Active Users',
      'ar': '',
    },
    's6bxmbw8': {
      'fr': 'A small summary of your users base',
      'ar': '',
    },
    'y2io0sg7': {
      'fr': 'Total User Count',
      'ar': '',
    },
    'e6q8jim5': {
      'fr': 'An overview of all your users on your platform.',
      'ar': '',
    },
    '0ippt5us': {
      'fr': '56.4k',
      'ar': '',
    },
    'vexfxcrx': {
      'fr': 'المستخدمين',
      'ar': '',
    },
    'e7j4ggoa': {
      'fr': 'إضافة مستخدم جديد',
      'ar': '',
    },
    '5oitgax1': {
      'fr': 'الاسم',
      'ar': '',
    },
    'm0m0xz0w': {
      'fr': 'البريد الالكتروني',
      'ar': '',
    },
    '2esm3af7': {
      'fr': 'user@domainname.com',
      'ar': '',
    },
    'e7as1lbg': {
      'fr': 'Custom Name',
      'ar': '',
    },
    'tunxytgi': {
      'fr': 'user@domainname.com',
      'ar': '',
    },
    '54jtnwlb': {
      'fr': 'user@domainname.com',
      'ar': '',
    },
    'ge1dhxq4': {
      'fr': 'Custom Name',
      'ar': '',
    },
    '8pt71z7m': {
      'fr': 'user@domainname.com',
      'ar': '',
    },
    'rdg4gnms': {
      'fr': 'user@domainname.com',
      'ar': '',
    },
    '31uab1lk': {
      'fr': 'Custom Name',
      'ar': '',
    },
    '99l8w6gf': {
      'fr': 'user@domainname.com',
      'ar': '',
    },
    'mrsdj8t4': {
      'fr': 'user@domainname.com',
      'ar': '',
    },
    'wlnesc28': {
      'fr': 'Custom Name',
      'ar': '',
    },
    'dhv7cgh7': {
      'fr': 'user@domainname.com',
      'ar': '',
    },
    'et8862eo': {
      'fr': 'user@domainname.com',
      'ar': '',
    },
    'dx3idddq': {
      'fr': 'Active Users',
      'ar': '',
    },
    'gmvth2ku': {
      'fr': 'A small summary of your users base',
      'ar': '',
    },
    't4sqmzyn': {
      'fr': 'Total User Count',
      'ar': '',
    },
    'ws1jih6d': {
      'fr': 'An overview of all your users on your platform.',
      'ar': '',
    },
    'grrjgu3g': {
      'fr': '56.4k',
      'ar': '',
    },
    '1bfupcob': {
      'fr': '•',
      'ar': '',
    },
  },
  // sideBarNav
  {
    '1nmwizcl': {
      'fr': 'لوحة القيادة',
      'ar': '',
    },
    'tugug9nq': {
      'fr': 'العملاء',
      'ar': '',
    },
    'fm1rn1da': {
      'fr': 'المداخيل و المصاريف',
      'ar': '',
    },
    'r8sy6seg': {
      'fr': 'محاصيل القروض',
      'ar': '',
    },
    'j4htxbyb': {
      'fr': 'التحويلات البنكية',
      'ar': '',
    },
    'c1f1nypc': {
      'fr': 'الاعدادات',
      'ar': '',
    },
    'b69p5sj4': {
      'fr': 'تعديل الملف الشخصي',
      'ar': '',
    },
  },
  // addDepot
  {
    'evhlto35': {
      'fr': 'إضافة المداخيل',
      'ar': '',
    },
    'v0jor49q': {
      'fr': 'عنوان',
      'ar': '',
    },
    '1ih6a566': {
      'fr': 'عنوان',
      'ar': '',
    },
    'ysjo8dz2': {
      'fr': 'المبلغ',
      'ar': '',
    },
    'jebkduy9': {
      'fr': 'المبلغ',
      'ar': '',
    },
    'yaorl72a': {
      'fr': 'الملاحظة',
      'ar': '',
    },
    'sm85d3wm': {
      'fr': 'الملاحظة',
      'ar': '',
    },
    'o5axwczx': {
      'fr': 'جانفي',
      'ar': '',
    },
    'bii1j47h': {
      'fr': 'فيفري',
      'ar': '',
    },
    'k2iboelq': {
      'fr': 'مارس',
      'ar': '',
    },
    'e0yrt8pv': {
      'fr': 'أفريل',
      'ar': '',
    },
    'a1gxboo1': {
      'fr': 'ماي',
      'ar': '',
    },
    'uitge9ke': {
      'fr': 'جوان',
      'ar': '',
    },
    '7np0jtyu': {
      'fr': 'جويلية',
      'ar': '',
    },
    'kuvffa9k': {
      'fr': 'أوت',
      'ar': '',
    },
    '4tfbrg2v': {
      'fr': 'سبتمبر',
      'ar': '',
    },
    '77sxy6m7': {
      'fr': 'أكتوبر',
      'ar': '',
    },
    '5b207stk': {
      'fr': 'نوفمبر',
      'ar': '',
    },
    'w856j5f8': {
      'fr': 'ديسمبر',
      'ar': '',
    },
    'yvejb1i6': {
      'fr': 'اختر الشهر',
      'ar': '',
    },
    'vo6ns5a2': {
      'fr': 'Search for an item...',
      'ar': '',
    },
    'b9yn97av': {
      'fr': '2020',
      'ar': '',
    },
    'pj0izh8h': {
      'fr': '2021',
      'ar': '',
    },
    'b29e2901': {
      'fr': '2022',
      'ar': '',
    },
    'iz7z0xpr': {
      'fr': '2023',
      'ar': '',
    },
    '8gt4m0s1': {
      'fr': '2024',
      'ar': '',
    },
    'w9qq3411': {
      'fr': '2025',
      'ar': '',
    },
    'xo2soza1': {
      'fr': '2026',
      'ar': '',
    },
    'h0pjmp0o': {
      'fr': '2027',
      'ar': '',
    },
    '0s2qlhkz': {
      'fr': '2028',
      'ar': '',
    },
    'do89engw': {
      'fr': '2029',
      'ar': '',
    },
    'r95lqoiq': {
      'fr': '2030',
      'ar': '',
    },
    'meorf55r': {
      'fr': 'اختر السنة',
      'ar': '',
    },
    'jzs4se9k': {
      'fr': 'Search for an item...',
      'ar': '',
    },
    'pl17uzg6': {
      'fr': 'عودة',
      'ar': '',
    },
    '7ymaetmm': {
      'fr': 'اضافة',
      'ar': '',
    },
  },
  // addWithdrawal
  {
    '8coj0217': {
      'fr': 'إضافة المصاريف',
      'ar': '',
    },
    'ivpv49ww': {
      'fr': 'عنوان',
      'ar': '',
    },
    'c6zspkiy': {
      'fr': 'عنوان',
      'ar': '',
    },
    'q6pmkoof': {
      'fr': 'المبلغ',
      'ar': '',
    },
    '5w7yoblg': {
      'fr': 'المبلغ',
      'ar': '',
    },
    'ots53rdc': {
      'fr': 'الملاحظة',
      'ar': '',
    },
    '0d5eqbtk': {
      'fr': 'الملاحظة',
      'ar': '',
    },
    '7b07af3w': {
      'fr': 'جانفي',
      'ar': '',
    },
    'z0jon2uy': {
      'fr': 'فيفري',
      'ar': '',
    },
    'r8d4wlxg': {
      'fr': 'مارس',
      'ar': '',
    },
    'taadkyy6': {
      'fr': 'أفريل',
      'ar': '',
    },
    'q72f36ez': {
      'fr': 'ماي',
      'ar': '',
    },
    '2vmmoy1o': {
      'fr': 'جوان',
      'ar': '',
    },
    '08rnd9nr': {
      'fr': 'جويلية',
      'ar': '',
    },
    '6orh6n4s': {
      'fr': 'أوت',
      'ar': '',
    },
    'q6qzhw6l': {
      'fr': 'سبتمبر',
      'ar': '',
    },
    '2d4bygmr': {
      'fr': 'أكتوبر',
      'ar': '',
    },
    'kcxpw9km': {
      'fr': 'نوفمبر',
      'ar': '',
    },
    '4g7kypq0': {
      'fr': 'ديسمبر',
      'ar': '',
    },
    'mpjh3kau': {
      'fr': 'اختر الشهر',
      'ar': '',
    },
    '63wtsc3a': {
      'fr': 'Search for an item...',
      'ar': '',
    },
    'tx556wtz': {
      'fr': '2020',
      'ar': '',
    },
    'ykmucdyp': {
      'fr': '2021',
      'ar': '',
    },
    'zhipv43o': {
      'fr': '2022',
      'ar': '',
    },
    'bbf2awvs': {
      'fr': '2023',
      'ar': '',
    },
    'sj253hi0': {
      'fr': '2024',
      'ar': '',
    },
    'l1ul64zj': {
      'fr': '2025',
      'ar': '',
    },
    '9ytzrwht': {
      'fr': '2026',
      'ar': '',
    },
    'gypu7zb1': {
      'fr': '2027',
      'ar': '',
    },
    'oa3v6phc': {
      'fr': '2028',
      'ar': '',
    },
    'e7p1mv1x': {
      'fr': '2029',
      'ar': '',
    },
    'ry87ic5u': {
      'fr': '2030',
      'ar': '',
    },
    'sfic3ylc': {
      'fr': 'اختر السنة',
      'ar': '',
    },
    'bu8nccdo': {
      'fr': 'Search for an item...',
      'ar': '',
    },
    'qmtpw6fw': {
      'fr': 'عودة',
      'ar': '',
    },
    'o4jwfivx': {
      'fr': 'اضافة',
      'ar': '',
    },
  },
  // addBankTransfert
  {
    'p7x0nw9s': {
      'fr': 'عودة',
      'ar': '',
    },
    'k3ajvd3d': {
      'fr': 'إضافة تحويل بنكي',
      'ar': '',
    },
    'sdm58hov': {
      'fr': 'اضافة',
      'ar': '',
    },
    'qsv1qe4k': {
      'fr': 'عنوان',
      'ar': '',
    },
    '7l7veyws': {
      'fr': 'عنوان',
      'ar': '',
    },
    'pw2u2rek': {
      'fr': 'يجب عليك تحديد عنوان أو إضافة عنوان جديد لإضافة تحويل مصرفي جديد',
      'ar': '',
    },
    'p6g9snnz': {
      'fr': 'Custom Name',
      'ar': '',
    },
    'hkyctri0': {
      'fr': 'Design & Education',
      'ar': '',
    },
    '3vf9zo2x': {
      'fr': 'Design & Education',
      'ar': '',
    },
    'ps7a3mrg': {
      'fr': 'Active',
      'ar': '',
    },
    'ua0we5ut': {
      'fr': 'Custom Name',
      'ar': '',
    },
    '0jus4a0x': {
      'fr': 'Design & Education',
      'ar': '',
    },
    'cjfqu2wm': {
      'fr': 'Design & Education',
      'ar': '',
    },
    'ddvvbf9a': {
      'fr': 'Active',
      'ar': '',
    },
    'dcowexn6': {
      'fr': 'Custom Name',
      'ar': '',
    },
    'e5zdws0d': {
      'fr': 'Development & No Code',
      'ar': '',
    },
    'dsug0g7m': {
      'fr': 'Development & No Code',
      'ar': '',
    },
    'fybd90is': {
      'fr': 'Active',
      'ar': '',
    },
    '7hndfmgt': {
      'fr': 'Custom Name',
      'ar': '',
    },
    'uhzdmt2f': {
      'fr': 'Development & No Code',
      'ar': '',
    },
    'daqqsk0h': {
      'fr': 'Development & No Code',
      'ar': '',
    },
    'i7equ3ig': {
      'fr': 'Active',
      'ar': '',
    },
  },
  // addBankTransfertStep2
  {
    'x3807aby': {
      'fr': 'إضافة تحويل بنكي',
      'ar': '',
    },
    'mb3z2xkw': {
      'fr': 'المبلغ المستخلص',
      'ar': '',
    },
    'do3cypu7': {
      'fr': 'المبلغ المستخلص',
      'ar': '',
    },
    'i1skt2lv': {
      'fr': 'الفائض',
      'ar': '',
    },
    '2mra19ln': {
      'fr': 'الفائض',
      'ar': '',
    },
    'zxphrlsh': {
      'fr': 'التاريخ',
      'ar': '',
    },
    'uq64zuwh': {
      'fr': 'التاريخ',
      'ar': '',
    },
    '7fy6dtjy': {
      'fr': 'رقم الملف',
      'ar': '',
    },
    'vbl8ljbb': {
      'fr': 'رقم الملف',
      'ar': '',
    },
    'u5i691h5': {
      'fr': 'جانفي',
      'ar': '',
    },
    '40cw4pzd': {
      'fr': 'فيفري',
      'ar': '',
    },
    '26lljd0z': {
      'fr': 'مارس',
      'ar': '',
    },
    'tp6e00xo': {
      'fr': 'أفريل',
      'ar': '',
    },
    '9j35kuzt': {
      'fr': 'ماي',
      'ar': '',
    },
    '4ld07n0d': {
      'fr': 'جوان',
      'ar': '',
    },
    'wk9xlvx2': {
      'fr': 'جويلية',
      'ar': '',
    },
    '02v8jsh2': {
      'fr': 'أوت',
      'ar': '',
    },
    'ku3oqcou': {
      'fr': 'سبتمبر',
      'ar': '',
    },
    'l9udfir1': {
      'fr': 'أكتوبر',
      'ar': '',
    },
    'iegz7704': {
      'fr': 'نوفمبر',
      'ar': '',
    },
    '7kz5jedi': {
      'fr': 'ديسمبر',
      'ar': '',
    },
    'a317j6ks': {
      'fr': 'اختر الشهر',
      'ar': '',
    },
    '0zwqhme5': {
      'fr': 'Search for an item...',
      'ar': '',
    },
    'bl1wih3v': {
      'fr': '2020',
      'ar': '',
    },
    'yz07cn1z': {
      'fr': '2021',
      'ar': '',
    },
    '0usmrcdz': {
      'fr': '2022',
      'ar': '',
    },
    '9id7clxp': {
      'fr': '2023',
      'ar': '',
    },
    'ocbhcisk': {
      'fr': '2024',
      'ar': '',
    },
    'znjqhsyu': {
      'fr': '2025',
      'ar': '',
    },
    'kfgmju2i': {
      'fr': '2026',
      'ar': '',
    },
    'tfqpulww': {
      'fr': '2027',
      'ar': '',
    },
    '3lsfyjkp': {
      'fr': '2028',
      'ar': '',
    },
    '4z6xyj4p': {
      'fr': '2029',
      'ar': '',
    },
    '5i6ehc3n': {
      'fr': '2030',
      'ar': '',
    },
    '6mhh8dmy': {
      'fr': 'اختر السنة',
      'ar': '',
    },
    'wrz7yrc9': {
      'fr': 'Search for an item...',
      'ar': '',
    },
    'td5qf02l': {
      'fr': 'عودة',
      'ar': '',
    },
    'xwolc2f2': {
      'fr': 'اضافة',
      'ar': '',
    },
  },
  // addCredit
  {
    '30a8gjfb': {
      'fr': 'إضافة المبالغ المودعة',
      'ar': '',
    },
    'acsw8tce': {
      'fr': 'رقم الملف',
      'ar': '',
    },
    'zo6xzj6u': {
      'fr': 'رقم الوثيقة',
      'ar': '',
    },
    '8cq5ljnp': {
      'fr': 'المبلغ',
      'ar': '',
    },
    'uccwvcnj': {
      'fr': 'المبلغ',
      'ar': '',
    },
    'te8x1o9u': {
      'fr': 'التاريخ',
      'ar': '',
    },
    'fkq7di36': {
      'fr': 'التاريخ',
      'ar': '',
    },
    '662068xm': {
      'fr': 'جانفي',
      'ar': '',
    },
    'lzdt8ytf': {
      'fr': 'فيفري',
      'ar': '',
    },
    'vh3qomne': {
      'fr': 'مارس',
      'ar': '',
    },
    'ln3s48u1': {
      'fr': 'أفريل',
      'ar': '',
    },
    'mre400np': {
      'fr': 'ماي',
      'ar': '',
    },
    '4blfopdd': {
      'fr': 'جوان',
      'ar': '',
    },
    'd74z8waf': {
      'fr': 'جويلية',
      'ar': '',
    },
    '8087gqrt': {
      'fr': 'أوت',
      'ar': '',
    },
    'nf1bq6b6': {
      'fr': 'سبتمبر',
      'ar': '',
    },
    'yuwsn1rj': {
      'fr': 'أكتوبر',
      'ar': '',
    },
    '7p2flgos': {
      'fr': 'نوفمبر',
      'ar': '',
    },
    'icj0sv3o': {
      'fr': 'ديسمبر',
      'ar': '',
    },
    '3qglhy33': {
      'fr': 'اختر الشهر',
      'ar': '',
    },
    '7arv4g2p': {
      'fr': 'Search for an item...',
      'ar': '',
    },
    'doxlli0z': {
      'fr': '2020',
      'ar': '',
    },
    'y3kb9y8h': {
      'fr': '2021',
      'ar': '',
    },
    'ejp9c2vo': {
      'fr': '2022',
      'ar': '',
    },
    '7816trr8': {
      'fr': '2023',
      'ar': '',
    },
    'hkq6zll1': {
      'fr': '2024',
      'ar': '',
    },
    'yuw8kami': {
      'fr': '2025',
      'ar': '',
    },
    'f751zkf6': {
      'fr': '2026',
      'ar': '',
    },
    'fad26kxd': {
      'fr': '2027',
      'ar': '',
    },
    'v9kxvd7w': {
      'fr': '2028',
      'ar': '',
    },
    'k75zzrac': {
      'fr': '2029',
      'ar': '',
    },
    'qvq1y4fq': {
      'fr': '2030',
      'ar': '',
    },
    'se5o0rvw': {
      'fr': 'اختر السنة',
      'ar': '',
    },
    'tk7ondil': {
      'fr': 'Search for an item...',
      'ar': '',
    },
    '0qvcsb5c': {
      'fr': 'عودة',
      'ar': '',
    },
    'jkkvdc6a': {
      'fr': 'اضافة',
      'ar': '',
    },
  },
  // TitleDepot
  {
    'clia0clg': {
      'fr': 'عودة',
      'ar': '',
    },
    '86khpwhm': {
      'fr': 'إضافة المداخيل',
      'ar': '',
    },
    'uza96pi2': {
      'fr': 'اضافة',
      'ar': '',
    },
    '4k65a0l1': {
      'fr': 'عنوان',
      'ar': '',
    },
    'ttut3lgm': {
      'fr': 'عنوان',
      'ar': '',
    },
    '8gb2rf4c': {
      'fr': 'يجب عليك تحديد عنوان أو إضافة عنوان جديد لإضافة تحويل مداخيل ',
      'ar': '',
    },
    '2s5kth5n': {
      'fr': 'Custom Name',
      'ar': '',
    },
    'goci2zfm': {
      'fr': 'Design & Education',
      'ar': '',
    },
    'l3dbg11y': {
      'fr': 'Design & Education',
      'ar': '',
    },
    '382s3v16': {
      'fr': 'Active',
      'ar': '',
    },
    'w6b0dlzd': {
      'fr': 'Custom Name',
      'ar': '',
    },
    'tjfqyo6q': {
      'fr': 'Design & Education',
      'ar': '',
    },
    '9gir45t2': {
      'fr': 'Design & Education',
      'ar': '',
    },
    'eeauwr1m': {
      'fr': 'Active',
      'ar': '',
    },
    'g10ul4nd': {
      'fr': 'Custom Name',
      'ar': '',
    },
    'irvj7wxp': {
      'fr': 'Development & No Code',
      'ar': '',
    },
    'ujq8ob58': {
      'fr': 'Development & No Code',
      'ar': '',
    },
    'v6tlho1w': {
      'fr': 'Active',
      'ar': '',
    },
    '5n4g1la4': {
      'fr': 'Custom Name',
      'ar': '',
    },
    'q40ggxb5': {
      'fr': 'Development & No Code',
      'ar': '',
    },
    'awrqbw7s': {
      'fr': 'Development & No Code',
      'ar': '',
    },
    'xqus2g2j': {
      'fr': 'Active',
      'ar': '',
    },
  },
  // TitleWithdrawal
  {
    'iryso7pq': {
      'fr': 'عودة',
      'ar': '',
    },
    'dmub4jwn': {
      'fr': 'إضافة المصاريف',
      'ar': '',
    },
    'msmow58c': {
      'fr': 'اضافة',
      'ar': '',
    },
    '9d8lro0x': {
      'fr': 'عنوان',
      'ar': '',
    },
    '6f7pf74e': {
      'fr': 'عنوان',
      'ar': '',
    },
    '1qhcws5e': {
      'fr': 'يجب عليك تحديد عنوان أو إضافة عنوان جديد لإضافة تحويل مداخيل ',
      'ar': '',
    },
    'z98d3vhx': {
      'fr': 'Custom Name',
      'ar': '',
    },
    'aobrqat5': {
      'fr': 'Design & Education',
      'ar': '',
    },
    'i9alx6w5': {
      'fr': 'Design & Education',
      'ar': '',
    },
    'iwbxc1au': {
      'fr': 'Active',
      'ar': '',
    },
    '62astszk': {
      'fr': 'Custom Name',
      'ar': '',
    },
    'fyr5nz13': {
      'fr': 'Design & Education',
      'ar': '',
    },
    'qx2qwp5u': {
      'fr': 'Design & Education',
      'ar': '',
    },
    'zq0bibz5': {
      'fr': 'Active',
      'ar': '',
    },
    'tn8ibcuj': {
      'fr': 'Custom Name',
      'ar': '',
    },
    'n88erld6': {
      'fr': 'Development & No Code',
      'ar': '',
    },
    't8m32g9o': {
      'fr': 'Development & No Code',
      'ar': '',
    },
    'vpf2bjlr': {
      'fr': 'Active',
      'ar': '',
    },
    'xsk61bye': {
      'fr': 'Custom Name',
      'ar': '',
    },
    'ms7twt86': {
      'fr': 'Development & No Code',
      'ar': '',
    },
    '4bjnvdr0': {
      'fr': 'Development & No Code',
      'ar': '',
    },
    'jhujpwrt': {
      'fr': 'Active',
      'ar': '',
    },
  },
  // addFileDepot
  {
    'q41gyk0k': {
      'fr': 'اضاقة الوثيقة',
      'ar': '',
    },
    'c7t6m2xt': {
      'fr': 'تحميل الوثيقة',
      'ar': '',
    },
    '7uav9p0m': {
      'fr': 'عودة',
      'ar': '',
    },
    '3bg15cr9': {
      'fr': 'اضافة',
      'ar': '',
    },
  },
  // seeFile
  {
    'jjvk0n8t': {
      'fr': 'اضاقة الوثيقة',
      'ar': '',
    },
    'k5zcu4dc': {
      'fr': 'عودة',
      'ar': '',
    },
    '72554240': {
      'fr': 'طباعة الوثيقة',
      'ar': '',
    },
  },
  // addFileWithdrawal
  {
    '86vw7dtr': {
      'fr': 'اضاقة الوثيقة',
      'ar': '',
    },
    'qrnhcgpn': {
      'fr': 'تحميل الوثيقة',
      'ar': '',
    },
    'ij009wvr': {
      'fr': 'عودة',
      'ar': '',
    },
    '42f92cgs': {
      'fr': 'اضافة',
      'ar': '',
    },
  },
  // addFileBankTrensfert
  {
    'hahar5rk': {
      'fr': 'اضاقة الوثيقة',
      'ar': '',
    },
    'q64lclix': {
      'fr': 'تحميل الوثيقة',
      'ar': '',
    },
    'm6vou27p': {
      'fr': 'عودة',
      'ar': '',
    },
    'stqb4zgg': {
      'fr': 'اضافة',
      'ar': '',
    },
  },
  // addFileCredit
  {
    'lab4l39n': {
      'fr': 'اضاقة الوثيقة',
      'ar': '',
    },
    'o4lgrfv7': {
      'fr': 'تحميل الوثيقة',
      'ar': '',
    },
    'hf11y3oe': {
      'fr': 'عودة',
      'ar': '',
    },
    'hu260rsa': {
      'fr': 'اضافة',
      'ar': '',
    },
  },
  // Miscellaneous
  {
    'a30utms4': {
      'fr': '',
      'ar': '',
    },
    'wzargk7n': {
      'fr': '',
      'ar': '',
    },
    'j2i04dnk': {
      'fr': '',
      'ar': '',
    },
    'ao7mj3qo': {
      'fr': '',
      'ar': '',
    },
    'cucsxwv0': {
      'fr': '',
      'ar': '',
    },
    'r6krxn38': {
      'fr': '',
      'ar': '',
    },
    '2tq2mp9l': {
      'fr': '',
      'ar': '',
    },
    'of54rxlg': {
      'fr': '',
      'ar': '',
    },
    'rfm9btce': {
      'fr': '',
      'ar': '',
    },
    'mdzf1yxb': {
      'fr': '',
      'ar': '',
    },
    'mqhk2931': {
      'fr': '',
      'ar': '',
    },
    'ippqz5b5': {
      'fr': '',
      'ar': '',
    },
    'af0c2q67': {
      'fr': '',
      'ar': '',
    },
    '03yxwn5h': {
      'fr': '',
      'ar': '',
    },
    '04wlykgu': {
      'fr': '',
      'ar': '',
    },
    'jlu76se3': {
      'fr': '',
      'ar': '',
    },
    'gemzwry6': {
      'fr': '',
      'ar': '',
    },
    'yjk5n5qm': {
      'fr': '',
      'ar': '',
    },
    'ss18gf04': {
      'fr': '',
      'ar': '',
    },
    'o3cyrf95': {
      'fr': '',
      'ar': '',
    },
    'b7aeq3wp': {
      'fr': '',
      'ar': '',
    },
    'j882kq09': {
      'fr': '',
      'ar': '',
    },
    '7az2zvzm': {
      'fr': '',
      'ar': '',
    },
    'n0xy02ni': {
      'fr': '',
      'ar': '',
    },
    'ai7t0ba9': {
      'fr': '',
      'ar': '',
    },
    'vzhpqf4g': {
      'fr': '',
      'ar': '',
    },
    '0vrxfwo6': {
      'fr': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
