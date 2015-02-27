class ContactsController < ApplicationController

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      gflash :success => "Спасибо, сообщение отправлено успешно. Мы свяжемся с вами в ближайшее время"
      redirect_to contacts_path
    else
      render action: 'index'
    end
  end
end
