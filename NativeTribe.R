# Import libraries
library(dplyr)
library(ggplot2)
library(tidyverse)
library(plotly)
library(maps)




# Put the city names into a vecor
city <- c('Asotin', 'Cathlamet', 'Chehalis', 'Chelan', 'Chewelah', 'Chimacum', 'Clallam Bay',
          'Claquato', 'Cle Elum', 'Entiat', 'Enumclaw', 'Hoquiam', 'Ilwaco', 'Issaquah', 'Klickitat', 
          'Mukilteo', 'Nahcotta', 'Naselle', 'Neah Bay', 'Newhalem', 'Okanogan', 'Omak', 'Palouse', 'Queets',
          'Quilcene', 'Salkum', 'Seattle', 'Sequim', 'Skamania', 'Skykomish', 'Snohomish', 'Snoqualmie', 
          'Spokane', 'Steilacoom', 'Tacoma', 'Tenino', 'Tonasket', 'Toppenish', 'Tumwater', 'Twisp', 
          'Walla Walla', 'Wapato', 'Wenatchee', 'Wishram')

# Put the latitudes into a vector
lat <- c('46.3393', '46.2032', '46.6620', '47.8408', '48.2763', '48.0106', '48.2533', '46.6434', '47.1954', 
         '47.6760', '47.2043', '46.9809', '46.3090', '47.5301', '45.8171', '47.9445', '46.5146', '46.3654', '48.3681', 
         '48.6739', '48.3613', '48.4110', '46.9102', '47.5397', '47.8223', '46.5315', '47.6062', '48.0795', '45.6176', 
         '47.7093', '47.9129', '47.5287', '47.6588', '47.1698', '47.2529', '46.8568', '48.7052', '46.3774', '47.0073', 
         '48.3635', '46.0646', '46.4476', '47.4235', '45.6573')

# Put the longitudes into a vector
long <- c('-117.0482', '-123.3832', '-122.9640', '-120.0168', '-117.7155', '-122.7687', '-124.2601', '-123.0174', '-120.9392', 
          '-120.2084', '-121.9915', '-123.8893', '-124.0432', '-122.0326', '-121.1526', '-122.3046', '-123.7690', '-123.8107', 
          '-124.6250', '-121.2461', '-119.5834', '-119.5276', '-117.0757', '-124.3311', '-122.8757', '-122.6260', '-122.3321', 
          '-123.1018', '-122.0489', '-121.3601', '-122.0982', '-121.8254', '-117.4260', '-122.6026', '-122.4443', '-122.8529', 
          '-119.4395', '-120.3087', '-122.9093', '-120.1223', '-118.3430', '-120.4203', '-120.3103', '-120.9667')

#  Put some descriptions into a vector
desc <- c()

# Associate a tribe with each city
tribe <- c('Nez Pierce', 'Cathlamet', 'Chehalis', 'Chelan', 'Chewelah', 'Chimacum', 'Klallam', 'Salish',
           'Salish', 'Entiat', 'Duwamish', 'Hoquiam', 'Chinook', 'Snoqualmie', 'Klickitat', 'Mukilteo', 
           'Chinook', 'Chinook', 'Makah', 'Salish', 'Salish', 'Okangogan', 'Palouse', 'Queets', 'Twana', 
           'Cowlitz', 'Suquamish', 'S’Klallam', 'Shahala', 'Skykomish', 'Snohomish', 'Snoqualmie',
           'Spokan', 'Steilacoom', 'Salish', 'Chinook', 'Okanogan', 'Yakama', 'Salish', 'Chinook', 
           'Walla Walla', 'Chinook', 'Wenatchee', 'Chinook')

# Put all the above into a data frame
nativeData <- data.frame(city, lat, long, tribe, stringsAsFactors = FALSE)

#View the data frame
View(nativeData)


# Export the data into a csv file
write.csv(nativeData, './Desktop/NativeMap/nativeData.csv')

# Get the map data by state, and filter to get only the state of Washington
map <- map_data('state')
map <- filter(map, region == 'washington')
View(map)





