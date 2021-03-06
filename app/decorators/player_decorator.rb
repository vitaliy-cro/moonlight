class PlayerDecorator < Draper::Decorator
  delegate_all

  include Rails.application.routes.url_helpers

  def current_location_path
    current_location = self.location

    if current_location.cell?
      h.link_to "Back to #{current_location.name}", cell_path(current_location.slug), class: 'btn btn-success'
    else
      h.link_to "Back to #{current_location.name}", location_path(current_location.slug), class: 'btn btn-success'
    end
  end

  def current_hp_get
    "#{current_hp} / #{hp} HP"
  end

  def current_exp_get
    "EXP: #{exp} / #{exp_next}"
  end
end
