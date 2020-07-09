#' Add large strips to facet plot.
#'
#' Adds 'overall' facets for the top and right of a facet plot.
#' @param top.strip Char for label of top strip.
#' @param right.strip Char for label of right strip.
#' @param strip.fill Colour value for fill of strips. (Default = "gray85")
#' @param strip.col Colour value for colour of ourtline for strip. Defatults to "NA".
#' @keywords strip, ggplot, facet
#' @export
#' @examples
#' p2 <- ggplot(CO2, aes(conc, uptake, colour = Plant)) +
#' geom_point() +
#' facet_grid(cols=vars(Type), rows = vars(Treatment))
#'
#' add_large_strips(p2, top.strip = "Plant Type", right.strip = "Treatment")


add_large_strips <- function(p1, top.strip, right.strip, strip.fill = "gray85", strip.col = NA){

# Labels
labelR = right.strip
labelT = top.strip

# Get the ggplot grob
z <- ggplotGrob(p1)

# Get the positions of the strips in the gtable: t = top, l = left, ...
posR <- subset(z$layout, grepl("strip-r", name), select = t:r)
posT <- subset(z$layout, grepl("strip-t", name), select = t:r)

# Add a new column to the right of current right strips,
# and a new row on top of current top strips
width <- z$widths[max(posR$r)]    # width of current right strips
height <- z$heights[min(posT$t)]  # height of current top strips

z <- gtable_add_cols(z, width, max(posR$r))
z <- gtable_add_rows(z, height, min(posT$t)-1)

# Construct the new strip grobs
stripR <- gTree(name = "Strip_right", children = gList(
  rectGrob(gp = gpar(col = strip.col, fill = strip.fill)),
  textGrob(labelR, rot = -90, gp = gpar(fontsize = 8.8, col = "grey10"))))

stripT <- gTree(name = "Strip_top", children = gList(
  rectGrob(gp = gpar(col = strip.col, fill = strip.fill)),
  textGrob(labelT, gp = gpar(fontsize = 8.8, col = "grey10"))))

# Position the grobs in the gtable
z <- gtable_add_grob(z, stripR, t = min(posR$t)+1, l = max(posR$r) + 1, b = max(posR$b)+1, name = "strip-right")
z <- gtable_add_grob(z, stripT, t = min(posT$t), l = min(posT$l), r = max(posT$r), name = "strip-top")

# Add small gaps between strips
z <- gtable_add_cols(z, unit(1/5, "line"), max(posR$r))
z <- gtable_add_rows(z, unit(1/5, "line"), min(posT$t))

# Draw it
grid.newpage()
grid.draw(z)

}
