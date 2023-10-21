library(shiny)
library(dplyr)
library(leaflet)
library(readr)
library(ggplot2)

shinyServer(function(input, output){
  stationList <- c("Gombak","Taman Melati","Wangsa Maju","Sri Rampai","Setiawangsa",
                  "Jelatek","Dato' Keramat","Damai","Ampang Park","KLCC",
                  "Kampung Baru","Dang Wangi","Masjid Jamek (KJL)","Pasar Seni (KJL)",
                  "KL Sentral (KJL)","Bangsar","Abdullah Hukum","Kerinchi","Universiti",
                  "Taman Jaya","Asia Jaya","Taman Paramount","Taman Bahagia","Kelana Jaya",
                  "Lembah Subang","Ara Damansara","Glenmarie","Subang Jaya","SS 15","SS 18",
                  "USJ 7 (KJL)","Taipan","Wawasan","USJ 21","Alam Megah","Subang Alam",
                  "Putra Heights (KJL)","Sungai Buloh","Kampung Selamat","Kwasa Damansara",
                  "Kwasa Sentral","Kota Damansara","Surian","Mutiara Damansara","Bandar Utama",
                  "TTDI","Phileo Damansara","Pusat Bandar Damansara","Semantan","Muzium Negara",
                  "Pasar Seni (SBK)","Merdeka","Bukit Bintang","Tun Razak Exchange (TRX)",
                  "Cochrane","Maluri (SBK)","Taman Pertama","Taman Midah","Taman Mutiara",
                  "Taman Connaught","Taman Suntex","Sri Raya","Bandar Tun Hussein Onn",
                  "Batu 11 Cheras","Bukit Dukung","Sungai Jernih","Stadium Kajang","Kajang")
  
  EstimatedTime <- read_csv("./Time.csv")
  EstimatedTime <- data.frame(EstimatedTime, row.names = 1)
  colnames(EstimatedTime) <- stationList
  
  Routes <- read_csv("./Route.csv")
  Routes <- data.frame(Routes, row.names = 1)
  colnames(Routes) <- stationList
  
  Fare <- read_csv("./Fare.csv")
  Fare <- data.frame(Fare, row.names = 1)
  colnames(Fare) <- stationList
  
  output$time <- renderText({
    EstimatedTime[input$current,input$destination]
  })
  
  output$route <- renderText({
    Routes[input$current,input$destination]
  })
  
  output$fare <- renderText({
    Fare[input$current,input$destination]
  })
  
})