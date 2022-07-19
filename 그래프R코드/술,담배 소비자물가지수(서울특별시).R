library(xlsx)
library(ggplot2)

favorite_seoul_index <- read.xlsx("~/동아리/공모전/가공데이터/excel/소비자물가지수_담배.술_연별_서울특별시.xlsx",
                                  1,
                                  colIndex = 1:4,
                                  rowIndex = 1:96,
                                  header = T,
                                  encoding = "UTF-8")

favorite_seoul_index

#version 1

ggplot(data = favorite_seoul_index)+
  geom_line(aes(x = 연도, y=소비자물가지수, color = 항목))+
  ggtitle("술,담배 소비자물가지수(서울특별시)")+
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(legend.title = element_text(hjust = 0.5))+
  ylab("소비자물가지수 \n (2015 = 100)")+
  theme(axis.title.y = element_text(size = 9))


#############################################################
#version 2

ggplot(data = favorite_seoul_index) +
  geom_bar(aes(x=연도, y = 소비자물가지수, fill = 항목), stat = "identity", position = 'dodge', colour = "black") +
  ggtitle("술,담배 소비자물가지수(서울특별시)") +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(legend.title = element_text(hjust = 0.5))+
  ylab("소비자물가지수 \n (2015 = 100)")+
  theme(axis.title.y = element_text(size = 9))
