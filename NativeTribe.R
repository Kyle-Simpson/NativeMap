# Import libraries
library(gapminder)
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
lat <- c(46.3393, 46.2032, 46.6620, 47.8408, 48.2763, 48.0106, 48.2533, 46.6434, 47.1954, 
         47.6760, 47.2043, 46.9809, 46.3090, 47.5301, 45.8171, 47.9445, 46.5146, 46.3654, 48.3681, 
         48.6739, 48.3613, 48.4110, 46.9102, 47.5397, 47.8223, 46.5315, 47.6062, 48.0795, 45.6176, 
         47.7093, 47.9129, 47.5287, 47.6588, 47.1698, 47.2529, 46.8568, 48.7052, 46.3774, 47.0073, 
         48.3635, 46.0646, 46.4476, 47.4235, 45.6573)

# Put the longitudes into a vector
long <- c(-117.0482, -123.3832, -122.9640, -120.0168, -117.7155, -122.7687, -124.2601, -123.0174, -120.9392, 
          -120.2084, -121.9915, -123.8893, -124.0432, -122.0326, -121.1526, -122.3046, -123.7690, -123.8107, 
          -124.6250, -121.2461, -119.5834, -119.5276, -117.0757, -124.3311, -122.8757, -122.6260, -122.3321, 
          -123.1018, -122.0489, -121.3601, -122.0982, -121.8254, -117.4260, -122.6026, -122.4443, -122.8529, 
          -119.4395, -120.3087, -122.9093, -120.1223, -118.3430, -120.4203, -120.3103, -120.9667)

#  Put some descriptions into a vector                                                                                     
desc <- c('This was originally a Nez Perce winter camp site. The Nez Perce called the nearby creek Has-shu-tin which means “eel” for this was an area where the eel where plentiful. When the Americans moved in following the 1877 Nez Perce war, they spelled Has-shu-tin as Asotin (or Assotin).', 
          'This town is named for the Cathlamet Indian tribe, a Penutian-speaking group linguistically and culturally related to the Multnomah, Clackamas, and Wasco-Wishram. The designation “Cathlamet” (also spelled “Kathlamet”) is said to mean “stone” in reference to the rocky course of the Columbia River in their traditional homeland.', 
          'This town is named for the Chehalis Indian tribe, a Salish-speaking group linguistically and culturally related to the Humptulips and Wynoochee. Governor Isaac Stevens met with the Chehalis and other tribes in treaty council at Grays Harbor in 1855. Stevens and the American negotiators fully intended for the tribe to be placed on the Quinault Reservation, but tribal leaders objected and refused to sign the treaty. They were eventually allowed to have their own reservation.', 
          'This town is named for the Chelan Indian tribe, a Salish-speaking group linguistically and culturally related to the Entiat, Method, and Wenatchee. The first fur traders who entered the area in 1811 were told that the name of the river was Tsill-ane which then became Chelan. The name means “land of bubbling water” in reference to the rapids.', 
          'This town is named for the Chewelah Indian tribe, a Salish-speaking group linguistically and culturally related to the Pend d’Oreille, Kalispel, and Flathead.', 
          'This town is named for the Chimacum (also spelled Chemakum and Chimikum) Indian tribe, who are linguistically related to the Quileute. Jake Palmer (1847-1881) is generally considered the last of the Chimacum Indians.', 
          'This community takes its name from the Klallam Indians, a Salish-speaking group linguistically related to the Lummi, Saanich, Samish, Semiahmoos, Songhees, and Sooke. The Klallam call themselves Nu’sklaim which means “strong people.”', 
          'This is a Salish term meaning “high land.”', 
          'This is a Salish term meaning “swift water.”', 
          'This town is named for the Entiat Indian tribe, a Salish-speaking group linguistically and culturally related to the Chelan, Method, and Wenatchee. The designation “entiat” is said to refer to “rushing water.”', 
          'This was a traditional campsite for the Duwamish Indians. Translations of “Enumclaw” range from “place of evil spirits” (probably a European misconception of Native sacred places), “thundering mountain,” and “loud, rattling noise.”', 
          'This seems to be an interpretation of the Indian word “ho-qui-umpts” which means “hungry for wood” which refers to the driftwood at the mouth of the river.', 
          'This town was named for the son-in-law of Chinook Chief Comcomly, Elowahka Jim which then became Ilwaco.', 
          'This was the hunting and fishing ground of the Snoqualmie Indians. According to some accounts, the Indians called the area “Ishquoh” which may have meant “the sound of the birds.” When pronounced in Indian, the word has a glottal stop which English-speakers have difficulty with and so they pronounced it as “squak” In 1899, the town was officially designated as Issaquah.', 
          'This town was named for the Klickitat Indian tribe, a Sahaptian-speaking group who are linguistically related to the Yakama, Kittitas, Upper Cowlitz, and Taitnapam.', 
          'This was a traditional Indian ceremonial and council ground. The name “Mukilteo” means “good camping ground.”', 
          'This community is named for Chinook chief Nahcati who was friendly with the American settlers when the town was established in 1888.', 
          'This settlement is named for the Na-sil band of Chinook Indians.', 
          'This is the capital of the Makah Indian nation and was named for the Makah chief Dee-ah. In 1828, Captain Henry Kellett met chief Dee-ah and, unable to pronounce his name correctly, named the site Neah Bay. Makah is a designation given to the tribe by the neighboring Klallam which means “generous with food.” They call themselves Kwih-dich-chu-ahtx which means “people who live by the rocks and seagulls.”', 
          'This is based on a Salish word which means “goat snare.”', 
          'This is based on the Salish word “okanagen” which means “rendezvous.”', 
          'This town takes its name from the name of a lake, Omache, which means “great medicine.”', 
          'This town takes its name from the Palouse (also spelled Palus, Pallatpallah, and Pelusha) Indian tribe. This is a Sahaptian-speaking tribe linguistically related to the Walla Walla and Wanapam.', 
          'This town is named for the Queets Indian tribe, a Salish-speaking group linguistically related to the Quinault, Copalis, and Oyhut.', 
          'This was originally the home of the Twana Indians who apparently called it Kwil-sid. The name may mean “salt water people.”', 
          'Probably means “boiling up” which refers to a section on the Cowlitz River where the falls are located.', 
          'Named for Suquamish Chief Sealth. Alki Point takes its name from the Suquamish word “alki” which means “by and by” or “after a while.”', 
          'Located in the homeland of the S’Klallam Indian tribe, the bay was called Such-e-kwai-ing which means “quiet water” and was then Anglicized into Sequim (which is pronounced “skiwm”.)', 
          'This is a Shahala Indian word which means “swift water.”', 
          'This town is named for the Skykomish Indian tribe, a Salish-speaking group linguistically related to the Duwamish, Muckleshoot, Nisqually, Puyallup, Skagit, Snohomish, Steilacoom, Stillaguamish, and Swinomish.', 
          'This town is named for the Snohomish Indian tribe, a Salish-speaking group linguistically related to the Skykomish.', 
          'This town is named for the Snoqualmie Indian tribe, a Salish-speaking group linguistically related to the Skykomish.', 
          'This town is named for the Spokan Indian tribe, a Salish-speaking group linguistically related to the Kalispel, Cheweleh, Pend d’Oreille, and Flathead.', 
          'This town is named for the Steilacoom Indian tribe, a Salish-speaking group linguistically related to the Skykomish.', 
          'The Salish-speaking Indians in the area referred to it as Shubahlup which means “the sheltered place.” American settlers later named it Tacoma which is supposedly from Takohoma which has been reported to mean “frozen waters,” or “nourishing breast,” or “near to heaven” which may refer to the nearby Mt. Rainier.', 
          'This name comes from the Chinook word which means “meeting place” in reference to it being a meeting ground and trading place. In addition, the Tenino are a Shaptian-speaking tribe related to the Umatilla and the Celilo.', 
          'This was a traditional Okanogan Indian camping place and was named for Chief Tonasket.', 
          'Located on the Yakama Indian Reservation, this name may come from Thap-pahn-ish meaning “People of the trail which comes from the foot of the hills.” Some people, however, feel that it comes from Qapuishlema which means “people from the foot of the hills.”', 
          'The Salish-speaking Indians called the Deschutes River Tum Chuk which referred to the falls. While the town was originally named New Market, it changed to Tumwater in 1857.', 
          'Appears to be from the Chinook word “t-wapsp” which means “yellow jacket.”', 
          'This is named for the Walla Walla Indian tribe, a Sahaptian-speaking group linguistically and culturally related to the Palouse and Wanapam. Walla Walla is often translated as “many waters.”', 
          'This is from the Chinook word “wapatoo” which means “potato” referring to the camas root which was commonly used for food.', 
          'This town is named for the Wenatchee Indian tribe, a Salish-speaking group linguistically related to the Chelan, Entiate, and Method.', 
          'This is a Chinook word meaning “flea” or “louse.”')

