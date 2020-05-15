#' Strip an axis.
#'
#' This function strips the specified axis from the plot by supplying element_blank() for all of the relevant theme components.
#' @param axis Which axis to strip, either x or y.
#' @keywords strip, ggplot
#' @export
#' @examples
#' ggplot(iris, aes(Sepal.Length, Sepal.Width, colour = Species)) + geom_point() + strip_axis(axis = "x")

#The plan at some point is co make these levels customisable but that is not the case currently.

strip_axis <- function(axis = "y"){
  if(axis == "y"){

  strip <- theme(axis.title.y = element_blank(),
                 axis.text.y = element_blank(),
                 axis.ticks.y = element_blank(),
                 plot.margin = margin(l = 0, r = 0))

  }else{
    if(axis == "x"){

    strip <- theme(axis.title.x = element_blank(),
                   axis.text.x = element_blank(),
                   axis.ticks.x = element_blank(),
                   plot.margin = margin(b = 0, t = 0))
    }else(
      print("You must provide either the x or the y axis.")
    )
  }
  return(strip)
}

