class Fanforce
  def self.env(&block)
    if !block.nil?
      @env = block
    elsif !@env.nil?
      @env.call
    else
      {}
    end
  end
  require_relative 'fanforce/_base'
  require_relative 'fanforce/version'
end

