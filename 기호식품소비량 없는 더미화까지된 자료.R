New_data_no_h07_5aq1 <- New_data_before_na
New_data_no_h07_5aq1 <- New_data_no_h07_5aq1[,-11]

New_data_no_h07_5aq1 <- New_data_no_h07_5aq1[complete.cases(New_data_no_h07_5aq1),]

New_data_no_h07_5aq1 <- dummy_cols(New_data_no_h07_5aq1, select_columns = "h_g6") ##기준변수 없어서 분석 시 1개 변수 제외하고 분서해야함
New_data_no_h07_5aq1 <- dummy_cols(New_data_no_h07_5aq1, select_columns = "h_reg5") ##기준변수 없어서 분석 시 1개 변수 제외하고 분서해야함
New_data_no_h07_5aq1 <- dummy_cols(New_data_no_h07_5aq1, select_columns = "h06_1")
New_data_no_h07_5aq1 <- dummy_cols(New_data_no_h07_5aq1, select_columns = "h_eco4")


New_data_no_h07_5aq1 <- New_data_no_h07_5aq1[,-9:-10]
New_data_no_h07_5aq1 <- New_data_no_h07_5aq1[,-9:-10]
New_data_no_h07_5aq1 <- New_data_no_h07_5aq1[,-16]
New_data_no_h07_5aq1 <- New_data_no_h07_5aq1[,-21]
New_data_no_h07_5aq1 <- New_data_no_h07_5aq1[,-26]
New_data_no_h07_5aq1 <- New_data_no_h07_5aq1[,-34]

write.csv(New_data_no_h07_5aq1,"기호식품소비량 없는 더미화까지된 자료.csv")
