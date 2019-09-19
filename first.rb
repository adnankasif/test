class User < ActiveRecord::Base
    enum status: [ :active, :inactive, :pending ]
end