Tourney_search<- function(gender, yr){
  if(gender == "1"){file_name_tmp<- "atp"}
  else{file_name_tmp<- "wta"}
  data_tmp1<- read.csv(paste("data/",file_name_tmp, "_matches_", yr, ".csv", sep=""))
  return(unique(as.character(data_tmp1[,"tourney_name"])))
}