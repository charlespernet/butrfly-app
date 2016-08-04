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
    l(dispo_from, :format => '%B %Y')
  end

  def sport_display
    female? ? "Sportive" : "Sportif"
  end

  def musician_display
    female? ? "Musicienne" : "Musicien"
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
