#' Simple light theme.
#'
#' This function strips the specified axis from the plot by supplying element_blank() for all of the relevant theme components.
#' @param AR Aspect ratio of plot as dbl.
#' @param legend Whether or not to include legend, TRUE by default.
#' @param linesize Thickness of plot border, defaults to 1.
#' @keywords strip, ggplot
#' @export
#' @examples
#' ggplot(iris, aes(Sepal.Length, Sepal.Width, colour = Species)) + geom_point() + strip_axis(axis = "x")

#The plan at some point is co make these levels customisable but that is not the case currently.

simple_light <-  function(AR = 1/2, legend = TRUE, linesize = 1){
  if(legend == TRUE){
    pos = "right"
  }else{
    pos = ""
  }

  some_theme = theme(panel.border = element_rect(colour = "gray30",
                                                 size = linesize,
                                                 fill = NA),
                     aspect.ratio = AR,
                     legend.position = pos)
  return(some_theme)
}

