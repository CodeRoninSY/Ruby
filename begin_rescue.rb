$meters = 10
$inches = 1

[$meters, $inches, $mils].each { |op|
  begin
    if op == $meters
      puts "This time meters: #{$meters}"
    elsif op == $inches
      puts "This time inches: #{$inches}"
    end
  rescue
    puts "Ooooopppppsss!"
  end
}
