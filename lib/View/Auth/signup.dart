import 'package:flutter/material.dart';
import 'login.dart';

// Écran d'inscription (design seulement)
class SignupView extends StatelessWidget {
  const SignupView({super.key});

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
                  champ('Nom complet', Icons.person_outline, 'Alexandre Dubois', false),
                  const SizedBox(height: 25),
                  champ('Email professionnel', Icons.mail_outline, 'nom@entreprise.com', false),
                  const SizedBox(height: 25),
                  champ('Mot de passe', Icons.lock_outline, '6 caractères minimum', true),
                  const SizedBox(height: 25),
                  champ('Confirmer le mot de passe', Icons.lock_outline, 'Répétez le mot de passe', true),
                  const SizedBox(height: 40),
                  bouton('S’inscrire'),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 1. Bandeau bleu du haut (même que la page de connexion)
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

  // 2. Les deux onglets (ici "S'inscrire" est actif)
  Widget onglets(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          // Onglet inactif : un clic ramène à la connexion
          Expanded(
            child: unOnglet('Se connecter', false, () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LoginView()),
              );
            }),
          ),
          // Onglet actif : on est déjà sur cette page
          Expanded(child: unOnglet('S’inscrire', true, () {})),
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

  // 3. Un champ (titre + zone de saisie vide avec un texte d'aide)
  Widget champ(String label, IconData icone, String aide, bool cache) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 16, color: Color(0xFF334155))),
        const SizedBox(height: 10),
        TextField(
          obscureText: cache,
          style: const TextStyle(fontSize: 16, color: Color(0xFF334155)),
          decoration: InputDecoration(
            hintText: aide, // texte gris affiché quand le champ est vide
            hintStyle: const TextStyle(color: Color(0xFF94A3B8)),
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