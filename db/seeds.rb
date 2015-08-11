# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' )
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.create(name: 'Coordinador') #id: 1
Role.create(name: 'Administrador') #id: 2
Role.create(name: 'Alumno') #id: 3

career1 = Career.create(name: 'Ingeniería en Informática') #id: 1
career2 = Career.create(name: 'Ingeniería en Informática (Plan Nuevo)') #id: 2
career3 = Career.create(name: 'Diseño Gráfico') #id: 3

Schedule.create(name: '7:00 am - 8:30 am (1,3)')
Schedule.create(name: '8:30 am - 10:00 am (1,3)')
Schedule.create(name: '10:00 am - 11:30 am (1,3)')
Schedule.create(name: '3:00 pm - 4:30 pm (1,3)')
Schedule.create(name: '4:30 pm - 6:00 pm (1,3)')
Schedule.create(name: '6:00 pm - 7:30 pm (1,3)')
Schedule.create(name: '7:30 pm - 9:00 pm (1,3)')
Schedule.create(name: '7:00 am - 8:30 am (2,4)')
Schedule.create(name: '8:30 am - 10:00 am (2,4)')
Schedule.create(name: '10:00 am - 11:30 am (2,4)')
Schedule.create(name: '3:00 pm - 4:30 pm (2,4)')
Schedule.create(name: '4:30 pm - 6:00 pm (2,4)')
Schedule.create(name: '6:00 pm - 7:30 pm (2,4)')
Schedule.create(name: '7:30 pm - 9:00 pm (2,4)')
Schedule.create(name: '7:00 am - 8:30 am (5)')
Schedule.create(name: '8:30 am - 10:00 am (5)')
Schedule.create(name: '10:00 am - 11:30 am (5)')
Schedule.create(name: '3:00 pm - 4:30 pm (5)')
Schedule.create(name: '4:30 pm - 6:00 pm (5)')
Schedule.create(name: '6:00 pm - 7:30 pm (5)')
Schedule.create(name: '6:00 pm - 9:00 pm (5)')
Schedule.create(name: '7:30 am - 10:30 am (6)')
Schedule.create(name: '10:30 am - 1:30 pm (6)')
Schedule.create(name: '1:30 pm - 4:30 pm (6)')
Schedule.create(name: '4:30 pm - 7:30 pm (6)')
Schedule.create(name: '7:30 am - 10:30 am (7)')
Schedule.create(name: '10:30 am - 1:30 pm (7)')
Schedule.create(name: '2:00 pm - 5:00 pm (7)')

State.create(name: 'Pendiente')
State.create(name: 'Confirmado')
State.create(name: 'Cancelado')

