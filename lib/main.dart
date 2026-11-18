
import 'package:flutter/material.dart';

void main() {
  runApp(const MonApplication());
}

class MonApplication extends StatelessWidget {
  const MonApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mon CV',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ConnexionPage(),
    );
  }
}

// PAGE DE CONNEXION

class ConnexionPage extends StatefulWidget {
  const ConnexionPage({super.key});

  @override
  State<ConnexionPage> createState() => _ConnexionPageState();
}

class _ConnexionPageState extends State<ConnexionPage> {

  final identifiant = TextEditingController();
  final motDePasse = TextEditingController();

  void connecter() {
    if (identifiant.text == 'don' &&
        motDePasse.text == '1234') {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const AccueilPage(),
        ),
      );

    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Identifiant ou mot de passe incorrect'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const Icon(
                Icons.person,
                size: 90,
                color: Colors.blue,
              ),

              const Text(
                'BIENVENUE',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              TextField(
                controller: identifiant,
                decoration: const InputDecoration(
                  labelText: 'Identifiant',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: motDePasse,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Mot de passe',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: connecter,
                  child: const Text('Se connecter'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// PAGE D'ACCUEIL ET NAVIGATION

class AccueilPage extends StatefulWidget {
  const AccueilPage({super.key});

  @override
  State<AccueilPage> createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {

  int pageActuelle = 0;

  final pages = const [
    CVPage(),
    FamillePage(),
    ContactPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon espace personnel'),
        centerTitle: true,
      ),

      body: pages[pageActuelle],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageActuelle,
        onTap: (index) {
          setState(() {
            pageActuelle = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Mon CV',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.family_restroom),
            label: 'Famille',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            label: 'Contact',
          ),
        ],
      ),
    );
  }
}

// PAGE MON CV

class CVPage extends StatelessWidget {
  const CVPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Center(
            child: CircleAvatar(
              radius: 55,
              child: Icon(Icons.person, size: 65),
            ),
          ),

          const SizedBox(height: 15),

          const Center(
            child: Text(
              'DON WILONDJA',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const Center(
            child: Text(
              'Étudiant en Réseaux et Télécommunications',
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: 25),

          const Text(
            'À PROPOS DE MOI',
            style: TextStyle(
              fontSize: 20,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),

          const Text(
            'Je suis un étudiant passionné par '
            'l’informatique, les réseaux et les '
            'télécommunications.',
          ),

          const SizedBox(height: 20),

          const Text(
            'FORMATION',
            style: TextStyle(
              fontSize: 20,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),

          const Text(
            'Formation en Réseaux et Télécommunications.\n'
            'Établissement : À compléter.',
          ),

          const SizedBox(height: 20),

          const Text(
            'EXPÉRIENCES',
            style: TextStyle(
              fontSize: 20,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),

          const Text(
            'Stage professionnel chez MD ENGINEERING.\n'
            'Maintenance préventive et corrective '
            'des équipements télécoms.',
          ),

          const SizedBox(height: 20),

          const Text(
            'COMPÉTENCES',
            style: TextStyle(
              fontSize: 20,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),

          const Text(
            '• Maintenance informatique\n'
            '• Réseaux informatiques\n'
            '• Télécommunications GSM et LTE\n'
            '• Fibre optique\n'
            '• Microsoft Office\n'
            '• Notions de programmation',
          ),

          const SizedBox(height: 20),

          const Text(
            'LANGUES',
            style: TextStyle(
              fontSize: 20,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),

          const Text('Français et anglais : à préciser.'),

          const SizedBox(height: 20),

          const Text(
            'CENTRES D’INTÉRÊT',
            style: TextStyle(
              fontSize: 20,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),

          const Text(
            'Football, informatique, lecture et '
            'développement personnel.',
          ),
        ],
      ),
    );
  }
}

// PAGE FAMILLE

class FamillePage extends StatelessWidget {
  const FamillePage({super.key});

  @override
  Widget build(BuildContext context) {

    final membres = [
      ['Mon père', 'Père', Icons.man],
      ['Ma mère', 'Mère', Icons.woman],
      ['Mon frère', 'Frère', Icons.person],
      ['Ma sœur', 'Sœur', Icons.person],
    ];

    return ListView(
      padding: const EdgeInsets.all(15),

      children: [

        const Text(
          'MA FAMILLE',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 15),

        for (var membre in membres)

          Card(
            elevation: 3,
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(membre[2] as IconData),
              ),

              title: Text(membre[0] as String),

              subtitle: Text(
                'Lien de parenté : ${membre[1]}',
              ),
            ),
          ),
      ],
    );
  }
}

// PAGE CONTACT

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),

      children: [

        const Icon(
          Icons.contact_mail,
          size: 80,
          color: Colors.blue,
        ),

        const Text(
          'MES COORDONNÉES',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 25),

        const ListTile(
          leading: Icon(Icons.phone, color: Colors.blue),
          title: Text('Téléphone'),
          subtitle: Text('+243 XXX XXX XXX'),
        ),

        const ListTile(
          leading: Icon(Icons.email, color: Colors.blue),
          title: Text('E-mail'),
          subtitle: Text('votreemail@gmail.com'),
        ),

        const ListTile(
          leading: Icon(Icons.location_on, color: Colors.blue),
          title: Text('Adresse'),
          subtitle: Text('Goma, RDC'),
        ),

        const ListTile(
          leading: Icon(Icons.facebook, color: Colors.blue),
          title: Text('Facebook'),
          subtitle: Text('Mon profil Facebook'),
        ),

        const ListTile(
          leading: Icon(Icons.code, color: Colors.blue),
          title: Text('GitHub'),
          subtitle: Text('Only1donwil'),
        ),

        const ListTile(
          leading: Icon(Icons.work, color: Colors.blue),
          title: Text('LinkedIn'),
          subtitle: Text('Mon profil LinkedIn'),
        ),
      ],
    );
  }
}