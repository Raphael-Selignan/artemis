---
title: "Artemis Package"
author: "Hamza Sentissi & Raphael Selignan"
date: "2017-11-15"
output: rmarkdown::html_vignette
vignette: >
  %\VignetteIndexEntry{Vignette Title}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---

#ARTEMIS PACKAGE

<img src="https://fthmb.tqn.com/3AFmXdYHbuOYHd1Vd4NwYyjb0Xc=/768x0/filters:no_upscale()/ArtemisBust-56aaad0f5f9b58b7d008d863.jpg" alt="Artemis">

This packages is composed of 8 functions and a shiny app. Although some of the functions can be used separately, most of them are conceived to be used by the shiny app.

The two most important components of the package are thus the app and the function address_to_cadastre.

##The app

The app enables you to search an address an obtain a map location and all the useful information contained by the cadastre databse. It is actually quicker than the official websties, which requires numerous entries to obtain the same information.


##The address_to_cadastre function

This function is the function that justifies the existence of the 7 others. It enables the shiny app to work by using the 7 inputs of the others functions and coming up with the required information. 

So you can understand better how this works without having to take a look at the code, let us explain:

1. You will input an address in the form "3 rue d'Olivet 75007", the city name is not required
2. The address_geocode function will find all the details concerning your address, including its GPS coordinates
3. The url_cadastre function will use this information to create the URL leading to the database containing the information for your address
3. The load_cadastre_sheet function will use that URL to download and import the relevant information as geographical data
4. The nearest_polygon function will use the GPS coordinates of the address and the imported data to find which "parcelle" is closest to The address you have given
5. The point_feuille function will find which cadaster sheet corresponds to this adress
6. The address_info uses the results of the two previous functions to gather all the information needed on this address
7. The map_point function uses the GPS coordinates to spot the address on a map and adds a popup with all the necessary information
8. Finally, the address_to_cadaster unites all those functions and enables you to obtain the final map with only the address!

Have fun!



