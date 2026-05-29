import 'package:apliasi_doa/pages/dzikir_pagi_petang.dart';
import 'package:flutter/material.dart';

class DzikirPagi extends StatelessWidget {
  const DzikirPagi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0F172A),

      /// APP BAR
      appBar: AppBar(
        backgroundColor: const Color(0xff0F172A),
        elevation: 0,

        title: const Text(
          "Dzikir Pagi",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),

        iconTheme: const IconThemeData(color: Color(0xff4ADE80)),
      ),

      /// BODY
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,

            colors: [Color(0xff0F172A), Color(0xff111827), Color(0xff1E293B)],
          ),
        ),

        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              /// JUDUL UTAMA
              const Center(
                child: Text(
                  "Dzikir Pagi",

                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              /// DZIKIR 1
              buildDzikirCard(
                title: " Membaca Ayat Kursi",
                arab:
                    "اللَّهُ لَا إِلَٰهَ إِلَّا هُوَ الْحَيُّ الْقَيُّومُ ۚ لَا تَأْخُذُهُ سِنَةٌ وَلَا نَوْمٌ ۚ لَهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الْأَرْضِ ۗ مَنْ ذَا الَّذِي يَشْفَعُ عِنْدَهُ إِلَّا بِإِذْنِهِ ۚ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ ۖ وَلَا يُحِيطُونَ بِشَيْءٍ مِنْ عِلْمِهِ إِلَّا بِمَا شَاءَ ۚ وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالْأَرْضَ ۖ وَلَا يَؤُودُهُ حِفْظُهُمَا ۚ وَهُوَ الْعَلِيُّ الْعَظِيمُ",
                latin:
                    "Allāhu lā ilāha illā huwal-ḥayyul-qayyūm, lā ta’khudzuhū sinatuw wa lā naum. Lahū mā fis-samāwāti wa mā fil-arḍ. Man dzalladzī yasyfa‘u ‘indahū illā bi idznih. Ya‘lamu mā baina aidīhim wa mā khalfahum, wa lā yuḥīṭūna bisyai’im min ‘ilmihī illā bimā syā’. Wasi‘a kursiyyuhus-samāwāti wal-arḍ, wa lā ya’ūduhū ḥifẓuhumā, wa huwal-‘aliyyul-‘aẓīm.",
                arti:
                    "Allah, tidak ada Tuhan selain Dia, Yang Maha Hidup, Yang terus-menerus mengurus makhluk-Nya. Tidak mengantuk dan tidak tidur. Milik-Nya apa yang ada di langit dan di bumi. Tidak ada yang dapat memberi syafaat di sisi-Nya tanpa izin-Nya. Dia mengetahui apa yang di hadapan mereka dan apa yang di belakang mereka, dan mereka tidak mengetahui sesuatu apa pun dari ilmu-Nya melainkan apa yang Dia kehendaki. Kursi-Nya meliputi langit dan bumi. Dan Dia tidak merasa berat memelihara keduanya. Dan Dia Maha Tinggi lagi Maha Agung.",
              ),

              const SizedBox(height: 25),
              // Surat Al ikhlas
              buildDzikirCard(
                title: "Membaca Surat Al-Ikhlas (3x)",
                arab:
                    "بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ\n"
                    "قُلْ هُوَ اللَّهُ أَحَدٌ ۝ اللَّهُ الصَّمَدُ ۝ "
                    "لَمْ يَلِدْ وَلَمْ يُولَدْ ۝ وَلَمْ يَكُن لَّهُ كُفُوًا أَحَدٌ",
                latin:
                    "Qul huwallāhu ahad. Allāhus shamad. Lam yalid wa lam yūlad. Wa lam yakun lahū kufuwan ahad.",
                arti:
                    "Dengan menyebut nama Allah Yang Maha Pengasih lagi Maha Penyayang. Katakanlah: Dialah Allah, Yang Maha Esa. Allah adalah ilah yang bergantung kepada-Nya segala urusan. Dia tidak beranak dan tiada pula diperanakkan, dan tidak ada seorang pun yang setara dengan Dia.” (QS. Al Ikhlas: 1-4) (Dibaca 3 x)",
              ),
              // Surat Al falaq
              buildDzikirCard(
                title: "Membaca Surat Al-Falaq (3x)",
                arab:
                    "بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ\n"
                    "قُلْ أَعُوذُ بِرَبِّ الْفَلَقِ ۝ "
                    "مِن شَرِّ مَا خَلَقَ ۝ "
                    "وَمِن شَرِّ غَاسِقٍ إِذَا وَقَبَ ۝ "
                    "وَمِن شَرِّ النَّفَّاثَاتِ فِي الْعُقَدِ ۝ "
                    "وَمِن شَرِّ حَاسِدٍ إِذَا حَسَدَ ۝",
                latin:
                    "Qul a‘ūdzu birabbil-falaq.\n"
                    "Min syarri mā khalaq.\n"
                    "Wa min syarri ghāsiqin idzā waqab.\n"
                    "Wa min syarrin-naffāṡāti fil-‘uqad.\n"
                    "Wa min syarri ḥāsidin idzā ḥasad.",
                arti:
                    "Katakanlah: Aku berlindung kepada Tuhan yang menguasai subuh,\n"
                    "dari kejahatan makhluk-Nya,\n"
                    "dan dari kejahatan malam apabila telah gelap gulita,\n"
                    "dan dari kejahatan perempuan-perempuan penyihir yang meniup pada buhul-buhul,\n"
                    "dan dari kejahatan orang yang dengki apabila dia dengki.\n"
                    "(QS. Al-Falaq: 1-5) (Dibaca 3x)",
              ),
              // Surat An-Nas
              buildDzikirCard(
                title: "Membaca Surat An-Nas (3x)",
                arab:
                    "بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ\n"
                    "قُلْ أَعُوذُ بِرَبِّ النَّاسِ ۝ "
                    "مَلِكِ النَّاسِ ۝ "
                    "إِلَٰهِ النَّاسِ ۝ "
                    "مِن شَرِّ الْوَسْوَاسِ الْخَنَّاسِ ۝ "
                    "الَّذِي يُوَسْوِسُ فِي صُدُورِ النَّاسِ ۝ "
                    "مِنَ الْجِنَّةِ وَالنَّاسِ ۝",
                latin:
                    "Qul a‘ūdzu birabbin-nās.\n"
                    "Malikin-nās.\n"
                    "Ilāhin-nās.\n"
                    "Min syarril-waswāsil-khannās.\n"
                    "Alladzī yuwaswisu fī ṣudūrin-nās.\n"
                    "Minal-jinnati wan-nās.",
                arti:
                    "Katakanlah: Aku berlindung kepada Tuhan manusia,\n"
                    "Raja manusia,\n"
                    "Sembahan manusia,\n"
                    "dari kejahatan (bisikan) setan yang biasa bersembunyi,\n"
                    "yang membisikkan kejahatan ke dalam dada manusia,\n"
                    "dari jin dan manusia.\n"
                    "(QS. An-Nas: 1-6) (Dibaca 3x)",
              ),

              const SizedBox(height: 25),

              // Dzikir 1
              buildDzikirCard(
                title: "Dzikir Pagi: Ash-bahnaa",
                arab:
                    "أَصْبَحْنَا وَأَصْبَحَ الْمُلْكُ لِلَّهِ، وَالْحَمْدُ لِلَّهِ، "
                    "لاَ إِلَـهَ إِلاَّ اللهُ وَحْدَهُ لاَ شَرِيْكَ لَهُ، "
                    "لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيْرُ.\n"
                    "رَبِّ أَسْأَلُكَ خَيْرَ مَا فِيْ هَذَا الْيَوْمِ وَخَيْرَ مَا بَعْدَهُ، "
                    "وَأَعُوْذُ بِكَ مِنْ شَرِّ مَا فِيْ هَذَا الْيَوْمِ وَشَرِّ مَا بَعْدَهُ، "
                    "رَبِّ أَعُوْذُ بِكَ مِنَ الْكَسَلِ وَسُوْءِ الْكِبَرِ، "
                    "رَبِّ أَعُوْذُ بِكَ مِنْ عَذَابٍ فِي النَّارِ وَعَذَابٍ فِي الْقَبْرِ",
                latin:
                    "Ash-bahnaa wa ash-bahal mulku lillah walhamdulillah,\n"
                    "laa ilaha illallah wahdahu laa syarika lah,\n"
                    "lahul mulku walahul hamdu wa huwa ‘ala kulli syai-in qodir.\n"
                    "Robbi as-aluka khoiro maa fii hadzal yaum wa khoiro maa ba’dahu,\n"
                    "wa a’udzu bika min syarri maa fii hadzal yaum wa syarri maa ba’dahu.\n"
                    "Robbi a’udzu bika minal kasali wa su-il kibar.\n"
                    "Robbi a’udzu bika min ‘adzabin fin naari wa ‘adzabin fil qobri.",
                arti:
                    "Kami telah memasuki waktu pagi dan kerajaan hanya milik Allah, segala puji bagi Allah. "
                    "Tidak ada ilah (yang berhak disembah) kecuali Allah semata, tiada sekutu bagi-Nya. "
                    "Milik Allah kerajaan dan bagi-Nya pujian. Dia-lah Yang Mahakuasa atas segala sesuatu. "
                    "Wahai Rabbku, aku mohon kepada-Mu kebaikan di hari ini dan kebaikan sesudahnya. "
                    "Aku berlindung kepada-Mu dari kejahatan hari ini dan kejahatan sesudahnya. "
                    "Wahai Rabbku, aku berlindung kepada-Mu dari kemalasan dan kejelekan di hari tua. "
                    "Wahai Rabbku, aku berlindung kepada-Mu dari siksaan di neraka dan siksaan di alam kubur.\n"
                    "(Dibaca 1x)",
              ),
              // Dzikir 2
              buildDzikirCard(
                title: "Dzikir Pagi: Allahumma bika ash-bahnaa (HR. Muslim)",
                arab:
                    "اَللَّهُمَّ بِكَ أَصْبَحْنَا، وَبِكَ أَمْسَيْنَا، "
                    "وَبِكَ نَحْيَا، وَبِكَ نَمُوْتُ وَإِلَيْكَ النُّشُوْرُ",
                latin:
                    "Allahumma bika ash-bahnaa wa bika amsaynaa wa bika nahyaa "
                    "wa bika namuutu wa ilaikan nusyuur.",
                arti:
                    "Ya Allah, dengan rahmat dan pertolongan-Mu kami memasuki waktu pagi, "
                    "dan dengan rahmat dan pertolongan-Mu kami memasuki waktu petang. "
                    "Dengan rahmat dan pertolongan-Mu kami hidup dan dengan kehendak-Mu kami mati. "
                    "Dan kepada-Mu kebangkitan (bagi semua makhluk).\n"
                    "(Dibaca 1x, HR. Muslim)",
              ),

              /// DZIKIR 3
              buildDzikirCard(
                title: "Dzikir Pagi: Membaca Sayyidul Istighfar",
                arab:
                    "اَللَّهُمَّ أَنْتَ رَبِّيْ لاَ إِلَـهَ إِلاَّ أَنْتَ، "
                    "خَلَقْتَنِيْ وَأَنَا عَبْدُكَ، وَأَنَا عَلَى عَهْدِكَ وَوَعْدِكَ مَا اسْتَطَعْتُ، "
                    "أَعُوْذُ بِكَ مِنْ شَرِّ مَا صَنَعْتُ، أَبُوْءُ لَكَ بِنِعْمَتِكَ عَلَيَّ، "
                    "وَأَبُوْءُ بِذَنْبِيْ فَاغْفِرْ لِيْ فَإِنَّهُ لاَ يَغْفِرُ الذُّنُوْبَ إِلاَّ أَنْتَ.",
                latin:
                    "Allahumma anta robbii laa ilaha illa anta,\n"
                    "kholaqtanii wa anaa ‘abduka wa anaa ‘ala ‘ahdika wa wa’dika mas-tatho’tu.\n"
                    "A’udzu bika min syarri maa shona’tu.\n"
                    "Abu-u laka bi ni’matika ‘alayya wa abu-u bi dzambii.\n"
                    "Fagh-firlii fainnahu laa yagh-firudz dzunuuba illa anta.",
                arti:
                    "Ya Allah, Engkau adalah Rabbku, tidak ada ilah yang berhak disembah kecuali Engkau, "
                    "Engkaulah yang menciptakanku. Aku adalah hamba-Mu. Aku akan setia pada perjanjianku pada-Mu "
                    "(yaitu aku akan mentauhidkan-Mu) semampuku dan aku yakin akan janji-Mu (berupa surga untukku). "
                    "Aku berlindung kepada-Mu dari kejelekan yang kuperbuat. Aku mengakui nikmat-Mu kepadaku dan aku mengakui dosaku. "
                    "Oleh karena itu, ampunilah aku. Sesungguhnya tiada yang mengampuni dosa kecuali Engkau.\n"
                    "(Dibaca 1x, HR. Bukhari)",
              ),

              const SizedBox(height: 25),
              // dzikir 4
              buildDzikirCard(
                title: "Dzikir Pagi: Doa Memohon 'Afiyah",
                arab:
                    "اَللَّهُمَّ إِنِّيْ أَسْأَلُكَ الْعَفْوَ وَالْعَافِيَةَ فِي الدُّنْيَا وَاْلآخِرَةِ، "
                    "اَللَّهُمَّ إِنِّيْ أَسْأَلُكَ الْعَفْوَ وَالْعَافِيَةَ فِي دِيْنِيْ وَدُنْيَايَ وَأَهْلِيْ وَمَالِيْ، "
                    "اَللَّهُمَّ اسْتُرْ عَوْرَاتِى وَآمِنْ رَوْعَاتِى، "
                    "اَللَّهُمَّ احْفَظْنِيْ مِنْ بَيْنِ يَدَيَّ، وَمِنْ خَلْفِيْ، وَعَنْ يَمِيْنِيْ وَعَنْ شِمَالِيْ، "
                    "وَمِنْ فَوْقِيْ، وَأَعُوْذُ بِعَظَمَتِكَ أَنْ أُغْتَالَ مِنْ تَحْتِيْ",
                latin:
                    "Allahumma innii as-alukal ‘afwa wal ‘aafiyah fid dunyaa wal aakhiroh.\n"
                    "Allahumma innii as-alukal ‘afwa wal ‘aafiyah fii diinii wa dun-yaya wa ahlii wa maalii.\n"
                    "Allahumas-tur ‘awrootii wa aamin row’aatii.\n"
                    "Allahummahfazh-nii mim bayni yadayya wa min kholfii wa ‘an yamiinii wa ‘an syimaalii wa min fawqii,\n"
                    "wa a’udzu bi ‘azhomatik an ughtala min tahtii.",
                arti:
                    "Ya Allah, sesungguhnya aku memohon kebajikan dan keselamatan di dunia dan akhirat. "
                    "Ya Allah, sesungguhnya aku memohon kebajikan dan keselamatan dalam agama, dunia, keluarga dan hartaku. "
                    "Ya Allah, tutupilah auratku (aib dan sesuatu yang tidak layak dilihat orang) dan tenteramkanlah aku dari rasa takut. "
                    "Ya Allah, peliharalah aku dari muka, belakang, kanan, kiri dan atasku. "
                    "Aku berlindung dengan kebesaran-Mu, agar aku tidak disambar dari bawahku "
                    "(oleh ular atau tenggelam dalam bumi dan lain-lain yang membuat aku jatuh).\n"
                    "(Dibaca 1x, HR. Abu Dawud, Ibnu Majah)",
              ),

              /// DZIKIR 5
              buildDzikirCard(
                title:
                    "Dzikir Pagi: Doa Perlindungan dari Kejahatan Diri dan Setan",
                arab:
                    "اَللَّهُمَّ عَالِمَ الْغَيْبِ وَالشَّهَادَةِ فَاطِرَ السَّمَاوَاتِ وَاْلأَرْضِ، "
                    "رَبَّ كُلِّ شَيْءٍ وَمَلِيْكَهُ، أَشْهَدُ أَنْ لاَ إِلَـهَ إِلاَّ أَنْتَ، "
                    "أَعُوْذُ بِكَ مِنْ شَرِّ نَفْسِيْ، وَمِنْ شَرِّ الشَّيْطَانِ وَشِرْكِهِ، "
                    "وَأَنْ أَقْتَرِفَ عَلَى نَفْسِيْ سُوْءًا أَوْ أَجُرَّهُ إِلَى مُسْلِمٍ",
                latin:
                    "Allahumma ‘aalimal ghoybi wasy syahaadah faathiros samaawaati wal ardh.\n"
                    "Robba kulli syai-in wa maliikah.\n"
                    "Asyhadu alla ilaha illa anta.\n"
                    "A’udzu bika min syarri nafsii wa min syarrisy syaythooni wa syirkihi,\n"
                    "wa an aqtarifa ‘alaa nafsii suu-an aw ajurrohu ilaa muslim.",
                arti:
                    "Ya Allah, Yang Maha Mengetahui yang ghaib dan yang nyata, wahai Rabb pencipta langit dan bumi, "
                    "Rabb segala sesuatu dan yang merajainya. Aku bersaksi bahwa tidak ada ilah yang berhak disembah kecuali Engkau. "
                    "Aku berlindung kepada-Mu dari kejahatan diriku, setan dan balatentaranya (godaan untuk berbuat syirik pada Allah), "
                    "dan aku berlindung kepada-Mu dari berbuat kejelekan terhadap diriku atau menyeretnya kepada seorang muslim.\n"
                    "(Dibaca 1x)",
              ),

              const SizedBox(height: 25),

              /// DZIKIR 6
              buildDzikirCard(
                title: "Dzikir Pagi: Doa Perlindungan dengan Nama Allah",
                arab:
                    "بِسْمِ اللَّهِ الَّذِى لاَ يَضُرُّ مَعَ اسْمِهِ شَىْءٌ فِى الأَرْضِ "
                    "وَلاَ فِى السَّمَاءِ وَهُوَ السَّمِيعُ الْعَلِيمُ",
                latin:
                    "Bismillahilladzi laa yadhurru ma’asmihi syai-un fil ardhi "
                    "wa laa fis samaa’ wa huwas samii’ul ‘aliim.",
                arti:
                    "Dengan nama Allah yang bila disebut, segala sesuatu di bumi dan langit tidak akan berbahaya, "
                    "Dia-lah Yang Maha Mendengar lagi Maha Mengetahui.\n"
                    "(Dibaca 3x)",
              ),

              const SizedBox(height: 25),

              /// DZIKIR 7
              buildDzikirCard(
                title:
                    "Dzikir Pagi: Ridha kepada Allah, Islam, dan Nabi Muhammad ﷺ",
                arab:
                    "رَضِيْتُ بِاللهِ رَبًّا، وَبِاْلإِسْلاَمِ دِيْنًا، "
                    "وَبِمُحَمَّدٍ صَلَّى اللهُ عَلَيْهِ وَسَلَّمَ نَبِيًّا",
                latin:
                    "Rodhiitu billaahi robbaa wa bil-islaami diinaa, "
                    "wa bi-muhammadin shallallaahu ‘alaihi wa sallama nabiyya.",
                arti:
                    "Aku ridha Allah sebagai Rabb, Islam sebagai agama dan Muhammad shallallahu ‘alaihi wa sallam sebagai nabi.\n"
                    "(Dibaca 3x)",
              ),
              // dzikir 8
              buildDzikirCard(
                title: "Dzikir Pagi: Yaa Hayyu Yaa Qayyum",
                arab:
                    "يَا حَيُّ يَا قَيُّوْمُ بِرَحْمَتِكَ أَسْتَغِيْثُ، "
                    "وَأَصْلِحْ لِيْ شَأْنِيْ كُلَّهُ "
                    "وَلاَ تَكِلْنِيْ إِلَى نَفْسِيْ طَرْفَةَ عَيْنٍ",
                latin:
                    "Yaa Hayyu Yaa Qoyyum, bi-rohmatika as-taghiits,\n"
                    "wa ash-lih lii sya’nii kullahu,\n"
                    "wa laa takilnii ilaa nafsii thorfata ‘ainin abadan.",
                arti:
                    "Wahai Rabb Yang Maha Hidup, wahai Rabb Yang Berdiri Sendiri (tidak butuh segala sesuatu), "
                    "dengan rahmat-Mu aku minta pertolongan, perbaikilah segala urusanku dan jangan diserahkan kepadaku "
                    "sekali pun sekejap mata (tanpa mendapat pertolongan dari-Mu).\n"
                    "(Dibaca 1x)",
              ),
              // Dzikir 9
              buildDzikirCard(
                title: "Dzikir Pagi: Ash-bahnaa ‘ala Fithratil Islam",
                arab:
                    "أَصْبَحْنَا عَلَى فِطْرَةِ اْلإِسْلاَمِ وَعَلَى كَلِمَةِ اْلإِخْلاَصِ، "
                    "وَعَلَى دِيْنِ نَبِيِّنَا مُحَمَّدٍ صَلَّى اللهُ عَلَيْهِ وَسَلَّمَ، "
                    "وَعَلَى مِلَّةِ أَبِيْنَا إِبْرَاهِيْمَ، "
                    "حَنِيْفًا مُسْلِمًا وَمَا كَانَ مِنَ الْمُشْرِكِيْنَ",
                latin:
                    "Ash-bahnaa ‘ala fithrotil islaam wa ‘alaa kalimatil ikhlaash,\n"
                    "wa ‘alaa diini nabiyyinaa Muhammadin shallallahu ‘alaihi wa sallam,\n"
                    "wa ‘alaa millati abiina Ibraahiima haniifam muslimaaw wa maa kaana minal musyrikin.",
                arti:
                    "Di waktu pagi kami memegang agama Islam, kalimat ikhlas (kalimat syahadat), "
                    "agama Nabi kami Muhammad shallallahu ‘alaihi wa sallam, dan agama bapak kami Ibrahim, "
                    "yang berdiri di atas jalan yang lurus, muslim dan tidak tergolong orang-orang musyrik.\n"
                    "(Dibaca 1x di pagi hari saja)",
              ),
              // Dzikir 10
              buildDzikirCard(
                title: "Dzikir Pagi: Subhaanallahi wa bihamdihi",
                arab: "سُبْحَانَ اللهِ وَبِحَمْدِهِ",
                latin: "Subhanallah wa bi-hamdih.",
                arti:
                    "Maha suci Allah, aku memuji-Nya.\n"
                    "(Dibaca 100x)",
              ),
              // dzikir 11
              buildDzikirCard(
                title:
                    "Dzikir Pagi: Laa ilaha illallah wahdahu laa syariika lah",
                arab:
                    "لاَ إِلَـهَ إِلاَّ اللهُ وَحْدَهُ لاَ شَرِيْكَ لَهُ، "
                    "لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ "
                    "وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيْرُ",
                latin:
                    "Laa ilaha illallah wahdahu laa syarika lah,\n"
                    "lahul mulku walahul hamdu wa huwa ‘ala kulli syai-in qodiir.",
                arti:
                    "Tidak ada ilah yang berhak disembah selain Allah semata, tidak ada sekutu bagi-Nya. "
                    "Bagi-Nya kerajaan dan segala pujian. Dia-lah yang berkuasa atas segala sesuatu.\n"
                    "(Dibaca 10x)",
              ),
              // Dzikir 12
              buildDzikirCard(
                title:
                    "Dzikir Pagi: Subhaanallahi wa bihamdihi, ‘adada khalqih",
                arab:
                    "سُبْحَانَ اللهِ وَبِحَمْدِهِ، عَدَدَ خَلْقِهِ، وَرِضَا نَفْسِهِ، "
                    "وَزِنَةَ عَرْشِهِ، وَمِدَادَ كَلِمَاتِهِ",
                latin:
                    "Subhanallah wa bi-hamdih,\n"
                    "‘adada kholqih wa ridhoo nafsih,\n"
                    "wa zinata ‘arsyih, wa midaada kalimaatih.",
                arti:
                    "Maha Suci Allah, aku memuji-Nya sebanyak makhluk-Nya, sejauh kerelaan-Nya, "
                    "seberat timbangan ‘Arsy-Nya dan sebanyak tinta tulisan kalimat-Nya.\n"
                    "(Dibaca 3x di waktu pagi saja)",
              ),
              // Dzikir 13
              buildDzikirCard(
                title: "Dzikir Pagi: Doa Memohon Ilmu, Rizki, dan Amal",
                arab:
                    "اَللَّهُمَّ إِنِّيْ أَسْأَلُكَ عِلْمًا نَافِعًا، "
                    "وَرِزْقًا طَيِّبًا، "
                    "وَعَمَلاً مُتَقَبَّلاً",
                latin:
                    "Allahumma innii as-aluka ‘ilman naafi’a,\n"
                    "wa rizqon thoyyibaa,\n"
                    "wa ‘amalan mutaqobbalaa.",
                arti:
                    "Ya Allah, sungguh aku memohon kepada-Mu ilmu yang bermanfaat (bagi diriku dan orang lain), "
                    "rizki yang halal dan amal yang diterima (di sisi-Mu dan mendapatkan ganjaran yang baik).\n"
                    "(Dibaca 1x setelah salam dari shalat Shubuh, HR. Ibnu Majah)",
              ),
              // Dzikir 14
              buildDzikirCard(
                title: "Dzikir Pagi: Istighfar",
                arab: "أَسْتَغْفِرُ اللهَ وَأَتُوْبُ إِلَيْهِ",
                latin: "Astagh-firullah wa atuubu ilaih.",
                arti:
                    "Aku memohon ampun kepada Allah dan bertobat kepada-Nya.\n"
                    "(Dibaca 100x dalam sehari)",
              ),
              const SizedBox(height: 40),

              /// PENUTUP
              const Center(
                child: Text(
                  "Semoga Allah memberikan keberkahan di pagi hari 🌿",
                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff4ADE80),
                  ),
                ),
              ),

              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  /// WIDGET CARD DZIKIR
  Widget buildDzikirCard({
    required String title,
    required String arab,
    required String latin,
    required String arti,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),

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
            title,

            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xff4ADE80),
            ),
          ),

          const SizedBox(height: 20),

          /// ARAB
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),

            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(18),
            ),

            child: Text(
              arab,
              textAlign: TextAlign.right,

              style: const TextStyle(
                fontSize: 30,
                height: 2,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 20),

          /// LATIN
          const Text(
            "Latin",

            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            latin,

            style: const TextStyle(
              fontSize: 17,
              fontStyle: FontStyle.italic,
              height: 1.5,
              color: Colors.white70,
            ),
          ),

          const SizedBox(height: 20),

          /// ARTI
          const Text(
            "Arti",

            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            arti,

            style: const TextStyle(
              fontSize: 17,
              height: 1.6,
              color: Colors.white60,
            ),
          ),
        ],
      ),
    );
  }
}
