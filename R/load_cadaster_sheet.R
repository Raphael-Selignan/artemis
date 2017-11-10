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
  saved_name <- paste("Cadastre.sheet",city_code,"json.gz",sep = ".")
  download.file(url,saved_name)
  cadastre_sheet <- sf::st_read(R.utils::gunzip(saved_name))
  return(cadastre_sheet)
}
