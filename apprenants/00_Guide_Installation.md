<div class="cover">
<div class="kicker">Bootcamp · YNOV Montpellier</div>

# Guide d'installation

<div class="subtitle">Préparer son environnement — Linux (WSL ou dual boot), Docker & Python</div>

<div class="meta">
À réaliser AVANT le bootcamp · Windows 10/11<br>
Date : 17/09/2026
</div>

<div class="badge">À faire tranquillement chez soi, 1 à 2 h</div>
</div>

# Guide d'installation — préparer sa machine

*À réaliser chez vous, sans stress, avant le jour du bootcamp. Prenez votre temps : ce guide part de zéro et suppose que vous n'avez jamais utilisé Linux ni un terminal.*

## Avant de commencer

Pendant le bootcamp, vous allez manipuler trois outils. Ce guide sert à les installer **à l'avance** pour ne pas perdre de temps le jour J.

| Outil | À quoi ça sert | Quand on s'en sert |
| --- | --- | --- |
| **Linux (Kali)** | La « boîte à outils » du testeur d'intrusion : elle contient les logiciels de pentest (Nmap, Hydra, Burp Suite…). | Toute la matinée (pentest). |
| **Docker** | Un moteur qui lance en une commande la cible d'entraînement **DVWA** (un site web volontairement vulnérable, sans danger, chez vous). | Pour avoir une cible à tester. |
| **Python + Jupyter** | L'environnement de calcul pour la partie **AB testing** (statistiques). | L'après-midi (données). |

**Prérequis matériel :**

- Un ordinateur **Windows 10 (version 2004 ou plus récente) ou Windows 11**.
- **8 Go de RAM** minimum (16 Go recommandés), **30 Go d'espace disque libre**.
- Les **droits administrateur** sur la machine (indispensable).
- Une **connexion internet stable** (les téléchargements sont volumineux).

> **⚠️ Attention — sauvegardez d'abord**
> Toute manipulation qui touche au système (surtout la Voie 2, le dual boot) comporte un risque. **Avant de commencer, copiez vos documents importants** sur un disque externe ou un cloud. On ne prend jamais de risque avec des données non sauvegardées.

## Le terminal & Linux : le minimum vital (pour ne pas paniquer)

Sous Linux, on donne souvent des instructions à l'ordinateur en **tapant du texte** dans une fenêtre appelée **terminal** (ou « console »). C'est normal si cela vous semble intimidant : dans quelques minutes, ce sera une habitude.

- Le terminal affiche une **invite** (par exemple `kali@kali:~$`) qui attend que vous tapiez quelque chose.
- Vous tapez **une commande**, puis vous appuyez sur **Entrée** pour l'exécuter.
- Pour **coller** du texte dans un terminal Linux, utilisez **`Ctrl + Maj + V`** (et non `Ctrl + V`). Pour copier : `Ctrl + Maj + C`.

> **💡 Astuce — le mot de passe « invisible »**
> Quand une commande commençant par `sudo` vous demande votre mot de passe, **rien ne s'affiche pendant que vous tapez** (pas même des étoiles). C'est voulu, pour la sécurité. Tapez votre mot de passe « à l'aveugle » puis appuyez sur Entrée.

**`sudo`**, c'est le mot magique qui dit « exécute cette commande en tant qu'administrateur ». On l'utilise pour installer des logiciels ou modifier le système.

**Les 7 commandes de survie :**

