print("Pierwszy skrypt")

pudelka1 = c(dlugosc = 20, szerokosc = 15, wysokosc = 12, liczba_szt = 3)
pudelka2 = c(dlugosc = 7, szerokosc = 5, wysokosc = 3, liczba_szt = 3)

objetosc1 = pudelka1["dlugosc"] * pudelka1["szerokosc"] * pudelka1["wysokosc"]
objetosc2 = pudelka2["dlugosc"] * pudelka2["szerokosc"] * pudelka2["wysokosc"]

names(objetosc1) = c(NULL)
names(objetosc2) = c(NULL)

print("Objetość  pudełka 1 to: ")
print(objetosc1)

print("Objetość  pudełka 2 to: ")
print(objetosc2)
