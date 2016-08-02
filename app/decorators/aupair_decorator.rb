class AupairDecorator < Draper::Decorator
  delegate_all

  def age_display
    return "non communiqué" unless age
    "#{age} ans"
  end

  def gender_display
    I18n.t(gender).capitalize
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def dispo_from_display
    return "non communiqué" unless dispo_from
    dispo_from.strftime("%B %Y")
  end

  def sport_display
    if gender == :male and sports == true
      return "Sportif"
    elsif gender == :female and sports == true
      return "Sportive"
    else
      return "non communiqué"
    end
  end

  def musician_display
    if gender == :male
      return "Musicien"
    elsif gender == :female
      return "Musicienne"
    else
      return "Musicien"
    end
  end

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