# Associate a tribe with each city
tribe <- c('Nez Pierce', 'Cathlamet', 'Chehalis', 'Chelan', 'Chewelah', 'Chimacum', 'Klallam', 'Salish',
           'Salish', 'Entiat', 'Duwamish', 'Hoquiam', 'Chinook', 'Snoqualmie', 'Klickitat', 'Mukilteo', 
           'Chinook', 'Chinook', 'Makah', 'Salish', 'Salish', 'Okangogan', 'Palouse', 'Queets', 'Twana', 
           'Cowlitz', 'Suquamish', 'S’Klallam', 'Shahala', 'Skykomish', 'Snohomish', 'Snoqualmie',
           'Spokan', 'Steilacoom', 'Salish', 'Chinook', 'Okanogan', 'Yakama', 'Salish', 'Chinook', 
           'Walla Walla', 'Chinook', 'Wenatchee', 'Chinook')

# Put all the above into a data frame
nativeData <- data.frame(city, lat, long, tribe, desc, stringsAsFactors = FALSE)

#View the data frame
View(nativeData)




# Get the map data by state, and filter to get only the state of Washington
map <- map_data('state')
map <- filter(map, region == 'washington')
View(map)


# Plot the state of Washington and pinpoint the Native cities
waMap <- ggplot(gapminder) + geom_polygon(data = map, aes(x=long, y = lat, group = group)) + 
  coord_fixed(1.3) +
  geom_point(data = nativeData, aes(x = long, y = lat), color = "red") +
  xlab("Longitude") +
  ylab("Latitude")

# Make the plot interactive
ggplotly(waMap)




# Two very important data frames
#map
#nativeData



# Export the native data into a csv file
write.csv(nativeData, './Desktop/NativeMap/nativeData.csv')

# Export the Washington map into a csv file
write.csv(map, './Desktop/NativeMap/waMap.csv')
  
  

