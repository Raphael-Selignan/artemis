#' Gives the URL of the cadastre datanase corresponding to the city of the address input in geocode_address
#'
#' @param city_code numerical vector from geocode result
#' @param context character vector from geocode result
#'
#' @return character vector
#' @export
#'
#' @examples
#' \dontrun{
#' url_cadastre(75107,"75, Paris")
#' }
#'
url_cadastre <- function(city_code,context){
  city_code <- toString(city_code)
  context <- toString(context)
  dep <- strsplit(context,",")[[1]][1]
  url_basis <- "https://cadastre.data.gouv.fr/data/etalab-cadastre/latest/communes"
  url_end <- paste("cadastre", city_code,"parcelles.json.gz", sep = "-")
  url <- paste(url_basis,dep,city_code,url_end,sep = "/")
  return(url)
}
