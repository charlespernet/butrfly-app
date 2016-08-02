class FamilyDecorator < Draper::Decorator
  delegate_all

  def prefered_gender_display
    I18n.t(prefered_gender).capitalize
  end

  def family_name
    "Famille #{name}"
  end

  def children_ages
    return "non communiqué" unless children_age_from and children_age_to
    "De #{children_age_from} à #{children_age_to} ans"
  end

  def children_number_display
    return "non communiqué" unless children_number
    "#{children_number}"
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
