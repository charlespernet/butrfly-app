class Country < ActiveRecord::Base
  def name_translated
    I18n.t(code, scope: "country")
  end
end