| Commande | Ce qu'elle fait |
| --- | --- |
| `pwd` | Affiche le dossier où vous êtes actuellement. |
| `ls` | Liste les fichiers et dossiers présents. |
| `cd Documents` | Se déplace dans le dossier `Documents` (`cd ..` remonte d'un cran). |
| `clear` | Nettoie l'écran du terminal. |
| `sudo <commande>` | Exécute la commande avec les droits administrateur. |
| `sudo apt install <nom>` | Installe un logiciel. |
| `nano fichier.txt` | Ouvre un éditeur de texte simple (quitter : `Ctrl+X`). |

> **💡 En cas de doute**
> Si une commande ne fonctionne pas ou affiche un message que vous ne comprenez pas, **ne forcez pas** : notez le message et demandez au formateur. Une erreur dans un terminal ne casse rien tant que vous n'exécutez pas de commande de suppression.

## Choisir sa voie : WSL ou dual boot ?

Il existe deux façons d'avoir Linux sur votre PC Windows. **Vous n'en choisissez qu'une seule.**

| Critère | **Voie 1 — WSL 2** | **Voie 2 — Dual boot** |
| --- | --- | --- |
| Facilité | ★★★★★ très simple | ★★☆☆☆ plus technique |
| Risque pour Windows | Aucun | Réel (partitionnement) |
| Réversible ? | Oui, en 1 clic | Difficile (repartitionner) |
| Performance | Très bonne | Maximale (Linux natif) |
| Interfaces graphiques | Bonnes (Windows 11) | Parfaites |
| Temps d'installation | 20–30 min | 1–2 h |

> **🔑 À retenir — notre recommandation**
> **Pour débuter, choisissez la Voie 1 (WSL).** Elle s'installe en quelques minutes, ne touche pas à votre Windows et se désinstalle en un clic. La Voie 2 (dual boot) est faite pour celles et ceux qui veulent une vraie machine Linux permanente et acceptent une installation plus délicate.

---

## VOIE 1 — WSL 2 (recommandée)

WSL (« Windows Subsystem for Linux ») fait tourner un vrai Linux **à l'intérieur** de Windows, sans machine virtuelle lourde ni redémarrage.

### Étape 1 — Vérifier sa version de Windows

Appuyez sur **`Touche Windows + R`**, tapez `winver`, validez. Il vous faut **Windows 10 version 2004** (build 19041) **ou plus récent**, ou **Windows 11**. Si besoin, faites vos mises à jour Windows d'abord.

### Étape 2 — Ouvrir PowerShell en administrateur

1. Cliquez sur le menu **Démarrer**.
2. Tapez `PowerShell`.
3. **Clic droit** sur « Windows PowerShell » → **« Exécuter en tant qu'administrateur »**.
4. Cliquez sur **Oui** dans la fenêtre de confirmation.

### Étape 3 — Installer WSL

Dans la fenêtre PowerShell (administrateur), tapez :

```powershell
wsl --install
```

Cette commande installe WSL 2 et un Linux par défaut (Ubuntu). **Redémarrez votre ordinateur** quand c'est demandé.

> **⚠️ Attention — si `wsl --install` échoue**
> - Activez la **virtualisation matérielle** dans le BIOS/UEFI (souvent appelée *Intel VT-x*, *AMD-V* ou *SVM*).
> - Activez les fonctionnalités Windows : *Panneau de configuration → Programmes → Activer ou désactiver des fonctionnalités Windows* → cochez **« Plateforme de machine virtuelle »** et **« Sous-système Windows pour Linux »**, redémarrez.
> - Mettez WSL à jour : `wsl --update`.

### Étape 4 — Installer Kali Linux

Toujours dans PowerShell :

```powershell
wsl --install -d kali-linux
```

(Alternative : ouvrez le **Microsoft Store**, cherchez **« Kali Linux »**, cliquez sur *Installer*.)

Au premier lancement, Kali vous demande de **créer un nom d'utilisateur et un mot de passe** Linux.

> **🔑 À retenir**
> **Notez soigneusement ce nom d'utilisateur et ce mot de passe** : ils vous serviront à chaque `sudo`. Ce mot de passe est indépendant de celui de Windows.

### Étape 5 — Première mise à jour

Dans le terminal Kali qui vient de s'ouvrir :

```bash
sudo apt update && sudo apt full-upgrade -y
```

> **✅ Ce que vous devez voir**
> Une longue liste de paquets qui se téléchargent et s'installent, puis le retour de l'invite `kali@...:~$` sans message d'erreur en rouge.

### Étape 6 — Installer les outils de pentest

```bash
sudo apt install -y nmap hydra
```

Vérifiez que ça répond :

```bash
nmap --version
hydra -h
```

Pour **Burp Suite** (l'outil d'interception), voir la note ci-dessous — il s'installe séparément et s'utilise soit via l'interface graphique de WSL (WSLg, sous Windows 11), soit en version Windows classique.

```bash
sudo apt install -y burpsuite
```

> **🔑 À retenir — adressage réseau en WSL**
> Pendant les TP, la cible d'entraînement **DVWA** sera lancée avec **Docker** et accessible sur **`127.0.0.1`** (c'est-à-dire « votre propre machine », aussi appelé *localhost*). C'est cette adresse que vous utiliserez partout où le TP écrit `<IP_CIBLE>`.

---

## VOIE 2 — Dual boot Kali + Windows

Le « dual boot » installe Kali **à côté** de Windows sur le disque : à chaque démarrage, vous choisissez l'un ou l'autre. C'est plus puissant, mais plus délicat.

