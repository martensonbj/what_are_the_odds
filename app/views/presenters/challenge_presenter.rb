require 'delegate'

class ChallengePresenter < SimpleDelegator

  attr_reader :challenge_ready

  def initialize
    @challenge = Challenge.find(params[:id])
  end

  def challenge_ready
    <% if @challenge.challenger_guess && @challenge.challengee_guess %>
      <h4>Odds Are 1 in <%= @challenge.odds %></h4>
      <h4 class="challenge-ready-text">CHALLENGE READY!</h4>
      <h3 class="start-countdown btn btn-default"> START COUNTDOWN! <span class="count"></span> </h3>
    <% end %>
  end

end
