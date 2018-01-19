Player_yr_summary<- function(gender, yr, Pname){
  yr_<- as.numeric(yr)
  if(gender == "1"){file_name_tmp<- "atp"}
  else{file_name_tmp<- "wta"}
  data_tmp1<- read.csv(paste("data/",file_name_tmp, "_matches_", yr, ".csv", sep=""))
  data_simplified<- data_tmp1[,c("tourney_name","tourney_date","winner_name","winner_ioc","winner_seed","winner_age","winner_rank","loser_name","score" ,"round")]
  index_match_win_tmp<- agrep(Pname, as.character(data_simplified[,"winner_name"]), max.distance = 0.3)
  index_match_lose_tmp<- agrep(Pname, as.character(data_simplified[,"loser_name"]), max.distance = 0.3)
  if(length(c(index_match_win_tmp, index_match_lose_tmp))>0)
  {
    Message_tmp<- paste("You search for player ", Pname, "'s ", yr, " summary", sep="")
    index_final_tmp<- which(data_simplified[index_match_win_tmp, "round"]=="F")
    data_final_matched<- data_simplified[index_match_win_tmp, ][index_final_tmp, ]
    data_non_final_matched<- data_simplified[index_match_lose_tmp, ]
    data_player_combined<- rbind(data_final_matched, data_non_final_matched)
    data_player_combined_ordered<- data_player_combined[order(data_player_combined[,"tourney_date"]), ]
    data_summary<- data_player_combined_ordered[,c("winner_name","winner_ioc","winner_seed","winner_rank","tourney_name","tourney_date","round","loser_name","score")]
    data_summary<- data_summary[order(data_summary[,"round"]), ]
    colnames(data_summary)<- c("Name", "Country", "Seed", "Ranking", "Tourney Name", "Date","Round", "Def.","Score")
    name_unique<- unique(c(as.character(data_final_matched[,"winner_name"]), as.character(data_non_final_matched[,"loser_name"])))
    if(length(name_unique) > 1){Message_tmp<- paste(Message_tmp, ", but we found ", length(name_unique), " tennis players partially matched you searched for.", sep="")}
    return(list(text1 = Message_tmp, summary1 = data_summary))
  }
  else
  {
    Message_tmp<- paste("Sorry, we couldn't (partially) match the player's name you searched: " , Pname,
                        ", or there is no title record of this player, Please try different name", sep="")
    data_summary<- c("")
    return(list(text1 = Message_tmp, summary = data_summary))
  }
}


