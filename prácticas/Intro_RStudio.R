###Introducción a RStudio

###Mis primeros comandos
###Diapositiva What are R commands?

getwd() #Muestra en consola el directorio de trabajo con el que estamos trabajando
setwd() #Cambia el directorio de trabajo, fijando en la ruta que se indica ("PATH")
ls() #Muestra el listado de objetos que tenemos en el directorio de trabajo
rm() # Borra el objeto indicado del directorio de trabajo

#Ayuda con programas o funciones 
help("matrix") 

#Si no conozco el nombre exacto del comando

apropos("matr")

#ayuda a buscar funciones dentro de los paquetes 
help.search("clustering")

#Mi primer objeto 
primer_obj<- 1
first_value <- 1 

second_value <-2.5
class(second_value) #preguntar o verificar el tipo o clase de un objeto.
class(second_value)
a <- TRUE

class(a)

text <- "Hola"
class(text)


##Operadores

5+5
5-2
variable43<-(34-1)
variable44<-34-1
variable43
variable43
12*12
12/2
3**4
7%%2
(mi_variable<-2^5)
(tu_variable<- (5*3)+2)
#Vectores
mi_vector <- c(2,6,3)
"mi_vector"
str(mi_vector)

(mi_vector2 <-c((5+5+3)*2,
                "mi operacion",
                "esta cool"))

otro_vector <- c(2,6,'3')
vector_coercion <- c('a', TRUE)
str(vector_coercion)

round(3.85,digits=1)

#data frames
primer_data<- data.frame(Edad=sample(1:100,6)).Nombre =c("Juan","Jose","Rafa","Petra","Luisa","Arturo")
                      
                      
                      
TablaSeg<- data.frame(Ed=sample(1:100,6), 
                      Nombre =c("Juan","Jose","Rafa","Petra","Luisa","Arturo"), 
                      Casado = sample(c(TRUE,FALSE),6,replace = TRUE))
TablaSeg
View(TablaSeg)
my_data2 <- data.frame(nombre = c("caroll","Gis","Elias","Fer","Yael", 'James',"Melissa","Barbara","Santiago","luna","Marisol","Karina","Atziri","Ivan","Zuriel","Miguel"), 
                       estatura = c(1.58,1.54,1.72,1.59,1.78, 1.68, 1.55,1.68,1.80,1.52,1.73,1.65,1.57,1.72,1.69,1.78))


#renglones y columnas para consultar o renombrar 
rownames(my_data2)
colnames(my_data2)
rownames(my_data2)
colnames(my_data2)
my_data2
 
View(my_data2)

row.names(my_data2)<- c("Alum1")

row.names(my_data2)<- c("Alum1", "Alum2","Alum3", "Alum4", "Alum5",
                        "Alum6","Alum7","Alum8","Alum9","Alum10",
                        "Alum11","Alum12","Alum13","Alum14","Alum15","Alum16")
View(my_data2)

my_data2[1,2]
my_data2[1,1]
my_data2[2,1]
my_data2[8,2]



#funciones en dataframes
dim(my_data2)
nrow(my_data2)
ncol(my_data2)
head(my_data2)
tail(my_data2,2)

colSums(my_data2[1])
colSums(my_data2[2])
colSums(my_data2["estatura"])
which(my_data2$estatura==1.72)
head(my_data2,3)
tail(my_data2)
tail(my_data2,2)
which(my_data2$estatura==1.72)

which(my_data2$nombre=='Karina')

#crear un directorio
getwd()
setwd("/Users/guadallupeayala/GDL/")
getwd()
dir.create("Resultados")
ls()

#Como escrbir un tabla

write.table(my_data2,here("Resultados/Tabla2.txt"), sep = "\t",quote = TRUE)

###leer tablas
 

data_clase<-read.table(here("Resultados/Tabla.txt"), header = TRUE, row.names = 1, sep =",")
data_clase<-read.table(("Resultados/Tabla.txt"), header = TRUE, row.names = 1, sep =",")

read
dim(data_estatura) 



####Dia 2
### Instalar paqueterias

#install.packages("dplyr")
#install.packages("ggplot2")
#install.packages("tidyverse")

#Cargar paqueterias 
library(dplyr)
library(dplyr)
library(ggplot2)
library(tidyverse)

my_data2 %>% 
  mutate(Genero = c("F", "F","M", "F", "M", "M","F","F","M","F","F", "F","F","M","M", "M")) %>% 
  mutate(Edad = c(21,20, 23, 19,23,20,21,23,18,16,21,22,19,22,21,19))

prueba = prueba %>% 
  mutate(Ciudad = c("Guadalajara", "Zapopan", "Tlaquepaque", "Zapopan", "Guadalajara", "Guadalajara")) %>%  
  mutate(Helado =c('Chocolate', 'Vainilla', 'Fresa' ,'Banana', 'Cereza', 'Maracuya'))%>%
  mutate(Cabello = c('red', 'chocolate', 'cyan', 'darkorchid', 'purple', 'black'))
prueba %>% select(nombre, Ciudad)

prueba %>% 
  filter(Ciudad=="Guadalajara")
#Mi primer grafica 

ggplot(my_data2, aes(x = nombre, y = estatura)) +
  geom_bar(stat = "identity") 

