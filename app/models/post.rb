class Post < ActiveRecord::Base
  attr_accessible :content, :from, :till, :vacation, :vacation_type
end
