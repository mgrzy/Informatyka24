#################
### Zajęcia 2 ###
#################

#################
# Wycieczka po R studio
# - Console
# - Environment
# - History
# - Help 

################
# Interaktywna praca w konsoli 
2 + 2
(27 + 12 - 4) * 7

################
# Operatory arytmetyczne 
1 + 1 # dowalanie 
2 - 3 # odejmowanie 
5 * 5 # mnożenie 
10 / 2 # dzielenie 
4^4 # potęgowanie 
9 %% 2 # reszta z dzielenia  
9 %% 3 # reszta z dzielenia  
9 %/% 4 # dzielenie z zaokrągleniem do liczby całkowitej 
0.5*3

# Zadanie 1
# Aby zaliczyć zajęcia z informatyki należy uzyskać minimum 60% punktów. 
# Maksymalnie można zdobyć 90 punktów. Ile punktów musisz uzyskać aby zaliczyć ten przedmiot? 
# Z kolejnych bloków można uzyskać 30, 40 i 20 punktów, ile punktów trzeba by uzyskać gdyby był 
# wymóg zaliczenia każdego bloku z osobna.


###############
# Zmienne
# Zmienna to symboliczna reprezentacja przechowywanych danych, 
# które mogą być odczytywane, modyfikowane i manipulowane w trakcie działania programu.
# Musi zaczynać się literą. 

# Przypisanie wartości do zmiennych 
Pierwsza.zmienna <- 123
Drua.zmienna = 456

# Działania na zmiennych
Pierwsza.zmienna * Drua.zmienna
Wynik <- Pierwsza.zmienna * Drua.zmienna

# Typy zmiennych
liczba <- 111 # liczbowe
tekst <- "111" # tekstowe 
tekst.2 <- "abc"

liczba * tekst # nie działa 

# Zadanie 2
# Utwórz zmienną tekstową zawierająca Twoje imię i nazwisko, utwórz zmienne liczbowe 
# zawierające liczbę punktów możliwych do uzyskania w kolejnych blokach oraz na całych zajęciach i 
# wykonaj obliczenia z zadania 1 na zmiennych. Wyniki zapisz w zmiennych, 
# których nazwy zaczynają się od “wynik-”.

#####################
# Zmienna logiczne 
# Mogą przyjmować jedną z dwóch wartości: prawda (TRUE) albo fałsz (FALSE)
TRUE
FALSE

# && - AND
#'|| - OR
#! - NOT

# Operacje na wartościach logicznych 
prawda <-  TRUE
tezprawda <-  TRUE
nieprawda <-  FALSE
toteznie <-  FALSE

prawda && nieprawda
prawda && tezprawda
prawda || nieprawda
!prawda

#Operatory porównania 
Pierwsza.zmienna == Drua.zmienna # Równe 
Pierwsza.zmienna != Drua.zmienna # Nierówne
Pierwsza.zmienna < Drua.zmienna # Większe
Pierwsza.zmienna > Drua.zmienna # Mniejsze
Pierwsza.zmienna >= Drua.zmienna # Mniejsze lub równe
Pierwsza.zmienna <= Drua.zmienna # Większe lub równe 

# Zadanie 3
# Używając operatorów porównania sprawdź czy suma wyliczonych punktów 
# niezbędnych do zaliczenia każdego bloku
# jest równa liczbie punktów niezbędnych do zaliczenia całego przedmiotu.

# Funkcje 
#Wywołanie funkcji przez podanie jej nazwy i ewentualnie w nawiasie argumentów
sum()
sum(1,2,3,4)
sum(Pierwsza.zmienna, Drua.zmienna)

# Funkcje sprawdzające
typeof("10")
is.numeric(Pierwsza.zmienna)
is.character(Pierwsza.zmienna)

# Funkcje zmieniające typ danych 
tekst
as.numeric(tekst)
Pierwsza.zmienna
as.character(Pierwsza.zmienna)

# Wektory 
# Wektor to jest tablica zawierająca dowolną liczbę takich samych elementów. 
Moje.liczby <- c(10, 12, 43, 25, 87) # tworzymy przy użyciu funkcji c()

# Zadanie 4 
# Utwórz wektor zawierający liczbę punktów możliwych do uzyskania podczas całego przedmiotu 
# oraz liczby punktów do uzyskania w każdym z bloków. 

# Wyświetlenie wektora 
Moje.liczby

# Wyświetlenie elementu wektora 
Moje.liczby[2]

# Operator zakresu ":"
1:20

# Wyświetlenie elementu wektora 
Moje.liczby[2:3]

#Wyświetlenie wektora z pominięciem elementów
Moje.liczby[-1]
Moje.liczby[-1:-3]

# Funkcje zwracające informacje o wektorach 
length(Moje.liczby) # długość wektora
min(Moje.liczby) # Najmniejsza wartość
max(Moje.liczby) # Największa wartość
range(Moje.liczby) # zakres 

# Działania arytmetyczne na wektorach 
Moje.liczby + 5
Moje.liczby + c(5,5,5,5,5) # to samo co powyżej

Moje.liczby
Moje.liczby + c(1,2)
Moje.liczby + c(1, 2, 1, 2, 1)

# Użycie wektorów w obliczeniach 
Moje.liczby
Moje.liczby[1] + Moje.liczby[2]
Moje.liczby[1] <- Moje.liczby[1] * 2 # Zmiana wartości elementu wektora 
Moje.liczby

# Zadanie 5
# Przeprowadź obliczenia z zadania 1 używając wektorów


# Funkcje modyfikujące wektory 
rev(Moje.liczby) # Wektor w odwróconej kolejności 
sort(Moje.liczby) # sortowanie, dane od najmniejszej do największej 
sort(Moje.liczby, decreasing = T) # odwrotnie 
order(Moje.liczby)# pozycje elementów wektora począwszy od wartości najmniejszej do największej
diff(Moje.liczby) # różnice między kolejnymi elementami wektora 

# Funkcje statystyczne 
sum(Moje.liczby)
mean(Moje.liczby)
sd(Moje.liczby)

# Zadanie 6
# Użyj funkcji sum(), mean(), sd() do wykonania obliczeń na wektorze z zadania 4


# Wektory tekstowe 
Znaki.tekstowe <- c(6, "y", "h", "n", 5, "t", "g", "b")

# Elementy wektora mogą mieć swoje nazwy 
pudelka <- c(dlugosc = 20, szerokosc = 15, wysokosc = 12, liczba_szt = 3)
pudelka

objetosc <- pudelka["dlugosc"] * pudelka["szerokosc"] * pudelka["wysokosc"]
objetosc

Moje.liczby2 = c(1, 12, 23, 34, 45)
Moje.liczby
names(Moje.liczby2) = c("pierwsza", "druga", "trzecia", "czwarta", "piąta")
Moje.liczby2
names(Moje.liczby2) <- NULL
Moje.liczby

# Zadanie 7
# Dodaj etykiety do wektora z zadania 4 używając funkcji names()


### Sprawdzenie czy dany element jest w wektorze 
12 %in% Moje.liczby2
c(2, 12) %in% Moje.liczby2