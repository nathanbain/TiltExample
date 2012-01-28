require 'tilt'  
  
contacts = {  
    "Email" => "nathan_bain@hotmail.com",  
    "Twitter" => "@nathanbain",  
    "Facebook" => "nathan.bain",  
    "Skype"  => "nathanbainitv" }  
  
context = Object.new  
def context.title  
    "Contact Details"  
end  
  
template = Tilt.new("templates/contact_list.erb")  
  
File.open "output/contact_me.html", "w" do |file|  
    file.write template.render(context) { 
      Tilt.new("templates/sites.erb").render(Object.new, contacts: contacts)
    }  
end 
