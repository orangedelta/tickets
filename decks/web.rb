require "mote"
require "syro"

class Web < Syro::Deck
  include Mote::Helpers

  def view(template)
    sprintf("views/%s.html", template)
  end

  def partial(template, params = {})
    mote(view(template), params)
  end

  def render(template, params = {})
    res.html partial("layout",
      content: partial(template, params))
  end
end