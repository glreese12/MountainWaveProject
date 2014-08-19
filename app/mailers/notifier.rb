class Notifier < ActionMailer::Base
  helper :events # include the events helper, if needed
  
  default :from => "flms@digitalglobe.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.event_created.subject
  #
  def event_created(event)
    @event = event
    @categories = Category.all
    
    @event.categories.each {|cat|
      if @categories.include?(cat)
        if FileTest.exists?("#{Rails.root}/public/images/#{cat.name.split.join.camelize}-top.png") &&
          FileTest.exists?("#{Rails.root}/public/images/#{cat.name.split.join.camelize}-bottom.png")
            attachments.inline["upper.png"] = File.read("#{Rails.root}/public/images/#{cat.name.split.join.camelize}-top.png") 
            attachments.inline["lower.png"] = File.read("#{Rails.root}/public/images/#{cat.name.split.join.camelize}-bottom.png")
        else
            attachments.inline["upper.png"] = File.read("#{Rails.root}/public/images/HumanInterest-top.png") 
            attachments.inline["lower.png"] = File.read("#{Rails.root}/public/images/HumanInterest-bottom.png")
        end
      else
        attachments.inline["upper.png"] = File.read("#{Rails.root}/public/images/HumanInterest-top.png") 
        attachments.inline["lower.png"] = File.read("#{Rails.root}/public/images/HumanInterest-bottom.png")
      end
    }
    mail :to => DEFAULT_MAIL_TO,
          :bcc => Subscriber.all.map(&:email), :subject => "FirstLook Activation: #{event.name}"
  end
  
  def notify(event)
    @event = event
    @categories = Category.all    
    @event.categories.each {|cat|
      if @categories.include?(cat)
        attachments.inline["upper.png"] = File.read("#{Rails.root}/public/images/#{cat.name.split.join.camelize}-top.png") 
        attachments.inline["lower.png"] = File.read("#{Rails.root}/public/images/#{cat.name.split.join.camelize}-bottom.png")
      else
        attachments.inline["upper.png"] = File.read("#{Rails.root}/public/images/HumanInterest-top.png") 
        attachments.inline["lower.png"] = File.read("#{Rails.root}/public/images/HumanInterest-bottom.png")
      end
    }
    
   

    attachments.inline["icon.png"] = File.read("#{Rails.public_path}" + "#{event.icon.thumbnail.url(:thumb,false)}")
    
    mail :to => DEFAULT_MAIL_TO,
          :bcc => Subscriber.all.map(&:email), :subject => "FirstLook Activation: #{event.name}"
    
  end
  
end
