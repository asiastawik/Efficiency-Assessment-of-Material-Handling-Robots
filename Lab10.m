clc
clear
close all

data = load("Robot_data.mat").data;
result = DEA_CCR(data,2,2);
