class User < Sequel::Model

  def to_s
    self.login
  end

end
