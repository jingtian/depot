class Role < ActiveRecord::Base
  
 has_and_belongs_to_many :users

 validates_presence_of   :name, :description
 
#  ROLE_TYPES = [
#  # Displayed         stored in db
#  [ "Admin" ,          "admin" ],
#  [ "Keyword viewer" , "keyword viewer" ],
#  [ "Keyword manager" , "keyword manager" ],
#  [ "Link viewrer" , "link viewer" ],
#  [ "Data check" , "data check" ]
#]


  def self.get_roles  # get all the roles from db and render them to page
    Role.all.map{|r| [r.name.humanize, r.name]}
   #Role.all.map {|r| [r.name]}
  end

  def self.get_role_list  # get all the roles from db and render them to page
    Role.all.map {|r| [r.name]}
  end
  
end