> **⚠️ Attention — à lire absolument**
> - **Sauvegarde complète obligatoire** avant de commencer : une erreur de partitionnement peut effacer des données.
> - Désactivez **BitLocker** (chiffrement du disque) : *Panneau de configuration → Chiffrement de lecteur BitLocker → Désactiver*.
> - Désactivez le **démarrage rapide** de Windows (*Options d'alimentation → Choisir l'action des boutons → Modifier les paramètres actuellement non disponibles → décocher « Activer le démarrage rapide »*).
> - Repérez la **touche du menu de démarrage** de votre PC (souvent `F12`, `F9`, `Échap` ou `F2` selon la marque — Dell, HP, Lenovo, Asus…).

### Étape 1 — Télécharger l'image de Kali

Rendez-vous sur **kali.org/get-kali** → section **« Installer Images »** → téléchargez l'**ISO 64-bit** (fichier `.iso`, environ 4 Go).

### Étape 2 — Créer une clé USB bootable avec Rufus

1. Procurez-vous une **clé USB d'au moins 8 Go** (son contenu sera effacé).
2. Téléchargez **Rufus** sur **rufus.ie**, lancez-le.
3. Sélectionnez votre **clé USB** dans « Périphérique ».
4. Cliquez sur **« SÉLECTION »** et choisissez le fichier `.iso` de Kali.
5. Laissez les réglages par défaut, cliquez sur **« DÉMARRER »**, confirmez.

### Étape 3 — Libérer de l'espace disque pour Kali

1. Clic droit sur le menu **Démarrer** → **« Gestion des disques »**.
2. Clic droit sur votre partition Windows principale (souvent `C:`) → **« Réduire le volume »**.
3. Libérez environ **40 Go** (soit `40000` Mo). Cet espace « non alloué » accueillera Kali.

### Étape 4 — Démarrer sur la clé USB

1. Laissez la clé USB branchée, redémarrez le PC.
2. Au démarrage, appuyez plusieurs fois sur la **touche du menu de démarrage** (repérée plus haut).
3. Choisissez votre **clé USB** dans la liste.

> **🧯 Dépannage — la clé ne démarre pas**
> Entrez dans le BIOS/UEFI et désactivez **Secure Boot**, puis réessayez. Vérifiez aussi que la virtualisation est activée.

### Étape 5 — Installer Kali « à côté de Windows »

