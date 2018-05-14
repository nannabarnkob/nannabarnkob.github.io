
setwd("~/finalprojectSDAV-master/finalprojectSDAV")
Full_data <- read.csv("socio_data_kbh.csv")
Full_data[is.na(Full_data)] <- 0


Sorted_data <- Full_data[,c(3:5,7:21,25:37,63:70)]
write.csv(Sorted_data, file = "Sorted_data.csv",row.names=TRUE)

Aggregated_data <- data.frame(alder_antal_0_5=rep(0,7),
                 alder_antal_6_17=rep(0,7), 
                 alder_antal_18_29=rep(0,7),
                 alder_antal_30_39=rep(0,7),
                 alder_antal_40_49=rep(0,7),
                 alder_antal_50_64=rep(0,7),
                 alder_antal_over_65=rep(0,7),
                 aar = rep(0,7),
                 stringsAsFactors=FALSE) 

A <- c()
for (i in names(Aggregated_data)){
  B <- aggregate(Sorted_data[[i]],list(Region = Sorted_data$aar),sum)
  print(B$x)
  A <- cbind(A,B$x)
}


Aggregated_data[,]<- A
Aggregated_data[,8] <- B$Region

write.csv(Aggregated_data, file = "Aggregated_data.csv",row.names=TRUE)


Aggregated_data_udd <- data.frame(antal_gymnasial_udd=rep(0,7),
                                  antal_erh_faglig_udd=rep(0,7), 
                                  antal_kort_viderg_udd=rep(0,7),
                                  antal_mellemlang_viderg_udd=rep(0,7),
                                  antal_lang_viderg_udd=rep(0,7),
                                  antal_ingen_udd=rep(0,7),
                                  antal_under_udd=rep(0,7),
                              aar = rep(0,7),
                              stringsAsFactors=FALSE) 

A <- c()
for (i in names(Aggregated_data_udd)){
  B <- aggregate(Sorted_data[[i]],list(Region = Sorted_data$aar),sum)
  print(B$x)
  A <- cbind(A,B$x)
}


Aggregated_data_udd[,]<- A
Aggregated_data_udd[,8] <- B$Region

write.csv(Aggregated_data_udd, file = "Aggregated_data_udd.csv",row.names=TRUE)


