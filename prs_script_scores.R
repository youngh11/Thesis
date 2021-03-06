### script to generate files w/ id and risk score, and id all scores and risk score

all_data <- read.table("/users/hannah/Desktop/HONORS_THESIS/tttt.txt", header=F, sep="\t", stringsAsFactors=F)
q14 <- all_data[all_data$V3==14,]
q15 <- all_data[all_data$V3==15,]
q16 <- all_data[all_data$V3==16,]
q17 <- all_data[all_data$V3==17,]
q18 <- all_data[all_data$V3==18,]
q19 <- all_data[all_data$V3==19,]
q20 <- all_data[all_data$V3==20,]
q21 <- all_data[all_data$V3==21,]
q22 <- all_data[all_data$V3==22,]
q23 <- all_data[all_data$V3==23,]

q14_score <- data.frame(id=q14$V1, ifelse(q14$V4=="Certainly applies", 1, 0))
q15_score <- data.frame(id=q15$V1, ifelse(q15$V4=="Certainly applies", 1, 0))
q16_score <- data.frame(id=q16$V1, ifelse(q16$V4=="Certainly applies", 1, 0))
q17_score <- data.frame(id=q17$V1, ifelse(q17$V4=="Certainly applies", 1, 0))
q18_score <- data.frame(id=q18$V1, ifelse(q18$V4=="Certainly applies", 1, 0))
q19_score <- data.frame(id=q19$V1, ifelse(q19$V4=="Certainly applies", 1, 0))
q20_score <- data.frame(id=q20$V1, ifelse(q20$V4=="Certainly applies", 1, 0))
q21_score <- data.frame(id=q21$V1, ifelse(q21$V4=="Certainly applies", 1, 0))
q22_score <- data.frame(id=q22$V1, ifelse(q22$V4=="Certainly applies", 1, 0))
q23_score <- data.frame(id=q23$V1, ifelse(q23$V4=="Certainly applies", 1, 0))

names(q14_score) [2] <- "q14_score"
names(q15_score) [2] <- "q15_score"
names(q16_score) [2] <- "q16_score"
names(q17_score) [2] <- "q17_score"
names(q18_score) [2] <- "q18_score"
names(q19_score) [2] <- "q19_score"
names(q20_score) [2] <- "q20_score"
names(q21_score) [2] <- "q21_score"
names(q22_score) [2] <- "q22_score"
names(q23_score) [2] <- "q23_score"

q14_scores <- data.frame(id=q14$V1, certain_score=q14_score$q14_score, ifelse(q14$V4=="Possibly applies", 0.5, 0))
q15_scores <- data.frame(id=q15$V1, certain_score=q15_score$q15_score, ifelse(q15$V4=="Possibly applies", 0.5, 0))
q16_scores <- data.frame(id=q16$V1, certain_score=q16_score$q16_score, ifelse(q16$V4=="Possibly applies", 0.5, 0))
q17_scores <- data.frame(id=q17$V1, certain_score=q17_score$q17_score, ifelse(q17$V4=="Possibly applies", 0.5, 0))
q18_scores <- data.frame(id=q18$V1, certain_score=q18_score$q18_score, ifelse(q18$V4=="Possibly applies", 0.5, 0))
q19_scores <- data.frame(id=q19$V1, certain_score=q19_score$q19_score, ifelse(q19$V4=="Possibly applies", 0.5, 0))
q20_scores <- data.frame(id=q20$V1, certain_score=q20_score$q20_score, ifelse(q20$V4=="Possibly applies", 0.5, 0))
q21_scores <- data.frame(id=q21$V1, certain_score=q21_score$q21_score, ifelse(q21$V4=="Possibly applies", 0.5, 0))
q22_scores <- data.frame(id=q22$V1, certain_score=q22_score$q22_score, ifelse(q22$V4=="Possibly applies", 0.5, 0))
q23_scores <- data.frame(id=q23$V1, certain_score=q23_score$q23_score, ifelse(q23$V4=="Possibly applies", 0.5, 0))

names(q14_scores) [3] <- "q14_poss"
names(q15_scores) [3] <- "q15_poss"
names(q16_scores) [3] <- "q16_poss"
names(q17_scores) [3] <- "q17_poss"
names(q18_scores) [3] <- "q18_poss"
names(q19_scores) [3] <- "q19_poss"
names(q20_scores) [3] <- "q20_poss"
names(q21_scores) [3] <- "q21_poss"
names(q22_scores) [3] <- "q22_poss"
names(q23_scores) [3] <- "q23_poss"

library(plyr)
dfs <- list(q14_scores, q15_scores, q16_scores, q17_scores, q18_scores, q19_scores, q20_scores, q21_scores, q22_scores, q23_scores)
all_scores <- join_all(dfs, by="id")

sums <- rowSums(all_scores[,-1])
total <- cbind(all_scores, sums)

write.table(total, "/users/hannah/Desktop/HONORS_THESIS/ids_scores_sums_poss_and_cert.txt", row.names=F, quote=FALSE)
just_sums <- total[,c(1,12)]
write.table(just_sums, "/users/hannah/Desktop/HONORS_THESIS/ids_sums_poss_and_cert.txt", row.names=F, quote=FALSE)