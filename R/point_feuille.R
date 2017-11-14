#' Produces the reference of the feuille corresponding to the point
#'
#' @param banRmatrix matrix given out by banR
#' @param cadaster_sheet_feuilles corresponding cadaster_sheet
#'
#' @return integer
#' @import sf
#' @export
#'
#' @examples \dontrun{
#' point_feuille(geocode_address("youradrress"),feuille_cadaster_sheet.json)}
point_feuille <- function(banRmatrix,cadaster_sheet_feuilles){
  point <- sf::st_point(c(banRmatrix$longitude, banRmatrix$latitude))
  point <- sf::st_sfc(point, crs = 4326)
  UTM_point <- st_transform(point, crs = 32748)
  UTM_sheet <- cadaster_sheet_feuilles %>%
    st_transform(crs = 32748)
  distance_matrix <- st_distance(UTM_point, UTM_sheet)
  point_feuille_reference <- which.min(distance_matrix)
  return(point_feuille_reference)
}
