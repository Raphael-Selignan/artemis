#' Loads and open the cadaster sheet corresponding to the city code
#'
#' @param url character vecor
#' @param city_code numerical vector
#'
#' @import sf R.utils
#' @return dataframe
#' @export
#'
#' @examples \dontrun{
#' load_cadaster_sheet("https://cadastre.data.gouv.fr/data/etalab-cadastre/latest/communes/75/75117/cadastre-75117-batiments.json.gz",75117)
#' }
#'
#'
load_cadastre_sheet <- function(url,city_code){
  toString(city_code)
  saved_name_parcelles <- paste("Cadastre.sheet",city_code,"parcelles.json.gz",sep = ".")
  saved_name_feuilles <- paste("Cadastre.sheet",city_code,"feuilles.json.gz",sep = ".")
  download.file(url[1],saved_name_parcelles)
  download.file(url[2],saved_name_feuilles)
  cadastre_sheet_parcelles <- sf::st_read(R.utils::gunzip(saved_name_parcelles))
  cadastre_sheet_feuilles <- sf::st_read(R.utils::gunzip(saved_name_feuilles))
  file.remove(substring(saved_name_parcelles,1,nchar(saved_name_parcelles)-3))
  file.remove(substring(saved_name_feuilles,1,nchar(saved_name_feuilles)-3))
  cadastre_sheets <- list(cadastre_sheet_parcelles,cadastre_sheet_feuilles)
  return(cadastre_sheets)
}
