# Create parameter set for all 38 "relevant" parameters

par_set <- readRDS("F:/thinkpad_manual/181118_individual_folders/par_wb.rds")

par_names <- names(par_set)

par_bound <- list(c(-15,10), c(0.02, 0.16), c(10, 150), c(1, 180), c(10, 150), c(1, 20), c(0, 1), c(0, 1), c(10, 1000), c(0.5, 20), 
                  c(0.04, 1), c(0.04, 1), c(0, 5), c(-50, 50), c(-50, 50), c(-50, 50), c(-50, 50), c(0.05, 24), c(0, 10), c(0, 10),
                  c(0, 0.3), c(-25, 25), c(-25, 25), c(0.025, 0.15), c(0, 250), c(0, 1), c(-25, 25), c(-25, 25), c(-25, 25), 
                  c(-25, 25), c(-25, 25), c(0, 1), c(0, 1), c(0, 1), c(0, 500), c(0, 5000), c(0.02, 0.2), c(0, 500))

par_wb <- randomLHS(5000, 38) %>% 
  as_tibble(.) %>% 
  map2_df(., par_bound, ~ (.x*(.y[2] - .y[1]) + .y[1])) %>% 
  set_names(., par_names)

q_cal <- run_swatplus(project_path = proj_path, 
                      output = list(q_out = define_output(file = "channel",
                                                          variable = "flo_out",
                                                          unit = 1)),
                      parameter = par_wb,
                      start_date = "1993-01-01",
                      end_date = "2005-12-31",
                      years_skip = 3,
                      n_thread = 4)

q_out <- q_cal$simulation$q_out %>% 
  select(starts_with("run_")) %>% 
  map_dfc(., ~ .x/8.64)

nse_cal <- q_out %>% 
  map_dbl(., ~ NSE(.x, q_obs$q_out))

ggplot() + 
  geom_line(data = q_cal$simulation$q_out,
            aes(x = date, y = run_1161/8.64), col = "tomato3") + 
  geom_line(data = q_obs,
            aes(x = date, y = q_out), col = "steelblue3")
