#' A Dark Theme for ggplot2
#'
#' This function allows you to express your love of cats.
#' @param love Aspect ratio of plot, defaults to 1/2.
#' @keywords darkmode, theme, ggplot, darj
#' @export
#' @examples
#' ggplot(iris, aes(Sepal.Length, Sepal.Width, colour = Species)) + geom_point() + simple_dark()

#The plan at some point is co make these levels customisable but that is not the case currently.

simple_dark <- function(linesize = 2){

  level1 = "gray20"
  level2 = "gray30"
  level3 = "gray50"
  level4 = "gray69"
  level5 = "gray80"
  level6 = "gray85"
  level7 = "gray95"

  theme(panel.background = element_rect(colour = level4, fill = level2, size = linesize),
                        panel.grid = element_line(colour = level3),
                        panel.border = element_rect(fill = NA, colour = level4, size = linesize),
                        plot.background = element_rect(fill = level1, colour = NA),
                        plot.title = element_text(colour = level7),
                        plot.subtitle = element_text(colour = level6),
                        plot.caption = element_text(colour = level5),
                        axis.text = element_text(colour = level5),
                        axis.ticks = element_line(colour = level4),
                        axis.title = element_text(colour = level6),
                        # strip.background = element_rect(fill = level2, colour = "gray100", size = 0),
                        strip.background = element_blank(),
                        strip.text = element_text(colour = level7),
                        legend.background = element_blank(),
                        legend.text = element_text(colour = level5),
                        legend.position = "right",
                        legend.title = element_text(colour = level7),
                        legend.key = element_rect(fill = level2))

}
