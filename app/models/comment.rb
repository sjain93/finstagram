class Comment < ActiveRecord::Base
    belongs_to :user
    belongs_to :finstagram_post
    
    validates_presence_of :text, :finstagram_post, :user
    
end