1. Dans le menu de Kali, choisissez **« Graphical install »**.
2. Suivez les écrans (langue, clavier, nom d'utilisateur, mot de passe — **notez-les**).
3. À l'étape du partitionnement, choisissez **« Assisté – utiliser le plus grand espace libre continu »** (*Guided – use the largest continuous free space*) : Kali s'installe dans les 40 Go libérés, **sans toucher à Windows**.
4. Laissez l'installateur mettre en place **GRUB** : c'est le petit menu qui, à chaque démarrage, vous laisse choisir **Kali** ou **Windows**.

### Étape 6 — Premier démarrage

Au redémarrage, le menu **GRUB** apparaît : choisissez **Kali GNU/Linux**. Connectez-vous avec les identifiants créés, ouvrez un terminal et faites la mise à jour :

```bash
sudo apt update && sudo apt full-upgrade -y
sudo apt install -y nmap hydra burpsuite
```

> **🔑 À retenir — adressage réseau en dual boot**
> Si la cible est **DVWA en Docker** (recommandé), son adresse est **`127.0.0.1`**. Si vous utilisez plutôt une **VM cible séparée** (Metasploitable 2), son adresse sera dans le réseau privé « host-only », du type **`192.168.56.x`**.

---

## Installer Docker (pour lancer la cible DVWA)

Docker permet de démarrer la cible d'entraînement **DVWA** en une seule commande, de façon isolée et sans danger.

### En WSL (Voie 1)

**Le plus simple : Docker Desktop pour Windows.**

1. Téléchargez **Docker Desktop** sur **docker.com/products/docker-desktop**, installez-le, redémarrez.
2. Ouvrez Docker Desktop → **Settings (⚙️) → Resources → WSL Integration** → activez l'intégration pour **kali-linux**.
3. Vos commandes `docker` fonctionnent alors directement dans le terminal Kali.

**Alternative en ligne de commande** (dans Kali, sans Docker Desktop) :

```bash
sudo apt install -y docker.io
sudo service docker start
```

### En dual boot (Voie 2)

```bash
sudo apt install -y docker.io
sudo systemctl enable --now docker
```

### Éviter de taper `sudo` à chaque fois (optionnel)

```bash
sudo usermod -aG docker $USER
```

Puis **fermez et rouvrez votre session** pour que ce soit pris en compte.

### Tester Docker

```bash
sudo docker run hello-world
```

> **✅ Ce que vous devez voir**
> Un message qui commence par *« Hello from Docker! This message shows that your installation appears to be working correctly. »*

### Lancer la cible DVWA

```bash
sudo docker run --rm -it -p 80:80 vulnerables/web-dvwa
```

Laissez cette fenêtre ouverte, puis dans un navigateur ouvrez **`http://127.0.0.1`**.

- Identifiants : **`admin`** / **`password`**.
- Cliquez sur **« Create / Reset Database »** si demandé.
- Allez dans l'onglet **DVWA Security** et réglez le niveau sur **Low**.

> **🧯 Dépannage — Docker**
> - **`port is already allocated` / port 80 occupé** : un autre logiciel utilise le port 80. Lancez plutôt sur le port 8080 : `sudo docker run --rm -it -p 8080:80 vulnerables/web-dvwa`, puis allez sur `http://127.0.0.1:8080`.
> - **`permission denied` sur `/var/run/docker.sock`** : ajoutez `sudo` devant la commande, ou appliquez l'astuce `usermod -aG docker` ci-dessus (et rouvrez la session).
> - **Docker Desktop ne démarre pas** : vérifiez que la **WSL Integration** est activée et que WSL est à jour (`wsl --update`).

---

## Installer Python & Jupyter (pour l'AB testing)

Pour la partie statistiques de l'après-midi. Deux options : sur Windows directement (le plus simple) ou dans Linux/WSL.

### Option A — Windows natif (le plus simple)

1. Téléchargez **Python 3.11 ou plus récent** sur **python.org/downloads**.
2. Lancez l'installateur et **cochez impérativement la case « Add Python to PATH »** en bas de la première fenêtre.
3. Cliquez sur *Install Now*.
4. Ouvrez une invite de commandes (`cmd`) et vérifiez :

```powershell
python --version
```

### Option B — Linux / WSL

```bash
sudo apt install -y python3 python3-pip python3-venv
```

### Créer un environnement isolé et installer les librairies

Un « environnement virtuel » range proprement les librairies du projet à part.

```bash
# Créer l'environnement
python -m venv venv_abtest

# L'activer — Windows :
venv_abtest\Scripts\activate
# L'activer — Linux / WSL :
source venv_abtest/bin/activate

# Installer les librairies nécessaires
pip install jupyterlab pandas numpy scipy statsmodels matplotlib seaborn
```

### Lancer Jupyter et vérifier

```bash
jupyter lab
```

Un onglet s'ouvre dans votre navigateur. Créez un notebook et exécutez :

```python
import pandas, scipy, statsmodels
print("OK")
```

Si vous voyez **`OK`**, tout est prêt.

> **💡 Astuce — solution sans aucune installation**
> Si Python vous pose problème, **Google Colab** (**colab.research.google.com**) fait tourner tout le code Python **dans votre navigateur**, sans rien installer. Les librairies `pandas`, `scipy` et `statsmodels` y sont déjà disponibles. C'est un excellent plan B pour la partie AB testing.

---

## Checklist finale avant le jour J

Cochez chaque case une fois vérifiée :

- [ ] Linux (WSL **ou** dual boot) démarre correctement.
- [ ] `sudo apt update` s'exécute sans erreur.
- [ ] `nmap --version` et `hydra -h` répondent.
- [ ] Docker fonctionne : `sudo docker run hello-world` affiche le message de bienvenue.
- [ ] DVWA est accessible sur `http://127.0.0.1` (ou `:8080`), connexion `admin` / `password`, niveau **Low**.
- [ ] Python est installé (`python --version`) et les librairies s'importent (`import pandas, scipy, statsmodels`).
- [ ] Jupyter Lab démarre (`jupyter lab`).

> **🔑 À retenir**
> Si toutes les cases sont cochées, vous êtes prêt·e. Si une seule résiste, ce n'est pas grave : notez le message d'erreur et voyez le plan B ci-dessous, on débloquera cela ensemble au début du bootcamp.

## Si rien ne marche (plan B)

L'installation peut échouer pour mille raisons (machine verrouillée par l'entreprise, BIOS bridé, wifi trop lent…). **Ce n'est pas bloquant :**

- Le formateur apporte des **machines virtuelles VirtualBox pré-configurées** sur clé USB : tout est déjà installé, il suffit de les importer.
- Pour le pentest sans rien installer : **TryHackMe** (tryhackme.com), avec des parcours guidés pour débuter, fonctionne entièrement dans le navigateur.
- Pour l'AB testing sans rien installer : **Google Colab** (colab.research.google.com).

Arrivez simplement avec votre ordinateur et votre chargeur : on trouvera toujours une solution.
