class ApplicationController < ActionController::Base
  def blank_square_form

    render({ :template => "calculation_templates/square_form.html.erb"})
  end

   def calculate_square

    @num = params.fetch("elephant").to_f
    @square_of_num = @num ** 2
    render({ :template => "calculation_templates/square_results.html.erb"})
  end
  def payment_calculation
    apr = params.fetch("apr")
    number_of_years = params.fetch("number_of_years")
    principal = params.fetch("principal")

    n = number_of_years.to_i * 12
    apr = apr.to_f / 100
    r = apr / 12

    numerator = r * principal.to_f
    denominator = 1 -(1 + r)**(-n)

   @monthly_payment = numerator / denominator

   render({ :template => "calculation_templates/payment_new"})
  end

  def calculate_random

    @lower = params.fetch("user_min").to_f
    @upper = params.fetch("user_max").to_f
    @result = rand(@lower..@upper)
    render ({ :template => "calculation_templates/random_results.html.erb"})
  end
end
