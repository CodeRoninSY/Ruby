#!/usr/bin/env ruby -w
#
# think_oop.rb
#
# Dev: CodeRoninSY
# Date: 2020-12-22
#
# RubyConf 2012 Colorado
# Youtube https://www.youtube.com/watch?v=D52V2tbWdNQ
#
# $> nslookup github.com
#
# WEBrick::Utils.random_string() method for creating random string
# RAND_CHARS -> string that holds all the chars for a random set
require 'webrick'

RAND_CHARS = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789#?&*='

puts -> () {

  s = "foo"
  s.object_id

  s << 'd'
  s.length

  # random_string(len) -> return len.random string (from Webrik doc)
  def random_string(len)
    rand_max = RAND_CHARS.bytesize
    ret = ""
    len.times { ret << RAND_CHARS[rand(rand_max)] }
    ret
  end

  # uniform access
  class Person
    # attribute accessors
    attr_accessor :full_name, :nid, :fname, :lname
    attr_reader :id, :p_count

    # class Person counter
    @@pers_count = 0
    # initialize instance
    def initialize(full_name)
      @full_name    = full_name
      @fname        = @full_name.split(' ').first
      @lname        = @full_name.split(' ').last
      @p_count      = @@pers_count + 1
      @@pers_count += 1
      @nid          = WEBrick::Utils.random_string(15) << rand(10..99).to_s << 
                      WEBrick::Utils.random_string(2)
      @id           = 'PP' << '_' << @p_count.to_s
    end

    def first_name
      @fname
    end

    def first_name=(name)
      @fname      = name
      @full_name  = ''
      @full_name << @fname.to_s << ' ' << @lname.to_s
    end

    # def p_count
      # @p_count
    # end

    def self.pers_count
      @@pers_count
    end
  end

  persons = [ 'Goofy Soxhead', 'Roofy Boxhead', 'Michael Burnham',
              'Philippa Georgiou', 'Gabriel Lorca', 'Christopher Pike', 'Raul Endymion',
              'James Kirk', 'James Holden', 'Naomi Nagata', 'Alex Kamal',
              'Amos Barton', 'Joe Miller', 'Roberta "Bobbie" Draper', 'Chrisjen Avasarala',
              'Camina Drummer', 'Julie Mao', 
              'Captain Saru', 'Paul Stamets', 'Sylvia Tilly', 'Keyla Detmer', 'Joann Owosekun',
              'Ash Tyler', 'Jean-Luc Picard',
              'Alexander Grayson', 'Mina Murray', 'Jonathan Harker', 'Abraham VanHelsing', 
              'R.M. Renfield', 'Lucy Westenra', 'Lady Jane Wetherby'
  ]

  prs = []
  persons.each do |p|
    prs.append(Person.new(p))
  end

  puts "Persons list= #{prs}, \nlength(Person list)= #{prs.length}"

  puts "Total Person's count= #{Person.pers_count}"

  prs.each do |p|
    puts "ID: #{p.id}, NID: #{p.nid}, FullName: #{p.full_name}"
  end

}.()
