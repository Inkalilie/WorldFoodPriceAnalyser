# R Script Tanja


# Datentabelle laden




# Variable mit Spaltennamen erstellen und in "wfp_sortiert" anpassen
cnames_wfp<-c("country_ID", "country", "city_ID", "city", "market_ID", "market_city", "product_ID", "product", "currency_ID", "currency", "sales_channel_ID", "sales_channel", "unit_ID", "unit", "month", "year", "price_local_currency", "commodity_source")
colnames(wfp_sortiert)<-cnames_wfp
  
  
# Daten anschauen
class(wfp_sortiert) # Anzeige Kategorie des Datensatzes
head(wfp_sortiert)
tails(wfp_sortiert, 15) # Anzeige letzte 15 Zeilen des Datensatzes
#data(wfp_sortiert) #? 
names(wfp_sortiert) # Anzeige Spaltennamen
dim(wfp_sortiert) # Summe Zeilen und Spalten des Datensatzes
summary(wfp_sortiert) # min, 1st qu., median, mean, 3rd qu., max pro Spalte
object.size(wfp_sortiert) # Größe Datensatz
str(wfp_sortiert) # Struktur der Daten
ls(wfp_sortiert) # Liste der Spaltennamen
table(wfp_sortiert$product) #
nrow(wfp_sortiert) # Anzahl der Zeilen
ncol(wfp_sortiert) # Anzahl der Spalten
#tapply(wfp_sortiert$price, mean) # 
tapply(wfp_sortiert$country, wfp_sortiert$product=="Apples", summary) # Anzahl der Spalten von "Apples" and gesamten Datensatz
wfp_sortiert[wfp_sortiert$product == 'Apples',] # Anzeige Datensatz gefiltert auf "Apples"



  
# Zusammenfügen der Datensätze "wfp_sortiert" und "wfp_market_food_prices_inUSD"
wfp_USD<-cbind(wfp_sortiert, wfp_market_food_prices_inUSD[c('mp_price')])
  

# Spaltennamen in wfp_USD anpassen - Variable "cnames_USD" mit Spaltennamen erstellen und in "wfp_USD" anpassen
cnames_USD<-c("country_ID", "country", "city_ID", "city", "market_ID", "market_city", "product_ID", "product", "currency_ID", "currency", "sales_channel_ID", "sales_channel", "unit_ID", "unit", "month", "year", "price_local_currency", "commodity_source", "price_USD")
colnames(wfp_USD)<-cnames_USD
  

# Filtern: Jahre >2005, Produkte mit wenig Datensätzen (z.B. nur für ein Land) oder nicht relevante Produkte und in "wfp_USD_2006_2017" speichern
wfp_USD_2006_2017<-subset(wfp_USD, year>2005 & product!="Livestock animals" & product!="Exchange rate" & product!="Exchange rate (unofficial)" & product!="Charcoal" & product!="Passion fruit" & product!="Cotton" & product!="Blackberry" & product!="Broccoli" & product!="Cashew" & product!="Fonio" & product!="Gari" & product!="Ghee" & product!="Labaneh" & product!="Poultry" & product!="Pumpkin" & product!="Tortilla (maize)" & product!="Transport (public)" & product!="Beetroots" & product!="Noodles" & product!="Sesame" & product!="Water (drinking)" & product!="Peanut" & product!="Cornstarch" & product!="Buckwheat grits" & product!="Cassava leaves" & product!="Curd" & product!="Dates" & product!="Guava" & product!="Lettuce" & product!="Sour cream" & product!="Parsley")






# Subsets product:
Apples<-subset(wfp_USD, product=="Apples")
Bananas<-subset(wfp_USD, product=="Bananas")
