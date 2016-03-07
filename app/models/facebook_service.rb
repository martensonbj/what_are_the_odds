class FacebookService
  attr_reader :connection, :current_user

  def initialize(current_user)
    @current_user = current_user
    @connection = Faraday.new("https://graph.facebook.com/")
  end

  def friends
    parse(connection.get("/#{current_user.uid}/friends", access_token: current_user.token))
  end

  def email
    email = parse(connection.get("/#{current_user.uid}", access_token: current_user.token))
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end
