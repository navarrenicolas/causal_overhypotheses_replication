library(dplyr)
library(ggplot2)

filenames <- list.files(pattern="\\.csv$")

multmerge <- function() {
    datalist <- data.frame()
    for(i in 1:length(filenames)){
        df <- read.csv(file = filenames[i], header= TRUE)
        df <- df %>% mutate(condition = filenames[i])
        df <- df %>% mutate(condition = recode(condition,"sl_290024.csv"="both_loo", "sl_290396.csv"="none-PPO2", "sl_290464.csv"="none", "sl_290495.csv"="disjunctive_train", "sl_290496.csv"="conjunctive_train", "sl_290529.csv"="disjunctive_loo", "sl_290530.csv"="conjunctive_loo"))
# very high chance that the both_loo is something else
        colnames(df)%>%print
        datalist <- rbind(datalist,df)
        #datalist[i] <- df
    }
    return(datalist)
}

dlist <- multmerge()

ggplot()+ 
    geom_path(data=subset(dlist,condition!="none-PPO2"), aes(x = steps, y = reward,colour=condition)) +
    theme_minimal()


