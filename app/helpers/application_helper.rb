module ApplicationHelper
  def active(contr)
    # params[:controller] == contr ? "active" : contr
    params[:controller] == contr ? "active" :""
  end
end
