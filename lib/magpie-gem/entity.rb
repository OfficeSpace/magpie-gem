# Magpie class that corresponds with a real database backed model
module Magpie
  class Entity < Magpie::Base
    class << self
      alias_method :config, :tap
    end

    validates_presence_of :feed_provider, :id

    attr_accessor :feed_provider, :id, :model, :changes, :action

    def load_from_model(m)
      self.model = m
      self.feed_provider = m.feed_provider
      self.id = m.feed_id.to_s
      self.changes = {}

      self
    end

    def model_attributes_base
      {
        feed_id: id.to_s,
        feed_provider: feed_provider,
      }
    end
  end


end
