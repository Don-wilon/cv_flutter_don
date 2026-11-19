import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class AppColors {
  static const primary = Color(0xFF3157D5);
  static const navy = Color(0xFF17234D);
  static const background = Color(0xFFF4F7FC);
  static const card = Colors.white;
  static const muted = Color(0xFF718096);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio - Mulindwa',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: AppColors.navy),
        ),
        cardTheme: const CardThemeData(
          color: AppColors.card,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
      ),
      home: const ConnexionPage(),
    );
  }
}

class MonApplication extends StatelessWidget {
  const MonApplication({super.key});

  @override
  Widget build(BuildContext context) => const MyApp();
}

class ConnexionPage extends StatefulWidget {
  const ConnexionPage({super.key});

  @override
  State<ConnexionPage> createState() => _ConnexionPageState();
}

class _ConnexionPageState extends State<ConnexionPage> {
  final identifiant = TextEditingController();
  final motDePasse = TextEditingController();
  bool masquerMotDePasse = true;

  @override
  void dispose() {
    identifiant.dispose();
    motDePasse.dispose();
    super.dispose();
  }

  void connecter() {
    if (identifiant.text.trim() == 'mulindwa' && motDePasse.text == '1234') {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder<void>(
          pageBuilder: (_, __, ___) => const AccueilPage(),
          transitionDuration: const Duration(milliseconds: 450),
          transitionsBuilder: (_, animation, __, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Identifiant ou mot de passe incorrect'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFF7F9FF), Color(0xFFEAF0FF)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 430),
                child: Card(
                  elevation: 18,
                  shadowColor: AppColors.primary.withValues(alpha: 0.16),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 34,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 92,
                          height: 92,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const LinearGradient(
                              colors: [AppColors.primary, Color(0xFF6C8BF5)],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primary.withValues(
                                  alpha: 0.22,
                                ),
                                blurRadius: 24,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.badge_rounded,
                            size: 44,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Bienvenue',
                          style: TextStyle(
                            fontSize: 29,
                            height: 1.1,
                            color: AppColors.navy,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Accédez à mon portfolio',
                          style: TextStyle(
                            color: AppColors.muted,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 28),
                        TextField(
                          controller: identifiant,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            labelText: 'Identifiant',
                            prefixIcon: Icon(Icons.person_outline_rounded),
                            filled: true,
                            fillColor: Color(0xFFF7F9FC),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 14),
                        TextField(
                          controller: motDePasse,
                          obscureText: masquerMotDePasse,
                          textInputAction: TextInputAction.done,
                          onSubmitted: (_) => connecter(),
                          decoration: InputDecoration(
                            labelText: 'Mot de passe',
                            prefixIcon: const Icon(Icons.lock_outline_rounded),
                            filled: true,
                            fillColor: const Color(0xFFF7F9FC),
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              borderSide: BorderSide.none,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                masquerMotDePasse
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                              ),
                              onPressed: () => setState(() {
                                masquerMotDePasse = !masquerMotDePasse;
                              }),
                            ),
                          ),
                        ),
                        const SizedBox(height: 22),
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: FilledButton(
                            onPressed: connecter,
                            style: FilledButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Se connecter',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Icon(Icons.arrow_forward_rounded, size: 20),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AccueilPage extends StatefulWidget {
  const AccueilPage({super.key});

  @override
  State<AccueilPage> createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  int pageActuelle = 0;

  final titres = const ['Mon CV', 'Ma Famille', 'Mes Coordonnées'];
  final pages = const [CVPage(), FamillePage(), ContactPage()];

  void seDeconnecter() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute<void>(builder: (_) => const ConnexionPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 1,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          titres[pageActuelle],
          style: const TextStyle(
            color: AppColors.navy,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: 'Déconnexion',
            onPressed: seDeconnecter,
            icon: const Icon(Icons.logout_rounded, color: AppColors.primary),
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        child: KeyedSubtree(
          key: ValueKey(pageActuelle),
          child: pages[pageActuelle],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: pageActuelle,
        height: 72,
        indicatorColor: AppColors.primary.withValues(alpha: 0.12),
        backgroundColor: Colors.white,
        onDestinationSelected: (index) {
          setState(() => pageActuelle = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.person_outline_rounded),
            selectedIcon: Icon(Icons.person_rounded, color: AppColors.primary),
            label: 'Mon CV',
          ),
          NavigationDestination(
            icon: Icon(Icons.family_restroom_outlined),
            selectedIcon: Icon(Icons.family_restroom, color: AppColors.primary),
            label: 'Famille',
          ),
          NavigationDestination(
            icon: Icon(Icons.phone_outlined),
            selectedIcon: Icon(Icons.phone_rounded, color: AppColors.primary),
            label: 'Contact',
          ),
        ],
      ),
    );
  }
}

class CVPage extends StatelessWidget {
  const CVPage({super.key});

  static const competences = [
    'Maintenance informatique',
    'Réseaux informatiques',
    'Télécommunications GSM et LTE',
    'Fibre optique',
    'Microsoft Office',
    'Notions de programmation',
  ];

  Widget _section({
    required String titre,
    required IconData icone,
    required Widget contenu,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE8EDF6)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.10),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icone, color: AppColors.primary, size: 20),
                ),
                const SizedBox(width: 11),
                Text(
                  titre,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.navy,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            contenu,
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 28),
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 14),
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF3157D5), Color(0xFF6081E8)],
            ),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.18),
                blurRadius: 18,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                width: 92,
                height: 92,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                ),
                child: const Icon(
                  Icons.person_rounded,
                  size: 54,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 13),
              const Text(
                'MULINDWA BISIMWA',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.4,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Étudiant en Réseaux & Télécommunications',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.88),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        _section(
          titre: 'À propos',
          icone: Icons.person_outline_rounded,
          contenu: const Text(
            'Étudiant passionné par l’informatique, les réseaux et les télécommunications.',
            style: TextStyle(height: 1.5, color: AppColors.muted),
          ),
        ),
        _section(
          titre: 'Formation',
          icone: Icons.school_outlined,
          contenu: const Text(
            'Réseaux et Télécommunications\nÉtablissement : À compléter',
            style: TextStyle(height: 1.5, color: AppColors.muted),
          ),
        ),
        _section(
          titre: 'Expérience',
          icone: Icons.work_outline_rounded,
          contenu: const Text(
            'Stage professionnel chez MD ENGINEERING\n'
            'Maintenance préventive et corrective des équipements télécoms.',
            style: TextStyle(height: 1.5, color: AppColors.muted),
          ),
        ),
        _section(
          titre: 'Compétences',
          icone: Icons.build_outlined,
          contenu: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: competences
                .map(
                  (item) => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 9,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0F3FF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      item,
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        _section(
          titre: 'Langues',
          icone: Icons.language_rounded,
          contenu: const Text(
            'Français et anglais : à préciser',
            style: TextStyle(color: AppColors.muted),
          ),
        ),
        _section(
          titre: 'Centres d’intérêt',
          icone: Icons.favorite_border_rounded,
          contenu: const Text(
            'Football, informatique, lecture et développement personnel.',
            style: TextStyle(height: 1.5, color: AppColors.muted),
          ),
        ),
      ],
    );
  }
}

