#' Returns the closes polygon to a long lat point
#'
#' @param banRmatrix the banR matrix given by address_geocode
#' @param cadaster_sheet the corresponding cadaster sheet
#'
#' @return integer
#' @import sf
#' @export
#'
#' @examples \dontrun{
#' nearest_polygon(geocode_address("5 rue d'Olivet 75007"),cadaster_sheet_75107)
#' }
nearest_polygon <- function(banRmatrix,cadaster_sheet){
  point <- sf::st_point(c(banRmatrix$longitude, banRmatrix$latitude))
  point <- sf::st_sfc(point, crs = 4326)
  UTM_point <- st_transform(point, crs = 32748)
  UTM_sheet <- cadaster_sheet %>%
  st_transform(crs = 32748)
  distance_matrix <- st_distance(UTM_point, UTM_sheet)
  nearest_polygon_reference <- which.min(distance_matrix)
  return(nearest_polygon_reference)
}
