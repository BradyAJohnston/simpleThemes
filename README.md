# simpleThemes

Collection of simple themes that I use regularly for making figures, presentations etc.

Used with ggplot objects.

## Example:
```R
ggplot(iris, aes(Sepal.Length, Sepal.Width, colour = Species)) + 
  geom_point() + 
  labs(title = "A dark-themed plot!") +
  simple_dark()
```

![alt text](https://i.imgur.com/hZfCcCg.png "Example Plot")
