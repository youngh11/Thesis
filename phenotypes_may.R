phen_in <- read.csv("/users/hannah/Downloads/genesforgood_extract_fast_health_history_mental_health_2017-04-17T1626.tsv", sep="\t", stringsAsFactors = F)
phen <- phen_in[,c(1,3,17:26)]
names(phen) <- c("USER_ID", "sex","q_14", "q_15", "q_16", "q_17", "q_18", "q_19", "q_20", "q_21", "q_22", "q_23")
phen <- phen[-c(9400),]

phen$q_14[phen$q_14=="Certainly applies"] <- 5
phen$q_15[phen$q_15=="Certainly applies"] <- 5
phen$q_16[phen$q_16=="Certainly applies"] <- 5
phen$q_17[phen$q_17=="Certainly applies"] <- 5
phen$q_18[phen$q_18=="Certainly applies"] <- 5
phen$q_19[phen$q_19=="Certainly applies"] <- 5
phen$q_20[phen$q_20=="Certainly applies"] <- 5
phen$q_21[phen$q_21=="Certainly applies"] <- 5
phen$q_22[phen$q_22=="Certainly applies"] <- 5
phen$q_23[phen$q_23=="Certainly applies"] <- 5

phen$q_14[phen$q_14=="Possibly applies"] <- 4
phen$q_15[phen$q_15=="Possibly applies"] <- 4
phen$q_16[phen$q_16=="Possibly applies"] <- 4
phen$q_17[phen$q_17=="Possibly applies"] <- 4
phen$q_18[phen$q_18=="Possibly applies"] <- 4
phen$q_19[phen$q_19=="Possibly applies"] <- 4
phen$q_20[phen$q_20=="Possibly applies"] <- 4
phen$q_21[phen$q_21=="Possibly applies"] <- 4
phen$q_22[phen$q_22=="Possibly applies"] <- 4
phen$q_23[phen$q_23=="Possibly applies"] <- 4

phen$q_14[phen$q_14=="Unsure"] <- 3
phen$q_15[phen$q_15=="Unsure"] <- 3
phen$q_16[phen$q_16=="Unsure"] <- 3
phen$q_17[phen$q_17=="Unsure"] <- 3
phen$q_18[phen$q_18=="Unsure"] <- 3
phen$q_19[phen$q_19=="Unsure"] <- 3
phen$q_20[phen$q_20=="Unsure"] <- 3
phen$q_21[phen$q_21=="Unsure"] <- 3
phen$q_22[phen$q_22=="Unsure"] <- 3
phen$q_23[phen$q_23=="Unsure"] <- 3

phen$q_14[phen$q_14=="Possibly does not apply"] <- 2
phen$q_15[phen$q_15=="Possibly does not apply"] <- 2
phen$q_16[phen$q_16=="Possibly does not apply"] <- 2
phen$q_17[phen$q_17=="Possibly does not apply"] <- 2
phen$q_18[phen$q_18=="Possibly does not apply"] <- 2
phen$q_19[phen$q_19=="Possibly does not apply"] <- 2
phen$q_20[phen$q_20=="Possibly does not apply"] <- 2
phen$q_21[phen$q_21=="Possibly does not apply"] <- 2
phen$q_22[phen$q_22=="Possibly does not apply"] <- 2
phen$q_23[phen$q_23=="Possibly does not apply"] <- 2

phen$q_14[phen$q_14=="Certainly does not apply"] <- 1
phen$q_15[phen$q_15=="Certainly does not apply"] <- 1
phen$q_16[phen$q_16=="Certainly does not apply"] <- 1
phen$q_17[phen$q_17=="Certainly does not apply"] <- 1
phen$q_18[phen$q_18=="Certainly does not apply"] <- 1
phen$q_19[phen$q_19=="Certainly does not apply"] <- 1
phen$q_20[phen$q_20=="Certainly does not apply"] <- 1
phen$q_21[phen$q_21=="Certainly does not apply"] <- 1
phen$q_22[phen$q_22=="Certainly does not apply"] <- 1
phen$q_23[phen$q_23=="Certainly does not apply"] <- 1

