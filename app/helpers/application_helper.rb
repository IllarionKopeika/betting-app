module ApplicationHelper
  def format_datetime(datetime)
    months = %w[янв. февр. март апр. май июнь июль авг. сент. окт. нояб. дек.]
    "#{datetime.day} #{months[datetime.month - 1]} #{datetime.year} #{datetime.strftime('%H:%M')}"
  end
end
