# Bootcamp 6h — Pentest, Cybersécurité & AB Testing (M1 Reconversion)

Projet pédagogique complet pour une journée de 6h. YNOV Montpellier — 17/09/2026.

## Structure du projet

```
Bootcamp-cyber-info/
├── Bootcamp 6h – Pentest, Cybersécurité & AB Testing (M1 Reconversion).md  ← sujet/déroulé (source)
│
├── apprenants/                      ← À DISTRIBUER AUX APPRENANTS
│   ├── 00_Guide_Installation.pdf                       Installer Linux (WSL/dual boot) + Docker + Python — À ENVOYER J-3 (13 p.)
│   ├── 01_Cours_Cybersecurite_Pentest_ABTesting.pdf   Cours de référence (18 p.)
│   ├── 02_Cahier_de_TP.pdf                             Fiches de TP à compléter (9 p.)
│   ├── notebook_abtest.ipynb                           Notebook Python à trous (# TODO)
│   └── ab_test_exercice.csv                            Données de l'exercice autonome
│
├── prof/                            ← USAGE FORMATEUR — NE PAS DISTRIBUER
│   ├── Guide_Professeur.pdf                            Animation, timing, dépannage, FAQ (10 p.)
│   ├── Correction_complete.pdf                         Corrigé de tous les TP (13 p.)
│   ├── notebook_abtest_corrige.ipynb                   Notebook Python résolu
│   └── ab_test_exercice.csv                            (même jeu de données)
│
└── build/                          ← Outillage (regénération des livrables)
    ├── build_pdf.sh                 Markdown → PDF (pandoc + weasyprint)
    ├── gen_data.py                  Génère le CSV + calcule les valeurs attendues
    ├── gen_notebooks.py             Génère les 2 notebooks
    └── assets/style.css             Feuille de style des PDF
```

Les fichiers `.md` sources restent à côté de chaque `.pdf` pour permettre les modifications.

## Déroulé de la journée (rappel)

| Module | Durée | Contenu |
| --- | --- | --- |
| 1 — Fondamentaux cyber | 30 min | Triade CIA, vocabulaire, méthodologie pentest, cadre légal |
| Installation | 60 min | Déblocage : Linux via **WSL ou dual boot** + Docker (DVWA) + Python — installé en amont via le guide envoyé J-3 |
| 2 — Pentest pratique | 90 min | Recon Nmap, interception Burp, injection SQL, XSS, brute force Hydra |
| 3 — AB Testing | 120 min | Théorie stats (H0/H1, p-value, IC) + pratique Python |
| Synthèse | 60 min | Lien sécurité ↔ données, restitution, Q&A (sans note ni évaluation) |

## Chiffres clés du TP AB testing (déterministes)

- **Jeu principal** (10 % vs 12 %, n=5000) : z = −2,875, **p = 0,0040 → significatif**.
- **Exercice autonome** (`ab_test_exercice.csv`, 10 % vs 10,5 %, n=5000) : z = −1,249, **p = 0,2116 → NON significatif** (l'écart observé de +0,76 pt ne prouve rien).

## Régénérer les livrables

```bash
# Dépendances : pandoc, weasyprint (+ pango), python3 (pandas, numpy, scipy, statsmodels)
python3 build/gen_data.py           # (re)crée le CSV et affiche les valeurs attendues
python3 build/gen_notebooks.py      # (re)crée les 2 notebooks
./build/build_pdf.sh "apprenants/01_Cours_Cybersecurite_Pentest_ABTesting.md" "apprenants/01_Cours_Cybersecurite_Pentest_ABTesting.pdf"
# … idem pour les 3 autres .md
```

> ⚠️ **Rappel éthique/légal** — Tous les outils offensifs (Nmap, Hydra, Burp, injections) ne visent QUE les VM locales isolées. Toute utilisation contre un système tiers sans autorisation écrite est un délit (art. 323-1 et s. du Code pénal).
