class SamplesMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.samples_mailer.select.subject
  #
  def sample_form
    @name = params[:name]
    @sample_order_id = params[:sample_order_id]

    mail to: params[:email], subject: "Get FREE Samples"
  end
end
