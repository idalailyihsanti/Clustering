library(cluster)
library(factoextra)
library(tidyverse)
data = read.csv(file.choose(), header = TRUE)
view(data)
str(data)
is.na(data)
summary(data)
#standarisasi dan normalisasi data
datacluster <- data[3:5]
datacluster
#scale data untuk menyamakan skala data
data_norm <- scale(datacluster)
data_norm

#clustering
(kmeans.result <- kmeans(data_norm, 8))

#silhoute k=8
fviz_nbclust(data_norm, kmeans, method = "silhouette")
 
# elbow k=6
fviz_nbclust(data_norm, kmeans, method = "wss")
 
#metode gap k=6
set.seed(200)
gapstat <- clusGap(data_norm, FUN = kmeans, K.max = 10, B=200)
gapstat
fviz_nbclust(data_norm, kmeans, method = "gap")

#tampilkan akurasi
finalclus <- kmeans(data_norm, 6, nstart = 25) 
finalclus





#visualisasi data
fviz_cluster(finalclus, data = data_norm)


