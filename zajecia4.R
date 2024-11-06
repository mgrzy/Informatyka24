# Kod do wygenerowania ramki danych podiadającej zmienną dyskretną o 7 poziomach
# i 70 przypadków generowanych lososowo i losowo przypisywanych do zmiennej dyskretnej

data = data.frame(
  "cells" = sample(c("MCF-7", "A549", "CHO", "PC12", "HepG2", "293T", "NIH/3T3"), 70, replace=TRUE),
  "measure" = round(runif(70, min = 10, max = 30), 1)
)

# Dwa sposoby prowadzenia obliczeń ze zmiennymi pośrednimi i poprzez zagnieżdżanie funkcji

# Zmienne pośrednie

cases <- length(data[data$cells == "MCF-7", ]$measure)
mean <- mean(data[data$cells == "MCF-7", ]$measure)
sd <- sd(data[data$cells == "MCF-7", ]$measure)

cell1.result <- data.frame(cases, mean, sd)

# Zapis tożsamy wykorzystujący zagnieżdżanie funkcji
#
# Korzystniejszy przy złożonych obliczeniach bo nie tworzymy dodatkowych
# zmiennych w środowisku - mniejszy bałagan w environment

cell1.result <- data.frame(
  'cases' = length(data[data$cells == "MCF-7", ]$measure),
  'mean' = mean(data[data$cells == "MCF-7", ]$measure),
  'sd' = sd(data[data$cells == "MCF-7", ]$measure)
)

# Teraz wystarczy powtórzyć to dla wszystkich typów komórek i utworzyć wynikową ramkę danych
# Ale można sobie to uprościć

# Pętla for

for (x in 1:10) {
  print(x)
}

# Możemy to wykorzystać do powtórzenia obliczeń dla wszystkich typów komórek

for (v in c("MCF-7", "A549", "CHO", "PC12", "HepG2", "293T", "NIH/3T3")) {
  print(length(data[data$cells == v, ]$measure))
}

# Zamiast wymieniać typy komórek, możemy je "wyciągnąć" funkcją unique()

for (v in unique(data$cells)) {
  print(length(data[data$cells == v, ]$measure))
}

# Zbierając to razem

for (v in unique(data$cells)) {
  result <- data.frame(
    'cases' = length(data[data$cells == v, ]$measure),
    'mean' = mean(data[data$cells == v, ]$measure),
    'sd' = sd(data[data$cells == v, ]$measure)
  )
  print(result)

}

# Pojawia się problem taki, że przy pierwszym wykonaniu pętli powinna zostać
# utworzona ramka danych a w kolejnych do istniejącej ramki dodawane są wiersze.
# Można to rozwiązać na kilka sposobów, tutaj skorzystamy z takiego, który pozwoli
# poznać instrukcję warunkową if

# Instrukcja warunkowa if

dzielnik <- 7
dzielna <- 5

if (dzielnik != 0) {
  dzielna / dzielnik
}

# If else

dzielnik <- 0
dzielna <- 5

if (dzielnik != 0) {
  dzielna / dzielnik
} else {
  print("Nie dzielę przez 0")
}

# Rozwiązanie problemu z tworzeniem ramki danych

# Tworzymu zmienną na wynik i przypisujemy jej wartość pustą
result <- NULL

for (v in unique(data$cells)) {
  #sprawdzamy czy już coś dopisaliśmy jako wynik
  if (is.null(result)) {
    newrow <- data.frame(
      "cases" = length(data[data$cells == v, ]$measure),
      "mean" = mean(data[data$cells == v, ]$measure),
      "sd" = sd(data[data$cells == v, ]$measure)
    )
    # przypisujemy nazwę do nowo utworzonego wiersza
    rownames(newrow) <- v
    # zapisujemy nowy wiersz w wynikowej ramce danych
    result <- newrow
  } else {
    newrow <- data.frame(
      "cases" = length(data[data$cells == v, ]$measure),
      "mean" =  mean(data[data$cells == v, ]$measure),
      "sd" = sd(data[data$cells == v, ]$measure)
    )
    # przypisujemy nazwę do nowo utworzonego wiersza
    rownames(newrow) <- v
    # dopisujemy nowy wiersz do istniejącej ramki danych
    result <- rbind(result, newrow)
  }
}

# Wynik
print(result)

# W obu przpadkach instrukcji if elese wykonujemy ten sam kod,
# różnica jest w tym co z nim robimy.
#
# Powtarzalne fragmenty kodu warto zapisać w postaci funkcji.
# Funkcja to struktura, którą możemy wielokrotnie wykorzystywać.

mojafunkcja <- function() {
  print("to jest moja funkcja")
}

mojafunkcja()
mojafunkcja()
mojafunkcja()

# do funkcji można przekazywać argumenty

dodajadob <- function(a, b) {
  print(a+b)
}

dodajadob(2, 56)
dodajadob(7, 15)
dodajadob(24, 12)

# Zwracanie wyniku (aby przypisać go do zmiennej, lub użyć w obliczeniach)
# zamiast wyświetlania

dodajadob <- function(a, b) {
  return(a+b)
}

wynik <- dodajadob(2, 56)
print(wynik)
wynik <- dodajadob(7, 15)
print(wynik)

# Powtarzalną częśc kodu możemy umieścić w funkcji, która przymie jako
# argument używaną zmienną grupującą (czyli to co w petli for przechowuje zmienna v),
# a zwróci wiersz ramki danych z obliczonymi statystykami

calculatestats <- function(cellname) {
  newrow <- data.frame(
    "cases" = length(data[data$cells == cellname, ]$measure),
    "mean" = mean(data[data$cells == cellname, ]$measure),
    "sd" = sd(data[data$cells == cellname, ]$measure)
  )
  # przypisujemy nazwę do nowo utworzonego wiersza
  rownames(newrow) <- cellname
  # funkcja zwraca wiersz z wyliczonymi statystykami
  return(newrow)
}

# uproszczona pętla for wykorzystująca funkcję calculatestats()
result <- NULL
for (v in unique(data$cells)) {
  if (is.null(result)) {
    result <- calculatestats(v)
  } else {
    result <- rbind(result, calculatestats(v))
  }
}

print(result)

# Teraz jeśli chcemy coś zmodywfikowac w obliczeniach, np. dodać nową statystykę
# lub użyć funkcji round() żeby ograniczyć liczbę znaków po separatorze dziesiętnym
# zmiany dokonujemy tylko w jednym miesjcu - w funkcji

calculatestats <- function(cellname) {
  newrow <- data.frame(
    "cases" = length(data[data$cells == cellname, ]$measure),
    "mean" = round(mean(data[data$cells == cellname, ]$measure), 1),
    "sd" = round(sd(data[data$cells == cellname, ]$measure), 2)
  )
  rownames(newrow) <- cellname
  return(newrow)
}

result <- NULL
for (v in unique(data$cells)) {
  if (is.null(result)) {
    result <- calculatestats(v)
  } else {
    result <- rbind(result, calculatestats(v))
  }
}

print(result)

# Powyższy fragment kodu bedzie działał równieź jeśli liczbe typów komórek
# zwiększymy np. do 48, a liczbe przypadków do 17000
