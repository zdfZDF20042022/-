library(haven)

rm(list=ls())
getwd()
setwd("E:\\安徽财经大学\\统计软件\\CSS\\DTA")
#dir
CSS2006<-haven::read_dta("CSS2006.dta")
View(CSS2006)
library(tidyverse)
CSS2006 %>% names()
CSS2006 %>% sjlabelled::get_label() %>% write.csv('lab_dat06.csv')
library(dplyr)

CSS2006 <- CSS2006 %>%
  select(qs2a, qa01, qa02, qa08a, qd13_1, qd13_2, qd12_3) %>%
  rename(
    '省份' = qs2a,
    '性别' = qa01,
    '年龄' = qa02,
    '受教育程度(在读/已读)' = qa08a,
  ) %>%
  mutate(
    '年份' = 2006,
    就业失业问题 = ifelse(qd13_1 == 1 | qd13_2 == 1 | qd12_3 == 1, 1, 0)
  ) %>%
  select(-qd13_1, -qd13_2, -qd12_3)  # 删除不需要的变量
library(mice)
md.pattern(CSS2006)
summary(CSS2006)
View(CSS2006)