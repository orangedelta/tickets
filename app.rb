#Required:
require "./decks/web.rb"
require "syro"
require "ohm"

App = Syro.new(Web) do
  #inlogscherm:
  get do
    render("index")
  end
  
  post do
    user_name = req.params['user_name']
    pwd = req.params['user_pass']
  end
  #factuur:
  on"factuur" do
    
     #Maak een class en id aan:
     class Factuur
        @@id = 0
        @@day = 0
        @@month = 0
        @@year = 0
        @@price = 0
        
        def setId
          @@id += 1
        end
        
        def setDay(day)
          @@day = day
        end
        
        def setMonth(month)
          @@month = month
        end
        
        def setYear(year)
          @@year = year
        end
        
        def setPrice(price)
          @@price = price
        end
        
        def initialize
          setId
        end
        
        def getId
          return @@id.to_s
        end
        
        def getDate
          return @@day + ":" + @@month + ":" + @@year
        end
        
        def getPrice
          return @@price
        end
      end
     
     $usr = req.params['user_name']
     matthijs = Factuur.new
     
      render("factuur", reciever: $usr, id: matthijs.getId)
  end
  
  #flowchart:
  on "flowchart" do
    render("flowchart")
  end
end