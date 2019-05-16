class Event < ApplicationRecord
  belongs_to :user
  belongs_to :si
  belongs_to :priority
  belongs_to :category
  belongs_to :subject
end