ggplot(my_data2, aes(x = nombre, y = estatura))+
  geom_bar(stat = "identity", fill = "red", width = 0.5) +
  labs(title = "Estaturas de los alumnos", 
       x = "Alumnos", 
       y = "Estatura (metros)") +
  theme_minimal()

ggplot(data_estatura, aes(x = estatura, y = nombre, label = nombre)) +
  geom_point(color = "salmon", size = 3) +
  geom_text(hjust = -0.1, size = 3) +
  labs(title = "Estaturas de los alumnos", x = "Estatura (metros)", y = "Alumnos") +
  theme_dark()


###Ejemplo %% Pipe

altos <- data_estatura %>%
  filter(estatura > 1.70)
altos


ggplot(altos, aes(x = nombre, y = estatura)) +
  geom_point(color = "darkblue", size = 3)


####data precargados
iris
# Visualizando la informacion de iris
help("iris")        # Obtener la descripcion del conjunto iris
dim(iris)         # Obtener numero de renglones y columnas.
names(iris)        # Obtener nombres de las columnas
View(iris)        # Visualizando los datos de iris


#Graficando x=longitud del Sepalo vs y=longitud del petalo en una geometria de puntos
################################

ggplot(iris,aes(x=Sepal.Length, y=Petal.Lenth))+
  geom_point()

ggplot(iris,aes(x= Sepal.Length, y= Petal.Length))+
  geom_point()


# Colocando color constante "blue" 
# x = longitud sepalo,
# y = longitud petalo

ggplot(iris,aes(x=Sepal.Length,y=Petal.Length))+
  geom_point(color="blue")


#color depende a una variable
ggplot(iris,aes(x=Sepal.Length,y=Petal.Length, color = Species))+
  geom_point()


## Otro Ejemplo 1
# Asociando:
# x = longitud sepalo
# y = longitud petalo
# color = especie
# tamaño = ancho sepalo
# transparencia = ancho petalo
ggplot(iris,aes(x=Sepal.Length,
                y=Petal.Length,
                color=Species,
                size=Sepal.Width,
                alpha=Petal.Width)) + 
  geom_point()+
  geom_smooth(method = "lm")
#Guardar mi ultima imagen de ggplot 
ggsave("/Users/guadallupeayala/GDL/Resultados/ultima.jpg", width = 7,height = 5, dpi = 300)

## Otro Ejemplo 2
# Asociando:
# x = longitud sepalo
# y = longitud petalo
# color = constante
# tamaño = constante
# transparencia = ancho petalo
# forma = especie
ggplot(iris,aes(x=Sepal.Length, # asociados a una variable
                y=Petal.Length,
                shape=Species,
                alpha=Petal.Width)) + 
  geom_point(size=2.5, color="magenta") #aqui van si son constantes 


# Otro ejemplo
# Colocando:
# Titulo principal
# Subtitulo
# Titulo eje x 
# Titulo eje y
g1<- ggplot(iris,aes(x=Sepal.Length,
                     y=Petal.Length,
                     color=Species)) + 
  geom_point() +
  labs(title = "Relación del petalo y el sepalo",
       x="Longitud del sepalo (cm)",
       y="Longitud del petalo (cm)",
       subtitle="Datos iris")

# Modificando aspectos de la grafica
# Tamaño de letra del titulo y posicion

ggplot(iris,aes(x=Sepal.Length,
                y=Petal.Length,
                color=Species)) + 
  geom_point() +
  labs(title = "Relación del petalo y el sepalo",
       x="Longitud del sepalo (cm)",
       y="Longitud del petalo (cm)",
       subtitle="Datos iris")+
  theme(plot.title = element_text(color= "blue",
                                  face = "bold",
                                  size=16,
                                  hjust = 0.5),
        plot.subtitle = element_text((face="italic")),
        hjust =1)


# Boxplot con datos de ToothGrowth
# x = suplemento(supp)
# y = longitud (len)
# relleno de las cajas = supp
################################
ToothGrowth
dim(ToothGrowth)
names(ToothGrowth)

ggplot(ToothGrowth,aes(x =supp, y = len, fill= supp))+
  geom_boxplot(color= "white")

ToothGrowth %>% ggplot(aes(x= supp, y = len, fill= supp))+ 
  geom_boxplot(color= "black")

#geometrias
ggplot(ToothGrowth, aes(x=len)) +
  geom_histogram(fill="steelblue",color="white", bins = 5)

c_imagen <- ggplot(ToothGrowth,aes(x= supp, y =len, fill=supp))+
  geom_boxplot(color ="grey10")+
  geom_jitter(size=0.5, color ="red")+
  labs(title = "Tamaño de dientes vs suplemento")

# Salvando la ultima imagen generada con ggsave
#####################
# Revisando nuevamente si estoy en el directorio de trabajo

ggsave("miGrafica.pdf") 
#indicandole la ruta, se le puede indicar la resolución, aqui guarda la ultima
ggsave("Resultados/ultima.jpg", width = 7,height = 5, dpi = 300)

#al asignarle una variable 
ggsave("Resultados/grafica1.tiff", plot = g2,width = 7,height = 5, dpi = 300)


