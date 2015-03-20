module ApplicationHelper
<<<<<<< HEAD
  #Return a title on a per-page basis
  def title
    base_title= "Ruby on Rails Tutorial Sample App"
=======
  
  #Return a title on a per-page basis
  def title
    base_title = "Ruby on Rails Tutorial Sample App"
>>>>>>> filling-in-layout
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
end
