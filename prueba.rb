  def read_alum(file_name)
    file = File.open(file_name, 'r')
    alum = file.readlines.map(&:chomp).map { |lines| lines.split(', ') }
    file.close
    alum
  end

  arreglo_de_alumnos = read_alum("alumnos.csv")

  def menu
    system "clear"
    puts "-----------------------------"
    puts ""
    puts "------Menú------"
    puts ""
    puts "1) Mostrar alumnos y su promedio"
    puts "2) Mostrar alumnos e inasistencia"
    puts "3) Mostrar alumnos aprobados"
    puts "4) Salir"
  end

  menu
  puts "Ingrese opción: "
  opcion = gets.chomp.to_i

  while opcion !=4 do

    if opcion == 1
      suma = 0
      arreglo_de_alumnos.each do |alumno|
        nombre = alumno[0]
        suma = alumno[1..-1].map { |num| num.to_i}.sum
        print "El promedio de #{nombre} es #{suma/alumno[1..-1].length.to_f}\n"
      end
      puts "presione una tecla para continuar"
      gets
    elsif opcion == 2
      contador = 0
      arreglo_de_alumnos.each do |alumno|
        nombre = alumno[0]
        if alumno[1..-1].include? 'A'
          contador += 1
          print "La cantidad de inasistencias de #{nombre} es #{contador} \n"
          contador = 0
        else
          print "La cantidad de inasistencias de #{nombre} es #{contador} \n"
      end
    end
    puts "presione una tecla para continuar"
    gets
    elsif opcion == 3

      def aprobar (promedio, nota_aprobacion = 5.0)
        if promedio >= nota_aprobacion
          true
        else
          false
        end
      end

      suma = 0
      promedio = 0
      arreglo_de_alumnos.each do |alumno|
        nombre = alumno[0]
        suma = alumno[1..-1].map { |num| num.to_i}.sum
        promedio = suma/alumno[1..-1].length.to_f
       if aprobar(promedio) == true
         print "El alumno #{nombre} a Aprobado\n"
       end
      end
      puts "presione una tecla para continuar"
      gets
    else
      puts "\nSeleccione una opcion válida"
      puts "presione una tecla para continuar"
      gets
    end

    menu
    puts "Ingrese opción: "
    opcion = gets.chomp.to_i
  end

puts "Usted a salido del programa."
