#' Gives the map and all the cadaster information of a given address- global function
#'
#' @param address character string
#'
#' @export
#'
#' @examples \dontrun{
#' address_to_cadaster("3 rue d'Olivet 75007 Paris)}
address_to_cadaster <- function(address){
  banRmatrix <- address_geocode(address)
  url <- url_cadastre(banRmatrix$citycode,banRmatrix$context)
  matrice <- load_cadastre_sheet(url,banRmatrix$citycode)
  parcelles <- matrice[[1]]
  feuilles <- matrice[[2]]
  polygon_ref <- nearest_polygon(banRmatrix,parcelles)
  feuille_ref <- point_feuille(banRmatrix,feuilles)
  address_information <- address_info(polygon_ref,feuille_ref,parcelles,feuilles)
  map_point(banRmatrix,paste("<h3>",address,"</h3>",address_information))
}