#Ingenieria en Informatica
Course.create(name:'Programación I', requirements: 'Introducción a la Informática', recommended_requirements: 'n/a', career_id: career1.id)
Course.create(name:'Programación II',	requirements: 'Programación I',	recommended_requirements: 'n/a', career_id: career1.id)
Course.create(name:'Programación III', requirements: 'Programación II',	recommended_requirements: 'n/a', career_id: career1.id)
Course.create(name:'Programación IV',	requirements: 'Programación III',	recommended_requirements: 'n/a', career_id: career1.id)
Course.create(name:'Estructura de Datos',	requirements: 'Programación III',	recommended_requirements: 'n/a', career_id: career1.id)
Course.create(name:'Organización de Archivos',	requirements: 'Estructura de Datos',	recommended_requirements: 'n/a', career_id: career1.id)
Course.create(name:'Sistemas de Bases de Datos',	requirements: 'Organización de Archivos y Programación IV',	recommended_requirements: 'n/a', career_id: career1.id)
Course.create(name:'Investigación de Sistemas',	requirements: 'Sistemas de Información y Sistemas de Bases de Datos',	recommended_requirements: 'n/a', career_id: career1.id)
Course.create(name:'Diseño de Sistemas',	requirements: 'Investigación de Sistemas',	recommended_requirements: 'n/a', career_id: career1.id)
Course.create(name:'Ingeniería de Software',	requirements: 'Diseño de Sistemas', recommended_requirements: 'n/a', career_id: career1.id)
Course.create(name:'Auditoria Informática', requirements:'Diseño de Sistemas', recommended_requirements: 'n/a', career_id: career1.id)
Course.create(name:'Sistemas de Información', requirements: 'n/a', recommended_requirements: 'n/a', career_id: career1.id)
Course.create(name:'Aplicaciones de Bases de Datos', requirements: 'Sistemas de Información', recommended_requirements: 'n/a', career_id: career1.id)
Course.create(name:'Redes',	requirements: 'Aplicaciones de Bases de Datos',	recommended_requirements: 'n/a', career_id: career1.id)
Course.create(name:'Planeación y Control de Sistemas de Información',	requirements: 'Conta. Toma de Decisiones y Diseño de Sistemas',	recommended_requirements: 'n/a', career_id: career1.id)
Course.create(name:'Aplicaciones de Redes y Grupos de Trabajo',	requirements: 'Planeación y Control de Sistemas de Información',	recommended_requirements: 'n/a', career_id: career1.id)
Course.create(name:'Desarrollo de Aplicaciones Web',	requirements: 'Aplicaciones de Redes y Grupos de Trabajo',	recommended_requirements: 'n/a', career_id: career1.id)
Course.create(name:'Investigación de Operaciones para Ingeniería',	requirements: 'Estadística Matemática II',	recommended_requirements: 'n/a', career_id: career1.id)
Course.create(name:'Administración de Bases de Datos',	requirements: 'Aplicaciones de Bases de Datos',	recommended_requirements: 'n/a', career_id: career1.id)
Course.create(name:'Sistemas de Soporte de Decisiones',	requirements: 'Administración de Bases de Datos',	recommended_requirements: 'n/a', career_id: career1.id)
Course.create(name:'Administración de Proyectos de Informática',	requirements: 'Planeación y Control de Sistemas de Información e Investigación de Operaciones para Ingeniería',	recommended_requirements: 'n/a', career_id: career1.id)
Course.create(name:'Sistemas Operativos de Redes',	requirements: 'Redes',	recommended_requirements: 'n/a', career_id: career1.id)
Course.create(name:'Seguridad Computacional',	requirements: 'Aplicaciones de Redes y Grupos de Trabajo',	recommended_requirements: 'n/a', career_id: career1.id)
Course.create(name:'Desarrollo de Aplicaciones Empresariales I',	requirements: 'Seguridad Computacional',	recommended_requirements: 'n/a', career_id: career1.id)
Course.create(name:'Desarrollo de Aplicaciones Empresariales II',	requirements: 'Desarrollo de Aplicaciones Empresariales I',	recommended_requirements: 'n/a', career_id: career1.id)

