------------------------
INSTALACJA - EW lub LW
------------------------
PRZECZYTAJ WSZYSTKO, BY NIE POMINĄĆ WAŻNYCH UWAG.
(JEŚLI TYLKO AKTUALIZUJESZ DO NOWEJ WERSJI I WPROWADZAŁEŚ WŁASNE ZMIANY W DefaultMiniMods.ini, MOŻESZ POMINĄĆ KOPIOWANIE NOWEGO PLIKU .INI - JEDYNIE SPRAWDŹ NOWO DODANE WIERSZE)

1. Wypakuj .zip do jakiegoś folderu.
2. Wybierz właściwą wersję (EW lub LW) i skopiuj pliki z 3 folderów w środku do lokalizacji XEW\XComGame.

Dla przykładu w Windows wyglądałoby to tak:
Skopiuj pliki z wypakowanego folderu Config do: C:\Program Files (x86)\Steam\SteamApps\common\XCom-Enemy-Unknown\XEW\XComGame\Config
Skopiuj pliki z wypakowanego folderu CookedPCConsole do: C:\Program Files (x86)\Steam\SteamApps\common\XCom-Enemy-Unknown\XEW\XComGame\CookedPCConsole
Skopiuj pliki z wypakowanego folderu Localization do: C:\Program Files (x86)\Steam\SteamApps\common\XCom-Enemy-Unknown\XEW\XComGame\Localization

Domyślne ścieżki do XEW\XComGame podaję poniżej (dostosuj je odpowiednio do swojej instalacji):
Windows: C:\Program Files (x86)\Steam\SteamApps\common\XCom-Enemy-Unknown\XEW\XComGame
Linux: ﻿/home/YOURUSERNAME/.steam/steam/steamapps/common/XCom-Enemy-Unknown/xew/xcomgame
MAC: ~/Library/Application Support/Steam/steamapps/common/XCom-Enemy-Unknown/XCOMData/XEW/XComGame

WAŻNE: UŻYTKOWNICY LINUX LUB MAC POWINNI ZMIENIĆ NAZWY PLIKÓW NA PISANE MAŁYMI LITERAMI
WAŻNE: JEŚLI MASZ JUŻ PLIK DefaultMutatorLoader.ini NIE NADPISUJ GO - zamiast tego czytaj krok 3 poniżej.

3a. Otwórz DefaultMutatorLoader.ini i dodaj linię:
arrStrategicMutators="MiniModsCollection.MiniModsStrategy"
arrTacticalMutators="MiniModsCollection.MiniModsTactical"

3b. Otwórz plik DefaultGame.ini (ten z katalogu C:\Program Files (x86)\Steam\SteamApps\common\XCom-Enemy-Unknown\XEW\XComGame\Config). 
Dodaj 2 linijki jak niżej na samym początku pliku zaraz pod "BasedOn=..." 

[XComGame.XComGameInfo]
+ModNames="XComModShell.UIModManager"

Grasz w Long War? To wszystko!

WAŻNE: Jeśli używasz mod-a Line of Sight Indicators, zainstaluj dołączony SightlingesCompatilityFix.txt za każdym razem, gdy go przeinstalowujesz - inaczej część taktycznych MiniMods przestanie działać (użyj PatcherGUI, z narzędzi UPK Utils - do znalezienia na nexusmods)

------------------------
Tylko dla graczy wersji EW
------------------------
Wykonaj kroki 1-3 powyżej (upewnij się, że kopiujesz pliki wersji EW) plus:

4. Przejdź do XEW\XComGame\Config i znajdź plik DefaultGame.ini. 

5. Otwórz go w Notepad czy innym edytorze tekstu. Dodaj dodatkową linijkę w sekcji [XComGame.XComGameInfo] 
[XComGame.XComGameInfo]
+ModNames="XComMutator.BaseMutatorLoader"
+ModNames="XComModShell.UIModManager"

