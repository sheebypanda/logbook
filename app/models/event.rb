class Event < ApplicationRecord
  belongs_to :user
  belongs_to :si
  belongs_to :priority
  belongs_to :category
  belongs_to :subject

  def start_time
    self.start_date
  end

  def end_time
    self.end_date
  end

end