#Ingenieria en Informatica (Plan Nuevo)
Course.create(name:'Introducción a la Computación', requirements: 'n/a', recommended_requirements: 'n/a', career_id: career2.id)
Course.create(name:'Programación I', requirements: 'Introducción a la Computación', recommended_requirements: 'n/a', career_id: career2.id)
Course.create(name:'Programación II',	requirements: 'Programación I',	recommended_requirements: 'n/a', career_id: career2.id)
Course.create(name:'Programación III', requirements: 'Programación II',	recommended_requirements: 'n/a', career_id: career2.id)
Course.create(name:'Programación IV',	requirements: 'Programación III',	recommended_requirements: 'n/a', career_id: career2.id)
Course.create(name:'Estructura de Datos I',	requirements: 'Programación IV',	recommended_requirements: 'n/a', career_id: career2.id)
Course.create(name:'Estructura de Datos II',	requirements: 'Estructura de Datos I',	recommended_requirements: 'n/a', career_id: career2.id)
Course.create(name:'Teoría de Bases de Datos',	requirements: 'Estructura de Datos II',	recommended_requirements: 'n/a', career_id: career2.id)
Course.create(name:'Sistemas Operativos I',	requirements: 'Estructura de Datos II',	recommended_requirements: 'n/a', career_id: career2.id)
Course.create(name:'Redes',	requirements: 'Sistemas Operativos I',	recommended_requirements: 'n/a', career_id: career2.id)
Course.create(name:'Protocolos de Redes',	requirements: 'Redes', recommended_requirements: 'n/a', career_id: career2.id)
Course.create(name:'Administración de Bases de Datos', requirements:'Teoría de Bases de Datos', recommended_requirements: 'n/a', career_id: career2.id)
Course.create(name:'Ingeniería de Software I', requirements: 'Administración de Bases de Datos', recommended_requirements: 'n/a', career_id: career2.id)
Course.create(name:'Ingeniería de Software II', requirements: 'Ingeniería de Software I', recommended_requirements: 'n/a', career_id: career2.id)
Course.create(name:'Auditoria Informática',	requirements: 'Ingeniería de Software II',	recommended_requirements: 'n/a', career_id: career2.id)
Course.create(name:'Seguridad Computacional',	requirements: 'Auditoria Informática',	recommended_requirements: 'n/a', career_id: career2.id)
Course.create(name:'Fundam. Admón. Tecn. Informac.',	requirements: 'Seguridad Computacional',	recommended_requirements: 'n/a', career_id: career2.id)
Course.create(name:'Sis. Soporte Decisiones',	requirements: 'Ingeniería de Software I',	recommended_requirements: 'n/a', career_id: career2.id)
Course.create(name:'Gestión Servicios de Contenido',	requirements: 'Administración de Bases de Datos',	recommended_requirements: 'n/a', career_id: career2.id)
Course.create(name:'Desarrollo Aplic. de Vanguardia',	requirements: 'Ingeniería de Software II y Administración de Proyectos',	recommended_requirements: 'n/a', career_id: career2.id)
Course.create(name:'Comercio Electrónico',	requirements: 'Programación II',	recommended_requirements: 'n/a', career_id: career2.id)
Course.create(name:'Inves. Oper. Ingeniería',	requirements: 'Ecuaciones Diferenciales',	recommended_requirements: 'n/a', career_id: career2.id)
Course.create(name:'Proyecto/Práctica Fase I',	requirements: 'Desarrollo Aplic. de Vanguardia',	recommended_requirements: 'n/a', career_id: career2.id)
Course.create(name:'Proyecto/Práctica Fase II',	requirements: 'Proyecto/Práctica Fase I',	recommended_requirements: 'n/a', career_id: career2.id)