6. Użyj PatcherGUI (do pobrania tutaj https://www.nexusmods.com/xcom/mods/448) i za jego pomocą zainstaluj XComMutatorEnabler.txt
Skrócona wersja obsługi PatcherGUI, jeśli nigdy go nie używałeś:
1. Gdy uruchomisz PatcherGUI znajdziesz 2 przyciski "Browse" po prawej.
2. Kliknij "Browse" obok górnego okienka/pola i wskaż scieżkę do katalogu XCom-Enemy-Unknown\XEW. Domyślnie: C:\Program Files (x86)\Steam\SteamApps\common\XCom-Enemy-Unknown\XEW
3. Kliknij "Browse" obok następnego okienka (drugie od góry) wskaż plik .txt, który chcesz wgrać, czyli XComMutatorEnabler.txt
4. Kliknij "Apply"

WAŻNE: Jeśli używasz mod-a Line of Sight Indicators, zainstaluj SightlingesCompatilityFix.txt (użyj PatcherGUI, z narzędzi UPK Utils - do znalezienia na nexusmods)

Gotowe. Gratulacje!  

------------------------
ZNANE PROBLEMY
------------------------
1. Niektórzy gracze zgłaszali wyrzucenie do pulpitu przy ładowaniu zapisu z misji taktycznej (lub restarcie misji), używając MiniModsTactical
Rozwiązanie: Znajdź plik XComMutator.u w pakiecie dla wersji EW (w katalogu EW version\CookedPCConsole\Mutators). Skopiuj go, nadpisując oryginalny XComMutator.u dostarczony z Long War (domyślnie masz go w katalogu CookedPCConsole gry) 
2. Przy uruchomieniu gry możesz zobaczyć wiadomość: "Ambiguous package name: Using 'C:\Program Files(x86)\Steam\....\CookedPCConsole\MiniModsCollection.u', not 'C:\Program Files
(x86)\....\CookedPCConsole\Mutators\MiniModsCollection.u". Przeczytaj uważnie wiadomość, zwracając uwagę na podane ścieżki. Wiadomość mówi, że gra znalazła 2 pliki MiniModsCollection.u: jeden w folderze CookedPCConsole a drugi w jego podfolderze: \Mutators. Jeden z tych plików musisz skasować - najpewniej ten w CookedPCConsole. Mój pakiet wgrywa plik do podkatalogu \Mutators, więc to jest zapewne ten najnowszy. Drugi (ten w CookedPCConsole) pochodzi zapewne z pakietu LW Rebalance lub innego, który pożyczył/zintegrował MiniMods. Nie znam bowiem innej przyczyny, dla której plik ten mógł się znaleźć w CookedPCConsole.
3. Jeśli grasz w wersję EW i mimo wykonania wszystkich kroków nadal nie widzisz śladu działania MiniMods, spróbuje tego:
- znajdź katalog \Config (domyśllna ścieżka: C:\Program Files (x86)\Steam\SteamApps\common\XCom-Enemy-Unknown\XEW\XComGame\Config)
- otwórz plik DefaultEngine.ini
- znajdź tę linię: 
GameEngine=XComGame.XComEngine
- wykomentuj ją wstawiając ";" na początku (to lepsze niż kasowanie - w ten sposób zachowujesz kopię)
;GameEngine=XComGame.XComEngine
- zaraz poniżej ddodaj tę linię:
GameEngine=MiniModsCollection.MMXComEngine
- uruchom grę, wczytaj save i sprawdź czy działa.

-------------
PODZIĘKOWANIA
-------------
kdm2k6 - za testy z gamepadem
AzXeus - za wprowadzenie mnie w kodowanie z UDK
Ucross, fjz - za pomysły i dziewicze testy :)
datar0 - za zgłoszenia błędów i testy
Snackhound - za ogarnięcie map do pliku .ini
loriendal - za lokalizację na rosyjski, testy i raportowanie błędów
PawelS - za testy i raportowanie błędów