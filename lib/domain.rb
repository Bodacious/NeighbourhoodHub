# Define shared behaviour for module interface
module Domain
  extend ActiveSupport::Concern

  module ClassMethods
    def table_name_prefix
      "#{name.to_s.underscore}_"
    end
  end
end
