module Blinkee
  def self.enable_actionpack
    return if ActionView::Base.instance_methods.include_method? :blinkee
    ActionView::Base.send :include, ViewHelpers
  end
  
  module ViewHelpers
    def blinkee(content_or_options_with_block = nil, options = nil, escape = true, &block)
      content_tag(:blink, content_or_options_with_block, options, escape, &block)
    end
  end
end

if defined? Rails
  Blinkee.enable_actionpack if defined? ActionController
end
