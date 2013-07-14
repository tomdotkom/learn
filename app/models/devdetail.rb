class Devdetail < ActiveRecord::Base
  belongs_to :medevlp
  attr_accessible :devenvt, :devlang, :devtool
  
end
