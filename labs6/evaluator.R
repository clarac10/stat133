last_name  <- "Chun"
first_name <- "Clara"
birthday   <- "10/30/1993"

CheckEvaluation <- function(x, y, z) {
  system_info <- Sys.info()
  wd <- getwd()
  return(c(last_name  = x, 
           first_name = y, 
           birthday   = z,
           directory  = wd,
           time = Sys.time(),
           system_info))
}

my_data <- CheckEvaluation(last_name, first_name, birthday)

save(my_data, file = "evaluator.rda")
