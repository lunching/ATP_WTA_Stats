Title_Search_fun<- function(gender, yr_range_start, yr_range_end, Pname){
  yr_tmp<- c(as.numeric(yr_range_start): as.numeric(yr_range_end))
  if(gender == "1"){file_name_tmp<- "atp"}
  else{file_name_tmp<- "wta"}
  data_final<- c()
  yr_tmp2<- c()
  #   collect the data for all finals
    for(i in 1: length(yr_tmp))
    {
      data_tmp1<- read.csv(paste("data/",file_name_tmp, "_matches_", yr_tmp[i], ".csv", sep=""))
      data_simplified<- data_tmp1[,c("tourney_name","tourney_date","winner_name","winner_ioc","winner_seed","winner_age","winner_rank", "round")]
      index_final_tmp<- which(as.character(data_simplified[,"round"]) == "F")
      yr_tmp2<- c(yr_tmp2, rep(yr_tmp[i], length(index_final_tmp)))
      data_final_tmp1<- data_simplified[index_final_tmp, ]  
      data_final<- rbind(data_final, data_final_tmp1)
    }
  index_match_tmp<- agrep(Pname, as.character(data_final[,"winner_name"]), max.distance = 0.3)
    if(length(index_match_tmp)>0)
    {
      Message_tmp<- paste("You search for player ", Pname, sep="")
      data_final_matched<- data_final[index_match_tmp, ]
      data_final_matched_ordered<- data_final_matched[order(data_final_matched[,"tourney_date"]), ]
      yr_tmp3<- yr_tmp2[index_match_tmp]
      data_summary<- cbind(data_final_matched_ordered[, "winner_name"],yr_tmp3, data_final_matched_ordered[,c("tourney_name", "tourney_date", "winner_ioc", "winner_seed", "winner_age", "winner_rank")])
      data_summary[,"winner_age"]<- signif(data_summary[,"winner_age"], 3)
      colnames(data_summary)<- c("Name", "Year", "Tourney Name", "Date", "Country", "Seed", "Age", "Ranking")
      name_unique<- unique(as.character(data_summary[,"Name"]))
        if(length(name_unique) > 1)
        {Message_tmp<- paste("You search for player ", Pname,", but we found ", length(name_unique), " tennis players partially matched you searched for.", sep="")}
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





