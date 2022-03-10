
ind_to_dyad <- function(data, CoupleID, Distinguisher, labels, Between_dyad_vars = NULL){
  
  # If no variables except couple ID not being suffixed
  if(is.null(Between_dyad_vars) == T){Between_dyad_vars = CoupleID}
  
  # Split
  tempA <- data[data[,Distinguisher] == unique(data[,Distinguisher])[1],]
  tempB <- data[data[,Distinguisher] == unique(data[,Distinguisher])[2],]
  
  # Label
  ta <- as.data.frame(tempA[,!names(tempA) %in% c(CoupleID, Between_dyad_vars)])
  tb <- as.data.frame(tempA[,names(tempA) %in% c(CoupleID, Between_dyad_vars)])
  colnames(ta) <- paste(colnames(ta), labels[1], sep = "_")
  colnames(tb) <- unique(c(CoupleID, Between_dyad_vars))
  tempA <- cbind(tb,ta)
  
  ta <- as.data.frame(tempB[,!names(tempB) %in% c(CoupleID, Between_dyad_vars)])
  tb <- as.data.frame(tempB[,names(tempB) %in% c(CoupleID, Between_dyad_vars)])
  colnames(ta) <- paste(colnames(ta), labels[2], sep = "_")
  colnames(tb) <- unique(c(CoupleID, Between_dyad_vars))
  tempB <- cbind(tb,ta)
  
  rm(ta,tb)
  print(paste(unique(data[,Distinguisher])[1], "is being labelled", labels[1]))
  print(paste(unique(data[,Distinguisher])[2], "is being labelled", labels[2]))
  
  out <- merge(tempA, tempB, by = CoupleID)
  return(out)
}


ind_to_pair <- function(data, CoupleID, labels = c("A", "P"), Between_dyad_vars = NULL){
  
  
  
  
  # Split
  tempA <- data[!duplicated(data[,"CoupleID"]),]
  tempB <- data[duplicated(data[,"CoupleID"]),]
  
  # Label
  ta <- as.data.frame(tempA[,!names(tempA) %in% c(CoupleID, Between_dyad_vars)])
  tb <- as.data.frame(tempA[,names(tempA) %in% c(CoupleID, Between_dyad_vars)])
  colnames(ta) <- paste(colnames(ta), labels[1], sep = "_")
  colnames(tb) <- unique(c(CoupleID, Between_dyad_vars))
  tempA <- cbind(tb,ta)
  
  ta <- as.data.frame(tempB[,!names(tempB) %in% c(CoupleID, Between_dyad_vars)])
  tb <- as.data.frame(tempB[,names(tempB) %in% c(CoupleID, Between_dyad_vars)])
  colnames(ta) <- paste(colnames(ta), labels[2], sep = "_")
  colnames(tb) <- unique(c(CoupleID, Between_dyad_vars))
  tempB <- cbind(tb,ta)
  
  rm(ta,tb)
  
  
  out <- merge(tempA, tempB, by = CoupleID)
  
  ####
  
  # Split
  tempA <- data[data[,Distinguisher] == unique(data[,Distinguisher])[1],]
  tempB <- data[data[,Distinguisher] == unique(data[,Distinguisher])[2],]
  
  # Label
  ta <- as.data.frame(tempA[,!names(tempA) %in% c(CoupleID, Between_dyad_vars)])
  tb <- as.data.frame(tempA[,names(tempA) %in% c(CoupleID, Between_dyad_vars)])
  colnames(ta) <- paste(colnames(ta), labels[2], sep = "_")
  colnames(tb) <- unique(c(CoupleID, Between_dyad_vars))
  tempA <- cbind(tb,ta)
  
  ta <- as.data.frame(tempB[,!names(tempB) %in% c(CoupleID, Between_dyad_vars)])
  tb <- as.data.frame(tempB[,names(tempB) %in% c(CoupleID, Between_dyad_vars)])
  colnames(ta) <- paste(colnames(ta), labels[1], sep = "_")
  colnames(tb) <- unique(c(CoupleID, Between_dyad_vars))
  tempB <- cbind(tb,ta)
  
  rm(ta,tb)
  
  
  out2 <- merge(tempA, tempB, by = CoupleID)
  
  out <- rbind(out,out2)
  return(out)
}