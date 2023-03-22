******************************
WAŻNA INFORMACJA
******************************
Należy mieć na uwadze, że ten menadżer nie skanuje Twojego dysku w poszukiwaniu plików z modami, ani nie jest to rodzaj "Steam Workshop" zdolny do instalowania/odinstalowywania mod-ów. Menadżer działa tylko wewnątrz gry, współpracuje tylko z modami opartymi na mutatorach i tylko z tym, co zostało ręcznie zainstalowane przez gracza poza grą. Zadaniem autora danego mod-a jest udostępnienie jego opcji w menadżerze, zatem zobaczysz na listach dany mod i jego opcje TYLKO pod warunkiem, że autor umieścił stosowny kod "eksponujący" opcje. Z pakietem Mini Mods Collection zyskujesz na starcie 20+ mod-ów konfigurowalnych w grze.

******************************
INFORMACJA DLA MODDER'ÓW
******************************
Wszystko, co może Cię interesować zostało wyjaśnione w Przewodniku ("Guide for Modders"). Jeśli jakimś cudem potrzebujesz polskiej jego wersji napisz do mnie (szmind@gmail.com lub Discord szmind#7068). Znajdziesz tam informacje o tym jak: dodać mod do listy, dodać opcje dla mod-a, wybrać rodzaj widget'u (pole wyboru, pole kombo, suwak itp.). Większość tych rzeczy załatwia jedna linijka kodu. Musisz być obeznany z korzystaniem z UDK do kompilowania nowego kodu dla XCom w formie mutatora. Omawianie jak tworzyć mutatory wykracza poza zakres Przewodnika. Przykłady są najlepsze, zatem znajdziesz w dokumentacji kilka przykładów gotowego kodu "eksponującego".

******************************
INSTALACJA - INSTRUKCJE
******************************
PRZECZYTAJ W CAŁOŚCI ZANIM ZACZENIESZ DZIAŁAĆ :)

Rozpakuj pliki do jakiegoś folderu. Skopiuj plik z folderu \Install_files do odpowiednich folderów gry:

- pliki z \Install_files\CookedPCConsole powinny trafić do ...\XEW\XComGame\CookedPCConsole\  (albo nawet lepiej do podkatalogu np. ...CookedPCConsole\Mods)
- pliki z \Install_files\Config powinny trafić do ...\XEW\XComGame\Config
- pliki z \Install_files\Localization  powinny trafić ...\XEW\XComGame\Localization\INT

---------------
DefaultGame.ini
---------------
Postaraj się, aby początek pliku DefaultGame.ini wyglądał tak:

[Configuration]
BasedOn=..\Engine\Config\BaseGame.ini

[XComGame.XComGameInfo]
+ModNames=XComModShell.UIModManager

Dołączony plik _DefaultGame.ini służy dla podglądu, jak to winno wyglądać, jeśli potrzebujesz (podkreślnik w nazwie jest celowy - żeby przypadkiem nie nadpisać oryginalnego pliku używanego przez grę).
*************************************
Tylko użytkownicy XCom EW (bez Long War) 
*************************************
Musisz włączyć działanie mutatorów w grze. Zainstaluj mod Line of Sight Indicators albo pakiet MiniMods w wersji dla Enemy Within i postępuj zgodnie z ich instrukcjami w zakresie umożliwienia działania mutatorów.

---------------
XComMutator.u
---------------
Dołączony plik powinien zastąpić oryginalną jego wersję z pakietu Long War. Musiz zwyczajnie nadpisać plik dostarczony z pakietem Long War. Nie musisz tego robić, jeśli już używasz ulepszonej wersji, dostarczanej z pakietem MiniMods.