#!/bin/ruby

require 'csv'
require 'optparse'
require 'ostruct'
require 'rubygems'
require 'nokogiri'
require 'pry'

options = OpenStruct.new
OptionParser.new do |opt|
   opt.on('--input_file HTML_IN') { |o| options.input_file = o }
   opt.on('--output_file SOME_CSV') { |o| options.output_file = o }
end.parse!

# parses the input file (some html file) and returns a string of the relevant
# text in the html that pertains to the lecture and sections.
def parse_html(input_file)
   page = Nokogiri::HTML(open(input_file)) 
   page.css('div#win0divDERIVED_CLSRCH_GROUP6').text.split(/\n/).reject(&:empty?)
end

def to_csv(input_array, output_file)
   out = output_file[-4..-1] == '.csv' ? output_file : "#{output_file}.csv" 
   num_sections = input_array.shift.split.first.to_i
   name_of_course = input_array.shift.split.join(' ')
   binding.pry
   CSV.open(out, 'w') do |csv|
      
   end
end

puts 'Converting \'' + options.input_file + '\' to a csv called \'' +
   options.output_file + '\'.csv'

to_csv(parse_html(options.input_file), options.output_file)
