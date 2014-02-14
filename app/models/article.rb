class Article < Sequel::Model

  def to_s
    self.login
  end

end