class FamillePage extends StatelessWidget {
  const FamillePage({super.key});

  @override
  Widget build(BuildContext context) {
    const membres = [
      ('Mon père', 'Père', Icons.man_rounded),
      ('Ma mère', 'Mère', Icons.woman_rounded),
      ('Mon frère', 'Frère', Icons.person_rounded),
      ('Ma sœur', 'Sœur', Icons.person_rounded),
    ];

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 28),
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 14),
          child: Text(
            'Ma famille',
            style: TextStyle(
              color: AppColors.navy,
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        for (final membre in membres)
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0xFFE8EDF6)),
            ),
            child: Row(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.10),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(membre.$3, color: AppColors.primary),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        membre.$1,
                        style: const TextStyle(
                          color: AppColors.navy,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        'Lien de parenté : ${membre.$2}',
                        style: const TextStyle(
                          color: AppColors.muted,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.chevron_right_rounded,
                  color: Color(0xFFADB7C8),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  Widget _contact({
    required IconData icone,
    required String titre,
    required String valeur,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE8EDF6)),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(icone, color: AppColors.primary),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titre,
                  style: const TextStyle(
                    color: AppColors.navy,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  valeur,
                  style: const TextStyle(color: AppColors.muted, fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 28),
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 16),
          child: Text(
            'Mes coordonnées',
            style: TextStyle(
              color: AppColors.navy,
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        _contact(
          icone: Icons.phone_rounded,
          titre: 'Téléphone',
          valeur: '+243 XXX XXX XXX',
        ),
        _contact(
          icone: Icons.email_rounded,
          titre: 'E-mail',
          valeur: 'votreemail@gmail.com',
        ),
        _contact(
          icone: Icons.location_on_rounded,
          titre: 'Adresse',
          valeur: 'Goma, RDC',
        ),
        _contact(
          icone: Icons.facebook_rounded,
          titre: 'Facebook',
          valeur: 'Mon profil Facebook',
        ),
        _contact(
          icone: Icons.code_rounded,
          titre: 'GitHub',
          valeur: 'mulindwadan',
        ),
        _contact(
          icone: Icons.work_rounded,
          titre: 'LinkedIn',
          valeur: 'Mon profil LinkedIn',
        ),
      ],
    );
  }
}
