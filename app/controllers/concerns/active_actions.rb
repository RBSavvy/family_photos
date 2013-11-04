module ActiveActions
  extend ActiveSupport::Concern

  included do
    helper_method :active_family?
    helper_method :active_action?
  end

  def active_family? family
    "active" if current_family.present? && current_family.id == family.id
  end


  def active_action? action
    "active" if @active_action.present? && @active_action == action
  end

  def set_active_action action
    @active_action = action
  end
end