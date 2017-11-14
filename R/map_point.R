#' Loads the information of the parcel and displays it on a map of the parcel using its coordinates
#'
#' @param longitude numerical vector
#' @param latitude numerical vector
#' @param information character vector
#'
#' @import leaflet
#' @import dplyr
#'
#' @return dataframe
#' @export
#'
#' @examples \dontrun{
#' map_point(2.2945, 48.8584, 'Here is the <b>Tour Eiffel</b>, Paris')
#' }
#'
#'
map_point <- function(longitude,latitude,information){

m = leaflet() %>% addTiles()
## a map with the default OSM tile layer

m %>% addPopups(longitude, latitude, information)
## Longitude puis latitude
}
