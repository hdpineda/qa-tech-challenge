class LoginPage < SitePrism::Page
  set_url '/hackathonV2.html'

  # Definimos los elementos (Selectores CSS)
  element :username_input, '#username'
  element :password_input, '#password'
  element :login_button, '#log-in'

  element :alert_message, '.alert-warning'   
  # Iconos de redes sociales y Logo
  element :logo_image, '.logo-w img'
  elements :social_icons, '.buttons-w a'

  # Método único para loguearse (Encapsulamiento)
  def login(user, pass)
    username_input.set(user)
    password_input.set(pass)
    login_button.click
  end
end