class User < Sequel::Model

  def subscribed?
    !subscription.nil?
  end

  def to_s
    self.login
  end

end
