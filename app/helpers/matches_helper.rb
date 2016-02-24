module MatchesHelper

  def match_status(status)
    if status == "Open"
      status = "Close"
    elsif status == "Closed"
      status = "Finish"
    else
      status = "Open"
    end
  end

end
