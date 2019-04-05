#Установка пакета devtools, позволяет устанавливать и другие собирать пакеты 
install.packages("devtools")

#Установка пакета Артема Клевцова,позволяет собирать данные с Google Analytics
install.packages("RGA") 

#Открываем пакет для сбора данных с Google Analytics
library(RGA)

#Входим в рабочую директорию (папка на ваш выбор, где будет храниться данные о авторизации)
setwd("C:\\Program1\\R_my_scripts\\lesson") 

#Аутентификация в Google Analytics
tokens <- authorize(                          
  client.id = "648967740380-a9npp8v4bgqg02fbbhi05re7cco8a6hc.apps.googleusercontent.com",   #Ваш идентификатор клиента
  client.secret = "BpBR-VhgCJJgcTS3E2oLmiY2"                                                #Ваш секрет клиента
)

#Собираем нужные данные с Google Analytics, названия запроса в Power Bi - sessions 
sessions <- RGA::get_ga(   profileId     = "ga:188332750",
                           start.date    = "360daysAgo",
                           end.date      = "yesterday",
                           metrics       = "ga:sessions",
                           dimensions    = "ga:date,ga:city,ga:browser,ga:deviceCategory",
                      #    segment       = "gaid::K9_YokHTTpS3AAcpfLjHnw",  
                      #    filters       =  "ga:deviceCategory==mobile;ga:sessions>10",
                           samplingLevel = "HIGHER_PRECISION",
                           sort          = "-ga:sessions",
                      #    fetch.by      = "day", 
                           token         =  tokens)

#Собираем нужные данные с Google Analytics, названия запроса в Power Bi - revenue 
revenue <- RGA::get_ga(profileId     = "ga:188332750",
                       start.date    = "30daysAgo",
                       end.date      = "yesterday",
                       metrics       = "ga:users,ga:transactions,ga:transactionRevenue",
                       dimensions    = "ga:date,ga:source,ga:medium,ga:city",
                       samplingLevel = "HIGHER_PRECISION",
                       sort          = "-ga:transactionRevenue",
                       token         =  tokens)













