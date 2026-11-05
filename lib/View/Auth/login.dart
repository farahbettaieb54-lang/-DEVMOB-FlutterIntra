import 'package:flutter/material.dart';
import 'signup.dart';

// Écran de connexion (design seulement)
class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const bleu = Color(0xFF2563EB);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            entete(),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  onglets(context),
                  const SizedBox(height: 40),
                  champ('Email professionnel', Icons.mail_outline,
                      'alexandre.dubois@entreprise.com', false),
                  const SizedBox(height: 25),
                  champ('Mot de passe', Icons.lock_outline, 'motdepasse', true),
                  const SizedBox(height: 40),
                  bouton('Se connecter'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 1. Bandeau bleu du haut
  Widget entete() {
    return Container(
      width: double.infinity,
      height: 280,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1D4ED8), Color(0xFF2563EB), Color(0xFF4F46E5)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 73,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: Colors.white.withOpacity(0.25)),
            ),
            child: const Icon(Icons.share, color: Colors.white, size: 36),
          ),
          const SizedBox(height: 20),
          const Text(
            'Interco',
            style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 14),
          const Text(
            'Plateforme de Réseau Social d’Entreprise',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }

  // 2. Les deux onglets
  Widget onglets(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          // Onglet actif : on est déjà sur cette page
          Expanded(child: unOnglet('Se connecter', true, () {})),
          // Onglet inactif : un clic ouvre la page d'inscription
          Expanded(
            child: unOnglet('S’inscrire', false, () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const SignupView()),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget unOnglet(String texte, bool actif, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 52,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: actif ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
          boxShadow: actif
              ? [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 6, offset: const Offset(0, 2))]
              : [],
        ),
        child: Text(
          texte,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: actif ? const Color(0xFF1E293B) : const Color(0xFF64748B),
          ),
        ),
      ),
    );
  }

  // 3. Un champ (titre + zone de saisie)
  Widget champ(String label, IconData icone, String texte, bool cache) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 16, color: Color(0xFF334155))),
        const SizedBox(height: 10),
        TextField(
          controller: TextEditingController(text: texte),
          obscureText: cache,
          style: const TextStyle(fontSize: 16, color: Color(0xFF334155)),
          decoration: InputDecoration(
            prefixIcon: Icon(icone, color: const Color(0xFF94A3B8)),
            filled: true,
            fillColor: const Color(0xFFF8FAFC),
            contentPadding: const EdgeInsets.symmetric(vertical: 20),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(color: bleu, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }

  // 4. Le gros bouton bleu
  Widget bouton(String texte) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        boxShadow: [BoxShadow(color: bleu.withOpacity(0.3), blurRadius: 16, offset: const Offset(0, 8))],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bleu,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        ),
        onPressed: () {}, // rien pour l'instant : design seulement
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(texte, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            const SizedBox(width: 10),
            const Icon(Icons.arrow_forward, size: 22),
          ],
        ),
      ),
    );
  }
}