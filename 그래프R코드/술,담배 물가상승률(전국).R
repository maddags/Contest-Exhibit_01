library(xlsx)
library(ggplot2)

favorite_total_index <- read.xlsx("~/동아리/공모전/가공데이터/excel/소비자물가지수_담배,술_연별_전국.xlsx",
                                  1,
                                  colIndex = 1:4,
                                  rowIndex = 1:96,
                                  header = T,
                                  encoding = "UTF-8")

favorite_total_index

ggplot(data = favorite_total_index) +
  geom_bar(aes(x=연도, y = 상승률, fill = 항목), stat = "identity", position = 'dodge', colour = "black") +
  ggtitle("술,담배 물가상승률(전국)") +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(legend.title = element_text(hjust = 0.5))+
  ylab("상승률(%)")+
  theme(axis.title.y = element_text(size = 11))
