class ReportsMailer < ApplicationMailer
  def by_author(start_date, end_date, email)
    @start_date = Time.parse(start_date)
    @end_date = Time.parse(end_date)
    mail to: email, subject: 'Analitical report.', from: 'st027196@student.spbu.ru'
  end
end
