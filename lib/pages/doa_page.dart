import 'package:apliasi_doa/pages/schedule.dart';
import 'package:apliasi_doa/service/profile.dart';
import 'package:flutter/material.dart';
import 'package:apliasi_doa/homepage.dart';

class DoaPage extends StatefulWidget {
  const DoaPage({super.key});

  @override
  State<DoaPage> createState() => _DoaPageState();
}

class _DoaPageState extends State<DoaPage> {
  final TextEditingController searchController = TextEditingController();

  List<Map<String, String>> filteredDoa = [];

  final List<Map<String, String>> doaList = [
    {
      "title": "Doa Sebelum Makan",
      "arab": "بِسْمِ اللَّهِ",
      "latin": "Bismillah",
      "arti": "Dengan menyebut nama Allah.",
    },
    {
      "title": "Doa Sebelum Wudhu",
      "arab": "بِسْمِ اللَّهِ",
      "latin": "Bismillah",
      "arti": "Dengan menyebut nama Allah.",
    },

    {
      "title": "Doa Sesudah Makan",
      "arab":
          "الْحَمْدُ لِلَّهِ الَّذِي أَطْعَمَنِي هَذَا وَرَزَقَنِيهِ مِنْ غَيْرِ حَوْلٍ مِنِّي وَلَا قُوَّةٍ",
      "latin":
          "Alhamdulillahil ladzi ath'amanii hadzaa wa razaqaniihi min ghairi haulin minnii wa laa quwwah",
      "arti":
          "Segala puji bagi Allah yang telah memberiku makanan ini dan memberiku rezeki tanpa daya dan kekuatanku.",
    },

    {
      "title": "Doa Sebelum Tidur",
      "arab": "بِاسْمِكَ اللَّهُمَّ أَمُوتُ وَأَحْيَا",
      "latin": "Bismika Allahumma amuutu wa ahyaa",
      "arti": "Dengan nama-Mu ya Allah aku mati dan aku hidup.",
    },

    {
      "title": "Doa Bangun Tidur",
      "arab":
          "الْحَمْدُ لِلَّهِ الَّذِي أَحْيَانَا بَعْدَ مَا أَمَاتَنَا وَإِلَيْهِ النُّشُورُ",
      "latin":
          "Alhamdulillahilladzi ahyaanaa ba’da maa amaatanaa wa ilaihin nusyuur",
      "arti":
          "Segala puji bagi Allah yang telah menghidupkan kami setelah mematikan kami dan kepada-Nya kebangkitan.",
    },

    {
      "title": "Doa Masuk Rumah",
      "arab":
          "بِسْمِ اللَّهِ وَلَجْنَا وَبِسْمِ اللَّهِ خَرَجْنَا وَعَلَى رَبِّنَا تَوَكَّلْنَا",
      "latin":
          "Bismillahi walajnaa wa bismillahi kharajnaa wa 'alaa rabbinaa tawakkalnaa",
      "arti":
          "Dengan nama Allah kami masuk, dengan nama Allah kami keluar, dan kepada Tuhan kami bertawakal.",
    },

    {
      "title": "Doa Keluar Rumah",
      "arab":
          "بِسْمِ اللَّهِ تَوَكَّلْتُ عَلَى اللَّهِ لَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللَّهِ",
      "latin":
          "Bismillahi tawakkaltu ‘alallah laa haula wa laa quwwata illa بالله",
      "arti":
          "Dengan nama Allah, aku bertawakal kepada Allah, tidak ada daya dan kekuatan kecuali dengan Allah.",
    },

    {
      "title": "Doa Masuk Masjid",
      "arab": "اللَّهُمَّ افْتَحْ لِي أَبْوَابَ رَحْمَتِكَ",
      "latin": "Allahummaf tahlii abwaaba rahmatik",
      "arti": "Ya Allah, bukakanlah untukku pintu-pintu rahmat-Mu.",
    },

    {
      "title": "Doa Keluar Masjid",
      "arab": "اللَّهُمَّ إِنِّي أَسْأَلُكَ مِنْ فَضْلِكَ",
      "latin": "Allahumma inni as-aluka min fadhlik",
      "arti": "Ya Allah, sesungguhnya aku memohon karunia-Mu.",
    },

    {
      "title": "Doa Sebelum Belajar",
      "arab": "رَبِّ زِدْنِي عِلْمًا",
      "latin": "Rabbi zidnii ‘ilmaa",
      "arti": "Ya Tuhanku, tambahkanlah ilmu kepadaku.",
    },

    {
      "title": "Doa Naik Kendaraan",
      "arab":
          "سُبْحَانَ الَّذِي سَخَّرَ لَنَا هَذَا وَمَا كُنَّا لَهُ مُقْرِنِينَ وَإِنَّا إِلَى رَبِّنَا لَمُنْقَلِبُونَ",
      "latin":
          "Subhaanalladzi sakh-khoro lanaa haadzaa wa maa kunnaa lahu muqriniin wa innaa ilaa rabbinaa lamunqalibuun",
      "arti":
          "Maha Suci Allah yang menundukkan kendaraan ini untuk kami padahal kami sebelumnya tidak mampu menguasainya dan sesungguhnya kami akan kembali kepada Tuhan kami.",
    },

    {
      "title": "Doa Ketika Hujan",
      "arab": "اللَّهُمَّ صَيِّبًا نَافِعًا",
      "latin": "Allahumma shayyiban naafi‘an",
      "arti": "Ya Allah, jadikanlah hujan ini hujan yang bermanfaat.",
    },

    {
      "title": "Doa Memohon Kesembuhan",
      "arab":
          "اللَّهُمَّ رَبَّ النَّاسِ أَذْهِبِ الْبَأْسَ اشْفِ أَنْتَ الشَّافِي",
      "latin": "Allahumma rabban naas adzhibil ba’sa isyfi antasy syaafi",
      "arti":
          "Ya Allah Tuhan manusia, hilangkanlah penyakit ini, sembuhkanlah, Engkaulah Maha Penyembuh.",
    },

    {
      "title": "Doa Untuk Orang Tua",
      "arab": "رَبِّ ارْحَمْهُمَا كَمَا رَبَّيَانِي صَغِيرًا",
      "latin": "Rabbir hamhumaa kamaa rabbayaanii shaghiiraa",
      "arti":
          "Wahai Tuhanku, sayangilah keduanya sebagaimana mereka menyayangiku di waktu kecil.",
    },

    {
      "title": "Doa Dimudahkan Urusan",
      "arab": "اللَّهُمَّ لَا سَهْلَ إِلَّا مَا جَعَلْتَهُ سَهْلًا",
      "latin": "Allahumma laa sahla illa maa ja'altahu sahlaa",
      "arti":
          "Ya Allah, tidak ada kemudahan kecuali yang Engkau jadikan mudah.",
    },

    {
      "title": "Doa Agar Hati Tenang",
      "arab": "اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْهَمِّ وَالْحَزَنِ",
      "latin": "Allahumma inni a’uudzu bika minal hammi wal hazan",
      "arti":
          "Ya Allah, aku berlindung kepada-Mu dari kegelisahan dan kesedihan.",
    },

    {
      "title": "Doa Sesudah Wudhu",
      "arab":
          "أَشْهَدُ أَنْ لَا إِلٰهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ وَأَشْهَدُ أَنَّ مُحَمَّدًا عَبْدُهُ وَرَسُولُهُ",
      "latin":
          "Asyhadu allaa ilaaha illallaahu wahdahu laa syariika lahu wa asyhadu anna Muhammadan ‘abduhu wa rasuuluh",
      "arti":
          "Aku bersaksi bahwa tidak ada Tuhan selain Allah Yang Maha Esa, tidak ada sekutu bagi-Nya, dan aku bersaksi bahwa Nabi Muhammad adalah hamba dan utusan-Nya.",
    },

    {
      "title": "Doa Ketika Bersin",
      "arab": "الْحَمْدُ لِلَّهِ",
      "latin": "Alhamdulillah",
      "arti": "Segala puji bagi Allah.",
    },

    {
      "title": "Jawaban Orang Bersin",
      "arab": "يَرْحَمُكَ اللَّهُ",
      "latin": "Yarhamukallah",
      "arti": "Semoga Allah merahmatimu.",
    },

    {
      "title": "Balasan Orang Bersin",
      "arab": "يَهْدِيكُمُ اللَّهُ وَيُصْلِحُ بَالَكُمْ",
      "latin": "Yahdiikumullaahu wa yushlihu baalakum",
      "arti":
          "Semoga Allah memberi kalian petunjuk dan memperbaiki keadaan kalian.",
    },

    {
      "title": "Doa Masuk Kamar Mandi",
      "arab": "اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْخُبُثِ وَالْخَبَائِثِ",
      "latin": "Allahumma inni a’uudzu bika minal khubutsi wal khabaa-its",
      "arti":
          "Ya Allah, aku berlindung kepada-Mu dari godaan setan laki-laki dan perempuan.",
    },

    {
      "title": "Doa Keluar Kamar Mandi",
      "arab": "غُفْرَانَكَ",
      "latin": "Ghufraanaka",
      "arti": "Aku memohon ampun kepada-Mu.",
    },

    {
      "title": "Doa Melihat Cermin",
      "arab": "اللَّهُمَّ كَمَا حَسَّنْتَ خَلْقِي فَحَسِّنْ خُلُقِي",
      "latin": "Allahumma kamaa hassanta khalqii fahassin khuluqii",
      "arti":
          "Ya Allah, sebagaimana Engkau telah memperindah rupaku maka perindahlah akhlakku.",
    },

    {
      "title": "Doa Memakai Pakaian",
      "arab": "الْحَمْدُ لِلَّهِ الَّذِي كَسَانِي هَذَا الثَّوْبَ",
      "latin": "Alhamdulillaahil ladzi kasaanii haadzats tsaub",
      "arti": "Segala puji bagi Allah yang telah memberiku pakaian ini.",
    },

    {
      "title": "Doa Melepas Pakaian",
      "arab": "بِسْمِ اللَّهِ",
      "latin": "Bismillah",
      "arti": "Dengan menyebut nama Allah.",
    },

    {
      "title": "Doa Masuk Pasar",
      "arab": "لَا إِلٰهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ",
      "latin": "Laa ilaaha illallaahu wahdahu laa syariika lah",
      "arti":
          "Tidak ada Tuhan selain Allah Yang Maha Esa dan tidak ada sekutu bagi-Nya.",
    },

    {
      "title": "Doa Ketika Marah",
      "arab": "أَعُوذُ بِاللَّهِ مِنَ الشَّيْطَانِ الرَّجِيمِ",
      "latin": "A’uudzu billaahi minas syaithaanir rajiim",
      "arti": "Aku berlindung kepada Allah dari godaan setan yang terkutuk.",
    },

    {
      "title": "Doa Ketika Bepergian",
      "arab":
          "اللَّهُمَّ إِنَّا نَسْأَلُكَ فِي سَفَرِنَا هَذَا الْبِرَّ وَالتَّقْوَى",
      "latin":
          "Allahumma innaa nas-aluka fii safarinaa hadzal birra wat taqwaa",
      "arti":
          "Ya Allah, kami memohon kepada-Mu dalam perjalanan ini kebaikan dan ketakwaan.",
    },

    {
      "title": "Doa Ketika Mendengar Petir",
      "arab": "سُبْحَانَ الَّذِي يُسَبِّحُ الرَّعْدُ بِحَمْدِهِ",
      "latin": "Subhaanalladzi yusabbihur ra’du bihamdih",
      "arti": "Maha Suci Allah yang petir bertasbih dengan memuji-Nya.",
    },
    {
      "title": "Doa Ketika Bercermin",
      "arab": "اللَّهُمَّ أَنْتَ حَسَّنْتَ خَلْقِي فَحَسِّنْ خُلُقِي",
      "latin": "Allahumma anta hassanta khalqii fahassin khuluqii",
      "arti":
          "Ya Allah, Engkau telah memperindah kejadianku maka perindahlah akhlakku.",
    },

    {
      "title": "Doa Sebelum Masuk Masjid",
      "arab": "اللَّهُمَّ اجْعَلْ فِي قَلْبِي نُورًا",
      "latin": "Allahummaj ‘al fii qalbii nuuraa",
      "arti": "Ya Allah, jadikanlah cahaya di dalam hatiku.",
    },

    {
      "title": "Doa Menjenguk Orang Sakit",
      "arab": "لَا بَأْسَ طَهُورٌ إِنْ شَاءَ اللَّهُ",
      "latin": "Laa ba’sa thahuurun insyaa Allah",
      "arti": "Tidak apa-apa, semoga menjadi penghapus dosa insyaAllah.",
    },

    {
      "title": "Doa Ketika Sakit",
      "arab":
          "اللَّهُمَّ رَبَّ النَّاسِ أَذْهِبِ الْبَأْسَ وَاشْفِ أَنْتَ الشَّافِي",
      "latin": "Allahumma rabban naas adzhibil ba’sa wasyfi antasy syaafii",
      "arti":
          "Ya Allah Tuhan manusia, hilangkan penyakit dan sembuhkanlah, Engkau Maha Penyembuh.",
    },

    {
      "title": "Doa Memohon Ilmu Bermanfaat",
      "arab": "اللَّهُمَّ إِنِّي أَسْأَلُكَ عِلْمًا نَافِعًا",
      "latin": "Allahumma inni as-aluka ‘ilman naafi‘an",
      "arti": "Ya Allah, aku memohon ilmu yang bermanfaat.",
    },

    {
      "title": "Doa Memohon Rezeki Halal",
      "arab": "اللَّهُمَّ اكْفِنِي بِحَلَالِكَ عَنْ حَرَامِكَ",
      "latin": "Allahummakfinii bihalaalika ‘an haraamik",
      "arti": "Ya Allah, cukupkan aku dengan rezeki halal-Mu dari yang haram.",
    },

    {
      "title": "Doa Ketika Kesusahan",
      "arab": "حَسْبُنَا اللَّهُ وَنِعْمَ الْوَكِيلُ",
      "latin": "Hasbunallaahu wa ni’mal wakiil",
      "arti":
          "Cukuplah Allah menjadi penolong kami dan Dia sebaik-baik pelindung.",
    },

    {
      "title": "Doa Mohon Ampunan",
      "arab": "أَسْتَغْفِرُ اللَّهَ الْعَظِيمَ",
      "latin": "Astaghfirullaahal ‘azhiim",
      "arti": "Aku memohon ampun kepada Allah Yang Maha Agung.",
    },

    {
      "title": "Doa Ketika Mendapat Nikmat",
      "arab": "الْحَمْدُ لِلَّهِ",
      "latin": "Alhamdulillah",
      "arti": "Segala puji bagi Allah.",
    },

    {
      "title": "Doa Memohon Hidayah",
      "arab": "اللَّهُمَّ اهْدِنِي فِيمَنْ هَدَيْتَ",
      "latin": "Allahummahdinii fiiman hadait",
      "arti":
          "Ya Allah, berilah aku petunjuk bersama orang-orang yang Engkau beri petunjuk.",
    },

    {
      "title": "Doa Ketika Takut",
      "arab": "حَسْبِيَ اللَّهُ لَا إِلٰهَ إِلَّا هُوَ",
      "latin": "Hasbiyallaahu laa ilaaha illaa huwa",
      "arti": "Cukuplah Allah bagiku, tidak ada Tuhan selain Dia.",
    },

    {
      "title": "Doa Memohon Kesabaran",
      "arab": "رَبَّنَا أَفْرِغْ عَلَيْنَا صَبْرًا",
      "latin": "Rabbanaa afrigh ‘alainaa shabran",
      "arti": "Ya Tuhan kami, limpahkanlah kesabaran kepada kami.",
    },

    {
      "title": "Doa Ketika Mendapat Musibah",
      "arab": "إِنَّا لِلَّهِ وَإِنَّا إِلَيْهِ رَاجِعُونَ",
      "latin": "Innaa lillaahi wa innaa ilaihi raaji‘uun",
      "arti": "Sesungguhnya kami milik Allah dan kepada-Nya kami kembali.",
    },
    {
      "title": "Doa Masuk Surga",
      "arab": "اللَّهُمَّ إِنِّي أَسْأَلُكَ الْجَنَّةَ",
      "latin": "Allahumma inni as-alukal jannah",
      "arti": "Ya Allah, aku memohon kepada-Mu surga.",
    },

    {
      "title": "Doa Dijauhkan Dari Neraka",
      "arab": "اللَّهُمَّ أَجِرْنِي مِنَ النَّارِ",
      "latin": "Allahumma ajirnii minan naar",
      "arti": "Ya Allah, lindungilah aku dari api neraka.",
    },

    {
      "title": "Doa Memohon Kebaikan Dunia Akhirat",
      "arab":
          "رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الْآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ",
      "latin":
          "Rabbanaa aatinaa fid dunyaa hasanah wa fil aakhirati hasanah wa qinaa ‘adzaaban naar",
      "arti":
          "Ya Tuhan kami, berikanlah kami kebaikan di dunia dan kebaikan di akhirat serta lindungilah kami dari siksa neraka.",
    },

    {
      "title": "Doa Memohon Rezeki",
      "arab": "اللَّهُمَّ ارْزُقْنِي رِزْقًا حَلَالًا طَيِّبًا",
      "latin": "Allahummarzuqnii rizqan halaalan thayyiban",
      "arti": "Ya Allah, berikanlah aku rezeki yang halal dan baik.",
    },

    {
      "title": "Doa Memohon Kecerdasan",
      "arab": "رَبِّ اشْرَحْ لِي صَدْرِي وَيَسِّرْ لِي أَمْرِي",
      "latin": "Rabbi syrah lii shadrii wa yassir lii amrii",
      "arti": "Ya Tuhanku, lapangkanlah dadaku dan mudahkanlah urusanku.",
    },

    {
      "title": "Doa Sebelum Ujian",
      "arab": "اللَّهُمَّ لَا سَهْلَ إِلَّا مَا جَعَلْتَهُ سَهْلًا",
      "latin": "Allahumma laa sahla illaa maa ja’altahu sahlaa",
      "arti":
          "Ya Allah, tidak ada kemudahan kecuali yang Engkau jadikan mudah.",
    },

    {
      "title": "Doa Sesudah Belajar",
      "arab": "اللَّهُمَّ انْفَعْنِي بِمَا عَلَّمْتَنِي",
      "latin": "Allahumma anfa’nii bimaa ‘allamtanii",
      "arti":
          "Ya Allah, berikanlah manfaat atas ilmu yang Engkau ajarkan kepadaku.",
    },

    {
      "title": "Doa Ketika Lupa",
      "arab": "اللَّهُمَّ ذَكِّرْنِي مِنْهُ مَا نَسِيتُ",
      "latin": "Allahumma dzakkirnii minhu maa nasiitu",
      "arti": "Ya Allah, ingatkanlah aku terhadap apa yang aku lupa.",
    },

    {
      "title": "Doa Mohon Perlindungan",
      "arab": "أَعُوذُ بِكَلِمَاتِ اللَّهِ التَّامَّاتِ مِنْ شَرِّ مَا خَلَقَ",
      "latin": "A’uudzu bikalimaatillahit taammaati min syarri maa khalaq",
      "arti":
          "Aku berlindung dengan kalimat Allah yang sempurna dari kejahatan makhluk-Nya.",
    },

    {
      "title": "Doa Ketika Bahagia",
      "arab": "الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ",
      "latin": "Alhamdulillaahi rabbil ‘aalamiin",
      "arti": "Segala puji bagi Allah Tuhan semesta alam.",
    },

    {
      "title": "Doa Ketika Sedih",
      "arab": "اللَّهُمَّ إِنِّي عَبْدُكَ ابْنُ عَبْدِكَ",
      "latin": "Allahumma innii ‘abduka wabnu ‘abdika",
      "arti": "Ya Allah, sesungguhnya aku adalah hamba-Mu dan anak hamba-Mu.",
    },

    {
      "title": "Doa Memohon Jodoh",
      "arab": "رَبِّ إِنِّي لِمَا أَنْزَلْتَ إِلَيَّ مِنْ خَيْرٍ فَقِيرٌ",
      "latin": "Rabbi innii limaa anzalta ilayya min khairin faqiir",
      "arti":
          "Ya Tuhanku, sesungguhnya aku sangat memerlukan kebaikan yang Engkau turunkan kepadaku.",
    },

    {
      "title": "Doa Ketika Melihat Orang Sakit",
      "arab": "الْحَمْدُ لِلَّهِ الَّذِي عَافَانِي",
      "latin": "Alhamdulillaahil ladzii ‘aafaanii",
      "arti": "Segala puji bagi Allah yang telah menyelamatkanku.",
    },

    {
      "title": "Doa Ketika Terkena Bencana",
      "arab": "إِنَّا لِلَّهِ وَإِنَّا إِلَيْهِ رَاجِعُونَ",
      "latin": "Innaa lillaahi wa innaa ilaihi raaji’uun",
      "arti": "Sesungguhnya kami milik Allah dan kepada-Nya kami kembali.",
    },

    {
      "title": "Doa Agar Dimudahkan Tidur",
      "arab": "بِاسْمِكَ رَبِّ وَضَعْتُ جَنْبِي",
      "latin": "Bismika rabbi wadha’tu janbii",
      "arti": "Dengan nama-Mu ya Tuhanku aku meletakkan lambungku.",
    },

    {
      "title": "Doa Ketika Bangun Malam",
      "arab": "لَا إِلٰهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ",
      "latin": "Laa ilaaha illallaahu wahdahu laa syariika lah",
      "arti":
          "Tidak ada Tuhan selain Allah Yang Maha Esa, tidak ada sekutu bagi-Nya.",
    },
    {
      "title": "Doa Keluar Rumah Agar Selamat",
      "arab": "بِسْمِ اللَّهِ تَوَكَّلْتُ عَلَى اللَّهِ",
      "latin": "Bismillahi tawakkaltu ‘alallah",
      "arti": "Dengan nama Allah aku bertawakal kepada Allah.",
    },

    {
      "title": "Doa Mohon Kesehatan",
      "arab": "اللَّهُمَّ عَافِنِي فِي بَدَنِي",
      "latin": "Allahumma ‘aafinii fii badanii",
      "arti": "Ya Allah sehatkanlah tubuhku.",
    },

    {
      "title": "Doa Mohon Keselamatan",
      "arab": "اللَّهُمَّ سَلِّمْنِي مِنَ الْبَلَاءِ",
      "latin": "Allahumma sallimnii minal balaa'",
      "arti": "Ya Allah selamatkan aku dari bencana.",
    },

    {
      "title": "Doa Mohon Kemudahan Rezeki",
      "arab": "اللَّهُمَّ ارْزُقْنِي مِنْ حَيْثُ لَا أَحْتَسِبُ",
      "latin": "Allahummarzuqnii min haitsu laa ahtasib",
      "arti":
          "Ya Allah berilah aku rezeki dari arah yang tidak disangka-sangka.",
    },

    {
      "title": "Doa Agar Terhindar Dari Fitnah",
      "arab": "اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْفِتَنِ",
      "latin": "Allahumma innii a’uudzu bika minal fitan",
      "arti": "Ya Allah aku berlindung kepada-Mu dari berbagai fitnah.",
    },

    {
      "title": "Doa Mohon Keteguhan Iman",
      "arab": "يَا مُقَلِّبَ الْقُلُوبِ ثَبِّتْ قَلْبِي عَلَى دِينِكَ",
      "latin": "Yaa muqallibal quluub tsabbit qalbii ‘alaa diinika",
      "arti":
          "Wahai Dzat yang membolak-balikkan hati, teguhkan hatiku di atas agama-Mu.",
    },

    {
      "title": "Doa Agar Disayang Allah",
      "arab": "اللَّهُمَّ إِنِّي أَسْأَلُكَ حُبَّكَ",
      "latin": "Allahumma innii as-aluka hubbaka",
      "arti": "Ya Allah aku memohon cinta-Mu.",
    },

    {
      "title": "Doa Ketika Gelisah",
      "arab":
          "لَا إِلٰهَ إِلَّا أَنْتَ سُبْحَانَكَ إِنِّي كُنْتُ مِنَ الظَّالِمِينَ",
      "latin": "Laa ilaaha illaa anta subhaanaka innii kuntu minazh zhaalimiin",
      "arti":
          "Tiada Tuhan selain Engkau, Maha Suci Engkau, sesungguhnya aku termasuk orang-orang yang zalim.",
    },

    {
      "title": "Doa Mohon Perlindungan Keluarga",
      "arab":
          "رَبَّنَا هَبْ لَنَا مِنْ أَزْوَاجِنَا وَذُرِّيَّاتِنَا قُرَّةَ أَعْيُنٍ",
      "latin":
          "Rabbanaa hab lanaa min azwaajinaa wa dzurriyaatinaa qurrata a’yun",
      "arti":
          "Ya Tuhan kami, anugerahkanlah kepada kami pasangan dan keturunan sebagai penyejuk hati.",
    },

    {
      "title": "Doa Agar Hutang Lunas",
      "arab":
          "اللَّهُمَّ اكْفِنِي بِحَلَالِكَ عَنْ حَرَامِكَ وَأَغْنِنِي بِفَضْلِكَ عَمَّنْ سِوَاكَ",
      "latin":
          "Allahummakfinii bihalaalika ‘an haraamika wa aghninii bifadhlika ‘amman siwaak",
      "arti":
          "Ya Allah cukupkan aku dengan yang halal dari yang haram dan kayakan aku dengan karunia-Mu.",
    },

    {
      "title": "Doa Ketika Masuk Sekolah",
      "arab": "رَبِّ زِدْنِي عِلْمًا وَارْزُقْنِي فَهْمًا",
      "latin": "Rabbi zidnii ‘ilmaa warzuqnii fahmaa",
      "arti": "Ya Tuhanku tambahkanlah ilmuku dan berilah aku pemahaman.",
    },

    {
      "title": "Doa Memohon Akhlak Baik",
      "arab": "اللَّهُمَّ اهْدِنِي لِأَحْسَنِ الْأَخْلَاقِ",
      "latin": "Allahummahdinii li-ahsanal akhlaaq",
      "arti": "Ya Allah tunjukilah aku kepada akhlak yang terbaik.",
    },

    {
      "title": "Doa Agar Terhindar Dari Penyakit",
      "arab":
          "اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْبَرَصِ وَالْجُنُونِ وَالْجُذَامِ",
      "latin":
          "Allahumma innii a’uudzu bika minal barashi wal junuuni wal judzaam",
      "arti":
          "Ya Allah aku berlindung kepada-Mu dari belang, gila, dan penyakit kusta.",
    },

    {
      "title": "Doa Ketika Mendapat Kabar Baik",
      "arab": "الْحَمْدُ لِلَّهِ الَّذِي بِنِعْمَتِهِ تَتِمُّ الصَّالِحَاتُ",
      "latin": "Alhamdulillaahil ladzii bini’matihi tatimmush shaalihaat",
      "arti":
          "Segala puji bagi Allah yang dengan nikmat-Nya segala kebaikan menjadi sempurna.",
    },

    {
      "title": "Doa Ketika Susah Tidur",
      "arab": "اللَّهُمَّ غَارَتِ النُّجُومُ وَهَدَأَتِ الْعُيُونُ",
      "latin": "Allahumma ghaaratinnujuumu wa hadaatil ‘uyuun",
      "arti":
          "Ya Allah bintang-bintang telah tenggelam dan mata-mata telah terpejam.",
    },

    {
      "title": "Doa Agar Diberi Kesuksesan",
      "arab": "رَبِّ أَدْخِلْنِي مُدْخَلَ صِدْقٍ وَأَخْرِجْنِي مُخْرَجَ صِدْقٍ",
      "latin": "Rabbi adkhilnii mudkhala sidqin wa akhrijnii mukhraja sidqin",
      "arti":
          "Ya Tuhanku masukkan aku secara benar dan keluarkan aku secara benar.",
    },

    {
      "title": "Doa Ketika Lelah",
      "arab": "اللَّهُمَّ أَعِنِّي عَلَى ذِكْرِكَ وَشُكْرِكَ",
      "latin": "Allahumma a’innii ‘alaa dzikrika wa syukrika",
      "arti": "Ya Allah bantulah aku untuk mengingat dan bersyukur kepada-Mu.",
    },

    {
      "title": "Doa Memohon Kebahagiaan",
      "arab": "اللَّهُمَّ اجْعَلْنِي سَعِيدًا فِي الدُّنْيَا وَالْآخِرَةِ",
      "latin": "Allahummaj’alnii sa’iidan fid dunyaa wal aakhirah",
      "arti": "Ya Allah jadikan aku bahagia di dunia dan akhirat.",
    },

    {
      "title": "Doa Memohon Keberkahan",
      "arab": "اللَّهُمَّ بَارِكْ لَنَا فِيمَا رَزَقْتَنَا",
      "latin": "Allahumma baarik lanaa fiimaa razaqtanaa",
      "arti":
          "Ya Allah berkahilah rezeki yang telah Engkau berikan kepada kami.",
    },

    {
      "title": "Doa Ketika Akan Bekerja",
      "arab": "اللَّهُمَّ إِنِّي أَسْأَلُكَ خَيْرَ هَذَا الْعَمَلِ",
      "latin": "Allahumma innii as-aluka khaira haadzal ‘amal",
      "arti": "Ya Allah aku memohon kebaikan dari pekerjaan ini.",
    },
    {
      "title": "Doa Ketika Akan Tidur Siang",
      "arab": "اللَّهُمَّ بِاسْمِكَ أَحْيَا وَأَمُوتُ",
      "latin": "Allahumma bismika ahyaa wa amuut",
      "arti": "Ya Allah dengan nama-Mu aku hidup dan mati.",
    },

    {
      "title": "Doa Sesudah Adzan",
      "arab": "اللَّهُمَّ رَبَّ هَذِهِ الدَّعْوَةِ التَّامَّةِ",
      "latin": "Allahumma rabba haadzihid da'watit taammah",
      "arti": "Ya Allah Tuhan pemilik seruan yang sempurna ini.",
    },

    {
      "title": "Doa Ketika Mendengar Adzan",
      "arab": "أَشْهَدُ أَنْ لَا إِلٰهَ إِلَّا اللَّهُ",
      "latin": "Asyhadu allaa ilaaha illallaah",
      "arti": "Aku bersaksi bahwa tiada Tuhan selain Allah.",
    },

    {
      "title": "Doa Memohon Kemudahan",
      "arab": "رَبِّ يَسِّرْ وَلَا تُعَسِّرْ",
      "latin": "Rabbi yassir wa laa tu'assir",
      "arti": "Ya Tuhanku mudahkanlah dan jangan dipersulit.",
    },

    {
      "title": "Doa Memohon Ketenangan",
      "arab": "اللَّهُمَّ أَنْزِلِ السَّكِينَةَ فِي قَلْبِي",
      "latin": "Allahumma anzilis sakiinata fii qalbii",
      "arti": "Ya Allah turunkan ketenangan dalam hatiku.",
    },

    {
      "title": "Doa Ketika Masuk Kendaraan",
      "arab": "بِسْمِ اللَّهِ",
      "latin": "Bismillah",
      "arti": "Dengan nama Allah.",
    },

    {
      "title": "Doa Ketika Turun Dari Kendaraan",
      "arab": "الْحَمْدُ لِلَّهِ",
      "latin": "Alhamdulillah",
      "arti": "Segala puji bagi Allah.",
    },

    {
      "title": "Doa Memohon Perlindungan Anak",
      "arab": "أُعِيذُكُمَا بِكَلِمَاتِ اللَّهِ التَّامَّةِ",
      "latin": "U’iidzukumaa bikalimaatillahit taammah",
      "arti": "Aku melindungkan kalian dengan kalimat Allah yang sempurna.",
    },

    {
      "title": "Doa Ketika Melihat Bulan",
      "arab": "اللَّهُمَّ أَهِلَّهُ عَلَيْنَا بِالْأَمْنِ وَالْإِيمَانِ",
      "latin": "Allahumma ahillahu ‘alainaa bil amni wal iimaan",
      "arti":
          "Ya Allah tampakkan bulan ini kepada kami dengan keamanan dan iman.",
    },

    {
      "title": "Doa Ketika Berbuka Puasa",
      "arab": "اللَّهُمَّ لَكَ صُمْتُ وَبِكَ آمَنْتُ",
      "latin": "Allahumma laka shumtu wabika aamantu",
      "arti": "Ya Allah karena-Mu aku berpuasa dan kepada-Mu aku beriman.",
    },

    {
      "title": "Doa Niat Puasa",
      "arab": "نَوَيْتُ صَوْمَ غَدٍ لِلَّهِ تَعَالَى",
      "latin": "Nawaitu shauma ghadin lillaahi ta’aalaa",
      "arti": "Aku berniat puasa esok hari karena Allah Ta'ala.",
    },

    {
      "title": "Doa Ketika Kelaparan",
      "arab": "اللَّهُمَّ أَطْعِمْنِي",
      "latin": "Allahumma ath’imnii",
      "arti": "Ya Allah berilah aku makanan.",
    },

    {
      "title": "Doa Ketika Kehausan",
      "arab": "اللَّهُمَّ اسْقِنِي",
      "latin": "Allahummasqinii",
      "arti": "Ya Allah berilah aku minum.",
    },

    {
      "title": "Doa Memohon Keikhlasan",
      "arab": "اللَّهُمَّ اجْعَلْ عَمَلِي خَالِصًا",
      "latin": "Allahummaj’al ‘amalii khaalishan",
      "arti": "Ya Allah jadikan amalanku ikhlas.",
    },

    {
      "title": "Doa Ketika Mendapat Rezeki",
      "arab": "الْحَمْدُ لِلَّهِ الَّذِي رَزَقَنِي",
      "latin": "Alhamdulillaahil ladzi رزقني",
      "arti": "Segala puji bagi Allah yang telah memberiku rezeki.",
    },

    {
      "title": "Doa Mohon Dijauhkan Dari Syirik",
      "arab": "اللَّهُمَّ إِنِّي أَعُوذُ بِكَ أَنْ أُشْرِكَ بِكَ",
      "latin": "Allahumma inni a’uudzu bika an usyrika bika",
      "arti": "Ya Allah aku berlindung kepada-Mu dari menyekutukan-Mu.",
    },

    {
      "title": "Doa Agar Diberi Kekuatan",
      "arab": "اللَّهُمَّ قَوِّنِي",
      "latin": "Allahumma qawwinii",
      "arti": "Ya Allah kuatkanlah aku.",
    },

    {
      "title": "Doa Ketika Mendapat Cobaan",
      "arab": "إِنَّا لِلَّهِ وَإِنَّا إِلَيْهِ رَاجِعُونَ",
      "latin": "Innaa lillaahi wa innaa ilaihi raaji’uun",
      "arti": "Sesungguhnya kami milik Allah dan kepada-Nya kami kembali.",
    },

    {
      "title": "Doa Memohon Ampunan Orang Tua",
      "arab": "رَبِّ اغْفِرْ لِي وَلِوَالِدَيَّ",
      "latin": "Rabbighfir lii waliwaalidayya",
      "arti": "Ya Tuhanku ampunilah aku dan kedua orang tuaku.",
    },

    {
      "title": "Doa Ketika Akan Belajar",
      "arab": "اللَّهُمَّ افْتَحْ عَلَيْنَا حِكْمَتَكَ",
      "latin": "Allahummaftah ‘alainaa hikmatak",
      "arti": "Ya Allah bukakan hikmah-Mu untuk kami.",
    },

    {
      "title": "Doa Memohon Kecukupan",
      "arab": "اللَّهُمَّ اكْفِنِي",
      "latin": "Allahummakfinii",
      "arti": "Ya Allah cukupkanlah aku.",
    },

    {
      "title": "Doa Ketika Takjub",
      "arab": "مَا شَاءَ اللَّهُ",
      "latin": "Masyaa Allah",
      "arti": "Atas kehendak Allah.",
    },

    {
      "title": "Doa Ketika Melihat Keindahan",
      "arab": "سُبْحَانَ اللَّهِ",
      "latin": "Subhaanallah",
      "arti": "Maha Suci Allah.",
    },

    {
      "title": "Doa Ketika Mendapat Kesulitan",
      "arab": "لَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللَّهِ",
      "latin": "Laa haula wa laa quwwata illaa بالله",
      "arti": "Tiada daya dan kekuatan kecuali dengan Allah.",
    },

    {
      "title": "Doa Agar Selalu Bersyukur",
      "arab": "اللَّهُمَّ أَعِنِّي عَلَى شُكْرِكَ",
      "latin": "Allahumma a’innii ‘alaa syukrik",
      "arti": "Ya Allah bantulah aku untuk bersyukur kepada-Mu.",
    },

    {
      "title": "Doa Mohon Diberi Anak Sholeh",
      "arab": "رَبِّ هَبْ لِي مِنَ الصَّالِحِينَ",
      "latin": "Rabbi hab lii minash shaalihiin",
      "arti": "Ya Tuhanku anugerahkanlah kepadaku anak yang saleh.",
    },

    {
      "title": "Doa Ketika Akan Safar",
      "arab": "أَسْتَوْدِعُ اللَّهَ دِينَكَ",
      "latin": "Astaudi’ullaaha diinaka",
      "arti": "Aku titipkan agamamu kepada Allah.",
    },

    {
      "title": "Doa Memohon Husnul Khatimah",
      "arab": "اللَّهُمَّ اخْتِمْ لَنَا بِالْحَسَنَاتِ",
      "latin": "Allahummakhtim lanaa bil hasanaat",
      "arti": "Ya Allah akhirilah hidup kami dengan kebaikan.",
    },

    {
      "title": "Doa Memohon Cahaya Hati",
      "arab": "اللَّهُمَّ اجْعَلْ فِي قَلْبِي نُورًا",
      "latin": "Allahummaj’al fii qalbii nuuraa",
      "arti": "Ya Allah jadikan cahaya dalam hatiku.",
    },

    {
      "title": "Doa Ketika Kesepian",
      "arab": "اللَّهُ مَعِي",
      "latin": "Allahu ma’ii",
      "arti": "Allah bersamaku.",
    },

    {
      "title": "Doa Agar Dijauhkan Dari Sifat Malas",
      "arab": "اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْعَجْزِ وَالْكَسَلِ",
      "latin": "Allahumma inni a’uudzu bika minal ‘ajzi wal kasal",
      "arti": "Ya Allah aku berlindung kepada-Mu dari lemah dan malas.",
    },

    {
      "title": "Doa Ketika Mendapat Ilmu",
      "arab": "الْحَمْدُ لِلَّهِ الَّذِي عَلَّمَنَا",
      "latin": "Alhamdulillaahil ladzi ‘allamanaa",
      "arti": "Segala puji bagi Allah yang mengajarkan kami.",
    },

    {
      "title": "Doa Ketika Memulai Pekerjaan",
      "arab": "بِسْمِ اللَّهِ الرَّحْمٰنِ الرَّحِيمِ",
      "latin": "Bismillaahirrahmaanirrahiim",
      "arti": "Dengan nama Allah Yang Maha Pengasih lagi Maha Penyayang.",
    },

    {
      "title": "Doa Ketika Selesai Pekerjaan",
      "arab": "الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ",
      "latin": "Alhamdulillaahi rabbil ‘aalamiin",
      "arti": "Segala puji bagi Allah Tuhan semesta alam.",
    },

    {
      "title": "Doa Agar Diberi Keberanian",
      "arab": "اللَّهُمَّ قَوِّ قَلْبِي",
      "latin": "Allahumma qawwi qalbii",
      "arti": "Ya Allah kuatkan hatiku.",
    },

    {
      "title": "Doa Ketika Menunggu Hasil",
      "arab": "حَسْبِيَ اللَّهُ وَنِعْمَ الْوَكِيلُ",
      "latin": "Hasbiyallaahu wa ni’mal wakiil",
      "arti": "Cukuplah Allah sebagai penolongku.",
    },

    {
      "title": "Doa Memohon Perlindungan Dari Dosa",
      "arab": "اللَّهُمَّ اغْفِرْ ذُنُوبِي",
      "latin": "Allahummaghfir dzunuubii",
      "arti": "Ya Allah ampunilah dosa-dosaku.",
    },

    {
      "title": "Doa Ketika Akan Tidur Malam",
      "arab": "بِاسْمِكَ اللَّهُمَّ أَمُوتُ وَأَحْيَا",
      "latin": "Bismika Allahumma amuutu wa ahyaa",
      "arti": "Dengan nama-Mu ya Allah aku mati dan hidup.",
    },

    {
      "title": "Doa Ketika Bangun Pagi",
      "arab": "الْحَمْدُ لِلَّهِ الَّذِي أَحْيَانَا",
      "latin": "Alhamdulillaahil ladzi ahyaanaa",
      "arti": "Segala puji bagi Allah yang menghidupkan kami.",
    },

    {
      "title": "Doa Memohon Dijaga Dari Maksiat",
      "arab": "اللَّهُمَّ احْفَظْنِي مِنَ الْمَعَاصِي",
      "latin": "Allahummahfazhnii minal ma’aashii",
      "arti": "Ya Allah jagalah aku dari maksiat.",
    },

    {
      "title": "Doa Memohon Hati Bersih",
      "arab": "اللَّهُمَّ طَهِّرْ قَلْبِي",
      "latin": "Allahumma thahhir qalbii",
      "arti": "Ya Allah bersihkan hatiku.",
    },

    {
      "title": "Doa Ketika Ingin Bertaubat",
      "arab": "رَبِّ اغْفِرْ لِي وَتُبْ عَلَيَّ",
      "latin": "Rabbighfir lii watub ‘alayya",
      "arti": "Ya Tuhanku ampunilah aku dan terimalah taubatku.",
    },

    {
      "title": "Doa Ketika Memulai Hari",
      "arab": "اللَّهُمَّ بِكَ أَصْبَحْنَا",
      "latin": "Allahumma bika ashbahnaa",
      "arti": "Ya Allah dengan-Mu kami memasuki pagi.",
    },

    {
      "title": "Doa Ketika Mengakhiri Hari",
      "arab": "اللَّهُمَّ بِكَ أَمْسَيْنَا",
      "latin": "Allahumma bika amsainaa",
      "arti": "Ya Allah dengan-Mu kami memasuki petang.",
    },

    /// DATA DOA TETAP SAMA
  ];

