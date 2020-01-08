class Labeling < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :label, optional: true
end
