## Start-of-school-year Matriculations (2009-2019)
### Data Source and Relevance
The data used is summarised matriculation data calculated from the AMIE survey conducted by INEC. This is an annual survey which collects census data on the number of students and teachers at each Ecuadorian primary and secondary institution. Code books and methodology documents are available in this [online repository](https://educacion.gob.ec/amie/)

These data sets are updated every year, so it possible that links stop working. The relevant data sets (tabulados por sostenimiento) can be downloaded from this website: https://educacion.gob.ec/indice-de-tabulados/.

### Download
The following code downloads the data. 
```{r echo = TRUE, results = 'hide', message = FALSE}
## Download Data
links <- list("https://educacion.gob.ec/wp-content/plugins/download-monitor/download.php?id=15555", "https://educacion.gob.ec/wp-content/plugins/download-monitor/download.php?id=15556", "https://educacion.gob.ec/wp-content/plugins/download-monitor/download.php?id=15557", "https://educacion.gob.ec/wp-content/plugins/download-monitor/download.php?id=15558")
dfl <- lapply(links, read.xlsx, sheet = 5, startRow = 12)
addcol <- function(x){
        y <- c("fiscal", "particular", "municipal", "fiscomisional")
        for(i in 1:length(x)){x[[i]]$type <- y[i]}
        return(x)}
dfl1 <- addcol(dfl)
dfl2 <- lapply(dfl1, pivot_longer, cols = "2009-2010.Inicio":"2019-2020.Inicio",
               names_to = "schoolyear", values_to = "no.students")
df <- do.call(rbind, dfl2) %>%
        rename("province" = Provincia)
```

## Start-of-school-year Matriculations Zone 3 (2020)
### Data Source and Relevance
This data summarises the matriculation data in four Ecuadorian provinces at the start of the 2020-2021 school year. The data was taken from a news update by the Ecuadorian Ministry of education. I assume this data to be as accurate as the AMIE tabulated data; this is unlikely to hold true, but it's the best public data available. As the small table was presented as an image, I tabulated it myself in excel and uploaded it into the GitHub repository. Both forms of the data are accessed as follows:  

* Download the excel file [here](https://github.com/MaxAantjes/Exp-Analysis-Dropout-EDU-EC-COVID19/blob/master/dfzone3.csv)  
* Read the news article [here](https://educacion.gob.ec/374-908-estudiantes-inician-un-nuevo-ano-lectivo-en-la-zona-3/)  

### Download
The following code downloads the data. 
```{r}
sdf <- read.csv("dfzone3.csv") %>%
        mutate(schoolyear = "2020-2021.Inicio") %>%
        pivot_longer(cols = "fiscal":"municipal", names_to = "type",
                     values_to = "no.students")
```

## Population projections by year
### Data Source and Relevance
The population projects were calculated by INEC based on the 2010 population census. The methodology and code book is available in the relevant (government repository)[https://www.ecuadorencifras.gob.ec/proyecciones-poblacionales/].

### Download
The following code downloads the data.
```{r}
url <- "https://www.ecuadorencifras.gob.ec/documentos/web-inec/Poblacion_y_Demografia/Proyecciones_Poblacionales/PROYECCION_POR_EDADES_PROVINCIAS_2010-2020_Y_NACIONAL_2010-2020.xlsx"
sheets <- 2:12
years <- 2010:2020
read.mult.xlsx <- function(x, y, z){
  q <- list()
  for(i in 1:length(y)){
        q[[i]] <- read.xlsx(x, sheet = y[i], startRow = 8)
        q[[i]]$year = z[i]}
  q <- do.call(rbind, q)
  return(q)}
tdf <- read.mult.xlsx(url, sheets, years)
```
