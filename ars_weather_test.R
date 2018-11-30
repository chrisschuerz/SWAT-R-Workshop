library(pasta)
library(tidyverse)



file_path <- "/home/christoph/Documents/ars_weather"

ars_url <- "https://www.ars.usda.gov/ARSUserFiles/30980000/riesel/climate"

weather_files <- 2010:2012%&%"hrly.txt"

tbl_header <- c("year",        # yyyy
                "day",         # jdn
                "hour",        # (h)hmm
                "t_air_ave",   # degC
                "t_air_max",   # degC 
                "t_air_min",   # degC 
                "rh_max",      # %
                "rh_min",      # %
                "p_vap_ave",   # kPa
                "sr_tot",      # kJ m^-2
                "wnd_v_ave",   # m s^-1
                "wnd_v_max",   # m s^-1
                "wnd_dir_ave", # deg
                "pr_tot",      # mm
                "t_sol_ave",   # degC
                "t_sol_max",   # degC
                "t_sol_min"    # degC
                )

ars_clim <- map_dfr(weather_files, ~read_table(file = url(ars_url%//%.x), guess_max =  10000,
                                               skip = 3, col_names = F)) %>% 
  set_names(tbl_header)

saveRDS(ars_clim, "/home/christoph/Documents/projects/SWAT-R-Workshop/ars_clim.rds")

y_jdn <- function(y, jdn) {
  date <- ymd(y%//%"01"%//%"01")
  yday(date) <- jdn
  return(date)
}

y_jdn_h <- function(y, jdn, h) {
  date <- ymd_h(y%//%"01"%//%"01"%&&%h)
  yday(date) <- jdn
  return(date)
}

ars_clim_1 <- ars_clim %>% 
  filter(!is.na(year), year > 2000) %>% 
  mutate(date = y_jdn(year, day)) %>% 
  mutate(rh_ave = (rh_max + rh_min)/2) %>% 
  group_by(year, day) %>% 
  summarize(pr = sum(pr_tot), t_min = min(t_air_ave))
  
a <- read.table(file = url(ars_url%//%weather_files[1]), sep = "", skip = 3)
