# frozen_string_literal: true

class Policies::UserRequired
  def self.call(_obj, _args, ctx)
    ctx[:current_user].present?
  end
end
