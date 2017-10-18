#' Gives the geocode of the address given by the user
#'
#' @param address character parameter under the format "street number street type street name postcode city name"
#'
#' @return numeric vector
#' @import banR assertthat
#'
#' @examples
#' \dontrun{
#' assert_geocode(12 rue de Rivoli 75001 Paris)}
#'
addres_geocode <- function(address){
  assertthat::assert_that(is.character(address))
  coord <- banR::geocode(address)
  coord <- c(coord[1,16],coord[1,17])
  return(coord)

}
