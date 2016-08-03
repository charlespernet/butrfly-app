class Language < ActiveRecord::Base
  def label_select
    I18n.t(code)
  end
end
