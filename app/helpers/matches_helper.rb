module MatchesHelper

  def match_status(status)
    if status == "Open"
      status = "Close"
    else
      status = "Open"
    end
  end

end