#Diseño Gráfico
Course.create(name:'Expresión Oral', requirements: 'Español', recommended_requirements: 'n/a', career_id: career3.id)
Course.create(name:'Introducción al Diseño',	requirements: 'n/a',	recommended_requirements: 'n/a', career_id: career3.id)
Course.create(name:'Redacción', requirements: 'Expresión Oral',	recommended_requirements: 'n/a', career_id: career3.id)
Course.create(name:'Fund. Teorías Comunicación',	requirements: 'n/a',	recommended_requirements: 'n/a', career_id: career3.id)
Course.create(name:'Comp. Aplic. Diseño Gráfico',	requirements: 'n/a',	recommended_requirements: 'n/a', career_id: career3.id)
Course.create(name:'Intro. Medios Visuales',	requirements: 'Fund. Teorías Comunicación',	recommended_requirements: 'n/a', career_id: career3.id)
Course.create(name:'Dibujo',	requirements: 'n/a',	recommended_requirements: 'n/a', career_id: career3.id)
Course.create(name:'Proyecciones Geométricas',	requirements: 'Álgebra',	recommended_requirements: 'n/a', career_id: career3.id)
Course.create(name:'Psicología del Diseño',	requirements: 'Intro. Diseño Gráfico',	recommended_requirements: 'n/a', career_id: career3.id)
Course.create(name:'Comunicación Gráfica I',	requirements: 'Intro. Al Diseño Gráfico y Dibujo', recommended_requirements: 'Comp. Aplic. Diseño Gráfico', career_id: career3.id)
Course.create(name:'Semiótica', requirements:'Psicología del Diseño', recommended_requirements: 'n/a', career_id: career3.id)
Course.create(name:'Fotografía', requirements: 'Comunicación Gráfica I', recommended_requirements: 'n/a', career_id: career3.id)
Course.create(name:'Dibujo Avanzado', requirements: 'Comunicación Gráfica', recommended_requirements: 'n/a', career_id: career3.id)
Course.create(name:'Comunicación Gráfica II',	requirements: 'Fotografía y Dibujo Avanzado',	recommended_requirements: 'n/a', career_id: career3.id)
Course.create(name:'Creatividad Publicitaria',	requirements: 'Publicidad',	recommended_requirements: 'n/a', career_id: career3.id)
Course.create(name:'Tipografía',	requirements: 'Fotografía Comercial y Semiótica',	recommended_requirements: 'n/a', career_id: career3.id)
Course.create(name:'Fotografía Comercial',	requirements: 'Fotografía',	recommended_requirements: 'n/a', career_id: career3.id)
Course.create(name:'Tec. Expresión e Ilustración',	requirements: 'Comunicación Gráfica II',	recommended_requirements: 'n/a', career_id: career3.id)
Course.create(name:'Edición de Impresos',	requirements: 'Fotografía Comercial y Creatividad Publicitaria',	recommended_requirements: 'n/a', career_id: career3.id)
Course.create(name:'Imagen Corporativa',	requirements: 'Publicidad',	recommended_requirements: 'n/a', career_id: career3.id)
Course.create(name:'Nuevas Tecnologías Diseño Gráfico',	requirements: 'Tec. Expresión e Ilustración',	recommended_requirements: 'n/a', career_id: career3.id)
Course.create(name:'Diseño y Producción de Etiquetas, Envases y Empaques',	requirements: 'Creatividad Publicitaria',	recommended_requirements: 'n/a', career_id: career3.id)
Course.create(name:'Admon. Materiales y Costos de Impresión',	requirements: 'Diseño y Producción de Etiquetas, Envases y Empaques',	recommended_requirements: 'n/a', career_id: career3.id)
Course.create(name:'Campañas de Divulgación',	requirements: 'Creatividad Publicitaria',	recommended_requirements: 'n/a', career_id: career3.id)
Course.create(name:'Diseño Editorial',	requirements: 'Edición de Impresos',	recommended_requirements: 'n/a', career_id: career3.id)
Course.create(name:'Diseño Gráfico y Animación por Computadora',	requirements: 'Artes Finales',	recommended_requirements: 'n/a', career_id: career3.id)
Course.create(name:'Producciones de Artes Gráficas',	requirements: 'Diseño Producción de Etiquetas, Envases y Empaques',	recommended_requirements: 'n/a', career_id: career3.id)
Course.create(name:'Técnicas de Grabado',	requirements: 'Artes Finales',	recommended_requirements: 'n/a', career_id: career3.id)
Course.create(name:'Diseño para Multimedia',	requirements: 'Diseño Gráfico y Animación por Computadora',	recommended_requirements: 'n/a', career_id: career3.id)
Course.create(name:'Señalética',	requirements: 'Producción de Artes Gráficas',	recommended_requirements: 'n/a', career_id: career3.id)
Course.create(name:'Sistema de Impresión Serigráfica',	requirements: 'Técnicas de Grabado',	recommended_requirements: 'n/a', career_id: career3.id)
Course.create(name:'Historia del Arte',	requirements: 'n/a',	recommended_requirements: 'n/a', career_id: career3.id)
Course.create(name:'Metodología del Diseño',	requirements: 'Proyecciones Geométricas',	recommended_requirements: 'n/a', career_id: career3.id)
