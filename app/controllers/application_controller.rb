class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def self.helper_method(*meths)
    meths.flatten!
    self._helper_methods += meths

    meths.each do |meth|
      _helpers.class_eval <<-ruby_eval, __FILE__, __LINE__ + 1
        def #{meth}(*args, &blk)                               # def current_user(*args, &blk)
          controller.send(%(#{meth}), *args, &blk)             #   controller.send(:current_user, *args, &blk)
        end                                                    # end
      ruby_eval
    end
  end

  def self.hide_action(*args)
  end

  include Clearance::Controller

end