phen$q_14 <- as.numeric(phen$q_14)
phen$q_15 <- as.numeric(phen$q_15)
phen$q_16 <- as.numeric(phen$q_16)
phen$q_17 <- as.numeric(phen$q_17)
phen$q_18 <- as.numeric(phen$q_18)
phen$q_19 <- as.numeric(phen$q_19)
phen$q_20 <- as.numeric(phen$q_20)
phen$q_21 <- as.numeric(phen$q_21)
phen$q_22 <- as.numeric(phen$q_22)
phen$q_23 <- as.numeric(phen$q_23)

sums <- rowSums(phen[,-1:-2])
phen2 <- cbind(phen, sums)

#avg score across individuals
avg_score <- sum(phen2$sums)/nrow(phen2)


mean2_14 <- mean(phen2$q_14, na.rm = T)
mean2_15 <- mean(phen2$q_15, na.rm = T)
mean2_16 <- mean(phen2$q_16, na.rm = T)
mean2_17 <- mean(phen2$q_17, na.rm = T)
mean2_18 <- mean(phen2$q_18, na.rm = T)
mean2_19 <- mean(phen2$q_19, na.rm = T)
mean2_20 <- mean(phen2$q_20, na.rm = T)
mean2_21 <- mean(phen2$q_21, na.rm = T)
mean2_22 <- mean(phen2$q_22, na.rm = T)
mean2_23 <- mean(phen2$q_23, na.rm = T)

sd_14 <- sd(phen2$q_14, na.rm=T)
sd_15 <- sd(phen2$q_15, na.rm=T)
sd_16 <- sd(phen2$q_16, na.rm=T)
sd_17 <- sd(phen2$q_17, na.rm=T)
sd_18 <- sd(phen2$q_18, na.rm=T)
sd_19 <- sd(phen2$q_19, na.rm=T)
sd_20 <- sd(phen2$q_20, na.rm=T)
sd_21 <- sd(phen2$q_21, na.rm=T)
sd_22 <- sd(phen2$q_22, na.rm=T)
sd_23 <- sd(phen2$q_23, na.rm=T)

phen_ped <- phen2[,c(1:2,13)]
phen_ped$famid <- "x"
phen_ped$pat_id <- "x"
phen_ped$matid <- "x"
phen_ped <- phen_ped[,c(4,1,5:6,2:3)]

map <- read.table("/users/hannah/Desktop/HONORS_THESIS/genetic_result_user_id_mapping_2017-05-26-0921.tab", header=T)
map$RESULT_BARCODE <- substr(map$RESULT_BARCODE, 4, 8)
map$RESULT_BARCODE <- sub("^", "GFG", map$RESULT_BARCODE )
mapped_phen_ped <- merge(map, phen_ped, by="USER_ID")
long_ids <- read.table("/users/hannah/Desktop/HONORS_THESIS/longID_freeze2.txt", header=F)
FOO2 <-data.frame(do.call('rbind', strsplit(as.character(long_ids$V1), '@', fixed=TRUE)))
long_map <- cbind(FOO2, long_ids)
names(long_map) [1] <- "RESULT_BARCODE"
library(plyr)
final_long_id <- join(long_map, mapped_phen_ped, by="RESULT_BARCODE")
final_long_id$sex[final_long_id$sex == "male"] <- 1
final_long_id$sex[final_long_id$sex == "female"] <- 2
final_long_ids <- final_long_id[,c(5,3,6:9)]
final_long <- final_long_ids[complete.cases(final_long_ids$sums),]
names(final_long)[2] <- "iid"

write.table(final_long, "/users/hannah/Desktop/HONORS_THESIS/f2phen.ped", row.names = F, quote=F)

