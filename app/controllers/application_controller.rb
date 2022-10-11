class ApplicationController < ActionController::Base
  def blank_square_form

    render({ :template => "calculation_templates/square_form.html.erb"})
  end

   def calculate_square

    @num = params.fetch("elephant").to_f
    @square_of_num = @num ** 2
    render({ :template => "calculation_templates/square_results.html.erb"})
  end


  def payment_results
    @apr = params.fetch("apr").to_f
    @num_years = params.fetch("num_years").to_f
    @principal = params.fetch("principal").to_f
    
    @n = @num_years * -12
    # @apr = apr
    @r = @apr / 100.0 / 12

    @numerator = @r * @principal

    @denominator = 1 -(1 + @r)**(@n)

   @monthly_payment = (@numerator / @denominator)
   @apr = sprintf("%0.04f",@apr)
    render({ :template => "calculation_templates/payment_results.html.erb"})
  end
  def payment_calculation
  # payment form build goes here.
  #   @apr = params.fetch("apr").to_f
  #   @num_years = params.fetch("num_years").to_f
  #   @principal = params.fetch("principal").to_f
    
  #   n = @num_years.to_f * 12
  #   apr = apr.to_f / 100
  #   @r = apr.to_f / 12

  #   @numerator = @r * @principal.to_f
    
  #   @denominator = 1 -(1 + @r)**(-n)

  #  @monthly_payment = (@numerator / @denominator)
    # render({ :template => "calculation_templates/payment_results.html.erb"})

   render({ :template => "calculation_templates/payment_new.html.erb"})
  end

  def calculate_random

    @lower = params.fetch("user_min").to_f
    @upper = params.fetch("user_max").to_f
    @result = rand(@lower..@upper)
    render({ :template => "calculation_templates/random_results.html.erb"})
  end
  def random_form

    render({ :template => "calculation_templates/random_new.html.erb"})
  end

  def square_root_form

    # @num = params.fetch('user_num').to_f
    render({ :template => "calculation_templates/square_root_new.html.erb"})

  end

  def square_root_results
    @num = params.fetch("user_num").to_f
    @sqrt = Math.sqrt(@num).to_f
    render({ :template => "calculation_templates/square_root_results.html.erb"})
   
  end
end
