library(shiny)
library(leaflet)


ui <- fluidPage(titlePanel("MyRapidKL Train Scheduler"),
                
                navbarPage(
                  tabPanel("Main",
                           sidebarPanel(width = 3,
                    helpText(h3("Find the best path to your destination!")),
                    br(),
                    selectInput("current", label = "Select your current station", 
                                c("Gombak","Taman Melati","Wangsa Maju","Sri Rampai","Setiawangsa",
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
                                  "Batu 11 Cheras","Bukit Dukung","Sungai Jernih","Stadium Kajang","Kajang")),
                    
                    selectInput("destination", label = "Select your destination", 
                                c("Gombak","Taman Melati","Wangsa Maju","Sri Rampai","Setiawangsa",
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
                                  "Batu 11 Cheras","Bukit Dukung","Sungai Jernih","Stadium Kajang","Kajang")),
                    submitButton("Search"),
                    br(),
                    helpText(h3("Legends")),
                    helpText(span(h5("KJL : LRT Kelana Jaya Line"),style="color:pink")),
                    helpText(span(h5("SBK : MRT Kajang Line"),style="color:green")),
                    helpText(h5(">> : Interchange Station"))
                  ),
                  mainPanel(width = 6,
                    navbarPage(h2(" "), id = "main",
                               tabPanel(h4("Route search"),
                               h2("Route"),span(h4("Route to reach your destination"),style="color:grey"), span(textOutput("route"), style="color:green"),
                               h2("Estimated time"),span(h4("Estimated time to reach your destination (minutes)"),style="color:grey"), span(textOutput("time"), style="color:green"),
                               h2("Fare"),span(h4("Fare to reach your destination (RM)"),style="color:grey"), span(textOutput("fare"), style="color:green")),
                               
                               tabPanel(h4("Integrated Transit Map"),
                                        img(src = "https://myrapid.com.my/wp-content/uploads/2021/07/28102018_Transit-Map.png", height = 865, width = 610)
                                        ),
                               tabPanel(h4("More info"),
                                        h3("More info on RapidKL"),
                                        a(href = "https://myrapid.com.my/","Click here",target = "_blank"),
                                        br(),
                                        br() 
                                        ),
                               tabPanel(h4("Documentation"),
                                        h4("This Shiny application, called MyRapidKL Scheduler helps user to plan their journey when they plan
                                           to travel by taking public transport."),
                                        br(),
                                        span(h4("DISCLAIMER : THIS APPLICATION CAN ONLY BE USED FOR LRT KELANA JAYA LINE AND MRT
                                                KAJANG LINE."),style="color:red"),
                                        br(),
                                        h4("In the first tab panel *Route search*, user can enter his/her starting location and his/her desired
                                           destination in the left panel. The main panel will show the shortest route, the estimated time and
                                           the fare for the trip."),
                                        h4("As indicated in the legends, >> means that user need to change station either LRT to MRT or MRT to LRT."),
                                        br(),
                                        h4("Provided in the right panel, the route map for LRT KELANA JAYA LINE AND MRT KAJANG LINE."),
                                        h4("Legends in the left panel, indicate pink for LRT KELANA JAYA LINE AND green for MRT KAJANG LINE."),
                                        br(),
                                        h4("In second tab panel *Integrated Transit Map*, user can view the Klang Valley Integrated Transit Map."),
                                        br(),
                                        h4("In third tab panel *More info*, user can click on the (Click here) button to get more info on RapidKL.
                                           It will redirect user to RapidKL website."),
                               )
                               )
                               ),
                  sidebarPanel(width = 3,
                               splitLayout(cellWidths = c("50%", "50%"),
                    img(src = "https://i0.wp.com/www.klsentral.info/wp-content/uploads/2018/02/line_kelana-jaya.png?resize=553%2C4064&ssl=1", width = 170),
                    img(src = "https://i0.wp.com/www.klsentral.info/wp-content/uploads/2018/02/line-sungai-buloh-kajang.png?resize=710%2C3443&ssl=1", width = 170)
                  )
                  )
                               
                )
                )
)