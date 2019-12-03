class PasswordsController < Devise::PasswordsController
  layout 'new_admin', only: [:new, :create]
end
