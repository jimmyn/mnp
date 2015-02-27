class Contact < MailForm::Base
  include ActiveadminSettings::Helpers
  attribute :subject
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message,   :validate => true

  def headers
    {
        :subject => "Сообщение с сайта mnp-stroy.ru",
        :to => settings_value('Email'),
        :from => %("#{name}" <#{email}>)
    }
  end
end