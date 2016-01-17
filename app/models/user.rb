class User < ActiveRecord::Base
  include Clearance::User

  has_many :projects, dependent: :destroy
end
