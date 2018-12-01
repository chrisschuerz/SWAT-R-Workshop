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
The goal of the afternoon session is that you get familiar with the `SWATplusR` package. First we will load a demo SWAT project and explore the functionality of the `SWATplusR` package. The essential part of this session will be to learn how to utilize the package functionality and combine it with other *R* packages. In a small case study we will execute the SWAT model with different model parametrizations, extract simulation results, evaluate and visualize the simulation results (using the packages `hydroGOF` and the `tidyverse`), perform a parameter sensitivity analysis (employing packages such as `sensitivity` or `fast`), and perform a first model calibration.

###### The afternoon in bullets:
- Getting to know the SWATplusR package
- Parameter sampling (e.g. with `lhs`) and SWAT model execution
- SWAT model parameter sensitivity analysis (employing *R* packages such as `sensitivity` or `fast`, maybe own functions)
- A simple model evaluation/calibration example
- Visualization of the model results



## First steps
### Installation
#### base *R*
In order to execute *R* code you require base R installed on your computer. Please download the latest *R* version from the Comprehensive R Archive Network (CRAN) for your operating system: https://cran.r-project.org/. 
If you run linux on your computer I recommend an installation via the terminal. For Ubuntu bionic beaver (and maybe other recent debian distributions) this is a helpful link: https://linuxize.com/post/how-to-install-r-on-ubuntu-18-04/

#### Rstudio
In theory you can write your *R* code in any text editor and execute it in various ways. Probably the most established integrated development environment (IDE) for *R* is Rstudio. It is my preferred IDE to write and execute *R* code. It provides plenty of functionality for *R* package devlopment, manage your *R* projects and much more.
Please go to this website and install Rstudio for your operating system: https://www.rstudio.com/products/rstudio/download/#download.

#### R packages
After installing base *R* and Rstudio you should be able to run Rstudio. Rstudio should automatically recognize the *R* version you just installed as your default one. 
The console of Rstudio should show something like this on startup:
``` r
#> R version 3.5.1 (2018-07-02) -- "Feather Spray"
#> Copyright (C) 2018 The R Foundation for Statistical Computing
#> Platform: x86_64-pc-linux-gnu (64-bit)
#> 
#> R is free software and comes with ABSOLUTELY NO WARRANTY.
#> You are welcome to redistribute it under certain conditions.
#> Type 'license()' or 'licence()' for distribution details.
#> 
#>   Natural language support but running in an English locale
#> 
#> R is a collaborative project with many contributors.
#> Type 'contributors()' for more information and
#> 'citation()' on how to cite R or R packages in publications.
#> 
#> Type 'demo()' for some demos, 'help()' for on-line help, or
#> 'help.start()' for an HTML browser interface to help.
#> Type 'q()' to quit R.
```

The real strength of *R* is the large number of packages that are easily accesible from CRAN and that provide code solutions to most of the programming and data analysis problems you probably can think of :). To install an *R* package from CRAN you simply execute the function `install.package("name_of_the_package")`. During this short workshop we require functionality of various different *R* packages. Please copy the following lines of code in to the console of Rstudio (the window that shows: `>`) and press enter to run each line of code.

``` r
install.packages(c("devtools", "tidyverse", "lubridate", "lhs", "hydroGOF", "sensitivity", "fast", "sf"))
```

Especially installing the `sf` package can cause troubles on Linux, as it requires `gdal` (that maybe comes with QGIS). If you cannot resolve the troubles, please contact me. In general it is not essential to have the `sf` package installed. We might use it at the end of the course to visualize some maps.

If *R* or any of the required packages are allready installed on your computer, but you have not updated them for a while I recommend to do so. I did not check any downwards compability of my *R* packages yet nor did I check if the code I will present works with older versions of *R* or any of the packages. So please check if your computer is up to date :). 

#### SWATplusR
The `SWATplusR` package is not yet available from CRAN. It is however available from one of my github repositories. The *R* package `devtools` provides an easy way to install an *R* package directly from github. As it is still under development, I try at the moment to avoid to leave it out in the open, accessible by everybody. In the future it will be freely accessible of course. For the workshop however, you can install the package by running the following line of code

``` r
devtools::install_github("chrisschuerz/SWATplusR", auth_token = "e10028d297e76e4667342fc4a592baa35e198519")
```

### Troubleshooting
Good luck with the installation! If you encounter any problems I recommend to post an issue in the issue section of this github repository: https://github.com/chrisschuerz/SWAT-R-Workshop/issues. Thus, others that encounter the same problems can read if a solution was already posted. This hopefully reduces the number of emails I have to answer.
