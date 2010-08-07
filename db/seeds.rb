# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

countries = ["Regional", "Honduras", "Costa Rica", "Guatemala", "El Salvador", "Nicaragua"]
lcountries = ["Regional", "Honduras", "Costa Rica", "Guatemala", "El Salvador", "Nicaragua"]
ambitos= [
		"CAMBio,Lecciones ingresadas por usuarios internos de proyecto CAMBio que aplican a la experiencia del proyecto en general.",
		"BCIE,Lecciones ingresadas por usuarios internos del BCIE que aplican a la experiencia del proyecto y su relación con el BCIE.",
		"Institucional,Lecciones ingresadas por usuarios externos pertenecientes a instituciones relacionadas con Proyecto CAMBio, por ejemplo instituciones gubernamentales u otras organizaciones de cooperación internacional.",
		"IFI,Ingresadas por usuarios externos pertenecientes a una IFI referentes a aprendizaje que nfinanciamiento sino general.",
		"MIMYPE,Ingresadas por usuarios externos y referentes a una MIPYME específica."
	]
tipos = [
	"Recomendacion",
	"Leccion Aprendida",
	"Conclusión",
	"Acción"
]


productos=["Programa de Apoyo MiPYME", "Programa de Garantias Parciales de Crédito", "Fondo de Asistencia Tecnica"]

sectoresp=["Agroforestería","Agroforestería de Cacao", "Turismo Sostenible", "Acuicultura Certificada", "Sistemas Silvopastoriles", "Manejo Forestal"]
sectorese=["Micro Empresa", "Mediana Empresa", "Pequeña Empresa"]

resultados = [
	"Resultado 1, El BCIE y sus intermediarias financieras están proveyendo créditos a MIPYME para el desarrollo de actividades de negocios amigables con la biodiversidad",
	"Resultado 2, Las MIPYME centroamericanas trabajando en un amplio rango de sectores económicos son capaces de desarrollar iniciativas de negocios amigables con la biodiversidad y, por lo mismo, tienen acceso a nuevos mercados para sus productos y servicios"
	]
countries.each do |c|
	Country.find_or_create_by_name(c)
	Lcountry.find_or_create_by_name(c)
end

Ambito.delete_all
ambitos.each do |c|
	name, description=c.chomp.split(",")
	Ambito.create!(:name=>name, :description=>description)
end


LeccionType.delete_all
tipos.each do |t|
	LeccionType.find_or_create_by_name(t)
end

sectoresp.each do |s|
	ProductiveSector.find_or_create_by_name(s)
end

sectorese.each do |s|
	EmpresarialSector.find_or_create_by_name(s)
end


productos.each do |p|
	Producto.find_or_create_by_name(p)
end

Resultado.delete_all
resultados.each do |r|
	name, description = r.chomp.split(",")
	Resultado.create!(:name=>name, :description=>description)
end

Ifi.create(:name=>"Banco Temporal", :contact_name=>"Juan Perez", :contact_phone=>"232-3209", :contact_email=>"juanperez@seed.com", :country_id=>1)
Ifi.create(:name=>"Banco Agrario", :contact_name=>"Maria Lopez", :contact_phone=>"9900001", :contact_email=>"marialopez@test.com", :country_id=>1 )

Level.create(:name=>"Verde", :description=>"Nivel Verde")
Level.create(:name=>"Amarillo", :description=>"Nivel Amarillo")
Level.create(:name=>"Rojo", :description=>"Nivel Rojo")
Level.create(:name=>"Azul", :description=>"Nivel Azul")


