if (!require('ggplot2')) install.packages('ggplot2'); library('ggplot2')
if (!require('SmarterPoland')) install.packages('SmarterPoland'); library('SmarterPoland')

####Dane z pakietu SmarterPoland

#Countries z informacjami nt. współczynników narodzin i zgonów i populacją

data("countries")

#chcemy przedstawić rozkład współczynnika narodzin w obrębie krajów leżących na różnych kontynentach
#pytanie do państwa: z jakimi typami zmiennych mamy do czynienia?
#https://rstudio.github.io/cheatsheets/data-visualization.pdf

#pozbywamy się braków danych, żeby nam nie przeszadzały (przy pracy z własnymi danymi należy się zastanowić co zrobić z brakami danych)

countries<-na.omit(countries)

#wykres punktowy

ggplot(countries, aes(x=continent, y=birth.rate))+
  geom_point()

#może chcemy rozróżnić kontynenty kolorami
ggplot(countries, aes(x=continent, y=birth.rate))+
  geom_point(aes(color=continent))

#a może kształtami?

ggplot(countries, aes(x=continent, y=birth.rate))+
  geom_point(aes(shape=continent))

#a może obydwoma naraz?

ggplot(countries, aes(x=continent, y=birth.rate))+
  geom_point(aes(color= continent,shape=continent))

#może kropki wydają nam się za małe?
ggplot(countries, aes(x=continent, y=birth.rate))+
  geom_point(aes(color=continent), size = 5)

#trochę za duże, a poza tym, możemy spróbować coś ich wielkością wyrazić - np. populację

ggplot(countries, aes(x=continent, y=birth.rate))+
  geom_point(aes(color=continent, size=population))

#kropki za bardzo się zlewają, może porozsuwajmy je na boki

ggplot(countries, aes(x=continent, y=birth.rate))+
  geom_point(aes(color=continent, size=population), position = "jitter")

#może trochę za bardzo?

ggplot(countries, aes(x=continent, y=birth.rate))+
  geom_jitter(aes(color=continent, size=population), width = 0.2)


### TERAZ PAŃSTWO SAMI PRÓBUJĄ NA JAJOBAZIE ZROBIĆ ŁADNE WYKRESY PUNKTOWE

#kilka przykładów:

ggplot(tabelka_jaja, aes(x=GATUNEK, y=CIEZAR_ZNIE))+
  geom_point()

ggplot(subset(tabelka_jaja, SREDNICA > 15), aes(x=GATUNEK, y=LJAJ.k.))+
  geom_jitter(aes(color=LOSJAJA, shape=KOLONIA), alpha=0.7, width=0.3)+
  theme_bw()

#wracamy do danych "Countries"
#wykresy punktowe nie są idealne
#Pytanie do studentów: czego np. za ich pomocą nie przedstawiamy a moglibyśmy?


ggplot(countries, aes(x=continent, y=birth.rate))+
  geom_bar()

#co pokazuje boxplot, czego nie pokazywały kropki?
#znów bawimy się upięknianiem boxplotu

ggplot(countries, aes(x=continent, y=birth.rate))+
  geom_boxplot(aes(lower=quantile(birth.rate,0.25),
                   middle=median(birth.rate),
                   upper=quantile(birth.rate,0.75),
                   ymax=max(birth.rate)))

#w ggplot2 mamy możliwość zmiany zakresu wykresów pudełkowych, domyślne to: mediana i 1. i 3. kwartyl, więc można powyższy wykres otrzymać również prościej:

ggplot(countries, aes(x=continent, y=birth.rate))+
  geom_boxplot()

#jeśli nie chcemy pokazywać wąsów (sięgających domyślnie do półtora rozstęp między pierwszym i trzecim kwartylami):
#coef to argument opisujący długość wąsów

ggplot(countries, aes(x=continent, y=birth.rate))+
  geom_boxplot(coef=0)

#odsyłam do cheat sheet i robimy na jajobazie boxploty, zapraszam do zabawy z kolorami itp.

