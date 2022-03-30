# == Schema Information
#
# Table name: users
#
#  id    :bigint           not null, primary key
#  users :string           not null
#  name  :string           not null
#  email :string           not null
#
class User < ApplicationRecord
validates :name, :email, presence: true

    

end
