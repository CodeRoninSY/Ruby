file = File.open("users.txt")

# file_data = file.read
# puts file_data

file_data = file.readlines.map(&:chomp)
file.close
puts file_data

# read file line by line
# File.foreach("users.txt") { |line| puts line }


## read from a _data.csv file naming tweaks
# printf("LN\tTM\tFileName\tTIME\n")

# File.foreach("_data.csv") {|line|
#   line.chomp!
#   ln = "1\t" + line + "\tsype1200_hptr_2D_b1DDR_" + line + "_mu045_1stC_pg.rst.gz\tTIME=" + line
#   puts ln
# }
