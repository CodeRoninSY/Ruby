#!/usr/bin/env ruby
# db_backup.rb
# From "Build awesome command line apps in ruby"
# Dev: CodeRoninSY
# Date: <2020-11-28>
#

database = ARGV.shift
username = ARGV.shift
password = ARGV.shift
end_of_iter = ARGV.shift

if end_of_iter.nil?
  backup_file = database + Time.now.strftime("%Y%m%d")
else
  backup_file = database + end_of_iter
end

`mysqldump -u#{username} -p#{password} #{database} > #{backup_file}.sql`
`gzip -v #{backup_file}.sql`
