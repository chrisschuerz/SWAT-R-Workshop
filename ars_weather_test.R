library(pasta)
library(tidyverse)



file_path <- "/home/christoph/Documents/ars_weather"

ars_url <- "https://www.ars.usda.gov/ARSUserFiles/30980000/riesel/climate"

weather_files <- 2008:2012%&%"hrly.txt"

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

ars_clim <- map_dfr(weather_files, ~read_table(file = url(ars_url%//%.x), 
                                               skip = 3, col_names = F)) %>% 
  set_names(tbl_header)

save_