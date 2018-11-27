## Course outline

### Session 1: Basic data analysis in *R* 
###### (8:30 am to 12:00 pm)

The goal of the morning session is to give a short introduction into the basics of *R* and the *Rstudio* environment. At what level we will start this introduction strongly depends on the background and programming experience of the participants. Due to the limited time please only expect a very short introduction. The larger share of the morning session is reserved for our small practical example where we analyze a small data set and visualize our results. In *R* there are usually many ways to perform the same task (e.g. *base* plotting or *ggplot*). I will demonstrate here was is often called the *"tidy"* way of data analysis in *R*.

###### The morning in bullets:
- R basics (depending on the background of the participants)
- Basic data analysis using the tidyverse
- Data analysis and visualization using the ‘tidyverse’ based on a practical example.



### Session 2: SWAT simulation, calibration, and sensitivity analysis in *R* 
###### (1:00 pm to 4:30pm)
The goal of the afternoon session is that you get familiar with the `SWATplusR` package. First we will load a demo SWAT project and explore the functionality of the `SWATplusR` package. The essential part of this session will be to learn how to utilize the package functionality and combine it with other *R* packages. In a small case study we will execute the SWAT model with different model parametrizations, extract simulation results, evaluate and visualize the simulation results (using the packages `HydroGOF` and the `tidyverse`), perform a parameter sensitivity analysis (employing packages such as `sensitivity` or `fast`), and perform a first model calibration.

###### The afternoon in bullets:
- Getting to know the SWATplusR package
- Parameter sampling (e.g. with `lhs`) and SWAT model execution
- SWAT model parameter sensitivity analysis (employing *R* packages such as `sensitivity` or `fast`, maybe own functions)
- A simple model evaluation/calibration example
- Visualization of the model results



## First steps
### Installation
#### base *R*
In order to execute *R* code you require base R installed on your computer. Please download the latest *R* version from the Comprehensive R Archive Network (CRAN) for your operating system: https://cran.r-project.org/
