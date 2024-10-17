#################
### Zajęcia 2 ###
#################

### Pominięte tematy 

# Tworzenie zmiennych z funkcją assign
assign("zmienna", 123)

# Usuwanie rmiennych 
rm()
rm("zmienna")

# lista zmiennych 
a <- 1
ls()
rm(a)
##################

### Przypomnienie 
# “numeric” - zmiennoprzecinkowa podwójnej precyzji
# “integer” - liczba całkowita
# “character” - znakowa
# “logical” - TRUE/FALSE

typeof(10)
class(10)
as.integer(10.9)

# Tworzenie wektorów


# Tworzenie wektorów za pomocą operatora zakresu 


# Działanie na wektorach 


# Działanie na wektorach o różnej długości 


# Odwołanie do elementu wektora 


# Stworznie wektora ze znakami 


# Łącznie wektorów 


# Dodawanie i usuwanie elementów wektora 


### Zadanie 1 ###
# Zadanie o wektorach (Maja)
# 1. Stwórz wektor składający się z następujących wartości: 23,54,77,100,13.5,8,3,1,66.2,78,22,44.
# 2. Pomnóż kolejne jego elementy przez kolejne liczby całkowite od -3 do 8, wyniki zapisz w nowym wektorze.
# 3. Sprawdź który z wektorów ma wyższą wartość średnią.
# 4. Stwórz trzeci wektor składający się z następujących pięciu elementów: 
#    pierwszego, trzeciego i siódmego elementu drugiego wektora, wartości minimalnej drugiego wektora 
#    oraz odchylenia standardowego drugiego wektora podzielonego przez 5.
# 5. Oblicz sumę wszystkich elementów trzeciego wektora
# 6. Sprawdź które z elementów trzeciego wektora mają wartości ujemne. Zsumuj te elementy.

#################

# Listy 
l1 <- list(4, 4.5, "siedem", c(1, 2, 3))
l1

# Dostęp do elemntu listy z zachowaniem struktury 
l1[4]
class(l1[4])

# Bez zachowania struktury 
l1[[4]]
class(l1[[4]])

# Ramki danych (data frame)
# Ramka danych składa się z kolumn i wierszy - podobnie jak arkusz excela. 
# Z punktu widzenia statystyki, kolumny to zmienne, a wiersze to obserwacje.
# Wszystkie kolumny mają tą samą długość i każda z nich zawiera dane tego samego typu - czyli każda kolumna jest wektorem.

# Ramiki danych są szczególnym przypadkiem list:
# 1. Nazwy kolumn nie mogą być takie same 
# 2. Wszystkie elementy muszą być wektorami 
# 3. Wszystkie elementy muszą mieć taka samą długość

# Utworzenie ramki danych z wektorów 
c1 <- c(4, 7, 2, 6, 8, 3)
c2 <- c(2.3, 1.7, 2.1, 2.4, 1.9, 2.7)
c3 <- c("zielony", "czerwony", "niebieski", "fioletowy", "żółty", "pomarańczowy")
dane <- data.frame(c1, c2, c3)

# Z przypisaniem nazw kolumn  
dane <- data.frame(Dlugosc=c1, Szerokosc=c2, Kolor=c3)

# Wyświetlenie nazw kolumn 
names(dane)

# Przypisanie albo zmiana nazwy kolumn 
names(dane) <- c("dlugosc", "szerokosc", "kolor")
names(dane)

# Wyświetlanie nazw wierszy
rownames(dane)

# Zmiana nazw wierszy

rownames(dane) <- c("r1", "r2", "r3", "r4", "r5", "r6")
rownames(dane)

dane

### Infomracje o ramkach danych 

# Liczba kolumn 
ncol(dane)

# Liczba wierszy 
nrow(dane)

# Wymairy 
dim(dane)

class(dim(dane))

# Odwołania do elementów

# Wiersze
dane[2,]

# Kolumny 
dane[,2]

# Wybrana komórka 
dane[1,2]

# Można użyć wektorów w adresie, aby wybrać konkretnie wiersze/kolumny
dane[c(1,3,5),c(1,3)]

# Zakres kolumn
dane[,2:3]

# Zakres wierszy
dane[1:2,]

# Zamiast indeksów wierszy i kolumn możemy podać nazwy jeśli istnieją.
dane["r2", "szerokosc"]

dane[c("r2", "r4", "r6"), "szerokosc"]

# Zależnie od sposobu dostępu możemy uzyskać te same dane w różnej formie np. raz jak jednokolumnową ramkę danych lub wektor.

# Wektor
dane[,"kolor"]

# Jedno kolumnowa ramka danych
dane["kolor"]

# Wektor 
dane[["kolor"]]

# Wektor 
dane$kolor

# 
dane[,"kolor", drop=F]

# Sortowanie 
dane
order(dane$szerokość)

# Filtorwanie 
dane$szerokosc>2
dane[dane$szerokosc>2, ]

# Wczytywanie danych do R

getwd() # 
#setwd()
