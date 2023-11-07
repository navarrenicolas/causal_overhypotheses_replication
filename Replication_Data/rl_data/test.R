library(dplyr)
library(ggplot2)

filenames <- list.files(pattern="\\.csv$")
condition_map  <- c("sl_290024.csv"="both_loo", "sl_290396.csv"="none-PPO2", "sl_290464.csv"="none", "sl_290495.csv"="disjunctive_train", "sl_290496.csv"="conjunctive_train", "sl_290529.csv"="disjunctive_loo", "sl_290530.csv"="conjunctive_loo")
# very high chance that the both_loo is something else

dlist <- multmerge()
multmerge <- function() {
    #datalist <- vector(mode = "list", length = length(filenames))
    datalist <- list()
    for(i in 1:length(filenames)){
        df <- read.csv(file = filenames[i], header= TRUE)
        df <- df %>% mutate(condition = condition_map[filenames[i]])
        colnames(df)%>%print
        datalist <- append(datalist,df)
        #datalist[i] <- df
    }
    return(datalist)
    #merged_df <- Reduce(function(x, y) {
    #  rbind(x, y)
    #}, datalist)
    #return(merged_df)
}

dlist <- multmerge()
dlist


ggplot()+ 
    geom_path(data=datalist[[1]], aes(x = steps, y = reward)) +
    geom_path(data=datalist[[2]], aes(x = steps, y = reward)) +
    geom_path(data=datalist[[3]], aes(x = steps, y = reward)) +
    geom_path(data=datalist[[4]], aes(x = steps, y = reward)) +
    geom_path(data=datalist[[5]], aes(x = steps, y = reward)) +
    geom_path(data=datalist[[6]], aes(x = steps, y = reward)) +
    geom_path(data=datalist[[7]], aes(x = steps, y = reward)) +
    theme_minimal()


