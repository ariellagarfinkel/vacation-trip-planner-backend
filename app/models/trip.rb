class Trip < ApplicationRecord
  belongs_to :user
  has_many :places

  def friendly_start_time
    start_time.strftime("%D")
  end

  def friendly_end_time
    end_time.strftime("%D")
  end
  
end