gcta_phen <- final_long[,c(1:2,6)]
ldpred_phen <- final_long[,c(2,6)]

write.table(mapped_phen_ped, "/users/hannah/Desktop/HONORS_THESIS/freeze2_phenotype.ped", quote=F, row.names = F)
write.table(gcta_phen, "/users/hannah/Desktop/HONORS_THESIS/gcta_phenotype.ped", quote=F, row.names = F)


demos <- read.csv("/users/hannah/Downloads/genesforgood_extract_fast_health_history_demographics_2017-04-17T1627.tsv", stringsAsFactors = F, sep="\t")
demos[demos$X4_year_of_birth=="<1950",] <- 1950 
demos[demos$X4_year_of_birth=="&lt;1925",] <- 1925
demos[demos$X4_year_of_birth=="<1925",] <- 1925 
demos[demos$X4_year_of_birth=="2001+",] <- 2001 
demos[demos$X4_year_of_birth=="5",] <- NA
demos[demos==""] <- NA 
demos$X4_year_of_birth <- as.numeric(demos$X4_year_of_birth)


pc <- read.table("/users/hannah/Desktop/HONORS_THESIS/pca.out.eigenvec")
names(pc) <- c("iid", "fid", "PC1", "PC2", "PC3", "PC4", "PC5", "PC6", "PC7", "PC8", "PC9", "PC10")
library(plyr)
names(final_long_id) [3] <- "iid"
covar <- merge(pc, final_long_id, by="iid")
cov <- covar[complete.cases(covar$sums),]
cov <- cov[cov$USER_ID %in% demo_cov$user_id,]
cov$fid <- "x"
demo_cov <- demos[demos$user_id %in% cov$USER_ID,]
cov$age <- 2016 - (demo_cov$X4_year_of_birth)
cov$age2 <- (cov$age)**2
cov <- cov[,c(2,1,17:19,3:12)]

write.table(cov, "/users/hannah/Desktop/HONORS_THESIS/f2_covariates.ped", row.names=F, quote=F)

#change to include PCs
gcta_covar <- cov[c(1:2,6:8),]
ldpred_covar <- cov[c(2,6:8),]


height <- read.csv("/users/hannah/Downloads/genesforgood_extract_fast_health_history_height_and_weight_2017-05-22T1233.tsv", stringsAsFactors = F, sep = "\t")
height[height==""] <- NA 
FOO<-data.frame(do.call('rbind', strsplit(as.character(height$X1_height), '@', fixed=TRUE)))
height <- cbind(height, FOO)
height$X1 <- as.numeric(height$X1)
height$X1[height$X1 == 4] <- 7
height$X1[height$X1 == 1] <- 4
height$X1[height$X1 == 2] <- 5
height$X1[height$X1 == 3] <- 6
height$X2 <- as.numeric(height$X2)
height$X2[height$X2 == 1] <- 0
height$X2[height$X2 == 2] <- 1
height$X2[height$X2 == 3] <- 100
height$X2[height$X2 == 4] <- 110
height$X2[height$X2 == 5] <- 2
height$X2[height$X2 == 6] <- 3
height$X2[height$X2 == 7] <- 4
height$X2[height$X2 == 8] <- 5
height$X2[height$X2 == 9] <- 6
height$X2[height$X2 == 10] <- 7
height$X2[height$X2 == 11] <- 8
height$X2[height$X2 == 12] <- 9
height$X2[height$X2 == 13] <- NA
height$X2[height$X2 == 14] <- NA
height$X2[height$X2 == 100] <- 10
height$X2[height$X2 == 110] <- 11

height$inches<- (height$X1 * 12) + (height$X2)
height$cm <- height$inches *2.54

height_phen <- height[,c(1,15)]
# still needs to be mapped w/ long form IDs

write.table(height_phen, "/users/hannah/Desktop/HONORS_THESIS/height_phen.ped", row.names=F, quote=F)

