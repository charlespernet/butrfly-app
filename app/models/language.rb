class Language < ActiveRecord::Base
  def name_translated
    I18n.t(code, scope: "language")
  end
end
