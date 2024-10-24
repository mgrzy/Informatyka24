#################
### Zajęcia 4 ###
#################

# Zadanie 4.1 - powtórzenie z ramek danych
# 
# - Wczytaj do R ramkę danych z pliku JAJOBAZA.csv
# - Jakie są wymiary ramki danych?
# - Jakie są nazwy kolumn?
# - Ile jaj się wykluło, jaki procent wszystkich zaobserwowanych jaj stanowią?
# - Zapisz nową ramkę danych zawierającą tylko dane o wyklutych jajach
# 
# Dla dwóch wybranych gatunków ptaków policz:
# - ile jaj tego gatunku zaobserwowano 
# - ile wynosi średnia masa jaja

# 2. Opracje na ramce danych o jajach:
# - Zapisać otrzymne wyniki:
# write.csv albo write.table

#Ile gatunków ptaków obserwowano? W ilu lokalizacjach zamontowane są budki? 

#Ile jaj wyklutych i nie  należało do poszczególnych gatunków

# Czynniki (factor)
f1 <- factor(c("wysoki", "średni", "średni", "niski", "wysoki", "niski"))

f1[length(f1)+1] <- "duży"

f1 <- factor(c("pn", "wt", "śr", "cz", "pi", "so", "ni"))

sort(f1)

lev <- c("pn", "wt", "śr", "cz", "pi", "so", "ni")
dat <- c("śr","śr","pi","ni", "ni","pn","wt","cz", "so")

f2 <- factor(dat, lev, ordered=TRUE)

