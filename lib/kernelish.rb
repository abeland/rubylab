# Add methods which you want to be 'global' here.
# This module will be included on the Object class in a special
# initializer defined in config/initializers/object.rb. Since
# virtually all objects derive from Object, any methods you define
# here will be available in all contexts -- static classes, instance
# methods, and even irb itself (in irb, self is 'main', an instance of Object).
#
# BE VERY CAREFUL WITH THIS. IF YOU ADD SOME CLOWNY METHOD IN HERE IT IS DEFINED
# EVERYWHERE.

module Kernelish
  private

  def invariant(expr, message = nil)
    raise StandardError.new(message.nil? ? 'Failed invariant' : message) unless expr
  end
end