ggplot(tabelka_jaja, aes(x=GATUNEK, y=CIEZAR_ZNIE))+
  geom_boxplot(notch = TRUE, aes(fill = GATUNEK), alpha=0.2)+
  theme_bw()

#inne wykresy

ggplot(countries, aes(x=continent, y=birth.rate))+
  geom_violin(aes(fill=continent), color="white")


#za pomocą "+" możemy do wykresu dodawać kolejne elementy, złóżmy więc dotychczasowe wykresy

ggplot(countries, aes(x=continent, y=birth.rate))+
  geom_boxplot()+
  geom_jitter(aes(color=continent, size=population), width = 0.2)+
  geom_violin(aes(fill=continent), color="white")+
  theme_bw()

#nie wygląda to najlepiej, najważniejsze to popracować nad przezroczystością i kolejnością elementów

ggplot(countries, aes(x=continent, y=birth.rate))+
  geom_violin(aes(fill=continent), color="white", alpha=0.2)+
  geom_boxplot(coef=0, outliers = FALSE, alpha=0.1)+
  geom_jitter(aes(color=continent, size=population), width = 0.2)+
  theme_bw()

#możemy też dodać tytuł wykresu, opisy osi, zmienić pozycję legendy...

ggplot(countries, aes(x=continent, y=birth.rate))+
  geom_violin(aes(fill=continent), color="white", alpha=0.2)+
  geom_boxplot(coef=0, outliers = FALSE, alpha=0.1)+
  geom_jitter(aes(color=continent, size=population), width = 0.2)+
  theme_bw()+
  xlab("")+
  ylab("Birth rate")


#wykres możemy również zapisać w środowisku i nie przepisywać całości, jeśli chcemy dodać jakieś elementy do wykresu:

a<-ggplot(countries, aes(x=continent, y=birth.rate))+
  geom_violin(aes(fill=continent), color="white", alpha=0.2)+
  geom_boxplot(coef=0, outliers = FALSE, alpha=0.1)+
  geom_jitter(aes(color=continent, size=population), width = 0.2)+
  theme_bw()+
  xlab("")+
  ylab("Birth rate")

a

a<-a+ggtitle("Birth rates across the countries")

a<-a+theme(plot.title = element_text(color="gray50", size=20, hjust=0.5, face="bold"),
        axis.text = element_text(size=15),
        axis.title.y = element_text(size=17))

#itd itd


#zapisywanie wykresów do pliku: np. za pomocą funkcji ggsave

ggsave("plot1_countries.png", a, width = 7.5, height = 7.5)

#domyślnie wymiary wykresów są w calach
#uwaga na nadpisywanie, R nie pyta nas o potwierdzenie nadpisania istniejącego pliku

# Używana w poprzednich zajęciach ramka danych
data = data.frame(
  "cells" = sample(c("MCF-7", "A549", "CHO", "PC12", "HepG2", "293T", "NIH/3T3"), 70, replace=TRUE),
  "measure" = round(runif(70, min = 10, max = 30), 1)
)

# Kod tworzący ramkę danych z wyliczonymi statystykami,
# taki sam jak stworzony na poprzednich zajęciach
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

# Przekonwertowanie etykiet wierszy do formatu kolumny
# bo ggplot2 nie bierze kategorii z etykiet
result$cell <- rownames(result)

print(result)

# Wykonanie wykresu tego samego typu jak w excelu
ggplot(result, aes(x = cell, y = mean))+
  geom_bar(stat = "identity")+
  geom_errorbar(aes(ymin = mean - sd, ymax = mean + sd))

# Ładniejsza wersja wykresu
ggplot(result, aes(x = cell, y = mean))+
  geom_bar(stat = "identity", fill = "gray", color = "black", width = 0.65)+
  geom_errorbar(aes(ymin = mean - sd, ymax = mean + sd), width = 0.2)+ 
  labs(title = "Średnia wartość pomiaru", x = "Komórki", y = "Średnia")