  @override
  void initState() {
    super.initState();
    filteredDoa = doaList;
  }

  void searchDoa(String query) {
    final results = doaList.where((doa) {
      final title = doa['title']!.toLowerCase();
      return title.contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredDoa = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0F172A),

      /// APPBAR
      appBar: AppBar(
        backgroundColor: const Color(0xff0F172A),
        elevation: 0,
        centerTitle: true,

        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),

          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const HomePage()),
            );
          },
        ),

        title: const Text(
          "Kumpulan Doa",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,

            colors: [Color(0xff0F172A), Color(0xff111827), Color(0xff1E293B)],
          ),
        ),

        child: Column(
          children: [
            /// SEARCH
            Padding(
              padding: const EdgeInsets.all(16),

              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(18),

                  border: Border.all(color: Colors.white.withOpacity(0.1)),
                ),

                child: TextField(
                  controller: searchController,
                  onChanged: searchDoa,

                  style: const TextStyle(color: Colors.white),

                  decoration: InputDecoration(
                    hintText: "Cari doa...",
                    hintStyle: const TextStyle(color: Colors.white54),

                    prefixIcon: const Icon(Icons.search, color: Colors.white70),

                    filled: true,
                    fillColor: Colors.transparent,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),

            /// LIST DOA
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: filteredDoa.length,

                itemBuilder: (context, index) {
                  final doa = filteredDoa[index];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 18),
                    padding: const EdgeInsets.all(20),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),

                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,

                        colors: [
                          Colors.white.withOpacity(0.08),
                          Colors.white.withOpacity(0.03),
                        ],
                      ),

                      border: Border.all(color: Colors.white.withOpacity(0.08)),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// TITLE
                        Text(
                          doa['title']!,

                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff4ADE80),
                          ),
                        ),

                        const SizedBox(height: 18),

                        /// ARAB
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),

                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(18),
                          ),

                          child: Text(
                            doa['arab']!,
                            textAlign: TextAlign.right,

                            style: const TextStyle(
                              fontSize: 28,
                              height: 2,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),

                        const SizedBox(height: 18),

                        /// LATIN
                        Text(
                          doa['latin']!,

                          style: const TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            color: Colors.white70,
                          ),
                        ),

                        const SizedBox(height: 14),

                        /// ARTI
                        Text(
                          doa['arti']!,

                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white60,
                            height: 1.7,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      /// BOTTOM NAVIGATION
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff111827),

        currentIndex: 2,
        selectedItemColor: const Color(0xff4ADE80),
        unselectedItemColor: Colors.white54,

        onTap: (index) {
          /// HOME
          if (index == 0) {
            // halaman home
          }
          /// SCHEDULE
          else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Schedule()),
            );
          }
          /// PROFILE
          else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          }
        },

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),

          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: "Schedule",
          ),

          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Doa"),
        ],
      ),
    );
  }
}
