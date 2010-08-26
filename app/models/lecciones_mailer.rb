class LeccionesMailer < ActionMailer::Base
   def activacion(user)
    recipients    user.email
    from          "Lecciones Aprendidas, Proyecto CAMBio <info@proyectocambio.org>"
    subject       "Como activar su cuenta"
    sent_on       Time.now
    body          (:user => user)
  end
 
end
