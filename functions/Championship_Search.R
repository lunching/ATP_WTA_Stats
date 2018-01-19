Championshipe_search<- function(gender, yr, tourney){
  yr_<- as.numeric(yr)
  if(gender == "1"){file_name_tmp<- "atp"}
  else{file_name_tmp<- "wta"}
  data_tmp1<- read.csv(paste("data/",file_name_tmp, "_matches_", yr, ".csv", sep=""))
  data_simplified<- data_tmp1[,c("tourney_name","tourney_date","winner_name","winner_ioc","winner_seed","winner_age","winner_rank","loser_name","loser_rank","score" ,"round")]
  index_final_tmp<- which(as.character(data_simplified[,"round"]) == "F")
  data_final_tmp1<- data_simplified[index_final_tmp, ]
  #data_final_ordered<- data_final_tmp1[order(data_final_tmp1[,"tourney_date"]), ]
  data_summary_tmp<- data_final_tmp1[,c("tourney_name","tourney_date","winner_name","winner_ioc","winner_seed","winner_rank","loser_name","loser_rank","score")]
  index_tourney<- match(tourney, data_summary_tmp[,"tourney_name"])
  data_summary<- data_summary_tmp[index_tourney, ]
  data_summary<- data_summary[order(data_summary[,"tourney_date"]), ]
  colnames(data_summary)<- c("Tourney Name", "Date", "Name", "Country", "Seed", "Ranking", "Def.", "Loser Ranking","Score")
  return(data_summary)
}

