# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  config.wrappers :bootstrap, :tag => 'div', :class => 'control-group form-group', :error_class => 'error has-error' do |b|
#    b.use :html5
    b.use :placeholder

    # DEPRECATION
    #b.use :label, class: 'control-label col-lg-2'
    b.use :label, :wrap_with => {:class=>"control-label col-lg-2"}

    b.wrapper :tag => 'div', :class => 'controls col-lg-10' do |ba|
      ba.use :input
      ba.use :error, :wrap_with => { :tag => 'span', :class => 'help-inline has-error' }
      ba.use :hint,  :wrap_with => { :tag => 'p', :class => 'help-block' }
#      ba.wrapper :tag => 'input', type: 'checkbox', :class => 'form-control' do |input|
#      end
    end
  end

  config.wrappers :prepend, :tag => 'div', :class => "control-group", :error_class => 'error' do |b|
#    b.use :html5
    b.use :placeholder
    b.use :label
    b.wrapper :tag => 'div', :class => 'controls' do |input|
      input.wrapper :tag => 'div', :class => 'input-prepend' do |prepend|
        prepend.use :input
      end
      input.use :hint,  :wrap_with => { :tag => 'span', :class => 'help-block' }
      input.use :error, :wrap_with => { :tag => 'span', :class => 'help-inline' }
    end
  end

  config.wrappers :append, :tag => 'div', :class => "control-group", :error_class => 'error' do |b|
#    b.use :html5
    b.use :placeholder
    b.use :label
    b.wrapper :tag => 'div', :class => 'controls' do |input|
      input.wrapper :tag => 'div', :class => 'input-append' do |append|
        append.use :input
      end
      input.use :hint,  :wrap_with => { :tag => 'span', :class => 'help-block' }
      input.use :error, :wrap_with => { :tag => 'span', :class => 'help-inline' }
    end
  end

  # Wrappers for forms and inputs using the Twitter Bootstrap toolkit.
  # Check the Bootstrap docs (http://twitter.github.com/bootstrap)
  # to learn about the different styles for forms and inputs,
  # buttons and other elements.
  config.default_wrapper = :bootstrap
end
