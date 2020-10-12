# CovidChile
Dashboard for analysis of Chilean Covid19 data

A live version is being constantly updated at [shinyapps.io](https://millacurafa.shinyapps.io/covidchile/)

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

You need to install an R working environment and some libraries

```
#R libraries that need to be installed
#You can install via CRAN


install.packages("tidyverse")
install.packages("lubridate")
install.packages("janitor")
install.packages("shiny")
install.packages("shinythemes")
install.packages(scales)
install.packages(readxl)

```

### Installing

A step by step series of examples that tell you how to get a development env running

```
git clone https://github.com/millacurafa/CovidChile

or via SSH

git clone git@github.com:millacurafa/CovidChile.git
```

and open the Rproject shiny_app.Rproj

```
cd CovidChile/
open ui.R
```

You can now use the tidyverse library to edit data pulls

## Running the tests

Explain how to run the automated tests for this system

```
You can check a local version at http://127.0.0.1:4009 after proper deployment
```

### Break down into end to end tests


```
MVP for Covid 19 data analysis
```

### And coding style tests

```
Code is written using the camelCase standard for shiny apps.
```

## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* R studio
* Shiny

## Contributing

Please read [CONTRIBUTING.md](https://github.com/millacurafa/CovidChile/blob/master/CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [Git](https://git-scm.com/) for versioning. For the versions available, see the [tags on this repository](https://github.com/millacurafa/CovidChile/tags). 

## Authors


See the list of [contributors](https://github.com/millacurafa/CovidChile/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Thanks to Felipe Millacura for creating this project




