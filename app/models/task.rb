# == Schema Information
#
# Table name: tasks
#
#  id         :bigint           not null, primary key
#  content    :string           not null
#  status     :string           default("not_yet_started"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_tasks_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Task < ApplicationRecord
  belongs_to :user
  validates :content, presence: true

  scope :by_updated, -> { order(updated_at: :desc)}

  enum status: { not_yet_started: "not_yet_started", in_progress: "in_progress", completed: "completed" }
end
