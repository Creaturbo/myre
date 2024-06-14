import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => [
        'en',
        'ko',
        'ja',
        'fr',
        'de',
        'it',
        'zh_Hans',
        'zh_Hant',
        'ar',
        'ru',
        'pt',
        'es',
        'bn',
        'hi',
        'ur'
      ];

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
    String? koText = '',
    String? jaText = '',
    String? frText = '',
    String? deText = '',
    String? itText = '',
    String? zh_HansText = '',
    String? zh_HantText = '',
    String? arText = '',
    String? ruText = '',
    String? ptText = '',
    String? esText = '',
    String? bnText = '',
    String? hiText = '',
    String? urText = '',
  }) =>
      [
        enText,
        koText,
        jaText,
        frText,
        deText,
        itText,
        zh_HansText,
        zh_HantText,
        arText,
        ruText,
        ptText,
        esText,
        bnText,
        hiText,
        urText
      ][languageIndex] ??
      '';

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
  // HomePage
  {
    'wu2rs2xg': {
      'en': '24/7 365 Recorder',
      'ar': 'مسجل مستمر',
      'bn': 'ক্রমাগত রেকর্ডার',
      'de': 'Dauerschreiber',
      'es': 'registrador continuo',
      'fr': 'Enregistreur continu',
      'hi': 'सतत रिकॉर्डर',
      'it': 'Registratore continuo',
      'ja': '連続記録装置',
      'ko': '연속 레코더',
      'pt': 'Gravador contínuo',
      'ru': 'Непрерывный регистратор',
      'ur': 'مسلسل ریکارڈر',
      'zh_Hans': '连续记录器',
      'zh_Hant': '連續記錄儀',
    },
    'cxfeoqs0': {
      'en': 'Month',
      'ar': 'شهر',
      'bn': 'মাস',
      'de': 'Monat',
      'es': 'Mes',
      'fr': 'Mois',
      'hi': 'महीना',
      'it': 'Mese',
      'ja': '月',
      'ko': '월',
      'pt': 'Mês',
      'ru': 'Месяц',
      'ur': 'مہینہ',
      'zh_Hans': '月',
      'zh_Hant': '月',
    },
    'gm2ys2l7': {
      'en': 'Recording list',
      'ar': 'قائمة التسجيل',
      'bn': 'রেকর্ডিং তালিকা',
      'de': 'Aufnahmeliste',
      'es': 'Lista de grabación',
      'fr': 'Liste d\'enregistrement',
      'hi': 'रिकॉर्डिंग सूची',
      'it': 'Elenco delle registrazioni',
      'ja': '録画リスト',
      'ko': '녹음 목록',
      'pt': 'Lista de gravação',
      'ru': 'Список записей',
      'ur': 'ریکارڈنگ کی فہرست',
      'zh_Hans': '录制列表',
      'zh_Hant': '錄音列表',
    },
    'sdmrl5mj': {
      'en': 'Week',
      'ar': 'أسبوع',
      'bn': 'সপ্তাহ',
      'de': 'Woche',
      'es': 'Semana',
      'fr': 'Semaine',
      'hi': 'सप्ताह',
      'it': 'Settimana',
      'ja': '週',
      'ko': '주',
      'pt': 'Semana',
      'ru': 'Неделя',
      'ur': 'ہفتہ',
      'zh_Hans': '星期',
      'zh_Hant': '星期',
    },
    'vr37l074': {
      'en': 'Recording list',
      'ar': 'قائمة التسجيل',
      'bn': 'রেকর্ডিং তালিকা',
      'de': 'Aufnahmeliste',
      'es': 'Lista de grabación',
      'fr': 'Liste d\'enregistrement',
      'hi': 'रिकॉर्डिंग सूची',
      'it': 'Elenco delle registrazioni',
      'ja': '録画リスト',
      'ko': '녹음 목록',
      'pt': 'Lista de gravação',
      'ru': 'Список записей',
      'ur': 'ریکارڈنگ کی فہرست',
      'zh_Hans': '录制列表',
      'zh_Hant': '錄音列表',
    },
    '9rt4o846': {
      'en': 'Search for recordings..',
      'ar': 'البحث عن التسجيلات..',
      'bn': 'রেকর্ডিংয়ের জন্য অনুসন্ধান করুন..',
      'de': 'Suche nach Aufnahmen..',
      'es': 'Buscar grabaciones..',
      'fr': 'Rechercher des enregistrements..',
      'hi': 'रिकॉर्डिंग खोजें..',
      'it': 'Cerca registrazioni..',
      'ja': '録音を検索します。',
      'ko': '녹음 검색..',
      'pt': 'Procure gravações..',
      'ru': 'Поиск записей..',
      'ur': 'ریکارڈنگ تلاش کریں..',
      'zh_Hans': '搜索录音..',
      'zh_Hant': '搜尋錄音..',
    },
    'pc7r3yo0': {
      'en': 'Favorites List',
      'ar': 'قائمة المفضلة',
      'bn': 'পছন্দের তালিকা',
      'de': 'Favoritenliste',
      'es': 'Lista de favoritos',
      'fr': 'Liste des favoris',
      'hi': 'पसंदीदा सूची',
      'it': 'Elenco dei preferiti',
      'ja': 'お気に入りリスト',
      'ko': '즐겨찾기 목록',
      'pt': 'Lista de favoritos',
      'ru': 'Список избранного',
      'ur': 'پسندیدہ فہرست',
      'zh_Hans': '收藏列表',
      'zh_Hant': '收藏夾列表',
    },
    '80wlir54': {
      'en': 'Home',
      'ar': 'بيت',
      'bn': 'বাড়ি',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'hi': 'घर',
      'it': 'Casa',
      'ja': '家',
      'ko': '집',
      'pt': 'Lar',
      'ru': 'Дом',
      'ur': 'گھر',
      'zh_Hans': '家',
      'zh_Hant': '家',
    },
  },
  // HowToUse
  {
    'o4kn0234': {
      'en': 'How To Use:\n\n',
      'ar': 'كيف تستعمل:',
      'bn': 'কিভাবে ব্যবহার করে:',
      'de': 'Wie benutzt man:',
      'es': 'Cómo utilizar:',
      'fr': 'Comment utiliser:',
      'hi': 'का उपयोग कैसे करें:',
      'it': 'Come usare:',
      'ja': '使い方：',
      'ko': '사용하는 방법:',
      'pt': 'Como usar:',
      'ru': 'Как использовать:',
      'ur': 'استعمال کرنے کا طریقہ:',
      'zh_Hans': '如何使用：',
      'zh_Hant': '如何使用：',
    },
    '0t5yiwkt': {
      'en':
          ' Thank you for using our recording app.\n\nThis app allows continuous recording for 24 hours.\n\nBy default, recordings are saved in 60-minute intervals. \nRecorded files are automatically deleted every hour.\n\nTo set your preferred save and delete times, please go to the Settings tab.\n\nThank you.',
      'ar':
          'شكرًا لك على استخدام تطبيق التسجيل الخاص بنا.\n\nيتيح هذا التطبيق التسجيل المستمر لمدة 24 ساعة.\n\nبشكل افتراضي، يتم حفظ التسجيلات بفواصل زمنية مدتها 60 دقيقة. \nيتم حذف الملفات المسجلة تلقائيًا كل ساعة.\n\nلتعيين أوقات الحفظ والحذف المفضلة لديك، يرجى الانتقال إلى علامة التبويب \"الإعدادات\".\n\nشكرًا لك.',
      'bn':
          'আমাদের রেকর্ডিং অ্যাপ্লিকেশন ব্যবহার করার জন্য আপনাকে ধন্যবাদ.\n\nএই অ্যাপটি 24 ঘন্টা একটানা রেকর্ড করার অনুমতি দেয়।\n\nডিফল্টরূপে, রেকর্ডিং 60 মিনিটের ব্যবধানে সংরক্ষিত হয়। \nরেকর্ড করা ফাইল স্বয়ংক্রিয়ভাবে প্রতি ঘন্টা মুছে ফেলা হয়.\n\nআপনার পছন্দের সংরক্ষণ এবং মুছে ফেলার সময় সেট করতে, অনুগ্রহ করে সেটিংস ট্যাবে যান৷\n\nধন্যবাদ.',
      'de':
          'Vielen Dank, dass Sie unsere Aufnahme-App verwenden.\n\nDiese App ermöglicht eine kontinuierliche Aufnahme für 24 Stunden.\n\nStandardmäßig werden Aufnahmen in 60-Minuten-Intervallen gespeichert. \nAufgenommene Dateien werden automatisch jede Stunde gelöscht.\n\nUm Ihre bevorzugten Speicher- und Löschzeiten einzustellen, gehen Sie bitte zur Registerkarte „Einstellungen“.\n\nVielen Dank.',
      'es':
          'Gracias por usar nuestra aplicación de grabación.\n\nEsta aplicación permite la grabación continua durante 24 horas.\n\nDe forma predeterminada, las grabaciones se guardan en intervalos de 60 minutos. \nLos archivos grabados se eliminan automáticamente cada hora.\n\nPara configurar sus horas preferidas para guardar y eliminar, vaya a la pestaña Configuración.\n\nGracias.',
      'fr':
          'Merci d\'utiliser notre application d\'enregistrement.\n\nCette application permet un enregistrement continu pendant 24 heures.\n\nPar défaut, les enregistrements sont enregistrés à intervalles de 60 minutes. \nLes fichiers enregistrés sont automatiquement supprimés toutes les heures.\n\nPour définir vos heures d\'enregistrement et de suppression préférées, veuillez accéder à l\'onglet Paramètres.\n\nMerci.',
      'hi':
          'हमारे रिकॉर्डिंग ऐप का उपयोग करने के लिए धन्यवाद।\n\nयह ऐप 24 घंटे तक लगातार रिकॉर्डिंग करने की अनुमति देता है।\n\nडिफ़ॉल्ट रूप से, रिकॉर्डिंग 60 मिनट के अंतराल में सहेजी जाती हैं।\nरिकॉर्ड की गई फ़ाइलें हर घंटे अपने आप डिलीट हो जाती हैं।\n\nअपना पसंदीदा सेव और डिलीट समय सेट करने के लिए, कृपया सेटिंग टैब पर जाएँ।\n\nधन्यवाद।',
      'it':
          'Grazie per aver utilizzato la nostra app di registrazione.\n\nQuesta app consente la registrazione continua per 24 ore.\n\nPer impostazione predefinita, le registrazioni vengono salvate a intervalli di 60 minuti. \nI file registrati vengono eliminati automaticamente ogni ora.\n\nPer impostare gli orari di salvataggio ed eliminazione preferiti, vai alla scheda Impostazioni.\n\nGrazie.',
      'ja':
          '弊社の録音アプリをご利用いただきありがとうございます。\n\nこのアプリでは、24 時間連続録音が可能です。\n\nデフォルトでは、録音は 60 分間隔で保存されます。\n\n録音されたファイルは 1 時間ごとに自動的に削除されます。\n\n保存および削除の希望時間を設定するには、[設定] タブに移動してください。\n\nありがとうございます。',
      'ko':
          '저희 녹음 앱을 이용해 주셔서 감사합니다.\n\n이 앱을 사용하면 24시간 동안 연속 녹음이 가능합니다.\n\n기본적으로 녹음은 60분 간격으로 저장됩니다. \n녹화된 파일은 매시간 자동으로 삭제됩니다.\n\n원하는 저장 및 삭제 시간을 설정하려면 설정 탭으로 이동하세요.\n\n감사합니다.',
      'pt':
          'Obrigado por usar nosso aplicativo de gravação.\n\nEste aplicativo permite gravação contínua por 24 horas.\n\nPor padrão, as gravações são salvas em intervalos de 60 minutos. \nOs arquivos gravados são excluídos automaticamente a cada hora.\n\nPara definir seus horários preferidos para salvar e excluir, vá para a guia Configurações.\n\nObrigado.',
      'ru':
          'Благодарим вас за использование нашего приложения для записи.\n\nЭто приложение позволяет осуществлять непрерывную запись в течение 24 часов.\n\nПо умолчанию записи сохраняются с интервалом в 60 минут. \nЗаписанные файлы автоматически удаляются каждый час.\n\nЧтобы установить предпочтительное время сохранения и удаления, перейдите на вкладку «Настройки».\n\nСпасибо.',
      'ur':
          'ہماری ریکارڈنگ ایپ استعمال کرنے کا شکریہ۔\n\nیہ ایپ 24 گھنٹے مسلسل ریکارڈنگ کی اجازت دیتی ہے۔\n\nپہلے سے طے شدہ طور پر، ریکارڈنگ کو 60 منٹ کے وقفوں میں محفوظ کیا جاتا ہے۔ \nریکارڈ شدہ فائلیں ہر گھنٹے خود بخود حذف ہوجاتی ہیں۔\n\nاپنی ترجیحی محفوظ کرنے اور حذف کرنے کے اوقات مرتب کرنے کے لیے، براہ کرم ترتیبات کے ٹیب پر جائیں۔\n\nشکریہ',
      'zh_Hans':
          '感谢您使用我们的录音应用程序。\n\n此应用程序允许连续录音 24 小时。\n\n默认情况下，录音以 60 分钟为间隔保存。\n录制的文件每小时自动删除一次。\n\n要设置您喜欢的保存和删除时间，请转到“设置”选项卡。\n\n谢谢。',
      'zh_Hant':
          '感謝您使用我們的錄音應用程式。\n\n這個應用程式可以24小時連續錄製。\n\n預設情況下，錄音以 60 分鐘的間隔保存。 \n錄製的檔案每小時自動刪除。\n\n若要設定您的首選儲存和刪除時間，請前往「設定」標籤。\n\n謝謝。',
    },
    'sy5txn32': {
      'en': 'Close',
      'ar': 'يغلق',
      'bn': 'বন্ধ',
      'de': 'Schließen',
      'es': 'Cerca',
      'fr': 'Fermer',
      'hi': 'बंद करना',
      'it': 'Vicino',
      'ja': '近い',
      'ko': '닫다',
      'pt': 'Fechar',
      'ru': 'Закрывать',
      'ur': 'بند کریں',
      'zh_Hans': '关闭',
      'zh_Hant': '關閉',
    },
  },
  // MeetingDetails
  {
    '3wt1ecwb': {
      'en': '',
      'ar': '',
      'bn': '',
      'de': '',
      'es': '',
      'fr': '',
      'hi': '',
      'it': '',
      'ja': '',
      'ko': '',
      'pt': '',
      'ru': '',
      'ur': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'l7f8dijy': {
      'en': 'Close',
      'ar': 'يغلق',
      'bn': 'বন্ধ',
      'de': 'Schließen',
      'es': 'Cerca',
      'fr': 'Fermer',
      'hi': 'बंद करना',
      'it': 'Vicino',
      'ja': '近い',
      'ko': '닫다',
      'pt': 'Fechar',
      'ru': 'Закрывать',
      'ur': 'بند کریں',
      'zh_Hans': '关闭',
      'zh_Hant': '關閉',
    },
  },
  // note
  {
    'ov6c9vdr': {
      'en': 'Close',
      'ar': 'يغلق',
      'bn': 'বন্ধ',
      'de': 'Schließen',
      'es': 'Cerca',
      'fr': 'Fermer',
      'hi': 'बंद करना',
      'it': 'Vicino',
      'ja': '近い',
      'ko': '닫다',
      'pt': 'Fechar',
      'ru': 'Закрывать',
      'ur': 'بند کریں',
      'zh_Hans': '关闭',
      'zh_Hant': '關閉',
    },
  },
  // Option
  {
    'd9ca8i6y': {
      'en': 'Setting',
      'ar': 'جلسة',
      'bn': 'বিন্যাস',
      'de': 'Einstellung',
      'es': 'Configuración',
      'fr': 'Paramètre',
      'hi': 'सेटिंग',
      'it': 'Collocamento',
      'ja': '設定',
      'ko': '환경',
      'pt': 'Contexto',
      'ru': 'Параметр',
      'ur': 'ترتیب',
      'zh_Hans': '环境',
      'zh_Hant': '環境',
    },
    'i00u8fua': {
      'en': 'Automatic continuous recording',
      'ar': 'التسجيل المستمر التلقائي',
      'bn': 'স্বয়ংক্রিয় ক্রমাগত রেকর্ডিং',
      'de': 'Automatische Daueraufzeichnung',
      'es': 'Grabación continua automática',
      'fr': 'Enregistrement continu automatique',
      'hi': 'स्वचालित सतत रिकॉर्डिंग',
      'it': 'Registrazione continua automatica',
      'ja': '自動連続録画',
      'ko': '자동 연속 녹음',
      'pt': 'Gravação contínua automática',
      'ru': 'Автоматическая непрерывная запись',
      'ur': 'خودکار مسلسل ریکارڈنگ',
      'zh_Hans': '自动连续记录',
      'zh_Hant': '自動連續錄音',
    },
    'rdz7lhoo': {
      'en': 'On',
      'ar': 'على',
      'bn': 'চালু',
      'de': 'An',
      'es': 'En',
      'fr': 'Sur',
      'hi': 'पर',
      'it': 'SU',
      'ja': 'の上',
      'ko': '~에',
      'pt': 'Sobre',
      'ru': 'На',
      'ur': 'پر',
      'zh_Hans': '在',
      'zh_Hant': '在',
    },
    'kfucbpeh': {
      'en': 'Off',
      'ar': 'عن',
      'bn': 'বন্ধ',
      'de': 'Aus',
      'es': 'Apagado',
      'fr': 'Désactivé',
      'hi': 'बंद',
      'it': 'Spento',
      'ja': 'オフ',
      'ko': '끄다',
      'pt': 'Desligado',
      'ru': 'Выключенный',
      'ur': 'بند',
      'zh_Hans': '离开',
      'zh_Hant': '離開',
    },
    'gc3huf1i': {
      'en': 'On/Off',
      'ar': 'تشغيل/إيقاف',
      'bn': 'চালু/বন্ধ',
      'de': 'An aus',
      'es': 'Encendido apagado',
      'fr': 'Allumé éteint',
      'hi': 'बंद',
      'it': 'Acceso spento',
      'ja': 'オンオフ',
      'ko': '켜기/끄기',
      'pt': 'Ligado desligado',
      'ru': 'Вкл выкл',
      'ur': 'کبھی کبھی',
      'zh_Hans': '开关',
      'zh_Hant': '開關',
    },
    'm5tgljjg': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
      'bn': 'একটি আইটেম খুঁজুন...',
      'de': 'Nach einem Artikel suchen...',
      'es': 'Buscar un artículo...',
      'fr': 'Rechercher un article...',
      'hi': 'किसी आइटम की खोज करें...',
      'it': 'Cerca un articolo...',
      'ja': 'アイテムを検索...',
      'ko': '항목 검색...',
      'pt': 'Procure um item...',
      'ru': 'Искать предмет...',
      'ur': 'ایک آئٹم تلاش کریں...',
      'zh_Hans': '搜索商品...',
      'zh_Hant': '搜尋一個項目...',
    },
    'y1w8c7dt': {
      'en': 'Automatic deletion interval (hours)',
      'ar': 'الفاصل الزمني للحذف التلقائي (ساعات)',
      'bn': 'স্বয়ংক্রিয়ভাবে মুছে ফেলার ব্যবধান (ঘন্টা)',
      'de': 'Automatisches Löschintervall (Stunden)',
      'es': 'Intervalo de eliminación automática (horas)',
      'fr': 'Intervalle de suppression automatique (heures)',
      'hi': 'स्वचालित विलोपन अंतराल (घण्टे)',
      'it': 'Intervallo di cancellazione automatica (ore)',
      'ja': '自動削除間隔（時間）',
      'ko': '자동 삭제 간격(시간)',
      'pt': 'Intervalo de exclusão automática (horas)',
      'ru': 'Интервал автоматического удаления (часы)',
      'ur': 'خودکار حذف کرنے کا وقفہ (گھنٹے)',
      'zh_Hans': '自动删除间隔（小时）',
      'zh_Hant': '自動刪除間隔（小時）',
    },
    'tak53osr': {
      'en': '1',
      'ar': '1',
      'bn': '1',
      'de': '1',
      'es': '1',
      'fr': '1',
      'hi': '1',
      'it': '1',
      'ja': '1',
      'ko': '1',
      'pt': '1',
      'ru': '1',
      'ur': '1',
      'zh_Hans': '1',
      'zh_Hant': '1',
    },
    '15iehxb1': {
      'en': '2',
      'ar': '2',
      'bn': '2',
      'de': '2',
      'es': '2',
      'fr': '2',
      'hi': '2',
      'it': '2',
      'ja': '2',
      'ko': '2',
      'pt': '2',
      'ru': '2',
      'ur': '2',
      'zh_Hans': '2',
      'zh_Hant': '2',
    },
    'zfc0vpyr': {
      'en': '3',
      'ar': '3',
      'bn': '3',
      'de': '3',
      'es': '3',
      'fr': '3',
      'hi': '3',
      'it': '3',
      'ja': '3',
      'ko': '삼',
      'pt': '3',
      'ru': '3',
      'ur': '3',
      'zh_Hans': '3',
      'zh_Hant': '3',
    },
    'yp90hemz': {
      'en': '4',
      'ar': '',
      'bn': '',
      'de': '',
      'es': '',
      'fr': '',
      'hi': '',
      'it': '',
      'ja': '',
      'ko': '',
      'pt': '',
      'ru': '',
      'ur': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'h4qa6qlu': {
      'en': '5',
      'ar': '',
      'bn': '',
      'de': '',
      'es': '',
      'fr': '',
      'hi': '',
      'it': '',
      'ja': '',
      'ko': '',
      'pt': '',
      'ru': '',
      'ur': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'g4quft4q': {
      'en': 'Hours',
      'ar': 'ساعات',
      'bn': 'ঘন্টার',
      'de': 'Std',
      'es': 'Horas',
      'fr': 'Heures',
      'hi': 'घंटे',
      'it': 'Ore',
      'ja': '時間',
      'ko': '시간',
      'pt': 'Horas',
      'ru': 'Часы',
      'ur': 'گھنٹے',
      'zh_Hans': '小时',
      'zh_Hant': '小時',
    },
    'mhl4oleg': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
      'bn': 'একটি আইটেম খুঁজুন...',
      'de': 'Nach einem Artikel suchen...',
      'es': 'Buscar un artículo...',
      'fr': 'Rechercher un article...',
      'hi': 'किसी आइटम की खोज करें...',
      'it': 'Cerca un articolo...',
      'ja': 'アイテムを検索...',
      'ko': '항목 검색...',
      'pt': 'Procure um item...',
      'ru': 'Искать предмет...',
      'ur': 'ایک آئٹم تلاش کریں...',
      'zh_Hans': '搜索商品...',
      'zh_Hant': '搜尋一個項目...',
    },
    'vwe63w5m': {
      'en': 'Automatic recording interval (minutes)',
      'ar': 'الفاصل الزمني للتسجيل التلقائي (بالدقائق)',
      'bn': 'স্বয়ংক্রিয় রেকর্ডিং ব্যবধান (মিনিট)',
      'de': 'Automatisches Aufnahmeintervall (Minuten)',
      'es': 'Intervalo de grabación automática (minutos)',
      'fr': 'Intervalle d\'enregistrement automatique (minutes)',
      'hi': 'स्वचालित रिकॉर्डिंग अंतराल (मिनट)',
      'it': 'Intervallo di registrazione automatica (minuti)',
      'ja': '自動記録間隔（分）',
      'ko': '자동 기록 간격(분)',
      'pt': 'Intervalo de gravação automática (minutos)',
      'ru': 'Интервал автоматической записи (минуты)',
      'ur': 'خودکار ریکارڈنگ کا وقفہ (منٹ)',
      'zh_Hans': '自动记录间隔（分钟）',
      'zh_Hant': '自動記錄間隔（分鐘）',
    },
    '95we028i': {
      'en': '15',
      'ar': '1',
      'bn': '1',
      'de': '1',
      'es': '1',
      'fr': '1',
      'hi': '1',
      'it': '1',
      'ja': '1',
      'ko': '1',
      'pt': '1',
      'ru': '1',
      'ur': '1',
      'zh_Hans': '1',
      'zh_Hant': '1',
    },
    '82smr6hn': {
      'en': '30',
      'ar': '30',
      'bn': '30',
      'de': '30',
      'es': '30',
      'fr': '30',
      'hi': '30',
      'it': '30',
      'ja': '30',
      'ko': '30',
      'pt': '30',
      'ru': '30',
      'ur': '30',
      'zh_Hans': '三十',
      'zh_Hant': '30',
    },
    '9law8jq7': {
      'en': '60',
      'ar': '60',
      'bn': '60',
      'de': '60',
      'es': '60',
      'fr': '60',
      'hi': '60',
      'it': '60',
      'ja': '60',
      'ko': '60',
      'pt': '60',
      'ru': '60',
      'ur': '60',
      'zh_Hans': '60',
      'zh_Hant': '60',
    },
    'fp7yleuc': {
      'en': '90',
      'ar': '',
      'bn': '',
      'de': '',
      'es': '',
      'fr': '',
      'hi': '',
      'it': '',
      'ja': '',
      'ko': '',
      'pt': '',
      'ru': '',
      'ur': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'luikpb1y': {
      'en': '120',
      'ar': '',
      'bn': '',
      'de': '',
      'es': '',
      'fr': '',
      'hi': '',
      'it': '',
      'ja': '',
      'ko': '',
      'pt': '',
      'ru': '',
      'ur': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'ayvcpw0c': {
      'en': 'Minutes',
      'ar': 'دقائق',
      'bn': 'মিনিট',
      'de': 'Protokoll',
      'es': 'Minutos',
      'fr': 'Minutes',
      'hi': 'मिनट',
      'it': 'Minuti',
      'ja': '分',
      'ko': '분',
      'pt': 'Minutos',
      'ru': 'Минуты',
      'ur': 'منٹس',
      'zh_Hans': '分钟',
      'zh_Hant': '分分鐘',
    },
    '7o500k1l': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
      'bn': 'একটি আইটেম খুঁজুন...',
      'de': 'Nach einem Artikel suchen...',
      'es': 'Buscar un artículo...',
      'fr': 'Rechercher un article...',
      'hi': 'किसी आइटम की खोज करें...',
      'it': 'Cerca un articolo...',
      'ja': 'アイテムを検索...',
      'ko': '항목 검색...',
      'pt': 'Procure um item...',
      'ru': 'Искать предмет...',
      'ur': 'ایک آئٹم تلاش کریں...',
      'zh_Hans': '搜索商品...',
      'zh_Hant': '搜尋一個項目...',
    },
    'f55qxrnl': {
      'en': 'Close',
      'ar': 'يغلق',
      'bn': 'বন্ধ',
      'de': 'Schließen',
      'es': 'Cerca',
      'fr': 'Fermer',
      'hi': 'बंद करना',
      'it': 'Vicino',
      'ja': '近い',
      'ko': '닫다',
      'pt': 'Fechar',
      'ru': 'Закрывать',
      'ur': 'بند کریں',
      'zh_Hans': '关闭',
      'zh_Hant': '關閉',
    },
  },
  // name
  {
    'kwfsqgb1': {
      'en': 'Enter a new name..',
      'ar': 'أدخل اسما جديدا..',
      'bn': 'একটি নতুন নাম লিখুন..',
      'de': 'Geben Sie einen neuen Namen ein..',
      'es': 'Introduzca un nuevo nombre..',
      'fr': 'Entrez un nouveau nom..',
      'hi': 'नया नाम दर्ज करें..',
      'it': 'Inserisci un nuovo nome..',
      'ja': '新しい名前を入力してください。',
      'ko': '새 이름을 입력하세요..',
      'pt': 'Digite um novo nome..',
      'ru': 'Введите новое имя..',
      'ur': 'نیا نام درج کریں..',
      'zh_Hans': '输入新名称..',
      'zh_Hant': '輸入新名字..',
    },
  },
  // Miscellaneous
  {
    'd5sg8nwj': {
      'en': 'This app requires permissions to record audio',
      'ar': 'يتطلب هذا التطبيق أذونات لتسجيل الصوت',
      'bn': 'এই অ্যাপটির অডিও রেকর্ড করার অনুমতি প্রয়োজন',
      'de': 'Diese App erfordert Berechtigungen zum Aufzeichnen von Audio',
      'es': 'Esta aplicación requiere permisos para grabar audio.',
      'fr':
          'Cette application nécessite des autorisations pour enregistrer de l\'audio',
      'hi': 'इस ऐप को ऑडियो रिकॉर्ड करने के लिए अनुमति की आवश्यकता है',
      'it': 'Questa app richiede le autorizzazioni per registrare l\'audio',
      'ja': 'このアプリは音声を録音するための権限が必要です',
      'ko': '이 앱에는 오디오를 녹음할 수 있는 권한이 필요합니다.',
      'pt': 'Este aplicativo requer permissões para gravar áudio',
      'ru': 'Этому приложению требуются разрешения на запись звука',
      'ur': 'اس ایپ کو آڈیو ریکارڈ کرنے کے لیے اجازت درکار ہے۔',
      'zh_Hans': '此应用需要录音权限',
      'zh_Hant': '此應用程式需要錄製音訊的權限',
    },
    'ebj4odmj': {
      'en':
          'This app requires Bluetooth access to record audio through a Bluetooth device',
      'ar':
          'يتطلب هذا التطبيق الوصول إلى Bluetooth لتسجيل الصوت من خلال جهاز Bluetooth',
      'bn':
          'একটি ব্লুটুথ ডিভাইসের মাধ্যমে অডিও রেকর্ড করতে এই অ্যাপটির ব্লুটুথ অ্যাক্সেস প্রয়োজন',
      'de':
          'Diese App erfordert Bluetooth-Zugriff, um Audio über ein Bluetooth-Gerät aufzunehmen',
      'es':
          'Esta aplicación requiere acceso a Bluetooth para grabar audio a través de un dispositivo Bluetooth',
      'fr':
          'Cette application nécessite un accès Bluetooth pour enregistrer de l\'audio via un appareil Bluetooth',
      'hi':
          'इस ऐप को ब्लूटूथ डिवाइस के माध्यम से ऑडियो रिकॉर्ड करने के लिए ब्लूटूथ एक्सेस की आवश्यकता होती है',
      'it':
          'Questa app richiede l\'accesso Bluetooth per registrare l\'audio tramite un dispositivo Bluetooth',
      'ja': 'このアプリは、Bluetoothデバイス経由でオーディオを録音するためにBluetoothアクセスを必要とします',
      'ko': '이 앱은 블루투스 장치를 통해 오디오를 녹음하려면 블루투스 액세스가 필요합니다.',
      'pt':
          'Este aplicativo requer acesso Bluetooth para gravar áudio por meio de um dispositivo Bluetooth',
      'ru':
          'Этому приложению требуется доступ к Bluetooth для записи звука через устройство Bluetooth.',
      'ur':
          'اس ایپ کو بلوٹوتھ ڈیوائس کے ذریعے آڈیو ریکارڈ کرنے کے لیے بلوٹوتھ تک رسائی درکار ہے۔',
      'zh_Hans': '此应用需要蓝牙访问才能通过蓝牙设备录制音频',
      'zh_Hant': '此應用程式需要藍牙存取才能透過藍牙設備錄製音頻',
    },
    '6u8fdo0l': {
      'en': '',
      'ar': '',
      'bn': '',
      'de': '',
      'es': '',
      'fr': '',
      'hi': '',
      'it': '',
      'ja': '',
      'ko': '',
      'pt': '',
      'ru': '',
      'ur': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'sgk7eff4': {
      'en': '',
      'ar': '',
      'bn': '',
      'de': '',
      'es': '',
      'fr': '',
      'hi': '',
      'it': '',
      'ja': '',
      'ko': '',
      'pt': '',
      'ru': '',
      'ur': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'ik0cqn76': {
      'en': '',
      'ar': '',
      'bn': '',
      'de': '',
      'es': '',
      'fr': '',
      'hi': '',
      'it': '',
      'ja': '',
      'ko': '',
      'pt': '',
      'ru': '',
      'ur': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '36dbknqd': {
      'en': '',
      'ar': '',
      'bn': '',
      'de': '',
      'es': '',
      'fr': '',
      'hi': '',
      'it': '',
      'ja': '',
      'ko': '',
      'pt': '',
      'ru': '',
      'ur': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '21n74uzu': {
      'en': '',
      'ar': '',
      'bn': '',
      'de': '',
      'es': '',
      'fr': '',
      'hi': '',
      'it': '',
      'ja': '',
      'ko': '',
      'pt': '',
      'ru': '',
      'ur': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'epd5ltf0': {
      'en': '',
      'ar': '',
      'bn': '',
      'de': '',
      'es': '',
      'fr': '',
      'hi': '',
      'it': '',
      'ja': '',
      'ko': '',
      'pt': '',
      'ru': '',
      'ur': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'wsexu2ln': {
      'en': '',
      'ar': '',
      'bn': '',
      'de': '',
      'es': '',
      'fr': '',
      'hi': '',
      'it': '',
      'ja': '',
      'ko': '',
      'pt': '',
      'ru': '',
      'ur': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '417gohbp': {
      'en': '',
      'ar': '',
      'bn': '',
      'de': '',
      'es': '',
      'fr': '',
      'hi': '',
      'it': '',
      'ja': '',
      'ko': '',
      'pt': '',
      'ru': '',
      'ur': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'si9ufggn': {
      'en': '',
      'ar': '',
      'bn': '',
      'de': '',
      'es': '',
      'fr': '',
      'hi': '',
      'it': '',
      'ja': '',
      'ko': '',
      'pt': '',
      'ru': '',
      'ur': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'zkcnx3y5': {
      'en': '',
      'ar': '',
      'bn': '',
      'de': '',
      'es': '',
      'fr': '',
      'hi': '',
      'it': '',
      'ja': '',
      'ko': '',
      'pt': '',
      'ru': '',
      'ur': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'lbuorygd': {
      'en': '',
      'ar': '',
      'bn': '',
      'de': '',
      'es': '',
      'fr': '',
      'hi': '',
      'it': '',
      'ja': '',
      'ko': '',
      'pt': '',
      'ru': '',
      'ur': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'hgmdadov': {
      'en': '',
      'ar': '',
      'bn': '',
      'de': '',
      'es': '',
      'fr': '',
      'hi': '',
      'it': '',
      'ja': '',
      'ko': '',
      'pt': '',
      'ru': '',
      'ur': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    's2vi1jwy': {
      'en': '',
      'ar': '',
      'bn': '',
      'de': '',
      'es': '',
      'fr': '',
      'hi': '',
      'it': '',
      'ja': '',
      'ko': '',
      'pt': '',
      'ru': '',
      'ur': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'n5tnpm1u': {
      'en': '',
      'ar': '',
      'bn': '',
      'de': '',
      'es': '',
      'fr': '',
      'hi': '',
      'it': '',
      'ja': '',
      'ko': '',
      'pt': '',
      'ru': '',
      'ur': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'w29hpi5i': {
      'en': '',
      'ar': '',
      'bn': '',
      'de': '',
      'es': '',
      'fr': '',
      'hi': '',
      'it': '',
      'ja': '',
      'ko': '',
      'pt': '',
      'ru': '',
      'ur': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'syxjd7lq': {
      'en': '',
      'ar': '',
      'bn': '',
      'de': '',
      'es': '',
      'fr': '',
      'hi': '',
      'it': '',
      'ja': '',
      'ko': '',
      'pt': '',
      'ru': '',
      'ur': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'mbj45vrx': {
      'en': '',
      'ar': '',
      'bn': '',
      'de': '',
      'es': '',
      'fr': '',
      'hi': '',
      'it': '',
      'ja': '',
      'ko': '',
      'pt': '',
      'ru': '',
      'ur': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '4on0fedd': {
      'en': '',
      'ar': '',
      'bn': '',
      'de': '',
      'es': '',
      'fr': '',
      'hi': '',
      'it': '',
      'ja': '',
      'ko': '',
      'pt': '',
      'ru': '',
      'ur': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'e5xnt3zf': {
      'en': '',
      'ar': '',
      'bn': '',
      'de': '',
      'es': '',
      'fr': '',
      'hi': '',
      'it': '',
      'ja': '',
      'ko': '',
      'pt': '',
      'ru': '',
      'ur': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '6scy6z1x': {
      'en': '',
      'ar': '',
      'bn': '',
      'de': '',
      'es': '',
      'fr': '',
      'hi': '',
      'it': '',
      'ja': '',
      'ko': '',
      'pt': '',
      'ru': '',
      'ur': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'bc68dxzv': {
      'en': '',
      'ar': '',
      'bn': '',
      'de': '',
      'es': '',
      'fr': '',
      'hi': '',
      'it': '',
      'ja': '',
      'ko': '',
      'pt': '',
      'ru': '',
      'ur': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '9rdfx8x7': {
      'en': '',
      'ar': '',
      'bn': '',
      'de': '',
      'es': '',
      'fr': '',
      'hi': '',
      'it': '',
      'ja': '',
      'ko': '',
      'pt': '',
      'ru': '',
      'ur': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'sfusq7lv': {
      'en': '',
      'ar': '',
      'bn': '',
      'de': '',
      'es': '',
      'fr': '',
      'hi': '',
      'it': '',
      'ja': '',
      'ko': '',
      'pt': '',
      'ru': '',
      'ur': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'ejlt1quf': {
      'en': '',
      'ar': '',
      'bn': '',
      'de': '',
      'es': '',
      'fr': '',
      'hi': '',
      'it': '',
      'ja': '',
      'ko': '',
      'pt': '',
      'ru': '',
      'ur': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'k72pjc4a': {
      'en': '',
      'ar': '',
      'bn': '',
      'de': '',
      'es': '',
      'fr': '',
      'hi': '',
      'it': '',
      'ja': '',
      'ko': '',
      'pt': '',
      'ru': '',
      'ur': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
  },
].reduce((a, b) => a..addAll(b));
