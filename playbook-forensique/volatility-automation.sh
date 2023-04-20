import os

# Fonction pour afficher le menu
def display_menu():
    print("SOC_DE_KVS:")
    print("1. Liste des processus")
    print("2. Informations sur le processus")
    print("3. Dump de la mémoire d'un processus")
    print("4. Analyse de la mémoire avec Volatility")
    print("5. Quitter")


# Fonction pour exécuter la commande 'pslist' de Volatility
def list_processes():
    os.system("volatility pslist")

# Fonction pour exécuter la commande 'pstree' de Volatility
def process_info():
    pid = input("Entrez le PID du processus : ")
    os.system(f"volatility pstree -p {pid}")

# Fonction pour exécuter la commande 'procdump' de Volatility
def dump_process_memory():
    pid = input("Entrez le PID du processus : ")
    filename = input("Entrez le nom du fichier de dump : ")
    os.system(f"volatility procdump -p {pid} -D {filename}")

# Fonction pour exécuter la commande 'imageinfo' et 'pslist' de Volatility
def analyze_memory():
    filename = input("Entrez le nom du fichier de dump : ")
    os.system(f"volatility imageinfo -f {filename}")
    os.system(f"volatility pslist -f {filename}")

# Boucle principale pour afficher le menu et exécuter les commandes
while True:
    display_menu()
    choice = input("Entrez votre choix : ")

    if choice == "1":
        list_processes()
    elif choice == "2":
        process_info()
    elif choice == "3":
        dump_process_memory()
    elif choice == "4":
        analyze_memory()
    elif choice == "5":
        break
    else:
        print("Choix invalide. Veuillez réessayer.")
