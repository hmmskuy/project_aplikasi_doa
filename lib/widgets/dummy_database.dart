import 'package:apliasi_doa/pages/catatan_pribadi.dart';
import 'package:apliasi_doa/pages/dzikir_pagi_petang.dart';
import 'package:apliasi_doa/pages/prayer_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mdi_icons/flutter_mdi_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../pages/doa_page.dart';

class DummyDatabase {
  static List<Map<String, dynamic>> menuHome = [
    {"title": "Prayer Time", "icon": MdiIcons.mosque, "page": PrayerTimePage()},

    {"title": "Doa", "icon": MdiIcons.handsPray, "page": DoaPage()},
    {
      "title": "Dzikir Pagi dan Petang",
      "icon": MdiIcons.weatherSunsetDown,
      "page": DzikirPagiPetang(),
    },
    {
      "title": "Catatan pribadi",
      "icon": MdiIcons.book,
      "page": CatatanPribadiPage(),
    },
  ];
}
