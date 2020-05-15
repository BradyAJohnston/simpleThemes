\name{simple_dark}
\alias{dark}
\title{Simple Dark Theme}
\usage{
ggplot + simple_dark()
}
\description{
Adds a pre-made simple dark theme to the plot. Can take a linesize and aspect ratio argument, but contains defaults.
}
\examples{
ggplot(iris, aes(Sepal.Length, Sepal.Width, colour = Species)) + geom_point() + simple_dark()
}
