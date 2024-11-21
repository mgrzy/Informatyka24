library('ggplot2')

jajobaza <- read.csv('JAJOBAZA.csv', header=TRUE, sep=";", dec=".")

# Wykres podstawowy - przypisujemy do zmiennej, żeby nie powtarać go
wykresxy <- ggplot(jajobaza, aes(x=DLUGOSC, y=SREDNICA))+
  geom_point(aes(color=GATUNEK, shape=LOSJAJA), size=3)

# Definiujemy własną skalę kolorów
# kolory mogą być predefiniowane albo w hex
wykresxy+
  scale_color_manual(values=c("#006400", "purple", "black", "pink", "orange", "blue"))+
  theme_bw()

# Poza skalą kolorów możemy używać własnych kształtów punktów
wykresxy+
  scale_color_grey()+
  scale_shape_manual(values = c(1, 16))+
  theme_bw()

# predefiniowane palety kolorów
wykresxy+
  scale_color_brewer(palette="Spectral")+
  theme_bw()

# Linia trendu
wykresxy+
  geom_smooth(method="lm")+
  theme_bw()

# Miejsce umieszczenia parametrów color i shape ma znaczenie
#
# jeśli umieścimy je w geom_point to pomimo nadania różnych stylów punktów według zmiennych
# jest to traktowane jako jeden zbiór danych
ggplot(jajobaza, aes(x=DLUGOSC, y=SREDNICA))+
  geom_point(aes(color=GATUNEK, shape=LOSJAJA), size=3)+
  geom_smooth(method="lm")+
  theme_bw()

# Jeśli którąś ze zmiennych dyskretnych jako color lub shape umieścimy w funkcji ggplot
# to podzieli nam dane na podzbiory, czyli stanie się zmienną grupującą
ggplot(jajobaza, aes(x=DLUGOSC, y=SREDNICA, shape=LOSJAJA))+
  geom_point(aes(color=GATUNEK), size=3)+
  scale_color_brewer(palette="Spectral")+
  geom_smooth(method="lm")+
  theme_bw()

# Można też dać dwie zmienne grupujące, ale zrobi się bałagan
ggplot(jajobaza, aes(x=DLUGOSC, y=SREDNICA, shape=LOSJAJA, color=GATUNEK))+
  geom_point(size=3)+
  scale_color_brewer(palette="Spectral")+
  geom_smooth(method="lm")+
  theme_bw()

ggplot(jajobaza, aes(x=DLUGOSC, y=SREDNICA, shape=LOSJAJA, color=GATUNEK))+
  geom_point(size=3)+
  scale_color_manual(values=c("#006400", "purple", "black", "brown", "orange", "blue"))+
  scale_shape_manual(values = c(1, 16))+
  geom_smooth(method="lm")+
  facet_grid("GATUNEK ~ LOSJAJA")
  theme_bw()

# Inny zbiór danych - kolejność etykiet
skunks <- read.csv("skunks.csv", header=TRUE, sep=";", dec=",", fileEncoding = "ISO-8859-2")

# Sezony nie są po kolei
ggplot(skunks, aes(x=MASA, y=FLUOR, shape=PLEC, color=SEZON))+
  geom_point(size=3)+
  geom_smooth(method="lm")+
  facet_grid("SEZON ~ PLEC")+
  theme_bw()

# Wystarczy wektor SEZON zmienić na porządkowany factor
skunks$SEZON <- factor(skunks$SEZON, levels=(c("wiosna", "jesień", "zima")), ordered=TRUE)

ggplot(skunks, aes(x=MASA, y=FLUOR, shape=PLEC, color=SEZON))+
  geom_point(size=3)+
  geom_smooth(method="lm")+
  facet_grid("SEZON ~ PLEC")+
  theme_bw()

# Jeszcze etykiety
ggplot(skunks, aes(x=MASA, y=FLUOR, shape=PLEC, color=SEZON))+
  geom_point(size=3)+
  geom_smooth(method="lm")+
  facet_grid("SEZON ~ PLEC")+
  theme_bw()+
  labs(
    title="Badania skunksów",
    x="Masa [kg]",
    y="Zawartość fluoru [ppm]",
    color="Sezon",
    shape="Płeć"
  )



